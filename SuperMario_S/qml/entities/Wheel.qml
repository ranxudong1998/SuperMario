import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{

    entityType: "opponent"
    variationType: "wheel"
//    width: 80
//    height: 120


    width: wheelImage.width*wheelImage.scale
    height: wheelImage.height*wheelImage.scale

    //图片
    MultiResolutionImage{
        id:wheelImage
        scale: 0.1
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit

        source: "../../assets/img/game/3691857a-90cb-11e9-adae-5452007b698aOri"

        NumberAnimation{
            running: true
            loops: Animation.Infinite
            target: wheelImage
            from: 0
            to:360
            property: "rotation"
            duration: 3000
        }
    }

    //碰撞区域
    BoxCollider{
        id:collider
        anchors.fill: parent
        collisionTestingOnlyMode: true
        categories: Box.Category5
    }
}

