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
