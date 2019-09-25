import QtQuick 2.0
import Felgo 3.0

Enemy{
    id:bat
    entityType: "opponent"
    variationType: "bat"

    width:  batImage.width*batImage.scale
    height: batImage.height*batImage.scale

    //图片
    MultiResolutionImage{
        id:batImage
        scale: 0.5
        opacity: (alive?1:0)
        // transformOrigin: Item.Top //从图片底部中心缩放 here useless
        anchors.centerIn:  parent
        Behavior on opacity{
            NumberAnimation {duration: 2000 }
        }
        property string bat1 :"../../assets/img/game/PTModelSprite_ID32752.png"
        property string bat2 :"../../assets/img/game/PTModelSprite_ID32754.png"
        property string bat3 :"../../assets/img/game/PTModelSprite_ID32755.png"
        property string bat4 :"../../assets/img/game/PTModelSprite_ID32756.png"
        property string bat5 :"../../assets/img/game/PTModelSprite_ID32757.png"
    }

    //计时器
    Timer{
        id: batTimer
        interval: 120
        repeat: true
        running: true

        onTriggered: {
            switch(count % 5 ){
            case 0: batImage.source = batImage.bat1; break;
            case 1: batImage.source = batImage.bat2; break;
            case 2: batImage.source = batImage.bat3; break;
            case 3: batImage.source = batImage.bat4; break;
            case 4: batImage.source = batImage.bat5; break;
            }
            count++;

            if(count%120<60){
                bat.x+=5;
                batImage.mirror = true
            }
            else {
                bat.x-=5;
                batImage.mirror = false
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
            Qt.point(74,11),
            Qt.point(80,34),
            Qt.point(56,60),
            Qt.point(31,60),
            Qt.point(3,67),
            Qt.point(3,50)
        ]
        //                 [
        //                    Qt.point(5,1),
        //                    Qt.point(132,29),
        //                    Qt.point(113,84),
        //                    Qt.point(120,130),
        //                    Qt.point(11,129),
        //                    Qt.point(4,100),
        //                    Qt.point(6,59)
        //                ]
        bodyType: Body.Static
        categories: Box.Category5
        collidesWith: Box.Category1 | Box.Category2|Box.Category14
        friction: 1
        collisionTestingOnlyMode: true
    }

    //死亡
    function die(){
        alive = false
        batTimer.stop()
    }

    //重置
    function reset(){
        alive = true
        batTimer.restart()
    }
}

