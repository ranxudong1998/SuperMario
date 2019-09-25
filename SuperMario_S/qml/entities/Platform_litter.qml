import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id:platform_litter
    entityType: "platform"
    width: platform_litterImage.width
    height: platform_litterImage.height

    MultiResolutionImage{
        id:platform_litterImage
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/platform_litter.png"
    }

    BoxCollider{
        id:collider
        width: parent.width
        height: parent.height
        bodyType: Body.Static
        categories: Box.Category8
    }

}
