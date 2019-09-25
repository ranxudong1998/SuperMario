#ifndef LEVEL_H
#define LEVEL_H

#include <QJsonObject>
#include <QObject>


class Record : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString level READ level WRITE setLevel)
    Q_PROPERTY(QString record READ record WRITE setRecord )
    Q_PROPERTY(QString holder READ holder WRITE setHolder)
public:


    QString level();
    void  setLevel(const QString &);

    QString record();
    void  setRecord(const QString &);

    QString holder();
    void  setHolder(const QString &);

    Record(QObject *parent = nullptr);
//    Record(const QString &level,const QString &record,const QString &holder);
    void read(const QJsonObject &json);
    void write(QJsonObject &json);
    void print();


    QString m_level;
    QString m_record;
    QString m_holder;


};


#endif // LEVEL_H
