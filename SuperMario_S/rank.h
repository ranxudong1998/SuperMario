#ifndef RANK_H
#define RANK_H

#include <QObject>
#include "record.h"
#include <QVector>
#include <QQmlListProperty>


class Rank:public QObject
{
    Q_OBJECT
    Q_PROPERTY(Record* mlevel1 READ mlevel1 WRITE setMlevel1 NOTIFY mlevel1Changed)
    Q_PROPERTY(Record* mlevel2 READ mlevel2 WRITE setMlevel2 NOTIFY mlevel2Changed)
    Q_PROPERTY(Record* mlevel3 READ mlevel3 WRITE setMlevel3 NOTIFY mlevel3Changed)

public:

    void  setMlevel1(Record* level);
    Record* mlevel1();

    void  setMlevel2(Record* level);
    Record* mlevel2();

    void  setMlevel3(Record* level);
    Record* mlevel3();

    Rank(QObject *parent = nullptr);

    void read(const QJsonObject &json);
    void write(QJsonObject &json) ;
    void gameInit();


    Q_INVOKABLE bool loadGame();
    Q_INVOKABLE bool saveGame();

    Record *level1;
    Record *level2;
    Record *level3;

signals:
    void mlevel1Changed();
    void mlevel2Changed();
    void mlevel3Changed();

};

#endif // RANK_H
