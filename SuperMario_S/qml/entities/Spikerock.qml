import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id:spikerock
    entityType: "spikerock"

    Component.onCompleted: setLevelGround()
    property string grass: "../../assets/img/game/PTModelSprite_ID32779.png"
    property string dirt: "../../assets/img/game/PTModelSprite_ID4224.png"

    Column{
        Row{
            Repeater{
                model: widthSize
                MultiResolutionImage{
                    width: gameScene.gridSize
                    height: gameScene.gridSize
                    source: grass
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


    BoxCollider{
        id: collider
        anchors.fill: parent
        bodyType: Body.Static

        categories: Box.Category10
        collidesWith: Box.Category1
    }

}
