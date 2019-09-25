import Felgo 3.0
import QtQuick 2.0

Enemy {

    id: scorpion

    width: image.width
    height: image.height
    variationType: "scorpion"


    //图片
    MultiResolutionImage{
        id :image
        anchors.centerIn: parent
        mirror: true
        scale: 0.7
        transformOrigin: Item.Bottom
        opacity: (alive?1:0)
        Behavior on opacity {NumberAnimation{duration: 2000}} //死亡动画


        property string scorpion1: "../../assets/img/game/PTModelSprite_ID33512.png"
        property string scorpion2: "../../assets/img/game/PTModelSprite_ID33511.png"
        property string scorpion3: "../../assets/img/game/PTModelSprite_ID33510.png"
        property string scorpion4: "../../assets/img/game/PTModelSprite_ID33509.png"
        property string scorpion5: "../../assets/img/game/PTModelSprite_ID33508.png"
        property string scorpion6: "../../assets/img/game/PTModelSprite_ID33507.png"
    }
    property alias mirror: image.mirror

    //蝎子计时器
    Timer{
        id: scorpionTimer
        interval: 120
        running: true
        repeat: true
        onTriggered: {
            count++
            switch(count%6){
            case 0:image.source = image.scorpion1; break;
            case 1:image.source = image.scorpion2; break;
            case 2:image.source = image.scorpion3; break;
            case 3:image.source = image.scorpion4; break;
            case 4:image.source = image.scorpion5; break;
            case 5:image.source = image.scorpion6; break;
            }
            if(gameState){
                if(count%80<40) {scorpion.x -=10;scorpion.mirror = false;/*image.mirror = false*/}
                else {scorpion.x +=10;;scorpion.mirror = true; /*image.mirror = true*/}
            }
        }
    }
    property int count: 0
    property bool gameState: true  //判断是否游戏状态

    //蝎子区域
    PolygonCollider{
        id:collider
        vertices: [
            Qt.point(72, 24),
            Qt.point(112, 24),
            Qt.point(112, 52),
            Qt.point(72, 80),
            Qt.point(18,80),
            Qt.point(18,59)
        ]// scale 0.7
        /*
//        vertices: [
//            Qt.point(70, 0),
//            Qt.point(120, 0),
//            Qt.point(120, 40),
//            Qt.point(90, 80),
//            Qt.point(0,80),
//            Qt.point(0,50)
//        ]
*/
        active: alive
        bodyType: Body.Dynamic
        categories: Box.Category3
        collidesWith: Box.Category1|Box.Category2|Box.Category8|Box.Category14 // 玩家&&土地
        friction: 1
    }

    //蝎子传感器区域
    BoxCollider{
        id: sensor
        width: 120*image.scale
        height: 10

//        Rectangle{
//            width: parent.width
//            height: parent.height
//            color: "red"
//            anchors.centerIn: parent
//        }

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        bodyType: Body.Dynamic
        active: collider.active
        categories: Box.Category4
        collidesWith: Box.Category1|Box.Category8
        collisionTestingOnlyMode: true
    }

    //死亡
    function die(){
        if(gameState){
            alive = false
            scorpionTimer.stop()
        }
    }

    //重置
    function reset(){
        alive = true
        scorpionTimer.restart()
    }

}
