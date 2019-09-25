import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id:water
    //    entityId: "entity"
    entityType: "water"

    Component.onCompleted:  setLevelGround()
    property string dirt: "../../assets/img/game/PTModelSprite_ID4224.png"
    property string waterr:"../../assets/img/game/PTModelSprite_ID9167.png"

    Column{
        Row{
            Repeater{
                model: widthSize
                MultiResolutionImage{
                    width: gameScene.gridSize
                    height: gameScene.gridSize
                    source: waterr
                }
            }
        }

        Repeater{
            model: heightSize-1
            Row{
                Repeater{
                    model: widthSize
                    MultiResolutionImage{
                        width: gameScene.gridSize
                        height: gameScene.gridSize
                        source:dirt
                    }
                }
            }
        }
    }

    function setLevelGround(){
        switch(gameScene.currentLevel) {
        case 0:
            dirt = "../../assets/img/game/PTModelSprite_ID4224.png"
            break;
        case 1:
            dirt = "../../assets/img/game/PTModelSprite_ID15227.png"
            break;
        case 2:
            dirt = "../../assets/img/game/PTModelSprite_ID12697.png"
            break;
        case 3:
            dirt = "../../assets/img/game/PTModelSprite_ID9065.png"
            break;

        }
    }
    //碰撞区域
    BoxCollider{
        id: collider
        anchors.fill: parent
        bodyType: Body.Static

        categories: Box.Category9
        collidesWith: Box.Category1
    }

}
