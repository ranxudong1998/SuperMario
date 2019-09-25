import Felgo 3.0
import QtQuick 2.0
import "../entities"

SceneBase {
    id: menuScene

    //背景图片
    BackgroundImage{
        id:bgimage
        anchors.fill: parent
        source: "../../assets/img/game/backgroud3.png"
//        source: "../vassets/img/game/backgroud3.png"
    }

    //游戏名字
    MultiResolutionImage {
        id: gameName
        width: parent.width/3*2
        source: "../../assets/img/game/PTModelSprite_ID35736.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.1
    }

    //按钮
    Column{
        id: column
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin:  parent.height*0.15
        spacing: 5
//        property alias start: start  //导出去
//        property alias option: option
//        property alias setting: setting
        OurGameButtons {
            id: start
            text.text: "start"

            width: text.width
            height: 80

            onClicked: {
                gameWindow.state = "level"
                //console.log("start Clicked!")
            }
        }
        OurGameButtons {
            id: option
            text.text:  "option"

            width: text.width
            height: 80

            onClicked: {
                gameWindow.state = "option"
                //console.log("option Clicked!")
            }
        }
        OurGameButtons {
            id: ranking
            text.text:  "ranking"

            width: text.width
            height: 80

            onClicked: {
                gameWindow.state = "ranking"
            }
        }
    }

    //动画元素
    Item {
        id: running

        PhysicsWorld{id: physicalworld;gravity: Qt.point(0,10);debugDrawVisible: false}
        EntityManager{id: entityManager;entityContainer: parent }

        Item {
            id: run


        }
        Ground{
            id: ground
            x:-1000;y:610;z:-1;widthSize: 100;heightSize: 1;width: 3200; height: 32
        }
        TwoAxisController{
            id: controller
            xAxis: 1
            onXAxisChanged: player.changeDirection()
        }
        property alias controller: controller
        Player{id:player;x:50;y:100;z:-1;maxspeed: 100;isbig: false}
        Scorpion{id: scorpion; x: -100; y:100; gameState: false}


        Timer{
            id: timer
            running: true
            repeat: true
            interval: 60
            onTriggered: {
                if(player.x>menuScene.width+500){
                    controller.xAxis = -1
                    scorpion.mirror = false
                }
                else if(player.x<-500){
                    controller.xAxis = 1
                    scorpion.mirror = true

                }
                else {
                    if( controller.xAxis == -1)
                        scorpion.x = player.x+100
                    else
                        scorpion.x = player.x-100
                }
            }
        }
        Coin{
            id: coin
            scale: 0.25
            x:menuScene.width - coin.width*2
            y:coin.height
        }
    }
}
