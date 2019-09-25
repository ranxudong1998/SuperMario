import QtQuick 2.0
import Felgo 3.0
import "../scene"
Rectangle {
    id: rectangle1
    color: "#000000"
    width: 400
    height: 640

    anchors.centerIn: gameScene
    property int score //分数
    property int time //时间
    property alias image: imageStar //图片
    opacity: 0.5

    Rectangle {
        id: rectangle
        x: 60
        color: parent.color
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 0

        //祝贺
        Text {
            opacity: 1
            id: element
            color: "#ffffff"
            anchors.centerIn: parent
            font.family: successFont.name
            text: qsTr("Congratulations")
            anchors.verticalCenterOffset: 106
            anchors.horizontalCenterOffset: -148
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.pixelSize: 45
        }
    }
    //分数
    Text {
        opacity: 1
        id: element1
        x: 49
        y: 156
        width: 120
        height: 78
        color: "#ffffff"
        font.family: successFont.name
        text: qsTr("Score:")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 35
    }
    Text {
        id: scoreGame
        x: 266
        opacity: 1
        y:156
        color: "#ffffff"
        width: 120
        height: 78
        font.pixelSize: 35
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        text: score
        font.family: successFont.name
    }

    //时间
    Text {
        id: element2
        x: 49
        y: 287
        width: 120
        height: 78
        color: "#ffffff"
        font.family: successFont.name
        text: qsTr("Time:")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 35
    }
    Text {
        id: timeGame
        y:287
        width: 120
        height: 78
        font.pixelSize: 35
        color: "#ffffff"
        opacity: 1
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        x: 260
        text:minute + "'" + second + "''"
        font.family: successFont.name
    }

    //加载的字体
    FontLoader{
        id: successFont
        source: "../../assets/font/PepitaMT.ttf"
    }

    //星星的精灵动画
    SpriteSequence{
        id:imageStar
        x: 131
        y: 426
        height:40
        width: 120
        interpolate: false
        goalSprite: ""

        Sprite {
            name: "star1"
            source: "../../assets/img/game/stars.png"
            frameCount: 1
            frameX: 0
            frameY: 0
            frameWidth: 120
            frameHeight: 40
        }
        Sprite {
            name:"star2"
            source:"../../assets/img/game/stars.png"
            frameCount: 1
            frameX: 0
            frameY: 40
            frameWidth: 120
            frameHeight: 40

        }
        Sprite {
            name:"star3"
            source:"../../assets/img/game/stars.png"
            frameCount: 1
            frameX: 0
            frameY: 80
            frameWidth: 120
            frameHeight: 40
        }

    }
    property int minute
    property int second
    function time_Process(){
        var allGameTime = 300 - time
        minute = allGameTime / 60
        second = allGameTime % 60
    }

    //返回按钮
    OurGameButtons{
        id: backButton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imageStar.bottom
        anchors.topMargin: parent.height/10
        text.text: "back"
        onClicked: {
            parent.visible = false
            gameWindow.state = "level"
//            gameScene.player.
            playerImage.opacity=0
//            collider.active=false
        }
    }
}

