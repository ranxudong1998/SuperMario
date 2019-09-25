#include "record.h"
#include <QDebug>



QString Record::level()
{
    return  m_level;
}

void Record::setLevel(const QString &level)
{
    m_level = level;
}

QString Record::record()
{
    return  m_record;
}

void Record::setRecord(const QString &record)
{
    m_record = record;
}

QString Record::holder()
{
    return m_holder;
}

void Record::setHolder(const QString &holder)
{
    m_holder = holder;
}

Record::Record(QObject *parent)
    :QObject(parent)
{

}

//Record::Record(const QString &level, const QString &record, const QString &holder):
//    m_level(level),m_record(record),m_holder(holder)
//{

//}

void Record::read(const QJsonObject &json)
{
//    Record record;
    if(json.contains("level")&&json["level"].isString())
        m_level = json["level"].toString();
    if(json.contains("record")&&json["record"].isString())
        m_record = json["record"].toString();

    if(json.contains("holder")&&json["holder"].isString())
        m_holder = json["holder"].toString();

}

void Record::write(QJsonObject &json)
{
    json["level"]=m_level;
    json["record"]=m_record;
    json["holder"]=m_holder;
}

void Record::print()
{
    qDebug()<<m_level<<"  "<<m_record<<"  "<<m_holder<<"\n";

}
