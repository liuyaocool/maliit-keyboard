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

            ActionKey { label: "Esc"; action: "esc"; shifted: label; }
            
            CharKey { label: "-"; shifted: "_"; extended: ["_"]; extendedShifted: ["-"]; }
            CharKey { label: "="; shifted: "+"; extended: ["+"]; extendedShifted: ["="]; }

            CharKey { label: "["; shifted: "{"; extended: ["{"]; extendedShifted: ["["]; }
            CharKey { label: "]"; shifted: "}"; extended: ["}"]; extendedShifted: ["]"]; }

            CharKey { label: ";"; shifted: ":"; extended: [":"]; extendedShifted: [";"]; }
            CharKey { label: "'"; shifted: "\""; extended: ["\""]; extendedShifted: ["'"]; }
        
            CharKey { label: ","; shifted: "<"; extended: ["<"]; extendedShifted: [","]; }
            CharKey { label: "|"; shifted: "\\"; extended: ["\\"]; extendedShifted: ["|"]; }

            BackspaceKey {}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "`"; shifted: "~"; extended: ["~"]; extendedShifted: ["`"]; }
            CharKey { label: "1"; shifted: "!"; extended: ["!"]; extendedShifted: ["1"]; }
            CharKey { label: "2"; shifted: "@"; extended: ["@"]; extendedShifted: ["2"]; }
            CharKey { label: "3"; shifted: "#"; extended: ["#"]; extendedShifted: ["3"]; }
            CharKey { label: "4"; shifted: "$"; extended: ["$"]; extendedShifted: ["4"]; }
            CharKey { label: "5"; shifted: "%"; extended: ["%"]; extendedShifted: ["5"]; }
            CharKey { label: "6"; shifted: "^"; extended: ["^"]; extendedShifted: ["6"]; }
            CharKey { label: "7"; shifted: "&"; extended: ["&"]; extendedShifted: ["7"]; }
            CharKey { label: "8"; shifted: "*"; extended: ["*"]; extendedShifted: ["8"]; }
            CharKey { label: "9"; shifted: "("; extended: ["("]; extendedShifted: ["9"]; }
            CharKey { label: "0"; shifted: ")"; extended: [")"]; extendedShifted: ["0"]; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { label: "q"; shifted: "Q"; }
            CharKey { label: "w"; shifted: "W"; }
            CharKey { label: "e"; shifted: "E"; }
            CharKey { label: "r"; shifted: "R"; }
            CharKey { label: "t"; shifted: "T"; }
            CharKey { label: "y"; shifted: "Y"; }
            CharKey { label: "u"; shifted: "U"; }
            CharKey { label: "i"; shifted: "I"; }
            CharKey { label: "o"; shifted: "O"; }
            CharKey { label: "p"; shifted: "P"; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ActionKey { label: "↹"; action: "tab"; shifted: label; }
            CharKey { label: "a"; shifted: "A"; }
            CharKey { label: "s"; shifted: "S"; }
            CharKey { label: "d"; shifted: "D"; }
            CharKey { label: "f"; shifted: "F"; }
            CharKey { label: "g"; shifted: "G"; }
            CharKey { label: "h"; shifted: "H"; }
            CharKey { label: "j"; shifted: "J"; }
            CharKey { label: "k"; shifted: "K"; }
            CharKey { label: "l"; shifted: "L"; }
            ReturnKey {}
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            CharKey { label: "z"; shifted: "Z"; }
            CharKey { label: "x"; shifted: "X"; }
            CharKey { label: "c"; shifted: "C"; }
            CharKey { label: "v"; shifted: "V"; }
            CharKey { label: "b"; shifted: "B"; }
            CharKey { label: "n"; shifted: "N"; }
            CharKey { label: "m"; shifted: "M"; }
            ActionKey { label: "↑"; action: "up"; shifted: label; }
            ReturnKey {}
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + Device.row_margin;

            ActionKey { id: ctrl; label: "Ctrl"; action: "ctrl"; shifted: label; anchors.left: parent.left; }
            ActionKey { id: alt;  label: "Alt";  action: "alt";  shifted: label; anchors.left: ctrl.right;  }
            LanguageKey { id: language; anchors.left: alt.right; }
            // SpaceKey 必须加id:spaceKey 
            SpaceKey  { id: spaceKey; anchors.left: language.right; anchors.right: dot.left; noMagnifier: true; height: parent.height; }
            CharKey   { id: dot;   label: "."; anchors.right: sla.left;  shifted: ">"; extended: [">"]; extendedShifted: ["."]; }
            CharKey   { id: sla;   label: "/"; anchors.right: left.left; shifted: "?"; extended: ["?"]; extendedShifted: ["/"]; }
            ActionKey { id: left;  label: "←"; action: "left";   shifted: label; anchors.right: down.left;   }
            ActionKey { id: down;  label: "↓"; action: "down";   shifted: label; anchors.right: right.left;  }
            ActionKey { id: right; label: "→"; action: "right";  shifted: label; anchors.right: parent.right;}

        }
    } // column
}

