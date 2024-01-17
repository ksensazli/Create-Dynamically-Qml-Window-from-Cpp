#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "loginop.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    loginOp loginOperations;

    QQmlApplicationEngine engine;
    QQmlContext* context = engine.rootContext();
    context->setContextProperty("login", &loginOperations);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
