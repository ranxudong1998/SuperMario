import Felgo 3.0
import QtQuick 2.0
import QtGraphicalEffects 1.12

TiledEntityBase {

    id: diamond
    entityType: "diamond"
    width: diamondImage.width*diamondImage.scale
    height: diamondImage.height*diamondImage.scale

    //图片
    MultiResolutionImage{
        id:diamondImage
        anchors.centerIn: parent
        visible: !collected
        fillMode: Image.Stretch
        source: "../../assets/img/game/PTModelSprite_ID31370.png"

    }

    //碰撞区域
    BoxCollider{
        id:collider
        active: !collected
        anchors.centerIn: parent

        collisionTestingOnlyMode: true
        categories: Box.Category7
        collidesWith: Box.Category1
    }

    //发光效果
    Glow{
        anchors.fill: diamondImage
        source: diamondImage
        radius: 16
        samples: 24
        color: "#99FF00"
        spread: 0.5
        visible: !collected
    }

    //是否被收集
    property bool collected: false
    function collect(){
        collected = true
    }

    //重置
    function reset(){
        collected = false
    }
}
