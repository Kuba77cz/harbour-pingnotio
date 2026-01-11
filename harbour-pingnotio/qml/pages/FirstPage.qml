import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Notifications 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    function send() {
        if (titleField.text === "" && bodyField.text === "")
            return;

        myNotification.summary = titleField.text
        myNotification.body = bodyField.text
        myNotification.publish()

        titleField.text = ""
        bodyField.text = ""
    }


    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.animatorPush(Qt.resolvedUrl("About.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        PageHeader {
            id: header
            title: qsTr("PingNotio")
        }

        Item {
            anchors {
                top: header.bottom
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            Column {
                spacing: Theme.paddingSmall
                //anchors.centerIn: parent

                TextField {
                    id: titleField
                    placeholderText: qsTr("Enter title")
                    focus: true
                    width: page.width
                    EnterKey.enabled: text.length > 0
                    EnterKey.onClicked: bodyField.focus = true
                }

                TextField {
                    id: bodyField
                    placeholderText: qsTr("Enter text")
                    width: page.width
                    wrapMode: Text.Wrap
                    EnterKey.enabled: text.length > 0
                    EnterKey.onClicked: send()
                }

                Button {
                    text: qsTr("Send notification")
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: send()
                }
            }
        }

        Notification {
            id: myNotification
            appName: "PingNotio"
            urgency: Notification.Normal
            icon: "icon-launcher"
        }
    }
}
