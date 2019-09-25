

import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {
    id: coin
    entityType: "coin"
    width: image.width*image.scale
    height: image.height*image.scale

    //图片
    property alias scale: image.scale
    MultiResolutionImage{
        id: image
        scale: 0.15
        anchors.centerIn: parent
        visible: !collected
        fillMode: Image.PreserveAspectFit
        property string coin1: "../../assets/img/game/PTModelSprite_ID21678.png"
        property string coin2: "../../assets/img/game/PTModelSprite_ID21677.png"
        property string coin3: "../../assets/img/game/PTModelSprite_ID21676.png"
        property string coin4: "../../assets/img/game/PTModelSprite_ID21675.png"
    }

    //碰撞区域
    BoxCollider{
        id : collider
        bodyType: Body.Dynamic
        active: !collected
        collisionTestingOnlyMode: true //无重力
        categories: Box.Category7
        collidesWith: Box.Category1
    }

    //计时器
    property int count: 0
    Timer{
        id: coinTimer
        interval: 200
        running: true
        repeat: true
        onTriggered: {
            count++
            switch(count%4){
            case 0: image.source = image.coin1; break
            case 1: image.source = image.coin2; break
            case 2: image.source = image.coin3; break
            case 3: image.source = image.coin4; break
            }
        }
    }

    //被收集
    property bool collected : false
    function collect(){
        collected = true
        coinTimer.stop()
    }

    //重置
    function reset(){
        collected = false
        coinTimer.restart()
    }
}
