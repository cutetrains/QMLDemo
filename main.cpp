#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QDebug>
#include <QtQuick>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();
    QObject *object = view.rootObject();
    object->dumpObjectTree();
    QVariant returnedValue;


    /* HERE, A FUNCTION IS CALLED FROM C++ */
    /*** Setting color of label to golden ***/
    QVariant msg1 = "textLabelQML2";
    QVariant msg2 = "goldenrod";

    QMetaObject::invokeMethod(object, "myQmlSetColor",
        Q_RETURN_ARG(QVariant, returnedValue),
        Q_ARG(QVariant, msg1),
        Q_ARG(QVariant, msg2));
    qDebug() << "QML function returned:" << returnedValue.toString();

    /* HERE, AN EXISTING OBJECT IS MODIFIED FROM C++ */
     //QObject *rect = object->findChild<QObject*>("rectQMLFileN");
     QObject *rect = object->findChild<QObject*>("labelQMLSpriteN");
    if (rect){
        qDebug()<<"Element label found!";
        rect->setProperty("color", "red");
        rect->setObjectName("labelQMLSpriteNRenamed");
        qDebug()<<"----AFTER RENAME------";
        object->dumpObjectTree();
        qDebug()<<"-----------------------";
    }
    else
    {
        qDebug()<<"Element label not found!";
    }

    return app.exec();
}

