import Felgo 3.0
import QtQuick 2.0

TiledEntityBase {

    id:ground
    entityType: "ground"

    Component.onCompleted: setLevelGround()

    property string grass: "../../assets/img/game/PTModelSprite_ID3790.png"
    property string dirt: "../../assets/img/game/PTModelSprite_ID4224.png"

    //设置关卡土地颜色
    function setLevelGround(){
        switch(gameScene.currentLevel) {
        case 0:
            grass =  "../../assets/img/game/PTModelSprite_ID3790.png"
            dirt = "../../assets/img/game/PTModelSprite_ID4224.png"
            break;
        case 1:
            grass =  "../../assets/img/game/PTModelSprite_ID15236.png"
            dirt = "../../assets/img/game/PTModelSprite_ID15227.png"
            break;
        case 2:
            grass =  "../../assets/img/game/PTModelSprite_ID10436.png"
            dirt = "../../assets/img/game/PTModelSprite_ID12697.png"
            break;
        case 3:
            grass =  "../../assets/img/game/PTModelSprite_ID6658.png"
            dirt = "../../assets/img/game/PTModelSprite_ID9065.png"
            break;

        }
    }

    //排序的地
    Column{

        Row{
            Repeater{
                model: widthSize
                MultiResolutionImage{
                    width: gameScene.gridSize
                    height: gameScene.gridSize
                    source:grass
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

    //碰撞区域
    BoxCollider{
        id: collider
        anchors.fill: parent
        bodyType: Body.Static

        categories: Box.Category8
        collidesWith:Box.Category1|Box.Category2|Box.Category3|Box.Category11|Box.Category12|Box.Category14|Box.Category15
    }

}
