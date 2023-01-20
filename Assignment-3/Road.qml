import QtQuick 2.15

Rectangle {
    width: 540
    height: width
    color: "transparent"

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

        Image {
            id: carImage
            source: "assets/Car.png"
            height: parent.height
            width: height * 1.5
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                container.startCar()
            }
        }

        function startCar() {
            carAnimation.start()
        }

        SequentialAnimation {
            id: carAnimation
            NumberAnimation {
                target: carImage
                property: "x"
                to: parent.width
                duration: container.width * (container.duration / 250)
            }
        }
    }
}
