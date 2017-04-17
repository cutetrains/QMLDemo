import QtQuick 2.3
import QtQuick.Controls 1.2
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
