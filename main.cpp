/*************************************************************************
 * This file is part of QMLDemo.
 *
 * QMLDemo is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * QMLDemo is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with QMLDemo.  If not, see <http://www.gnu.org/licenses/>.
 ************************************************************************/

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
    view.show();//QML parts are initiated here
    QObject *object = view.rootObject();
    object->dumpObjectTree();//All QML items are listed
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

