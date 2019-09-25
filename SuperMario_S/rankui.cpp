#include "rankui.h"
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QFile>
#include <QDebug>


RankUI::RankUI(QObject *parent)
    :QObject(parent)
{

}

bool RankUI::loadRankUI()
{
    QFile loadFile(QStringLiteral("rankUI.json"));

    if(!loadFile.open(QIODevice::ReadOnly)){
        qDebug() << "failed";
        return false;
    }

    QByteArray readData = loadFile.readAll();

    QJsonDocument loadDoc(QJsonDocument::fromJson(readData));

    QJsonObject object = loadDoc.object();
    read(object);

    qDebug() <<jsonArray.count();

    return true;
}

bool RankUI::saveRankUI()
{
    QFile saveFile(QStringLiteral("rankUI.json"));
    if(!saveFile.open(QIODevice::WriteOnly)){
        qDebug()<<"failed!";
        return  false;
    }
    QJsonObject rankUIObject;

    write(rankUIObject);
    QJsonDocument saveDoc(rankUIObject);
    saveFile.write(saveDoc.toJson());

    return true;
}

QJsonArray RankUI::jsonarray()
{
    if(!loadRankUI())
    {
        initRankUI();
        if(loadRankUI()){
            qDebug() << "read succeed";
            return jsonArray;
        }

    }else {
        qDebug() << "succeed";
        return jsonArray;
    }
}

void RankUI::setJsonarray(QJsonArray array)
{
    jsonArray = array;
    if(!saveRankUI()){
        qDebug() << "save error";
    }
}

void RankUI::read(const QJsonObject &json)
{
    if(json.contains("levels")&& json["levels"].isArray())
        jsonArray = json["levels"].toArray();
}

void RankUI::write(QJsonObject &json)
{
//    json["levels"] = jsonArray;
    QJsonArray jsonarray;
    for (int index=0;index<jsonArray.size();index++) {
        QJsonObject oneRecord;
        oneRecord = jsonArray[index].toObject();
        jsonarray.append(oneRecord);
    }
    json["levels"] = jsonarray;

}

void RankUI::initRankUI()
{
    QJsonObject record1;
    QJsonObject record2;
    QJsonObject record3;

    record1.insert("level","level 1");
    record1.insert("record","4'22''");
    record1.insert("holder","Tom");

    record2.insert("level","level 2");
    record2.insert("record","4'12''");
    record2.insert("holder","Bob");

    record3.insert("level","level 3");
    record3.insert("record","4'02''");
    record3.insert("holder","Mary");

    jsonArray.append(record1);
    jsonArray.append(record2);
    jsonArray.append(record3);

    if(!saveRankUI())
        qDebug() << "save error";
}
