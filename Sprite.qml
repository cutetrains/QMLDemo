import QtQuick 2.3
import QtQuick.Controls 1.2
//Story_2_2
//Rectangle { width: 80; height: 50; color: "red" }

Label {
    id: labelQMLSprite
    objectName: "labelQMLSpriteN"
    text: qsTr("QML created from Sprite.qml in JS. Original Color: blue");
    font.pointSize: 12
    color: "blue"

    RotationAnimator {
        target: labelQMLSprite;
        from: 0;
        to: 360;
        duration: 10000
        running: true
    }
    OpacityAnimator on opacity{
        from: 1;
        to: 0;
        duration: 12000
        running: true
    }
}

