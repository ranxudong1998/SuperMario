import Felgo 3.0
import QtQuick 2.0

TiledEntityBase{

    id:platform
    entityType: "platform"


    width: platformCheck? 130*widthSize : 202
    height:platformCheck? 50:64

    property int widthSize: 1 //我修改了那个基类

    property var platformOld: "../../assets/img/game/PTModelSprite_ID2478.png"
    property var platformNew: "../../assets/img/game/platform_big.png" //202 x 64
    //重复platform
    Row{
        Repeater{
            model: widthSize
            MultiResolutionImage{
                id:platformImage
                source: platformCheck ? platformOld : platformNew
            }
        }
    }

    //碰撞区域
    BoxCollider{
        id: collider
        bodyType: Body.Static

        categories: Box.Category8
//        collidesWith: Box.Category1/*|Box.Category2*/
    }

}
