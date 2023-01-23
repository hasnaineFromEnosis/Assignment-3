import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Traffic Light Simulator")
    id: root
    property int duration: 3000
    property bool isFirstTime: true
    color: "#FDFDBD"

    Rectangle {
        width: Math.min(parent.width,parent.height * 1.8)
        height: width / 1.8
        id: maincontainer

        color: "#CDE990"
        property bool isRoad1Open: true

        Rectangle {
            id: trafficLightContainer
            height: maincontainer.height
            width: maincontainer.width / 6
            x:0
            y:0
            color: "transparent"

            TrafficLight {
                id: trafficlight1
                width: maincontainer.width * 45 / 600
                x: maincontainer.width * 20 / 600
                y: maincontainer.width * 20 / 600
                duration: root.duration

            }

            TrafficLight {
                id: trafficlight2
                width: maincontainer.width * 45 / 600
                x: maincontainer.width * 20 / 600
                y: (maincontainer.width * 40 / 600) + height
                duration: root.duration
            }

            Button {
                id: controlButton
                width: trafficLightContainer.width
                x:0
                y: trafficLightContainer.height - this.height
                text: "Starting..."
                onClicked: root.start()
            }
        }

        Rectangle {
            id: roadContainer
            width: maincontainer.width - trafficLightContainer.width
            height: maincontainer.height
            anchors.left: trafficLightContainer.right
            x: trafficLightContainer.width

            color: "transparent"

            Rectangle {
                id: roadSubContainer
                width: Math.min(roadContainer.width, roadContainer.height)
                height: width
                anchors.centerIn: roadContainer
                color: "#AACB73"

                Road {
                    id: road1
                    width: roadSubContainer.width
                }

                Road {
                    id: road2
                    width: roadSubContainer.width
                    rotation: 90
                }

                Car {
                    id: car1
                    width: roadSubContainer.width
                }

                Car {
                    id: car2
                    width: roadSubContainer.width
                    rotation: 90
                }
            }
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



    function start() {
        if(root.isFirstTime === true) {
            root.isFirstTime = false
            controlButton.focus = true
            if (maincontainer.isRoad1Open == true) {
                controlButton.text = "Open Vertical Road"
                trafficlight1.changeState()
                timer.setTimeout(function() {
                    car1.startCar()
                }, root.duration + 500)
            } else {
                controlButton.text = "Open Horizontal Road"
                trafficlight2.changeState()
                timer.setTimeout(function() {
                    car2.startCar()
                },root.duration + 500)
            }
        } else {
            toggleTrafficLight()
        }
    }

    function toggleTrafficLight() {
        if(maincontainer.isRoad1Open === true) {
            maincontainer.isRoad1Open = false
            controlButton.text = "Open Horizontal Road"
            car1.pauseCar()
            timer.setTimeout(function() {
                car2.startCar()
            },root.duration + 500)
        } else {
            maincontainer.isRoad1Open = true
            controlButton.text = "Open Vertical Road"
            trafficlight2.state = "false"
            timer.setTimeout(function() {
                car1.startCar()
            },root.duration + 500)
            car2.pauseCar()
        }

        trafficlight1.changeState()
        trafficlight2.changeState()
    }
}
