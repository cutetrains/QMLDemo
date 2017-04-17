var component; //Story_2_2
var sprite;


function createSpriteObjects(xpos, ypos) {
    component = Qt.createComponent("Sprite.qml");
    sprite = component.createObject(window, {"x": xpos, "y": ypos});

    if (sprite === null) {
        // Error Handling
        console.log("Error creating object");
    }
}
