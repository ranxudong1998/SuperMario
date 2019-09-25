import QtQuick 2.0
import Felgo 3.0


TiledEntityBase{
    id:trampoline
    entityType: "trampoline"


    width: trampolineImage.width*trampoline.scale-15
    height: trampolineImage.height*trampoline.scale-15

    property alias trampolineImage : trampolineImage

//    property alias trampoline1 : trampoline1
//    property alias trampoline2 : trampoline2
//    property alias trampoline3 : trampoline3

    SpriteSequence{
        id:trampolineImage
        scale: 0.6
        running: true
        width: 64; height: 68
//        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        interpolate: true


        Sprite{
            id:trampoline1
            name:"trampoline1" ; source: "../../assets/img/game/trampoline.png"
            frameCount: 1;
            frameWidth: 64; frameHeight: 68;
            frameX:0; frameY: 136
            duration: 300
            to:{"trampoline2" : 1}

        }
        Sprite{
            id:trampoline2

            name:"trampoline2"; source: "../../assets/img/game/trampoline.png"
            frameCount: 1;
            frameWidth: 64; frameHeight: 68;
            frameX:0; frameY: 68
            duration: 300
             to:{"trampoline3" : 1}
        }
        Sprite{
            id:trampoline3

            name:"trampoline3"; source: "../../assets/img/game/trampoline.png"
            frameCount: 1;
            frameWidth: 64; frameHeight: 68;
            frameX:0; frameY: 0
            duration: 300
              to:{"trampoline1" : 1}
        }
    }

    BoxCollider{
        id:collider
        width: parent.width*0.6
        height: 10
//        height: parent.height*0.6
        anchors.horizontalCenter: trampoline.horizontalCenter
//        anchors.verticalCenter: trampoline.verticalCenter
        anchors.top: parent.top

        active: true
        friction: 1
        bodyType: Body.Static
        collisionTestingOnlyMode: false

        categories: Box.Category15
        collidesWith:  Box.Category1|Box.Category8


    }

}
