import QtQuick 2.5

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
        property double stopPoint: width * (60.0 / 540.0)
        clip: true

        color: "transparent"

        Image {
            id: carImage
            source: "assets/Car.png"
            height: parent.height
            width: height * 1.5
            x: container.stopPoint
        }
    }

    SequentialAnimation {
        id: carAnimation

        NumberAnimation {
            target: carImage
            property: "x"
            to: parent.width
            duration: (container.width - x) * (container.duration / 700)
        }

        NumberAnimation {
            target: carImage
            property: "x"
            to: -carImage.width
            duration: 0
        }

        NumberAnimation {
            target: carImage
            property: "x"
            to: parent.width
            duration: (container.width - x) * (container.duration / 250)
            loops: Animation.Infinite
        }
    }

    SequentialAnimation {
        id: carAnimationStop
        NumberAnimation {
            target: carImage
            property: "x"
            to: parent.width
            duration: (container.width - x) * (container.duration / 350)
        }

        NumberAnimation {
            target: carImage
            property: "x"
            to: -carImage.width
            duration: 0
        }

        NumberAnimation {
            target: carImage
            property: "x"
            to: container.stopPoint
            duration: (container.width - x) * (container.duration / 250)
        }
    }

    function startCar() {
        carAnimation.start()
    }

    function pauseCar() {
        carAnimation.stop()
        carAnimationStop.start()
    }

}
