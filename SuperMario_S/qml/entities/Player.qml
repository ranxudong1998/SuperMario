import Felgo 3.0
import QtQuick 2.0
import "../common"

EntityBase {
    id: player
    entityType: "player"
    state:"standing"
    focus: true

    width: playerImage.width
    height: playerImage.height

    signal record();
    //图片
    MultiResolutionImage{
        id: playerImage
        //opacity: (alive?1:0)
        scale: isbig?0.7:0.6 //缩放
        opacity:1.0
        Behavior on scale {NumberAnimation{duration: 500}}
       // Behavior on opacity {NumberAnimation{duration: 2000}} //透明度改变时的动画
        transformOrigin: Item.Bottom //从图片底部中心缩放

        property string playerstanding: "../../assets/img/game/PTModelSprite_ID34297.png"
        property string playerwalking_1: "../../assets/img/game/PTModelSprite_ID34261.png"
        property string playerwalking_2: "../../assets/img/game/PTModelSprite_ID34260.png"
        property string playerwalking_3: "../../assets/img/game/PTModelSprite_ID34259.png"
        property string playerwalking_4: "../../assets/img/game/PTModelSprite_ID34258.png"
        property string playerwalking_5: "../../assets/img/game/PTModelSprite_ID34257.png"
        property string playerwalking_6: "../../assets/img/game/PTModelSprite_ID34256.png"
        property string playerwalking_7: "../../assets/img/game/PTModelSprite_ID34255.png"
        property string playerwalking_8: "../../assets/img/game/PTModelSprite_ID34254.png"
        property string playerjumping: "../../assets/img/game/PTModelSprite_ID34277.png"
    }

    property bool isbig: false //记录大小
    property alias mirror: playerImage.mirror //记录翻转

    //人物碰撞区域
    PolygonCollider{
        id:collider
        vertices:isbig?
                     [//big 0.7
                      Qt.point(11, 50),
                      Qt.point(32, 36),
                      Qt.point(53, 36),
                      Qt.point(65, 50),
                      Qt.point(65, 99),
                      Qt.point(53, 120),
                      Qt.point(11, 120),
                     ]
                   :
                     [//small
                      Qt.point(33, 48),
                      Qt.point(52, 48),
                      Qt.point(62, 60),
                      Qt.point(62, 102),
                      Qt.point(52, 120),
                      Qt.point(15, 120),
                      Qt.point(15, 60),
                     ]
        /* scale 1
                     [
                      Qt.point(0, 20),
                      Qt.point(30, 0),
                      Qt.point(60, 0),
                      Qt.point(77, 20),
                      Qt.point(77, 90),
                      Qt.point(60, 120),
                      Qt.point(0, 120),
                     ]
        */

        force: Qt.point(controller.xAxis*accelerateForce,0)
        active: alive
        bodyType: Body.Dynamic //动态的物体之间才可以碰撞
        categories: Box.Category1
        collidesWith: Box.Category3|Box.Category5|Box.Category7
                      |Box.Category8|Box.Category9|Box.Category10
                      |Box.Category11|Box.Category12| Box.Category13
                      |Box.Category15|Box.Category16

        friction: 0  //摩擦力

        //设置最大速度
        onLinearVelocityChanged: {
            if(linearVelocity.x >maxspeed)linearVelocity.x = maxspeed
            else if(linearVelocity.x <-maxspeed)linearVelocity.x = -maxspeed
        }

        //与物体碰撞
        fixture.onBeginContact:{
            var otherEntiry = other.getBody().target
            console.log("here we contact")
            if(otherEntiry.entityType === "powerup"){
                gameWindow.playerSound("mushroom_catch")
                otherEntiry.collect()
                playerBigger()
                sumScore = sumScore + 100
            }else if(otherEntiry.entityType === "coin"){
                gameWindow.playerSound("coin")
                otherEntiry.collect()
                coinNumber ++
                sumScore = sumScore + 50
            }else if(otherEntiry.entityType === "diamond"){
                gameWindow.playerSound("diamond")
                otherEntiry.collect()
                diamondNumber++
                sumScore = sumScore +200
            }else if(otherEntiry.entityType === "home"){
                gameWindow.playerSound("running_time")
                playerImage.opacity=0
                alive = false
                finalSuccess.visible=true

                finalSuccess.image.jumpTo(player.starNumberName())
                finalSuccess.time_Process();
                isOrNotShowRecordDialog()
//                dialogTimer.running = true
                gameScene.levelTimer.stop()

            }else if(otherEntiry.entityType === "opponent"){
                if(lifeAmount >= 2){
                    if(player.isbig == true){
                        playerSmaller()
                    }else{
                        playerLifeAmount();
                    }
                }else if(lifeAmount ==1 ){
                    gameWindow.playerSound("gameover")
                    lifeAmount --;
                    player.die();
                }
            }else if(otherEntiry.entityType === "magic"&&couldEat){
                gameWindow.playerSound("mushroom_catch")
                otherEntiry.collect();
                couldEat = false
                couldFire = true
                sumScore = sumScore + 100
            }else if(otherEntiry.entityType === "water"){
                gameWindow.playerSound("gameover")
                player.die();
            }else if(otherEntiry.entityType === "spikerock"){
                gameWindow.playerSound("gameover")
                player.die();
            }else if(otherEntiry.entityType === "trampoline"){
                collider.linearVelocity.y = -750
            }
        }
    }



    function playerBigger(){ //人物变大
        player.isbig = true
        couldjumptwotimes = true
        doublejump = true
    }
    //人物变小
    function playerSmaller(){
        player.isbig = false;
        alive = false;
        doublejump  =false;
        //reviveEffectTimer.start();
        reviveTimer.start();
    }


    //复活效果计时器
    Timer{
        id:reviveEffectTimer
        running: false
        repeat: true
        interval: 60
        onTriggered: {
            if(playerImage.opacity == 1.0){
                playerImage.opacity = 0.3
            } else{
                playerImage.opacity = 1.0
            }
        }
    }

    //复活计时器
    Timer{
        id:reviveTimer
        running: false;
        interval: 2000
        repeat: false;
        onTriggered: {
            alive = true;
            reviveEffectTimer.stop();
            playerImage.opacity = 1.0;
        }
    }

    //计算生命值
    function playerLifeAmount(){
        lifeAmount--;
        alive = false;
        reviveEffectTimer.start();
        reviveTimer.start();
    }

    //头部碰撞区域
    PolygonCollider{
        id:topCollider

        vertices: isbig?[
                             Qt.point(29,0),
                             Qt.point(19,7),
                             Qt.point(19,10),
                             Qt.point(40,10)
                         ]:
                         [
                             Qt.point(29,0+40),
                             Qt.point(19,7+40),
                             Qt.point(19,10+40),
                             Qt.point(40,10+40)
                         ]
        active: alive
        bodyType: Body.Dynamic
        categories: Box.Category2
        collidesWith: Box.Category16|Box.Category11
        collisionTestingOnlyMode: true

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType==="magic"){
                gameWindow.playerSound("mushroom_catch")
                otherEntity.visual = true
                checkTimer.start()
            }
            if(otherEntity.entityType==="golden"){
                gameWindow.playerSound("hit_block")
                otherEntity.show()
            }

        }
        friction: 0
    }

    //脚部碰撞区域
    BoxCollider{
        id: boxCollider
        width: 77*playerImage.scale-10
        height: 20*playerImage.scale

//        Rectangle{//调试时显示传感器的位置
//            width: parent.width
//            height: parent.height
//            anchors.centerIn: parent
//            color: "red"
//        }

        collisionTestingOnlyMode: true //设置只检测碰撞 不检测位置更新

        //显示传感器的位置
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        bodyType: Body.Dynamic
        active: collider.active
        categories: Box.Category2
        collidesWith: Box.Category3|Box.Category5|Box.Category8|Box.Category11

        fixture.onBeginContact: {
            var otherEntiry = other.getBody().target
            if(otherEntiry.entityType === "ground"
                    ||otherEntiry.entityType === "platform"
                    ||otherEntiry.entityType === "golden"){
                enablejump = true
                if(couldjumptwotimes)
                    doublejump = true
            } else if(otherEntiry.entityType === "opponent"){
                sumScore = sumScore + 100
                gameWindow.playerSound("enemy_killed")
                otherEntiry.die()
            }
        }
    }
    //目的是为了让finalSuccess页面消失，弹出重新登记记录的框

    //头部计时器
    Timer{
        id:checkTimer
        running: false
        repeat: false
        interval: 1000
        onTriggered: {
            player.couldEat = true
            console.log("checkTimer changed the coludEated be true")
        }

    }

    //更新player的信息
    Timer{
        id:playerTimer
        interval: 60
        repeat: true
        running: true
        onTriggered: {

            //设置player的状态
            if(collider.linearVelocity.y===0){
                if(collider.linearVelocity.x===0){
                    player.state = "standing"
                }
                else
                    player.state = "walking"
            }
            else{
                player.state = "jumping"
            }

            //选择player的图片
            if(player.state == "standing"){
                playerImage.source = playerImage.playerstanding
            }else if(player.state == "jumping"){
                playerImage.source = playerImage.playerjumping
            }else if(player.state == "walking"){
                playerWalkingCount ++;
                switch(playerWalkingCount%8){
                case 0:playerImage.source = playerImage.playerwalking_1;break;
                case 1:playerImage.source = playerImage.playerwalking_2;break;
                case 2:playerImage.source = playerImage.playerwalking_3;break;
                case 3:playerImage.source = playerImage.playerwalking_4;break;
                case 4:playerImage.source = playerImage.playerwalking_5;break;
                case 5:playerImage.source = playerImage.playerwalking_6;break;
                case 6:playerImage.source = playerImage.playerwalking_7;break;
                case 7:playerImage.source = playerImage.playerwalking_8;break;
                }
            }

            //处理无按键情况
            var x =controller.xAxis;
            if(x == 0) {
                //速度大于10时 每次除以1.5 添加缓冲
                if(Math.abs(collider.linearVelocity.x) > 10) collider.linearVelocity.x /= 1.5
                else collider.linearVelocity.x = 0
            }
        }
    }
    property int playerWalkingCount: 0 //player walking 时的state

    property int coinNumber: 0 //金币数目(50分一个)
    property int diamondNumber: 0 //钻石数目（200分一个）
    property int lifeAmount : 3    //生命值

