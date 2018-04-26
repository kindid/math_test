#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QFont>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    app.setApplicationDisplayName("Kindid Simple Adding. Addition.");
    app.setOrganizationDomain("kuiash.com");//todo. kindid.co.uk
    app.setOrganizationName("kuiash.com"); // kindid.co.uk

#if 0
    // does not accept qrc:/ urls... fucked up.
    int id = QFontDatabase::addApplicationFont(":/fonts/Lavi.ttf");
    QString family = QFontDatabase::applicationFontFamilies(id).at(0);
    QFont fon(family);
    app.setFont(fon);
#else
    QString family = "Chalkduster";
    QFont fon(family);
    app.setFont(fon);
#endif

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
