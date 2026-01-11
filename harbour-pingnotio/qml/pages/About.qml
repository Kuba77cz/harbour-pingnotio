import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: contactsPage

    SilicaFlickable {
        anchors.fill: parent

        contentHeight: column.height

        Column {
            id: column
            width: contactsPage.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("About")
            }

            Label {
                text: qsTr("PingNotio")
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeExtraLarge*1.5
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "/usr/share/icons/hicolor/86x86/apps/harbour-pingnotio.png"
                width: parent.width *0.2
                height: width
            }

            Label {
                text: qsTr("Version 1.0")
                font.pixelSize: Theme.fontSizeTiny
                color: Theme.secondaryHighlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: qsTr("Author: ") + "Kuba77"
                font.pixelSize: Theme.fontSizeTiny
                color: Theme.secondaryHighlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("This application is opensource: <a href=\"https://github.com/Kuba77cz/harbour-pingnotio\">Github</a>")
                color: Theme.secondaryHighlightColor
                onLinkActivated: Qt.openUrlExternally(link)
            }
        }
    }
}
