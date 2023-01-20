import QtQuick 2.5

Item {
    width: 500
    height: 500

    id: root

    property color black: "lightgrey"

    Rectangle {
        width: 150
        height: 300
        border.color: "black"

        Rectangle {
            id: light1
            x: 25; y: 15
            width: 100; height: width
            radius: width/2
            color: root.black
            border.color: "black"
        }

        Rectangle {
            id: light2
            x: 25; y: 135
            width: 100; height: width
            radius: width/2
            color: root.black
            border.color: "black"
        }
    }

    state: "stop"

    states: [
        State {
            name: "stop"
            PropertyChanges { target: light1; color: "red"}
            PropertyChanges { target: light2; color: root.black }
        },
        State {
            name: "go"
            PropertyChanges { target: light1; color: root.black }
            PropertyChanges { target: light2; color: "green" }
        }
    ]

    transitions: [
        Transition {
            from: "stop"; to: "go"
            //            from: "*"; to: "*"
            ColorAnimation { target: light1; properties: "color"; duration: 2000 }
            ColorAnimation { target: light2; properties: "color"; duration: 2000 }
        },

        Transition {
            from: "go"; to: "stop"
            //            from: "*"; to: "*"
            ColorAnimation { target: light1; properties: "color"; duration: 2000 }
            ColorAnimation { target: light2; properties: "color"; duration: 2000 }
        }
    ]

    MouseArea {
        anchors.fill: parent
        onClicked: parent.state = (parent.state === "stop"? "go" : "stop")
    }
}
