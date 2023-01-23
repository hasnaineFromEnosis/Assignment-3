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
            x: parent.width - this.width
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                container.startCar()
            }
        }

        Timer {
            id: timer
            function setTimeout(cb, delayTime) {
                timer.interval = delayTime;
                timer.repeat = false;
                timer.triggered.connect(cb);
                timer.triggered.connect(function release () {
                    timer.triggered.disconnect(cb); // This is important
                    timer.triggered.disconnect(release); // This is important as well
                });
                timer.start();
            }
        }

        function startCar() {
            carAnimation.start()

            timer.setTimeout(function() {
                pauseCar()
            }, 3500)

        }

        function pauseCar() {
            carAnimation.stop()
            carAnimationStop.start()
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
                to: parent.width - carImage.width
                duration: (container.width - x) * (container.duration / 250)
            }
        }
    }
}
