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

