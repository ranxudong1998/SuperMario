import Felgo 3.0
import QtQuick 2.12

import "../entities"
import RankUIType 1.0

SceneBase {
    id: rankScene

    //背景
    BackgroundImage{
        id:bgimage
        anchors.fill: parent
        source: "../../assets/img/game/20190620165516.png"
    }

    FontLoader{
        id: rankFont
        source: "../../assets/font/PepitaMT.ttf"
    }

    property var jsonData: [] //这是一个为了让QML中的值返回c++的js数组

    property alias jsonarray: rankUI.jsonarray
    property alias jsonData: rankScene.jsonData
    property alias jsonModel: jsonModel  //只存了前三关的数据，测试关卡的没有存
    //标题
    Text {
        id: ranking
        x: 385
        width: 177
        height: 101
        text: qsTr("Ranking")
        font.bold: false
        style: Text.Sunken
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        transformOrigin: Item.Center
        font.family: rankFont.name
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50
    }

    //齿轮
    Wheel{
        id: wheel
        x:parent.width - width/2*3
        y:0
    }

    RankUI{
        id:rankUI
    }

    JsonListModel{
        id:jsonModel

    }
    Component.onCompleted: {
        jsonModel.source = rankUI.jsonarray
    }


    function recordChanged()
    {
        for(var i=0;i<jsonModel.count;i++)
            jsonData[i] = jsonModel.get(i)
    }
    //listview视图
    ListView {
        id: listView
        width: 730
        height: 399
        delegate: delegate
        model: jsonModel
        header: header
        clip: true
        spacing:20
        anchors.top: ranking.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
    }

    //listview代理
    Component {
        id: delegate
        Item {
            id: wrapper
            width: parent.width
            height: row.recheight
            Row {
                id:row
                property int recheight: rec.height
                Rectangle {
                    id:rec

                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#3300CCFF"}
                        GradientStop{position: 0.5; color: "#660099FF"}
                        GradientStop{position: 1.0; color: "#9999CCFF"}
                    }
                    //                    rotation: 90
                    //                    height: wrapper.width/3
                    //                    width: leveltext.height*1.5
                    width: wrapper.width/3
                    height: leveltext.height
                    //                    color: "#3300CCFF"
                    radius: height/3
                    Text {
                        //                        rotation: 270
                        anchors.centerIn: parent
                        id: leveltext
                        text: level
                        font.family: rankFont.name
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: costtext.height
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#3300CCFF"}
                        GradientStop{position: 0.5; color: "#660099FF"}
                        GradientStop{position: 1.0; color: "#9999CCFF"}
                    }
                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: costtext
                        text: record
                        font.family: rankFont.name
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: bytext.height
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#3300CCFF"}
                        GradientStop{position: 0.5; color: "#660099FF"}
                        GradientStop{position: 1.0; color: "#9999CCFF"}
                    }
                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: bytext
                        text: holder
                        font.family: rankFont.name
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                    }
                }
            }
        }
    }
    //listview头部
    Component {
        id: header
        Item {
            id: wrapper
            width: parent.width
            height: row.recheight
            Row {
                id:row
                property int recheight: rec.height
                Rectangle {
                    id:rec

                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#99FF6666"}
                        GradientStop{position: 0.5; color: "red"}
                        GradientStop{position: 1.0; color: "#33FFCCCC"}
                    }

                    //                    rotation: 90

                    //                    height: wrapper.width/3
                    //                    width: leveltext.height*1.5
                    width: wrapper.width/3
                    height: leveltext.height*1.5/2
                    //                    color: "#3300CCFF"
                    //                    radius: height/3
                    Text {
                        //                        rotation: 270
                        anchors.centerIn: parent
                        id: leveltext
                        text: "level"
                        font.family: rankFont.name
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: costtext.height*1.5/2
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#99FF6666"}
                        GradientStop{position: 0.5; color: "red"}
                        GradientStop{position: 1.0; color: "#33FFCCCC"}
                    }

                    //                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: costtext
                        text: "record"
                        font.family: rankFont.name
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                    }
                }
                Rectangle {
                    width: wrapper.width/3
                    height: bytext.height*1.5/2
                    gradient: Gradient{
                        GradientStop{position: 0.0; color: "#99FF6666"}
                        GradientStop{position: 0.5; color: "red"}
                        GradientStop{position: 1.0; color: "#33FFCCCC"}
                    }

                    //                    radius: height/3
                    Text {
                        anchors.centerIn: parent
                        id: bytext
                        text: "holder"
                        font.family: rankFont.name
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 30
                    }
                }
            }
        }
    }

//    //listview模型
//    ListModel {
//        id: model
//    }

    //主菜单按钮
    OurGameButtons{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height*0.08

        anchors.horizontalCenter: parent.horizontalCenter
        width: text.width/2
        height: parent.height*0.1
        text.font.pointSize: 30
        text.color: "red"
        text.text: "menu"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                gameWindow.state = "menu"
            }
        }
    }

}
