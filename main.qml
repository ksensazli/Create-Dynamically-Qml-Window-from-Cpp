import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
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

        CircularProgressBar {
            id: circularProgressBar
            x: 25
            y: 25
            width: 310
            height: 310
            opacity: 1
            value: 100
            progressWidth: 16
        }

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
            y: 330
            opacity: 1
            color: "#ffffff"
            text: qsTr("Please enter Username and password")
            anchors.bottom: textUsername.top
            anchors.bottomMargin: 20
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

        Label {
            id: label
            x: 100
            y: 294
            opacity: 1
            color: "#ffffff"
            text: qsTr("Sign in to HydroApp")
            anchors.bottom: label1.top
            anchors.bottomMargin: 10
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CustomTextField {
            id: textUsername
            x: 30
            y: 395
            opacity: 1
            placeholderText: "Username"
        }

        CustomTextField {
            id: textPassword
            x: 30
            y: 445
            opacity: 1
            echoMode: TextInput.Password
            placeholderText: "Password"
        }

        CustomButton {
            id: loginBtn
            x: 30
            y: 495
            width: 300
            height: 40
            opacity: 1
            text: "Login"
            onClicked: {
                login.userCheck(textUsername.text, textPassword.text)
            }
        }

        Timeline {
            id: timeline
            animations: [
                TimelineAnimation {
                    id: timelineAnimation
                    running: true
                    loops: 1
                    duration: 10000
                    to: 10000
                    from: 0
                }
            ]
            startFrame: 0
            endFrame: 10000
            enabled: true

            KeyframeGroup {
                target: circularProgressBar
                property: "value"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 100
                    frame: 2000
                }
            }

            KeyframeGroup {
                target: circularProgressBar
                property: "opacity"
                Keyframe {
                    value: 1
                    frame: 2000
                }

                Keyframe {
                    value: 0
                    frame: 2500
                }

                Keyframe {
                    value: 1
                    frame: 0
                }
            }

            KeyframeGroup {
                target: loginScreen
                property: "height"
                Keyframe {
                    value: 360
                    frame: 0
                }

                Keyframe {
                    value: 360
                    frame: 2000
                }

                Keyframe {
                    value: 560
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: textUsername
                property: "y"
                Keyframe {
                    value: 295
                    frame: 2500
                }

                Keyframe {
                    value: 395
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: textUsername
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2500
                }

                Keyframe {
                    value: 1
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: textPassword
                property: "y"
                Keyframe {
                    value: 295
                    frame: 2500
                }

                Keyframe {
                    value: 445
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: textPassword
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2500
                }

                Keyframe {
                    value: 1
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: loginBtn
                property: "y"
                Keyframe {
                    value: 295
                    frame: 2500
                }

                Keyframe {
                    value: 495
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: loginBtn
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2500
                }

                Keyframe {
                    value: 1
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: closeBtn
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2500
                }

                Keyframe {
                    value: 1
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: label
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2700
                }

                Keyframe {
                    value: 1
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: label1
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2700
                }

                Keyframe {
                    value: 1
                    frame: 3000
                }
            }

            KeyframeGroup {
                target: logo
                property: "opacity"
                Keyframe {
                    value: 0
                    frame: 0
                }

                Keyframe {
                    value: 0
                    frame: 2500
                }

                Keyframe {
                    value: 1
                    frame: 3000
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
    }

}
