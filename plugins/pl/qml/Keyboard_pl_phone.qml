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

import QtQuick 2.0
import keys 1.0

KeyPad {
    content: c1
    symbols: "languages/Keyboard_symbols_phone.qml"

    Column {
        id: c1
        anchors.right: parent.right
        anchors.left: parent.left
        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            height: keyHeight;

            CharKey { label: "q"; shifted: "Q"; }
            CharKey { label: "w"; shifted: "W"; }
            CharKey { label: "e"; shifted: "E"; extended: ["ę","é","ě","€"]; extendedShifted: ["Ę","É","Ě","€"] }
            CharKey { label: "r"; shifted: "R"; extended: ["ŕ","ř"]; extendedShifted: ["Ŕ","Ř"] }
            CharKey { label: "t"; shifted: "T"; extended: ["ţ","ť"]; extendedShifted: ["Ţ","Ť"] }
            CharKey { label: "y"; shifted: "Y"; extended: ["¥"]; extendedShifted: ["¥"] }
            CharKey { label: "u"; shifted: "U"; extended: ["ü","ú","ů","ű"]; extendedShifted: ["Ü","Ú","Ů","Ű"] }
            CharKey { label: "i"; shifted: "I"; extended: ["í","î"]; extendedShifted: ["Í","Î"] }
            CharKey { label: "o"; shifted: "O"; extended: ["ó","ö","ô","ő"]; extendedShifted: ["Ó","Ö","Ô","Ő"] }
            CharKey { label: "p"; shifted: "P"; }
            CharKey { label: "ż"; shifted: "Ż"; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            height: keyHeight;

            CharKey { label: "a"; shifted: "A"; extended: ["ą","ä","á","â","ă"]; extendedShifted: ["Ą","Ä","Á","Â","Ă"] }
            CharKey { label: "s"; shifted: "S"; extended: ["ś","ß","ş","š","$"]; extendedShifted: ["Ś","Ş","Š","$"] }
            CharKey { label: "d"; shifted: "D"; extended: ["ď","đ"]; extendedShifted: ["Ď","Đ"] }
            CharKey { label: "f"; shifted: "F"; }
            CharKey { label: "g"; shifted: "G"; }
            CharKey { label: "h"; shifted: "H"; }
            CharKey { label: "j"; shifted: "J"; }
            CharKey { label: "k"; shifted: "K"; }
            CharKey { label: "l"; shifted: "L"; extended: ["ł","ľ","ĺ"]; extendedShifted: ["Ł","Ľ","Ĺ"] }
            CharKey { label: "ł"; shifted: "Ł"; }
            CharKey { label: "ą"; shifted: "Ą"; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            height: keyHeight;

            ShiftKey {}
            CharKey { label: "z"; shifted: "Z"; extended: ["ż","ź","ž"]; extendedShifted: ["Ż","Ź","Ž"] }
            CharKey { label: "x"; shifted: "X"; }
            CharKey { label: "c"; shifted: "C"; extended: ["ć","č","ç"]; extendedShifted: ["Ć","Č","Ç"] }
            CharKey { label: "v"; shifted: "V"; }
            CharKey { label: "b"; shifted: "B"; }
            CharKey { label: "n"; shifted: "N"; extended: ["ń","ň","ñ"]; extendedShifted: ["Ń","Ň","Ñ"] }
            CharKey { label: "m"; shifted: "M"; }
            CharKey { label: "ę"; shifted: "Ę"; }
            BackspaceKey {}
        }

        Component {
            id: contentTypeNormal
            Item {
                height: keyHeight

                SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; }
                LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; }
                CharKey        { id: commaKey;    label: ","; shifted: "/";  anchors.left: languageMenuButton.right; }
                SpaceKey       { id: spaceKey;                               anchors.left: commaKey.right; anchors.right: dotKey.left; }
                CharKey        { id: dotKey;      label: "."; shifted: ".";  anchors.right: enterKey.left; }
                ReturnKey      { id: enterKey;                               anchors.right: parent.right }
            }
        }
        Component {
            id: contentTypeEmail

            Item {
                height: keyHeight

                SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; }
                CharKey        { id: atKey;    label: "@"; shifted: "@";     anchors.left: symShiftKey.right; }
                SpaceKey       { id: spaceKey;                               anchors.left: atKey.right; anchors.right: urlKey.left; }
                UrlKey         { id: urlKey; label: ".pl";                   anchors.right: dotKey.left; }
                CharKey        { id: dotKey;      label: "."; shifted: ".";  anchors.right: enterKey.left; }
                ReturnKey      { id: enterKey;                               anchors.right: parent.right }
            }
        }
        Component {
            id: contentTypeUrl

            Item {
                height: keyHeight

                SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; }
                CharKey        { id: slashKey;    label: "/"; shifted: "/";  anchors.left: symShiftKey.right; }
                SpaceKey       { id: spaceKey;                               anchors.left: slashKey.right; anchors.right: urlKey.left; }
                UrlKey         { id: urlKey; label: ".pl";                   anchors.right: dotKey.left; }
                CharKey        { id: dotKey;      label: "."; shifted: ".";  anchors.right: enterKey.left; }
                ReturnKey      { id: enterKey;                               anchors.right: parent.right }
            }
        }
        Loader {
            anchors.left: parent.left
            anchors.right: parent.right

            sourceComponent: currentContentType === 0 ? contentTypeNormal :
                             currentContentType === 3 ? contentTypeEmail : contentTypeUrl
        }
    } // column
}
