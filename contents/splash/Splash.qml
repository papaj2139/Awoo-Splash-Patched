import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: root
    width: PlasmaCore.Units.gridUnit * 60
    height: PlasmaCore.Units.gridUnit * 40

    Image {
        id: background
        anchors.fill: parent
        source: "images/background.png"
        fillMode: Image.PreserveAspectCrop
    }

    AnimatedImage {
        id: wanwan
        source: "images/wanwan.gif"
        anchors.centerIn: parent
        opacity: 0
        cache: true
    }

    AnimatedImage {
        id: awoo_right
        source: "images/awoo_right.gif"
        anchors { bottom: parent.bottom; right: parent.right }
        opacity: 0
        cache: true
    }

    AnimatedImage {
        id: awoo_left
        source: "images/awoo_left.gif"
        anchors { bottom: parent.bottom; left: parent.left }
        opacity: 0
        cache: true
    }

    SequentialAnimation {
        id: introAnimation
        running: true

        ParallelAnimation {
            PropertyAnimation {
                target: awoo_left
                property: "opacity"
                from: 0
                to: 1
                duration: 750
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
            PropertyAnimation {
                target: awoo_right
                property: "opacity"
                from: 0
                to: 1
                duration: 750
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }

        PropertyAnimation {
            target: wanwan
            property: "opacity"
            from: 0
            to: 1
            duration: 500
            easing.type: Easing.InOutBack
            easing.overshoot: 1.0
        }
    }
}
