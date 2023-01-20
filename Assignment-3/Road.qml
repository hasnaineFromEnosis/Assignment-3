import QtQuick 2.15

Rectangle {
    width: 540
    height: width
    color: "transparent"

    Rectangle {
        width: parent.width
        height: parent.height / 5
        x: 0
        y: parent.height * 2 / 5;

        Image {
            id: roadImage
            source: "assets/Road.jpg"
            anchors.fill: parent
        }
    }
}
