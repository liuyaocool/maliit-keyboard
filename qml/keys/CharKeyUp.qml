/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import QtQuick.Controls 2.12

import MaliitKeyboard 2.0

import "config.js" as Config

Item {
    id: key

    property int padding: 0

    width: leftSide || rightSide ? panel.keyWidth * 2 : panel.keyWidth
    height: panel.keyHeight

    property string iconNormal: ""
    property string label: ""
    property string shifted: label
    property var extended; // list of extended keys

    property double textCenterOffset: Device.gu(-0.15)

    property string action

    property bool leftSide: false
    property bool rightSide: false

    property double rowMargin: fullScreenItem.landscape ? Device.rowMarginLandscape
                                                        : Device.rowMarginPortrait
    property double keyMargin: Device.keyMargins

    // Scale the font so the label fits if a long word is set
    property int fontSize: (fullScreenItem.landscape ? (height / 2) : (height / 2.8))
                           * (4 / (label.length >= 2 ? (label.length <= 6 ? label.length + 2.5 : 8) : 4));

    readonly property string bgColor: Config.get("Button", "background.color", "#323234")
    readonly property string bgColorClick: Config.get("Button", "background.color.click", "green")
    property string backgroundColor: bgColor
    property int pressY: 0

    Component.onCompleted: { }

    ToolButton {
        id: keyButton        

        anchors.fill: parent
        anchors.leftMargin: key.leftSide ? (parent.width - panel.keyWidth) + key.keyMargin : key.keyMargin
        anchors.rightMargin: key.rightSide ? (parent.width - panel.keyWidth) + key.keyMargin : key.keyMargin
        anchors.bottomMargin: key.rowMargin

        icon.name: key.iconNormal
        icon.height: key.fontSize
        icon.width: key.fontSize
        
        Rectangle {
            anchors.fill: parent
            color: backgroundColor
        }

        // 按键
        Label {
            id: keyLabel
            text: label
            color: Config.get("Button", "font.color", "white")
            font.pixelSize: key.fontSize
            font.weight: Font.Light
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: Device.gu(0.2)
            anchors.rightMargin: Device.gu(0.2)
            anchors.verticalCenter: parent.verticalCenter 
            anchors.verticalCenterOffset: key.textCenterOffset
            horizontalAlignment: Text.AlignHCenter
            // Avoid eliding characters that are slightly too wide (e.g. some emoji and chinese characters)
            elide: text.length <= 4 ? Text.ElideNone : Text.ElideRight
        }

        // 按键右上角
        Label {
            id: annotationLabel
            text: extended[0]
            color: Config.get("Button", "font.color", "white")
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: Device.annotationTopMargin
            anchors.rightMargin: Device.annotationRightMargin
            font.pixelSize: key.fontSize / 2.25
            font.weight: Font.Light
        }

    }
    
    PressArea {
        id: keyMouseArea
        anchors.fill: parent

        onPressed: {
            backgroundColor = bgColorClick;
            pressY = mouseY;
        }

        onReleased: {
            backgroundColor = bgColor;
            var submitText;
            if(action) {
            } else if((pressY - mouseY) < 50) {
                submitText = label;
            } else {
                if(extended && extended[0]) {
                    submitText = extended[0];
                } else {
                    submitText = shifted;
                }
            }
            event_handler.onKeyReleased(submitText, action);
        }

    }

}
