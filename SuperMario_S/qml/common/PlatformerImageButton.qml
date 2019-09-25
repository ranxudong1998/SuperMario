import QtQuick 2.0
import QtQuick.Controls.Styles 1.0
import Felgo 3.0

GameButton {
  id: imageButton

  height: parent.height

  property int borderWidth: 1
  property color borderColor: "black"
  property int radius: 3
  property color color: "white"
  property alias mouseArea: mouseArea

  property alias image: image
  property alias hoverRectangle: hoverRectangle

  // we override the default Felgo style with our own style
  style: ButtonStyle {
    background: Rectangle {
      border.width: imageButton.borderWidth
      border.color: imageButton.borderColor
      radius: imageButton.radius

      // add a gradient as background
      gradient: Gradient {
        // take color as the first color
        GradientStop { position: 0.0; color: imageButton.color }
        // tint color, to make it a little darker and use it as second color
        GradientStop { position: 1.0; color: Qt.tint(imageButton.color, "#24000000") }
      }
    }
  }

  onClicked: audioManager.playSound("click")

  // 图片
  MultiResolutionImage {
    id: image

    anchors.fill: parent
    anchors.margins: 1

    fillMode: Image.PreserveAspectFit
    MouseArea{
        id:mouseArea
      anchors.fill: parent


    }
  }

  // this white rectangle covers the button when the mouse hovers above it
  Rectangle {
    id: hoverRectangle

    anchors.fill: parent

    radius: imageButton.radius
    color: "white"

    // when the mouse hovers over the button, this rectangle is slightly visible
    opacity: hovered ? 0.3 : 0


  }

}

