#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QScopedPointer>
#include "communicat.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);




    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QScopedPointer<Communicat> mouse(new Communicat);

    engine.rootContext()->setContextProperty("mouse",mouse.data());

    /*test*/
    QObject *box = engine.findChild<QObject*>("contbox");

    /*test*/

    return app.exec();
}
