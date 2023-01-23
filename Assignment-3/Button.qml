// Button.qml

import QtQuick 2.5

Rectangle {
    id: root
    // export button properties
    property alias text: label.text
    signal clicked

    width: 116; height: width * (30/116)
    color: "#BFDB38"
    border.color: "slategrey"
    radius: width * (5 / 116)

    Text {
        id: label
        anchors.centerIn: parent
        text: "Start"
        font.pointSize: root.height * (8.0 / 30.0)
        fontSizeMode: Text.Fit
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}
