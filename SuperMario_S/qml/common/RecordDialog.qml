import QtQuick 2.0
import QtQuick.Controls 2.5
import Felgo 3.0

Rectangle{
    width: 400
    height:380
    anchors.centerIn: gameScene

    property alias name: appTextField.text

    //加载的字体
    FontLoader{
        id: successFont
        source: "../../assets/font/PepitaMT.ttf"
    }
    Rectangle {
        id: rectangle
        x: 20
        y: 23
        width: 358
        height: 114
        color: parent.color
        opacity: 0.5

        Text {
            id: element
            color: "red"
            text: qsTr("Your are best")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 40
            font.family: successFont.name
            x: 49
        }
    }

    Label {
        id: label
        x: 29
        y: 197
        width: 134
        height: 67
        text: qsTr("name")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 35
        font.family: successFont.name


    }

    Button {
        id: button
        x: 141
        y: 310
        width: 66
        height: 57
        text: qsTr("OK")
        font.pointSize: 25
        onClicked:{
            rankScene.jsonModel.setProperty(gameScene.currentLevel,"holder",appTextField.text)
            rankScene.jsonModel.setProperty(gameScene.currentLevel,"record",finalSuccess.timeString)
            rankScene.recordChanged()
            rankScene.jsonarray = rankScene.jsonData

        }
    }

    AppTextField {
        id: appTextField
        x: 197
        y: 197
        width: 181
        height: 67
        font.pixelSize: 35
        font.family: successFont.name
        borderColor: "blue"
    }

}
