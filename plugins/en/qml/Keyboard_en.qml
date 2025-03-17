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
    symbols: "languages/Keyboard_symbols.qml"

    Column {
        id: c1
        anchors.fill: parent
        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKeyUp { label: "`"; extended: ["~"]; }
            CharKeyUp { label: "1"; extended: ["!"]; }
            CharKeyUp { label: "2"; extended: ["@"]; }
            CharKeyUp { label: "3"; extended: ["#"]; }
            CharKeyUp { label: "4"; extended: ["$"]; }
            CharKeyUp { label: "5"; extended: ["%"]; }
            CharKeyUp { label: "6"; extended: ["^"]; }
            CharKeyUp { label: "7"; extended: ["&"]; }
            CharKeyUp { label: "8"; extended: ["*"]; }
            CharKeyUp { label: "9"; extended: ["("]; }
            CharKeyUp { label: "0"; extended: [")"]; }
            CharKeyUp { label: "-"; extended: ["_"]; }
            CharKeyUp { label: "="; extended: ["+"]; }
            BackspaceKey {}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKeyUp { label: "q"; shifted: "Q"; }
            CharKeyUp { label: "w"; shifted: "W"; }
            CharKeyUp { label: "e"; shifted: "E"; }
            CharKeyUp { label: "r"; shifted: "R"; }
            CharKeyUp { label: "t"; shifted: "T"; }
            CharKeyUp { label: "y"; shifted: "Y"; }
            CharKeyUp { label: "u"; shifted: "U"; }
            CharKeyUp { label: "i"; shifted: "I"; }
            CharKeyUp { label: "o"; shifted: "O"; }
            CharKeyUp { label: "p"; shifted: "P"; }
            CharKeyUp { label: "["; extended: ["{"]; }
            CharKeyUp { label: "]"; extended: ["}"]; }
            CharKeyUp { label: "|"; extended: ["\\"]; }

        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKeyUp { label: "Esc"; action: "esc"; }
            CharKeyUp { label: "a"; shifted: "A"; }
            CharKeyUp { label: "s"; shifted: "S"; }
            CharKeyUp { label: "d"; shifted: "D"; }
            CharKeyUp { label: "f"; shifted: "F"; }
            CharKeyUp { label: "g"; shifted: "G"; }
            CharKeyUp { label: "h"; shifted: "H"; }
            CharKeyUp { label: "j"; shifted: "J"; }
            CharKeyUp { label: "k"; shifted: "K"; }
            CharKeyUp { label: "l"; shifted: "L"; }
            CharKeyUp { label: ";"; extended: [":"]; }
            CharKeyUp { label: "'"; extended: ["\""]; }
            ReturnKey2 {}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKeyUp { label: "↹"; action: "tab"; }
            CharKeyUp { label: "z"; shifted: "Z"; }
            CharKeyUp { label: "x"; shifted: "X"; }
            CharKeyUp { label: "c"; shifted: "C"; }
            CharKeyUp { label: "v"; shifted: "V"; }
            CharKeyUp { label: "b"; shifted: "B"; }
            CharKeyUp { label: "n"; shifted: "N"; }
            CharKeyUp { label: "m"; shifted: "M"; }
            CharKeyUp { label: ","; extended: ["<"]; }
            CharKeyUp { label: "."; extended: [">"]; }
            CharKeyUp { label: "/"; extended: ["?"]; }
            CharKeyUp { label: "↑"; action: "up"; padding: 0; }
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + Device.row_margin;

            CharKeyUp { id: ctrl; label: "Ctrl"; action: "ctrl"; anchors.left: parent.left; }
            CharKeyUp { id: alt;  label: "Alt";  action: "alt";  anchors.left: ctrl.right;  }
            LanguageSwitch{ id: language; next: "zh-hans"; anchors.left: alt.right; }
            // SpaceKey 必须加id:spaceKey
            SpaceKey  { id: spaceKey; anchors.left: language.right; anchors.right: left.left; noMagnifier: true; height: parent.height; }
            CharKeyUp { id: left;  label: "←"; action: "left";   anchors.right: down.left;    padding: 0; }
            CharKeyUp { id: down;  label: "↓"; action: "down";   anchors.right: right.left;   padding: 0; }
            CharKeyUp { id: right; label: "→"; action: "right";  anchors.right: parent.right; padding: 0; }

        }
    } // column
}