//    property int entityNumber: 0//敌人数目(100分一个，包含所有可以吃得东西)
    property int accelerateForce: 200 //施加于player上的力
    property int maxspeed: 150 //最大速度

    property bool couldEat: false //是否能吃炮弹
    property bool couldFire: false //是否能发射炮弹
    property bool couldjumptwotimes: true //标记能否跳跃两次

    //跳跃
    function jump(){
        if(player.state !== "jumping"&&enablejump){
            collider.linearVelocity.y = firstjumpspeed
            enablejump = false;
            gameWindow.playerSound("jump")
        }else if(doublejump){
            collider.linearVelocity.y = secondjumpspeed
            doublejump = false;
            gameWindow.playerSound("jump")
        }
    }
    property bool enablejump: true  //第一次跳跃
    property bool doublejump: false  //第二次跳跃
    property int firstjumpspeed: -500  //第一次跳起速度
    property int secondjumpspeed: -350 //第二次跳起速度

    //改变 player 方向
    function changeDirection(){
        if(controller.xAxis == 1)
            playerImage.mirror = false
        if(controller.xAxis == -1)
            playerImage.mirror = true
    }

    property bool alive: true
    //人物死亡
    function die(){
        jump()  // 死亡时跳一哈
        collider.linearVelocity.x =0   //水平速度设为0
        deadTimer.start()
        gameWindow.playerSound("gameover")
        gameScene.failed.isTimeOut = false
        gameScene.failed.visible = true
        gameScene.levelTimer.stop()
        playerImage.opacity=0
//        system.pauseGameForObject(levelScene);//可以暂停游戏中的所有实体
    }
    //死亡计时器
    Timer{
        id :deadTimer
        running: false
        interval: 800
        repeat: false
        onTriggered: {
            alive = false
        }
    }

    //
    function resetPlayer(){
        //        system.resumeGameForObject(gameScene);//恢复
        lifeAmount = 3
        alive = true
        couldFire = false
        couldjumptwotimes = false
        playerImage.opacity = 1
        player.x = 100
        player.y = 100
        sumScore = 0
    }

    property int sumScore: 0

    function starNumberName()
    {
        switch(diamondNumber){
        case 2:
            return "star2"
        case 3:
            return "star3"
        default:
            return "star1"
        }
    }
    function isOrNotShowRecordDialog()
    {
        if(finalSuccess.timeString< rankScene.jsonModel.get(gameScene.currentLevel).record)
            recordDialog.visible=true

    }
}
