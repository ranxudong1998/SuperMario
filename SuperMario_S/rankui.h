#ifndef RANKUI_H
#define RANKUI_H

#include <QObject>
#include <QJsonArray>


class RankUI:public QObject
{
    Q_OBJECT
//    Q_PROPERTY(QJsonArray jsonarray READ jsonarray WRITE setJsonarray)
    Q_PROPERTY(QJsonArray jsonarray READ jsonarray WRITE setJsonarray NOTIFY jsonarrayChanged)

public:
    RankUI(QObject *parent = nullptr);
    Q_INVOKABLE bool loadRankUI();
    Q_INVOKABLE bool saveRankUI();


    QJsonArray jsonarray();
    void setJsonarray(QJsonArray array);

   void read(const QJsonObject &json);
   void write(QJsonObject &json) ;
   void initRankUI();

    QJsonArray jsonArray;

signals:
    void jsonarrayChanged();
};


#endif // RANKUI_H
