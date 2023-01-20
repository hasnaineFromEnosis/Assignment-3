import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Traffic Light Simulator")

    Rectangle {
        width: Math.min(parent.width,parent.height * 1.8)
        height: width / 1.8
        id: maincontainer

        border.color: "green"

        Rectangle {
            id: trafficLightContainer
            height: maincontainer.height
            width: maincontainer.width / 6
            x:0
            y:0
            border.color: "red"

            TrafficLight {
                id: trafficlight1
                width: maincontainer.width * 45 / 600
                x: maincontainer.width * 20 / 600
                y: maincontainer.width * 20 / 600
            }

            TrafficLight {
                id: trafficlight2
                width: maincontainer.width * 45 / 600
                x: maincontainer.width * 20 / 600
                y: (maincontainer.width * 40 / 600) + height
            }
        }

        Rectangle {
            id: roadContainer
            width: maincontainer.width - trafficLightContainer.width
            height: maincontainer.height
            anchors.left: trafficLightContainer.right
            x: trafficLightContainer.width
            border.color: "orange"

            Rectangle {
                id: roadSubContainer
                width: Math.min(roadContainer.width, roadContainer.height)
                height: width
                anchors.centerIn: roadContainer
                border.color: "black"


                Road {
                    width: roadSubContainer.width
                }

                Road {
                    width: roadSubContainer.width
                    rotation: 90
                }
            }
        }
    }
}
