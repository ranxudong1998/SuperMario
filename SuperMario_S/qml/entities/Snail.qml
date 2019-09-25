import Felgo 3.0
import QtQuick 2.0

Enemy{

    id:snail
    entityType: "opponent"
    variationType: "snail"

    width: snailImage.width
    height: snailImage.height

    property int speed: 70
    property int direction: -1

    //图片
    MultiResolutionImage{
        id:snailImage
        opacity: alive?1:0
        Behavior on opacity {
            NumberAnimation{ duration: 2000}
        }
        mirror: collider.linearVelocity.x <0 ? false : true //此属性保留图像是否应水平反转（有效地显示镜像图像）
        property string snailwalking_1: "../../assets/img/game/PTModelSprite_ID33374.png"
        property string snailwalking_2: "../../assets/img/game/PTModelSprite_ID33375.png"
        property string snailwalking_3: "../../assets/img/game/PTModelSprite_ID33376.png"
        property string snailwalking_4: "../../assets/img/game/PTModelSprite_ID33377.png"
    }

    property int snailstate: 0
    property  int snailWalkingCount: 0

    //蜗牛区域
    PolygonCollider{
        id:collider
        active: alive
        vertices: [
            Qt.point(1,1),
            Qt.point(58,-1),
            Qt.point(85,13),
            Qt.point(85,38),
            Qt.point(78,59),
            Qt.point(1,59)
        ]
        bodyType: Body.Dynamic
        linearVelocity: Qt.point(direction*speed,0)


        categories: Box.Category3
        collidesWith: Box.Category1 | Box.Category2 |Box.Category8 |Box.Category14

        onLinearVelocityChanged: {
            if(linearVelocity.x === 0 )
                direction *= -1
            linearVelocity.x = direction*speed
        }
    }

    //蜗牛传感器
    BoxCollider{
        id:leftColliderSensor
        active: collider.active
        width: 85
        height: 5
//        Rectangle{
//            width: parent.width
//            height: parent.height
//            anchors.fill: parent
//            color: "red"
//            visible: alive
//        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        collisionTestingOnlyMode: true//这是传感器只是用来检测碰撞的

        categories: Box.Category4
        collidesWith: Box.Category8

    }

    //蜗牛图片计时器
    Timer{
        id:snailImageTimer
        interval: 400
        repeat: true
        running: true
        onTriggered: {
            switch(snailWalkingCount%4){
            case 0:snailImage.source=snailImage.snailwalking_1;break;
            case 1:snailImage.source=snailImage.snailwalking_2;break;
            case 2:snailImage.source=snailImage.snailwalking_3;break;
            case 3:snailImage.source=snailImage.snailwalking_4;break;
            }
            snailWalkingCount++;
        }
    }

    //蜗牛转向计时器
    Timer{
        id:snailDirectionTimer
        interval: 8000
        running: true
        repeat: true
        onTriggered: {
            collider.linearVelocity.x=0
        }
    }

    //死亡
    function die() {
        alive = false
        snailImageTimer.stop()
        snailDirectionTimer.stop()
    }

    //重置--复活
    function reset(){
        alive = true
        snailImageTimer.restart()
        snailDirectionTimer.restart()
    }
}



