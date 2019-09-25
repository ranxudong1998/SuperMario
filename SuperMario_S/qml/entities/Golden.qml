import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    entityType: "golden"
    width: image.width*image.scale
    height: image.height*image.scale

    property alias active: collider.active

    //精灵动画
    SpriteSequence{

        id:image
        width:64
        height: 64
        scale: 0.8
        anchors.centerIn: parent
        interpolate: false
        goalSprite: ""

        Sprite{
            id:start
            name: "start"
            source: "../../assets/img/game/bonusblock.png"
            frameCount: 5
            frameX: 0
            frameY: 0
            frameWidth: 64
            frameHeight: 64
            frameDuration: 100//每帧存在时间
        }
        Sprite{
            id:block
            name: "block"
            source: "../../assets/img/game/bonusblock.png"
            frameCount: 1
            frameX: 320
            frameY: 0
            frameWidth: 64
            frameHeight: 64
            frameDuration: 100

        }
    }

    //碰撞区域
    BoxCollider{
        width: parent.width
        height: parent.height
        id:collider
        active:true
        bodyType: Body.Static
        categories: Box.Category11
        collidesWith: Box.Category1 | Box.Category2
    }

    //变身
    function show(){
        start.to={"block":1}
    }

    //重置
    function reset(){
        block.to={"start":1}
    }
}
