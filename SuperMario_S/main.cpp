#include <QApplication>
#include <FelgoApplication>
#include <QQmlEngine>
#include "rankui.h"

#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    qmlRegisterType<RankUI>("RankUIType",1,0,"RankUI");
    QApplication app(argc, argv);


    FelgoApplication felgo;
    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));


    engine.load(QUrl(felgo.mainQmlFileName()));



    return app.exec();
}

