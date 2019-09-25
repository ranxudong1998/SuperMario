import Felgo 3.0
import QtQuick 2.0

EntityBase {

    id: tiledEntityBase


    property bool platformCheck: true
    property double column
    property double row
    property int widthSize:1
    property int heightSize:1

    x:(column-1)*gameScene.gridSize
    y:gameScene.gridSize*20 - row*gameScene.gridSize
    width:widthSize*gameScene.gridSize
    height:heightSize*gameScene.gridSize

    //注释：gameScene.gridSize*20是整个屏幕的长度
}
