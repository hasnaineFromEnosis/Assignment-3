import QtQuick 2.5

Rectangle {
    width: 150
    height: width * 2.5
    color: "black"
    border.color: "grey"
    id: root
    property color black: "lightgrey"
    property int duration: 1000
    radius: width * 0.2
    state: "stop"

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

    states: [
        State {
            name: "stop"
            PropertyChanges { target: yellowlight; color: root.black}
            PropertyChanges { target: redlight; color: "red"}
        },
        State {
            name: "wait"
            PropertyChanges { target: redlight; color: root.black}
            PropertyChanges { target: greenlight; color: root.black}

            PropertyChanges { target: yellowlight; color: "yellow"}

        },
        State {
            name: "go"
            PropertyChanges { target: yellowlight; color: root.black}
            PropertyChanges { target: greenlight; color: "green" }
        }
    ]

    transitions: [
        Transition {
            from: "stop"; to: "wait"
            //            from: "*"; to: "*"
            ColorAnimation { target: redlight; properties: "color"; duration: root.duration * 0.5 }
            ColorAnimation { target: greenlight; properties: "color"; duration: root.duration * 0.5 }
            ColorAnimation { target: yellowlight; properties: "color"; duration: root.duration * 0.5 }
        },

        Transition {
            from: "go"; to: "wait"
            ColorAnimation { target: redlight; properties: "color"; duration: root.duration * 0.5 }
            ColorAnimation { target: greenlight; properties: "color"; duration: root.duration * 0.5 }
            ColorAnimation { target: yellowlight; properties: "color"; duration: root.duration * 0.5 }
        },

        Transition {
            from: "wait"; to: "stop"
            ColorAnimation { target: yellowlight; properties: "color"; duration: root.duration * 0.5 }
            ColorAnimation { target: redlight; properties: "color"; duration: root.duration * 0.5 }
        },

        Transition {
            from: "wait"; to: "go"
            ColorAnimation { target: yellowlight; properties: "color"; duration: root.duration * 0.5 }
            ColorAnimation { target: greenlight; properties: "color"; duration: root.duration * 0.5 }
        }
    ]

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


    function changeState() {
        console.log("pressed")
        if(root.state === "stop") {
            console.log("Waiting for go")
            root.state = "wait"
            timer.setTimeout(function(){
                   root.state = "go"
            }, root.duration * 0.5);
        } else {
            root.state = "wait"
            timer.setTimeout(function(){
                   root.state = "stop"
            }, root.duration * 0.5);
        }
    }
}
