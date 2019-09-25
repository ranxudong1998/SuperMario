import QtQuick 2.0
import Felgo 3.0


Item{

    width:400
    height: gameScene.height
    anchors.centerIn:gameScene

    Text {
        width: 100
        height: 100

        anchors.centerIn: parent
        text: qsTr("PAUSED")
        font.family: "Comic Sans MS"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 45    }

    MultiResolutionImage{
        width: 160
        height: 120
        anchors.bottom:parent.bottom
        id:recovery
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/play_big.png"
    }
    MultiResolutionImage{
        id:menu
        width: 160
        height: 120
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        fillMode: Image.PreserveAspectFit
        source: "../../assets/img/game/menu_sound.png"
    }


}
