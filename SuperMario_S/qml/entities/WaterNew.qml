import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

   id:waterNew
    entityType: "water"
    width: 67*widthSize
    height: heightSize*32

    Row{
    Repeater{
        model: widthSize
        MultiResolutionImage{
            id:waterNewImage
            fillMode: Image.PreserveAspectFit
            source: "../../assets/img/game/water1.png"
        }

        }
    }
   BoxCollider{
        id: collider
        anchors.fill: parent
        bodyType: Body.Static

//        vertices: [
//            Qt.point(0,18),
//            Qt.point(67,18),
//            Qt.point(0,135),
//            Qt.point(67,135)

//        ]

        categories: Box.Category9
        collidesWith: Box.Category1
    }

}
