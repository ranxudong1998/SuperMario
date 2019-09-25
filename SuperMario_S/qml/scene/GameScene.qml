import Felgo 3.0
import QtQuick 2.0

import "../gameElements"
import "../entities"
import "../common"
import "../levels"

SceneBase{

    id:gameScene
    gridSize: 32 //网格大小

    sceneAlignmentX: "left"
    sceneAlignmentY: "top"

    property int currentLevel: 0 //当前关卡

    property alias player: player
    property alias bullet: bullet

    //背景图片两张
    MultiResolutionImage{
        id:bgimage1
        source: selectLevel()
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        x:-480
        visible: true
    }
    MultiResolutionImage{
        id:bgimage2
        source: bgimage1.source
        width: parent.width
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        x:bgimage1.x+width
    }

    /* 可以让背景动 但是会有卡顿
    //    Timer{
    //        running: true
    //        repeat: true
    //        interval: 50
    //        onTriggered: {
    //            bgimage1.x = container.x %960
    //            bgimage2.x = bgimage1.x+bgimage1.width
    //        }
    //    }
    */

    //背景图片
    property string bg0:"../../assets/img/game/PTModelSprite_ID35342.png"
    property string bg1:"../../assets/img/game/PTModelSprite_ID35380.png"
    property string bg2:"../../assets/img/game/PTModelSprite_ID35353.png"
    property string bg3:"../../assets/img/game/PTModelSprite_ID35359.png"
    function selectLevel(){
        switch(currentLevel){
        case 0: return bg0;
        case 1: return bg1;
        case 2: return bg2;
        case 3: return bg3;
        }
    }

    //容器
    Item {
        id: container
        x:  (player.x>480?480-player.x:0)

        property alias loader: loader
        property alias player: player //选择关卡界面用来重置角色

        //物理世界
        PhysicsWorld{
            id: physicalWorld
            debugDrawVisible:false //false不显示物理线
            gravity: Qt.point(0,20) //重力
            z:3
        }

        //玩家
        Player{
            id:player
            x:100
            y:100
            z:1
        }
        //子弹
        Bullet{
            id: bullet
        }

        //关卡--动态加载 在选择关卡时动态加载
        Loader{
            id:loader
        }

        EntityManager{
            entityContainer:  container
        }
    }
    property alias container: container


    //重置子弹位置
    function resetBullet(){
        bullet.visible = true   //图片可见
        bullet.collider.active = true  //碰撞区域激活
//        var frontx = player.x>480?(480-player.width/2):player.x
//        var backx = player.x>480?(480+player.width):player.x+player.width/2
//        bullet.x=player.mirror?frontx:backx
        bullet.x=player.x //子弹位置
        bullet.y=player.y+player.height*1/2
        bullet.imageTimer.running=true //重新开启计时器
        bullet.imageTimer2.start()
        bulletTimer.start()
        bulletAlive = true
        bullet.image.visible = true
        gameScene.mirror = player.mirror
    }
    property bool mirror: false

    property bool bulletAlive: false //控制子弹
    property alias bulletTimer: bulletTimer
    //子弹存在计时器
    Timer{
        id:bulletTimer
        repeat: false
        running: false
        interval: 4000
        onTriggered: {
            bulletAlive  = false
            console.log("Wow! bullet dead")
        }
    }


    //控制器
    Keys.forwardTo: controller
    TwoAxisController{
        id :controller
        onInputActionPressed: {
            if(actionName == "up"){ //跳跃
                player.jump()
            }else if(actionName == "fire"){ //开火
                playerFire()
            }
        }
        onXAxisChanged: { //方向改变
            player.changeDirection()
        }

    }

    //玩家开火
    function playerFire(){
        if(player.couldFire&&!bulletAlive&&player.alive){
            gameWindow.playerSound("shot")
            resetBullet()
        }
    }

    //显示分数
    SceneShow{
        id:scoreDisplay
        text: "Score:"
        result: player.sumScore
    }
    //显示时间
    SceneShow{
        id:timeDisplay
        anchors.left: scoreDisplay.right
        anchors.leftMargin: 15
        text: "LeftTime:"
        result: leftTime
    }

    //在游戏中显示金币
    SceneShow{
        id:coinsDisplay
        anchors.left: timeDisplay.right
        anchors.leftMargin: 15
        text: "Coins:"
        result: player.coinNumber

    }

    SceneShow{
        id: life
        width: 191
        height: 30
        anchors.top: scoreDisplay.bottom
        anchors.margins: 15
        text: "LifeAmount:"
        result: player.lifeAmount
    }

    property int leftTime: 0 //游戏时间长度
    property alias levelTimer: levelTimer
    //游戏剩余时间计时器
    Timer{
        id:levelTimer
        interval: 1000
        repeat: true
        running: false
        onTriggered: {
            console.log("")
            leftTime=leftTime-1
            if(leftTime==0){
                player.die()
                failed.visible=true
                failed.isTimeOut = true
                levelTimer.running=false
            }
        }
    }


//    //暂停页面
//    Suspend{
//        id:suspend
//        visible: false
//    }

    property bool suspendOrStart: true
    MultiResolutionImage{
        id:suspendImage
        source:suspendOrStart ? "../../assets/img/game/button-pause.png" : "../../assets/img/game/button-play.png"
//       horizontalCenter:gameScene.horizontalCenter
        anchors.horizontalCenter: gameScene.horizontalCenter
        anchors.top: gameScene.top

        MouseArea{
            anchors.fill: suspendImage
            onClicked: {
                suspendOrStart = !suspendOrStart
                if(suspendOrStart==false){
                    console.log("this is false")
                    system.pauseGameForObject(gameScene)
                }
                else{
                    console.log("this is true")
                    system.resumeGameForObject(gameScene)
                }
            }
        }
    }
    //闯关成功界面
    FinalSuccess{
        id:finalSuccess
        visible: false
        score:player.sumScore
        time: leftTime
    }
    RecordDialog{
        id:recordDialog
        visible: false
    }

    //闯关失败界面
    property alias failed: failed
    Failed{
        id:failed
        visible: false
    }
    function restart(level){//游戏里面重新开局
        var currentLevel =loader.source
        loader.source = ""
        loader.source = currentLevel
        leftTime = 300
        levelTimer.restart()
        player.resetPlayer()
    }

    //主菜单按钮
    PlatformerImageButton{
        id:menuButton
        width: 80
        height: 60
        anchors.right:gameScene.gameWindowAnchorItem.right
        anchors.top: gameScene.gameWindowAnchorItem.top
        image.source: "../../assets/img/game/home.png"
        mouseArea.onClicked: {
            failed.visible=false
            loader.source = ""
            gameWindow.state = "menu"
        }
    }

    //手机控制左右
    PhoneViewRL{
        id:phoneViewRL
        controller: controller
    }
    //手机控制跳跃
    PhoneView{
        id:phoneViewUp
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        imageSource: "../../assets/img/game/up.png"
        onPressed: {
            player.jump();
        }
    }
    //手机控制开火
    PhoneView{
        id:phoneViewFire
        anchors.right: phoneViewUp.left
        anchors.bottom: phoneViewUp.top
        imageSource: "../../assets/img/game/up.png"
        onPressed: {
            playerFire()
        }
    }



}
