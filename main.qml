import QtQuick 2.3
import QtQuick.Controls 1.2
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

import "itemCreation.js" as MyScript //Story_2_2
//QQmlComponent can also be used but seems to be less useful
//However, in C++, qComponent is used. Align qml and c++ according to 
// http://doc.qt.io/q§t-5/qtqml-cppintegration-interactqmlfromcpp.html

Rectangle{
    id: window
    width:800
    height:600
    color: "transparent"
    objectName: "thisWindow"

    Component.onCompleted: {
        var dynamicObject = Qt.createQmlObject(
        'import QtQuick 2.3;Rectangle{id:nameSample1;objectName:"nameSample1";width:100;height:100;color:"blue";x:300;y:300;opacity:0.3}',
        window,'firstObject')

        MyScript.createSpriteObjects(500,250);

        MyScript.createSpriteObjects(600,350);
    }

    Rectangle {
        id: rectQMLFile
        objectName: "rectQMLFileN"
        color: "blue"
        opacity:0.5
        width: 250
        height: 100

        x: 10
        y: 10

        MouseArea {
            anchors.fill: parent
            onClicked: {
                window.myQmlSetColor("textLabelQML1", "green")
                //window.myQmlSetColor("labelQMLSpriteN", "green")
                MyScript.createSpriteObjects(350,200);
            }
        }
        Label {
            id: textLabel11
            objectName: "textLabel1N"
            text: qsTr("Click here to trigger QML internal function")
            anchors.fill: parent
        }
    }

    Label {
        id: textLabelQML1
        objectName: "textLabelQML1N"
        text: qsTr("Hello World(textLabelQML1). <br>Original: Blue <br>Called from qml: Green <br>Called from C++: gold")
        x: window.x
        y: window.y+120
        color: "steelblue"
        font.pointSize: 12
    }

    Label {
        id: textLabelQML2
        objectName: "textLabelQML1N"
        text: qsTr("Hello World(textLabelQML2), modified by c++ function call. <br>Original: Blue <br>Called from qml: Green <br>Called from C++: gold")
        x: window.x
        y: textLabelQML1.y+200
        color: "steelblue"
        font.pointSize: 12
    }

    function myQmlSetColor(itemName, colorName) {
        console.log("Internal: Got message:", itemName, colorName)
        var theInstructions = "console.log(123)";

        eval(itemName + ".color = \"" + colorName+"\"") //eval() works but is really slow

        return(itemName)
        }

}
