import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        width: Math.min(parent.width,parent.height * 2)
        height: width / 2

        border.color: "green"

        TrafficLight {
            id: trafficlight1
            width: parent.width * 45 / 600
            x: parent.width * 20 / 600
            y: parent.width * 20 / 600
        }

        TrafficLight {
            id: trafficlight2
            width: parent.width * 45 / 600
            x: parent.width * 20 / 600
            y: (parent.width * 40 / 600) + height
        }
    }
}
