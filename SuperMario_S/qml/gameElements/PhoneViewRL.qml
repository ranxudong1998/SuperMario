import Felgo 3.0
import QtQuick 2.0

Item {
    visible: !system.desktopPlatform
    enabled: visible

    height: 120
    width: 240// contain two Rectangle

    anchors.left:gameScene.gameWindowAnchorItem.left
    anchors.bottom: gameScene.gameWindowAnchorItem.bottom

    property var controller

    //左键
    Rectangle{
        id:leftRectangle
        width: parent.width/2
        height: parent.height
        anchors.left: parent.left
        opacity: 0.5
        color: "#ffffff"
        radius: 0.4
        visible: false
    }
    MultiResolutionImage{
        id:leftImage
        visible: true
        anchors.fill: leftRectangle
        source: "../../assets/img/game/left.png"
        fillMode: Image.PreserveAspectFit
        scale: 1
    }

    //右键
    Rectangle{
        id:rightRectangle
        width: parent.width/2
        height: parent.height
        anchors.right: parent.right
        opacity: 0.5
        color: "#ffffff"
        radius: 0.4
        visible: false
    }
    MultiResolutionImage{
        id:rightImage
        anchors.fill: rightRectangle
        source: "../../assets/img/game/right.png"
        fillMode: Image.PreserveAspectFit
        scale: 1
    }

    MultiPointTouchArea{
        anchors.fill: parent
        onPressed: {
            if(touchPoints[0].x < width/2){
                controller.xAxis = -1
                leftRectangle.visible=true
            }
            else{
                controller.xAxis = 1
                rightRectangle.visible=true
            }
        }
        onUpdated: {
            if(touchPoints[0].x < width/2)
                controller.xAxis = -1
            else
                controller.xAxis = 1
        }

        onReleased: {
            // reset xAxis to zero
            controller.xAxis = 0

            // make backgrounds invisible again
            leftRectangle.visible = false
            rightRectangle.visible = false
        }
    }



}
