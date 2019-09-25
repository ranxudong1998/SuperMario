import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{
    entityType: "home"

    width: homeImage.width*homeImage.scale
    height: homeImage.height*homeImage.scale

    //图片
    MultiResolutionImage{
        id:homeImage
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/castle_finish.png"
    }

    //碰撞区域
    PolygonCollider{
        vertices: [
            Qt.point(50,77),
            Qt.point(33,89),
            Qt.point(65,89),
            Qt.point(36,124),
            Qt.point(65,124)
        ]

        bodyType: Body.Static
        friction: 1
        categories: Box.Category11
    }
}
