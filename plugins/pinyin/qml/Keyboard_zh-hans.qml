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

import MaliitKeyboard 2.0

import keys 1.0

KeyPad {
    anchors.fill: parent

    content: c1
    symbols: "languages/Keyboard_symbols_zh-hans.qml"

    Column {
        id: c1
        anchors.fill: parent
        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "q"; leftSide: true; }
            CharKey { label: "w"; }
            CharKey { label: "e"; }
            CharKey { label: "r"; }
            CharKey { label: "t"; }
            CharKey { label: "y"; }
            CharKey { label: "u"; }
            CharKey { label: "i"; }
            CharKey { label: "o"; }
            CharKey { label: "p"; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "a"; leftSide: true; }
            CharKey { label: "s"; }
            CharKey { label: "d"; }
            CharKey { label: "f"; }
            CharKey { label: "g"; }
            CharKey { label: "h"; }
            CharKey { label: "j"; }
            CharKey { label: "k"; }
            CharKey { label: "l"; }
            BackspaceKey {}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            CharKey { label: "z"; }
            CharKey { label: "x"; }
            CharKey { label: "c"; }
            CharKey { label: "v"; }
            CharKey { label: "b"; }
            CharKey { label: "n"; }
            CharKey { label: "m"; }
            ActionKey { label: "↑"; action: "up"; }
            ReturnKey { id: enterKey; }
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + Device.row_margin;

            SymbolShiftKey { id: symShiftKey; label: "符号"; anchors.left: parent.left; }
            LanguageSwitch { id: language;    next: "en"; anchors.left: symShiftKey.right; }
            // SpaceKey 必须加id:spaceKey
            SpaceKey  { id: spaceKey; anchors.left: language.right; anchors.right: left.left; noMagnifier: true; }
            ActionKey { id: left;  label: "←"; action: "left";   anchors.right: down.left;   }
            ActionKey { id: down;  label: "↓"; action: "down";   anchors.right: right.left;  }
            ActionKey { id: right; label: "→"; action: "right";  anchors.right: parent.right;}
        }
    } // column
}
