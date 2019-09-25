import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    entityType: "wall"
    width: image.width*image.scale
    height: image.height*image.scale

    SpriteSequence{
        id:image
        scale: 0.8
        width:64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false
        goalSprite: ""

        Sprite{
            name: "wall"
            source: "../../assets/img/game/destroyblock_new.png"
            frameCount: 1
            frameX: 0
            frameY: 0
            frameWidth: 64
            frameHeight: 64
            frameDuration: 100//每帧存在时间
        }
    }

    BoxCollider{
        width: parent.width
        height: parent.height
        id:collider
        active:true
        bodyType: Body.Static
        categories:Box.Category8
        collidesWith: Box.Category1 | Box.Category2
    }
}
