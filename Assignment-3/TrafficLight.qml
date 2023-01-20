import QtQuick 2.5

Rectangle {
    width: 150
    height: width * 2.5
    border.color: "black"
    id: root
    property color black: "lightgrey"
    property int duration: 1000

    Rectangle {
        id: redlight
        x: root.width / 6; y: root.width * 15 / 150
        width: root.width / 1.5; height: width
        radius: width/2
        color: root.black
        border.color: "black"
    }

    Rectangle {
        id: yellowlight
        x: root.width / 6; y: root.width * 135 / 150
        width: root.width / 1.5; height: width
        radius: width/2
        color: root.black
        border.color: "black"
    }

    Rectangle {
        id: greenlight
        x: root.width / 6; y: root.width * 255 / 150
        width: root.width / 1.5; height: width
        radius: width/2
        color: root.black
        border.color: "black"
    }
    state: "stop"

    states: [
        State {
            name: "stop"
            PropertyChanges { target: redlight; color: "red"}
            PropertyChanges { target: greenlight; color: root.black }
        },
        State {
            name: "go"
            PropertyChanges { target: redlight; color: root.black }
            PropertyChanges { target: greenlight; color: "green" }
        }
    ]

    transitions: [
        Transition {
            from: "stop"; to: "go"
            //            from: "*"; to: "*"
            ColorAnimation { target: redlight; properties: "color"; duration: root.duration }
            ColorAnimation { target: greenlight; properties: "color"; duration: root.duration }
        },

        Transition {
            from: "go"; to: "stop"
            //            from: "*"; to: "*"
            ColorAnimation { target: redlight; properties: "color"; duration: root.duration }
            ColorAnimation { target: greenlight; properties: "color"; duration: root.duration }
        }
    ]

    MouseArea {
        anchors.fill: parent
        onClicked: parent.state = (parent.state === "stop"? "go" : "stop")
    }
}
