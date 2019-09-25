import QtQuick 2.0
import Felgo 3.0

Enemy{
    id:bear
    entityType: "opponent"
//    variationType: "bear"

    width:  bearImage.width*bearImage.scale
    height: bearImage.height*bearImage.scale

    //图片
    MultiResolutionImage{
        id:bearImage
        scale: 0.5
        opacity: (alive?1:0)
        anchors.centerIn:  parent
        Behavior on opacity{
            NumberAnimation {duration: 2000 }
        }
        property string bear1 :"../../assets/img/game/PTModelSprite_ID30184.png"
        property string bear2 :"../../assets/img/game/PTModelSprite_ID30185.png"
        property string bear3 :"../../assets/img/game/PTModelSprite_ID30186.png"
        property string bear4 :"../../assets/img/game/PTModelSprite_ID30187.png"
        property string bear5 :"../../assets/img/game/PTModelSprite_ID30188.png"
        property string bear6 :"../../assets/img/game/PTModelSprite_ID30189.png"
    }

    //计时器
    Timer{
        id: bearTimer
        interval: 120
        repeat: true
        running: true

        onTriggered: {
            switch(count % 6 ){
            case 0: bearImage.source = bearImage.bear1; break;
            case 1: bearImage.source = bearImage.bear2; break;
            case 2: bearImage.source = bearImage.bear3; break;
            case 3: bearImage.source = bearImage.bear4; break;
            case 4: bearImage.source = bearImage.bear5; break;
            case 5: bearImage.source = bearImage.bear6; break;
            }
            count++;

            if(count%120<60){
                bear.x+=5;
                bearImage.mirror = true
            }
            else {
                bear.x-=5;
                bearImage.mirror = false
            }
        }
    }
    property int count: 0

    //碰撞区域
    PolygonCollider{
        id:collider
        active: alive
        vertices:
            [
            Qt.point(10,1),
            Qt.point(50,11),
            Qt.point(50,34),
            Qt.point(56,80),
            Qt.point(31,80),
            Qt.point(3,67),
            Qt.point(3,50)
        ]

        bodyType: Body.Dynamic

        categories: Box.Category3
        collidesWith: Box.Category1 | Box.Category2| Box.Category8|Box.Category14
        friction: 1 //设置摩擦力
        collisionTestingOnlyMode: false
    }

    //死亡
    function die(){
        alive = false
        bearTimer.stop()
    }

    //重置
    function reset(){
        alive = true
        bearTimer.restart()
    }

}

