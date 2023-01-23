import QtQuick 2.15

Rectangle {
    width: 540
    height: width
    color: "transparent"
    id: root

    Rectangle {
        id: container
        width: parent.width
        height: parent.height / 5
        x: 0
        y: parent.height * 2 / 5;
        property int duration: 1000
        clip: true

        Image {
            id: roadImage
            source: "assets/Road.jpg"
            anchors.fill: parent
        }
    }
}
