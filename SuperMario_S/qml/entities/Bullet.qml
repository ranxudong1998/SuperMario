import Felgo 3.0
import QtQuick 2.0
TiledEntityBase {

    id:bulletEntityBase
    entityType: "bullet"
//    entityId: "mybullet"

    property alias image: image
    property alias collider: collider

    width: image.width*image.scale
    height: image.height*image.scale

    //旋转动画
    NumberAnimation {
        running: true
        target:image
        loops: Animation.Infinite
        from: 0
        to:360
        properties: "rotation"
        duration: 500
    }

    //图片
    MultiResolutionImage{
        scale: 0.5
        id:image
        fillMode: Image.Stretch
        anchors.centerIn: parent
        source: "../../assets/img/game/magic.png"
    }

    //碰撞区域
    BoxCollider{
        id:collider
        anchors.fill: parent
        bodyType: Body.Dynamic

        collisionTestingOnlyMode: true
        categories: Box.Category14
        collidesWith: Box.Category3 |Box.Category5 | Box.Category8

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType==="opponent"){
                otherEntity.die()
                hideBullet()  //子弹击中opponent时自己也死亡
                gameWindow.playerSound("kill_by_ballet")
            }
            else if(otherEntity.entityType==="ground"||"platform")
                 count = (count%20<10)? 10 : 0
        }
    }

    //控制bullet移动
    property int count: 0
    Timer{
        id: imageTimer
        running: false
        repeat: true
        interval: 100
        onTriggered: {
            count++

            if(gameScene.mirror)
                bulletEntityBase.x-=20
            else
                bulletEntityBase.x+=20

            if(count%20<10){
                bulletEntityBase.y-=10//上飞
            }else{
                bulletEntityBase.y+=10//下飞
            }

        }
    }

    //控制bullet存活
    Timer{
        id:imageTimer2
        running: false
        repeat: false
        interval: 4000
        onTriggered: {
            hideBullet()
//            console.log("imageTimer down down!!!")
        }
    }

    property alias imageTimer: imageTimer
    property alias imageTimer2: imageTimer2

    //隐藏子弹
    function hideBullet(){
        image.visible=false //图片不可见
        imageTimer.running=false //两个计时器关掉
        imageTimer2.stop()
        collider.active = false //碰撞区域取消激活
        gameScene.bulletAlive = false //GameScene里面取消控制
        gameScene.bulletTimer.stop();
    }

}

