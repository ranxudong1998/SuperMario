import QtQuick 2.0

Rectangle{

    width: textNmae.width + textResult.width+4
    height:30

    property alias text: textNmae.text
    property alias result: textResult.text
    anchors.top: gameScene.gameWindowAnchorItem.top
    anchors.left: gameScene.gameWindowAnchorItem.left
    anchors.margins: 4

    radius: 4
    opacity: 0.5
    color: "#ffffff"

    FontLoader{
        id: scenePartShow
        source: "../../assets/font/PepitaMT.ttf"
    }

    //属性
    Text {
        id: textNmae
        font.family: scenePartShow.name
        anchors.left: parent.left
        anchors.leftMargin: 2
        font.pixelSize: 20
    }

    //值
    Text {
        id: textResult
        font.family: scenePartShow.name
        verticalAlignment: Text.AlignVCenter
        anchors.left: textNmae.right
        anchors.leftMargin: 2
        font.pixelSize: 20
    }


}
