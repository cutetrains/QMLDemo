var component; //Story_2_2
var sprite;
function createSpriteObjects() {
    component = Qt.createComponent("Sprite.qml");
    if (component.status == Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function createStringObjects()//Story_2_2a
{
    var newObject = Qt.createQmlObject('import QtQuick 2.0; Rectangle {color: "red"; width: 20; height: 20}',
    parentItem, "dynamicSnippet1");
}


function finishCreation() {
    if (component.status == Component.Ready) {
        sprite = component.createObject(window, {"x": 500, "y": 500});
        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
