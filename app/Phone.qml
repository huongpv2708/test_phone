/*
 * Copyright (C) 2016 The Qt Company Ltd.
 * Copyright (C) 2018 Konsulko Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

import QtQuick.Window 2.13

ApplicationWindow {
    id: root

    width: container.width * container.scale
    height: container.height * container.scale

    Item {
        id: container
        anchors.centerIn: parent
        width: Window.width
        height: Window.height
        //scale: screenInfo.scale_factor()
        scale: 1

    TabBar {
        id: bar
        width: parent.width
        contentHeight: 160

        TabImageButton {
            icon: "./images/ic_contacts_48px.svg"
            text: "CONTACTS_huongpham4"
            font.pixelSize: 30
        }

        TabImageButton {
            icon: "./images/ic_schedule_48px.svg"
            text: "RECENTS_huongpham4"
            font.pixelSize: 30
        }

        TabImageButton {
            icon: "./images/ic_dialpad_48px.svg"
            text: "DIALPAD_huongpham4"
            font.pixelSize: 30
        }

    }

    StackLayout {
        anchors.top: bar.bottom
        width: parent.width
        height:parent.height - bar.height
        currentIndex: bar.currentIndex
        ContactsView {
            id: contacts
            onCall: {
                dialer.call(cname, cnumber)
                bar.setCurrentIndex(2)
            }
        }
        Recents {
            id: recents
            onCall: {
                dialer.call(cname, cnumber)
                bar.setCurrentIndex(2)
            }
        }
        Dialer {
            id: dialer
        }
    }
}
}
