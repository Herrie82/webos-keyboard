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

            CharKey { label: "ק"; shifted: ""; }
            CharKey { label: "ר"; shifted: ""; }
            CharKey { label: "א"; shifted: ""; }
            CharKey { label: "ט"; shifted: ""; }
            CharKey { label: "ו"; shifted: ""; }
            CharKey { label: "ן"; shifted: ""; }
            CharKey { label: "ם"; shifted: ""; }
            CharKey { label: "פ"; shifted: ""; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            height: keyHeight;

            CharKey { label: "ש"; shifted: ""; }
            CharKey { label: "ד"; shifted: ""; }
            CharKey { label: "ג"; shifted: ""; }
            CharKey { label: "כ"; shifted: ""; }
            CharKey { label: "ע"; shifted: ""; }
            CharKey { label: "י"; shifted: ""; }
            CharKey { label: "ח"; shifted: ""; }
            CharKey { label: "ל"; shifted: ""; }
            CharKey { label: "ך"; shifted: ""; }
            CharKey { label: "ף"; shifted: ""; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            height: keyHeight;

            CharKey { label: "ז"; shifted: ""; }
            CharKey { label: "ס"; shifted: ""; }
            CharKey { label: "ב"; shifted: ""; }
            CharKey { label: "ה"; shifted: ""; }
            CharKey { label: "נ"; shifted: ""; }
            CharKey { label: "מ"; shifted: ""; }
            CharKey { label: "צ"; shifted: ""; }
            CharKey { label: "ת"; shifted: ""; }
            CharKey { label: "ץ"; shifted: ""; }
            BackspaceKey { padding: 0 }
        }

        Component {
            id: contentTypeNormal
            Item {
                height: keyHeight

                SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; }
                LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; }
                CharKey        { id: commaKey;    label: ","; shifted: "/";  anchors.left: languageMenuButton.right; }
                SpaceKey       { id: spaceKey;                               anchors.left: commaKey.right; anchors.right: dotKey.left; noMagnifier: true }
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
                SpaceKey       { id: spaceKey;                               anchors.left: atKey.right; anchors.right: urlKey.left; noMagnifier: true }
                UrlKey         { id: urlKey; label: ".il";                   anchors.right: dotKey.left; }
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
                SpaceKey       { id: spaceKey;                               anchors.left: slashKey.right; anchors.right: urlKey.left; noMagnifier: true }
                UrlKey         { id: urlKey; label: ".il";                   anchors.right: dotKey.left; }
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