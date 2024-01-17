import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "components"

Window {
    id: welcomeScreen
    width: 380
    height: 580
    visible: true
    color: "#00000000"

    flags:Qt.FramelessWindowHint

    Rectangle {
        id: loginScreen
        width: 360
        height: 560
        color: "#151515"
        radius: 10

        Label {
            id: label1
            x: 55
            y: 330
            text: qsTr("Welcome! " + login.handledUser)
            color: "#ffffff"
            font.pointSize: 20
        }

        CustomButton {
            id: closeBtn
            x: 305
            y: 25
            width: 30
            height: 30
            opacity: 1
            text: "X"
            onClicked: welcomeScreen.close()
        }
    }
}
