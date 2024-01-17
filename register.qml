import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.1
import QtQuick.Timeline 1.0
import "components"

Window {
    id: loginSystem
    width: 380
    height: 580
    visible: true
    color: "#00000000"

    flags: Qt.FramelessWindowHint

    Rectangle {
        id: loginScreen
        width: 360
        height: 560
        color: "#151515"
        radius: 10

        CustomButton {
            id: closeBtn
            x: 305
            y: 25
            width: 30
            height: 30
            opacity: 1
            text: "X"
            onClicked: loginSystem.close()
        }

        Label {
            id: label1
            x: 55
            y: 291
            opacity: 1
            color: "#ffffff"
            text: qsTr("Please enter Username and password")
            anchors.horizontalCenterOffset: 0
            font.family: "Segoe UI"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

        Label {
            id: label
            x: 100
            y: 261
            opacity: 1
            color: "#ffffff"
            text: qsTr("Register to HydroApp")
            anchors.horizontalCenterOffset: 0
            font.family: "Segoe UI"
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomTextField {
            id: textUsername
            x: 30
            y: 345
            opacity: 1
            placeholderText: "Username"
        }

        CustomTextField {
            id: textPassword
            x: 30
            y: 395
            opacity: 1
            echoMode: TextInput.Password
            placeholderText: "Password"
        }

        CustomTextField {
            id: textRePassword
            x: 30
            y: 445
            opacity: 1
            echoMode: TextInput.Password
            placeholderText: "Re-Password"
        }

        CustomButton {
            id: registerBtn
            x: 30
            y: 495
            width: 300
            height: 40
            opacity: 1
            text: "Register"
            onClicked: {
                login.userRegister(textUsername.text, textPassword.text, textRePassword.text)
                if(!login.isRegister) {
                    failedMessageDialog.setVisible(true)
                }
                else {
                    successMessageDialog.setVisible(true)
                }
            }
        }

        Image {
            id: logo
            x: 0
            y: 131
            width: 360
            height: 98
            opacity: 1
            source: "images/logo.png"
            fillMode: Image.PreserveAspectFit
        }

        MessageDialog {
            id: failedMessageDialog
            title: "Error!"
            text: "Passwords not matched!"
            visible: false
        }

        MessageDialog {
            id: successMessageDialog
            title: "Success!"
            text: "The user has registered!"
            visible: false
            onAccepted: loginSystem.close()
        }
    }

}
