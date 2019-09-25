import Felgo 3.0
import QtQuick 2.0

import "./scene"
import "./entities"
import "./common"
GameWindow {
    id: gameWindow

    screenHeight: 640
    screenWidth: 960

    activeScene: menuScene //设置激活窗口
    state: "menu" //初始状态 menu
    onStateChanged: {
        if(music)
            mediasound.handleMusic()
    }

    //游戏画面
    GameScene{
        id: gameScene
    }
    //菜单界面
    MenuScene{
        id: menuScene
    }
    //选项界面
    OptionScene{
        id:optionScene
    }
    //排行榜界面
    RankScene{
        id: rankScene
    }
    //选关界面
    LevelScene{
        id: levelScene
    }

    //实体管理类
    EntityManager{
        id: manager
        entityContainer: gameScene.container
        poolingEnabled: true
    }
    //音乐管理类
    MediaSound{
        id: mediasound
    }

    //设置不同状态的gameWindow.activeScene 和Scene.opacity
    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: gameWindow
                activeScene: menuScene
            }
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
        },
        State {
            name: "option"
            PropertyChanges {
                target: gameWindow
                activeScene: optionScene
            }
            PropertyChanges {
                target: optionScene
                opacity: 1
            }
        },
        State {
            name: "ranking"
            PropertyChanges {
                target: gameWindow
                activeScene: rankScene
            }
            PropertyChanges {
                target: rankScene
                opacity: 1
            }
        },
        State {
            name: "level"
            PropertyChanges {
                target: gameWindow
                activeScene: levelScene
            }
            PropertyChanges {
                target: levelScene
                opacity: 1
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameWindow
                activeScene: gameScene
            }
            PropertyChanges {
                target: gameScene
                opacity: 1
            }
        }
    ]

    //被player调用
    function playerSound(object){
        if(sound)
            mediasound.gameSound(object)
    }

    //option 音效有无控制
    property bool music: true
    property bool sound: true
    onMusicChanged: {
        if(music)
            mediasound.handleMusic()
        else {
            mediasound.menuBgMusic.stop()
            mediasound.levelBgMusic.stop()
            mediasound.gameBgMusic.stop()
        }
    }
}
