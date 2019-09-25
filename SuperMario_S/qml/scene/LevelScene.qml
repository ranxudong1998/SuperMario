import Felgo 3.0
import QtQuick 2.12

import "../levels"
// EMPTY SCENE

SceneBase {
    id: levelScene

    //背景
    Column {
        z: -1
        Repeater {
            id: repeater
            model: 10
            Rectangle {
                width: levelScene.width
                height: levelScene.height / 10
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: "lightblue"
                    }
                    GradientStop {
                        position: 0.5
                        color: "#CCCCCC"
                    }
                    GradientStop {
                        position: 1.0
                        color: "lightblue"
                    }
                }
            }
        }
    }

    //标题
    //    Text {
    //        id: title
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        anchors.top:parent.top
    //        anchors.topMargin: 20
    //        text: qsTr("select level")
    //        font.pointSize: 45
    //        font.family: "URW Chancery L"
    //    }

    //主菜单
    MultiResolutionImage{
        id: home
        width: parent.width/15
        height:parent.width/15
        source: "../../assets/img/game/home.png"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin:height/2
        anchors.rightMargin: width/2
        fillMode: Image.Stretch
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menu"
                console.log("back home")
            }
        }
    }

    //关卡
    Grid{

        id: levelgrid
        columns: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height/9
        width: parent.width
        height: parent.height
        columnSpacing: parent.width/9
        leftPadding: parent.width/9
        rightPadding: parent.width/9
        rowSpacing: parent.height/10

        Rectangle{
            id: level1;
            width: parent.width/3;
            height: parent.height/3;
            radius: height/4
            color: "black"
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35579.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    startLevel(0)
                }
            }
        }
        Rectangle{
            id: level2;
            width: parent.width/3;
            height: parent.height/3;
            color: "black"
            radius: height/4
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35621.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    startLevel(1)
                }
            }
        }
        Rectangle{
            id: level3;
            width:parent.width/3;
            height: parent.height/3;
            color: "black"
            radius: height/4
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35597.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    startLevel(2)
                }
            }
        }
        Rectangle{
            id: level4;
            width: parent.width/3;
            height: parent.height/3;
            color: "black"
            radius: height/4
            MultiResolutionImage{
                width: parent.width+10
                height:  parent.height+10
                anchors.centerIn: parent
                source: "../../assets/img/game/PTModelSprite_ID35609.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    startLevel(3)
                }
            }
        }
    }

    function startLevel(level){
        gameScene.container.loader.source =""
        switch(level){
        case 0:
            gameScene.currentLevel = 0;
            gameScene.container.loader.source = "../levels/Level1.qml"
            break;
        case 1:
            gameScene.currentLevel = 1;
            gameScene.container.loader.source = "../levels/Level2.qml"
            break;
        case 2:
            gameScene.currentLevel = 2;
            gameScene.container.loader.source = "../levels/Level3.qml"
            break;
        case 3:
            gameScene.currentLevel = 3;
            gameScene.container.loader.source = "../levels/Level4.qml"
            break;
        }
        gameWindow.state = "game"
        gameScene.container.player.resetPlayer()
        gameScene.levelTimer.restart()
        gameScene.leftTime = 300 //规定闯关时间
    }
}
