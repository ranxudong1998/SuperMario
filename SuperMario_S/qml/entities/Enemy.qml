import Felgo 3.0
import QtQuick 2.0

EntityBase {
    entityType: "opponent"

    property int column
    property int row
    x:(column-1)*gameScene.gridSize
    y:gameScene.gridSize*20 - row*gameScene.gridSize

    property bool alive: true

//    function die() {
//        mediaSound.gameSound("enemy_killed")
//        alive = false
//    }
}
