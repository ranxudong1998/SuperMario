import Felgo 3.0
import QtQuick 2.0
import QtQuick.Particles 2.12
//import QtQuick.Shapes 1.12
import QtGraphicalEffects 1.0
import QtQuick 2.12
// EMPTY SCENE

SceneBase {

    id: optionScene
    //背景图片
    BackgroundImage{
        id:bgimage
        anchors.fill: parent
        source: "../../assets/img/game/20190620224727.png"
    }

    //封装--为了粒子系统
    Rectangle{
        width: parent.width
        height: parent.height
        color: "transparent"

        //主框架
        Rectangle{
            id:rec
            width: parent.width/3*2
            height: parent.height/3*2
            color: "#3333ffff"
            border.color: "lightblue"

            radius: height/10
            anchors.centerIn: parent

            FontLoader{
                id: optionFont
                source: "../../assets/font/PepitaMT.ttf"
            }

            //标题
            Rectangle{
                id: title
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                width: parent.width/10*3
                height: parent.height/10*2
                //            opacity: 0.6
                color: "transparent"

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.centerIn: parent
                    text: qsTr("option")
                    font.family: optionFont.name
                    //                color: "green"
                    //                color: "#0ef916"
                    color: "white"
                    styleColor: "#0ef916"
                    font.pointSize: 30
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                }
            }

            Grid{
                anchors.top: title.bottom
                anchors.topMargin: 20
                //                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                id:grid
                columns: 2
                columnSpacing: 30
                rowSpacing: 30
                Rectangle{
                    width: optionScene.width/10*2;
                    height:width/3*2;
                    radius: height/2;
                    color: "transparent"
                    opacity: 0.9
                    border.color: "red"
                    MultiResolutionImage{
                        id: music
                        anchors.centerIn: parent
                        source: "../../assets/img/game/music.png"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(music.opacity == 1.0){
                                gameWindow.sound = false
                                music.opacity = 0.2}
                            else {
                                gameWindow.sound = true
                                 music.opacity =1.0
                            }
                        }
                    }
                }
                Rectangle{
                    id: rect2
                    width: optionScene.width/10*2;
                    height:width/3*2;
                    radius: height/2;
                    color: "transparent"
                    opacity: 0.9
                    border.color: "red"
                    MultiResolutionImage{
                        anchors.centerIn: parent
                        id: sound
                        property string sound_on: "../../assets/img/game/sound_on.png"
                        property string sound_off: "../../assets/img/game/sound_off.png"
                        source: sound_on
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            rect2.count++;
                            if(rect2.count%2==1){
                                sound.source = sound.sound_off
                                gameWindow.music = false
                            }else{
                                sound.source = sound.sound_on
                                gameWindow.music = true
                            }

//                            sound.source =  rect2.count%2==1?sound.sound_off:sound.sound_on
//                            gameWindow.music = false
                            //sound.source = ((sound.source == sound.sound_on) ? sound.sound_off : sound.sound_on)
                            //console.log("click sound !!! "+ sound)
                        }
                    }
                    property int count: 0  //声音计数
                }
                Rectangle{
                    width: optionScene.width/10*2;
                    height:width/3*2;
                    radius: height/2;
                    color: "transparent"
                    border.color: "red"
                    Text {
                        color: "#ffffff"
                        anchors.centerIn: parent
                        text: qsTr("developer")
                        font.bold: true
                        font.family: optionFont.name
                        verticalAlignment: Text.AlignVCenter
                        style: Text.Sunken
                        font.pointSize: 15
                        horizontalAlignment: Text.AlignHCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            console.log("Here developer information")
                            developer.visible = !developer.visible
                        }
                    }

                }
                Rectangle{
                    width: optionScene.width/10*2;
                    height:width/3*2;
                    radius: height/2;
                    color: "transparent"
                    border.color: "red"
                    MultiResolutionImage{
//                        width: height
//                        height: parent.height
                        id:home
                        anchors.centerIn: parent
                        source: "../../assets/img/game/home.png"
                    }
                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            gameWindow.state = "menu"
                            //console.log("To Home Page")
                        }
                    }
                }
            }
            MultiResolutionImage{
                id: developer
                width: parent.width*8/10
                height: parent.height*8/10
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                visible: false
                source: "../../assets/img/game/IMG20190623153652.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        developer.visible = false
                    }
                }
            }


        }
        //粒子系统
        ParticleSystem{
            id:particle
        }

        //逻辑粒子可视化
        ImageParticle{
            id: flower
            source: "../../assets/img/game/paopao.png"
            //                        source: "../../simple/image/mushroom.png"
            system: particle
            alpha: 0.1  //透明度
            rotationVariation: 180 //旋转角度不超过180
            z:-1
        }

        //发射器
        Emitter{
            system: particle
            anchors.fill: parent
            emitRate: 20  //每秒发射速率
            lifeSpan: 20000  //粒子持续时间
            lifeSpanVariation: 10000
            size: 70 //粒子开始时的大小
            sizeVariation: 10 //粒子可变范围
            //粒子起始速度
            velocity: AngleDirection{
                angleVariation: 360
                magnitude: 3
            }
            maximumEmitted: 20 //同一时间下最多存在的粒子数目
            //            startTime: 5000 //在该值之前发射粒子
        }
    }

    //产生随机数的函数
    function randomnumber(min,max){
        var range = max - min
        var rand = Math.random()
        return min+Math.round(rand*range)
    }
}

/*自己写的气泡
//        ItemParticle{
//            id: circle
//            delegate:  Rectangle{
//                width: randomnumber(15,55)
//                height: width
//                radius: height/2
//                gradient: Gradient{
//                    GradientStop{position: 0.0;color: "#66FF99FF"}
////                    GradientStop{position: 0.5;color: "#22CCFFFF"}
//                    GradientStop{position: 1.0;color: "#6633CCFF"}
//                }
//                color: "transparent"
//                //                RadialGradient {
//                //                    width: parent.width/2
//                //                    height: parent.height/2

//                //                    verticalRadius: parent.radius
//                //                    horizontalRadius: parent.radius
//                //                    GradientStop { position: 0; color: "blue" }
//                //                    GradientStop { position: 0.2; color: "green" }
//                //                    GradientStop { position: 0.4; color: "red" }
//                //                    GradientStop { position: 0.6; color: "yellow" }
//                //                    GradientStop { position: 1; color: "cyan" }
//                //                }

//                rotation: randomnumber(0,180)
//                border.color: "#66c0c0c0"
//            }
//            system: particle
//        }
*/
