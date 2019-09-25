import QtQuick 2.12
import QtQml 2.1

Rectangle{
    id:failed


    opacity: 0.5
    color: "#000000"
    anchors.centerIn: gameScene
    width: 400
    height: 640

    property bool isTimeOut: false//判断是时间溢出还是失败了

    //加载的字体
    FontLoader{
        id: failedFont
        source: "../../assets/font/PepitaMT.ttf"
    }

    Column{

        id:column
        width:parent.width*2/3
        height: parent.height*2/3
        anchors.centerIn: parent
        spacing: parent.height/10

        Rectangle {
            id: rectangle
            width: parent.width
            height: parent.height/5

            Text {
                id: element
                text: isTimeOut ? qsTr("Time out !") : qsTr("You Losed")
                anchors.fill: parent
                font.bold: true
                font.family: failedFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 50
            }
        }

        Rectangle {
            id: rectangle1

            width: parent.width
            height: parent.height/5


            Text {
                id: element1
                text: qsTr("Once  Again")
                font.family: failedFont.name
                font.bold: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
                font.pixelSize: 45
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameScene.restart(gameScene.currentLevel)
                    failed.visible = false
                    gameScene.player.coinNumber = 0
                }
            }
        }

        Rectangle {
            id: rectangle2

            width:parent.width
            height: parent.height/5

            Text {
                id: element2
                text: qsTr("MENU")
                anchors.fill: parent
                font.bold: true
                font.family: failedFont.name
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 30
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gameWindow.state="level"
                    failed.visible = false
                }
            }
        }
    }
}

