#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "qqmlsortfilterproxymodel.h" and call registerAllTypes();

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("."));
    engine.addPluginPath(QStringLiteral("SortFilterProxyModel"));

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
