import Felgo 3.0
import QtQuick 2.0

Item {
    id: jumpTouchButton

    visible: !system.desktopPlatform
    enabled: visible

    height: 120
    width: 120

    signal pressed  //定义的信号

    Rectangle{
        id:upRectangle
        anchors.fill: parent
        radius: 0.4
        color: "#ffffff"
        opacity: 0.5
        visible: false
    }

    property alias imageSource: image.source
    MultiResolutionImage{
        id:image
        anchors.fill: upRectangle
        fillMode: Image.PreserveAspectFit
        scale: 1
    }

    MouseArea{
        anchors.fill: parent

        onPressed: {
            jumpTouchButton.pressed()//发送信号
            upRectangle.visible=true
        }
        onReleased: {
            upRectangle.visible=false
        }


    }
}
