import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.12

Item {
    id:mediaManager

    Component.onCompleted: handleMusic()
    property alias menuBgMusic: menuBgMusic
    property alias gameBgMusic: gameBgMusic
    property alias levelBgMusic: levelBgMusic
    BackgroundMusic{
        id: menuBgMusic
        autoPlay: false
        //        loops: 10
        //        playing: false
        source: "../../assets/sound/menu_music.mp3"
    }
    BackgroundMusic{
        id: gameBgMusic
        autoPlay: false
        //        loops: 10
        //        playing: false
        source: "../../assets/sound/world1_music.mp3"
    }
    BackgroundMusic{
        id: levelBgMusic
        autoPlay: false
        //        loops: 10
        //        playing: false
        source: "../../assets/sound/water_bonus.mp3"
    }

    //金币
    MediaPlayer{
        id:coin
        source: "../../assets/sound/coin.mp3"
    }

    //钻石
    MediaPlayer{
        id:diamond
        source: "../../assets/sound/diamond.mp3"
    }

    //蘑菇
    MediaPlayer{
        id:mushroom_catch
        source: "../../assets/sound/mushroom_catch.mp3"
    }

    //人物死亡
    MediaPlayer{
        id:gameover
        source: "../../assets/sound/gameover.mp3"
    }

    //到达终点
    MediaPlayer{
        id:running_time
        source: "../../assets/sound/running_time.mp3"
    }

    //跳跃
    MediaPlayer{
        id:jump
        source: "../../assets/sound/jump.mp3"
    }

    //射击
    MediaPlayer{
        id:shot
        source: "../../assets/sound/shot.mp3"
    }

    //石头击碎
    MediaPlayer{
        id:hit_block
        source: "../../assets/sound/hit_block.mp3"
    }

    //enemy 被射杀
    MediaPlayer{
        id:kill_by_bullet
        source: "../../assets/sound/killed_by_bullet.mp3"
    }

    //enemy 被踩死
    MediaPlayer{
        id:enemy_killed
        source: "../../assets/sound/enemy_killed.mp3"
    }

    function gameSound(sound){//不同场景的声音函数
        if(sound==="enemy_killed")
            enemy_killed.play();
        else if(sound==="diamond")
            diamond.play();
        else if(sound==="coin"){
            coin.stop()
            coin.play();
        }
        else if(sound==="mushroom_catch")
            mushroom_catch.play();
        else if(sound==="jump"){
            jump.stop();
            jump.play();
        }
        else if(sound==="gameover")
            gameover.play();
        else if(sound==="running_time")
            running_time.play();
        else if(sound==="shot")
            shot.play();
        else if(sound==="hit_block")
            hit_block.play();
        else if(sound==="kill_by_ballet")
            kill_by_bullet.play();
    }

    //处理不同场景的背景音乐
    function handleMusic(){
        switch(gameWindow.state){
        case "menu":
        case "option":
        case "ranking":
            mediaManager.startMusic(menuBgMusic)
            //            console.log("Here Handle Music && State " + gameWindow.state)
            break;
        case "level":
            mediaManager.startMusic(levelBgMusic)
            //            console.log("Here Handle Music && State " + gameWindow.state)
            break;
        case "game":
            mediaManager.startMusic(gameBgMusic)
            //            console.log("Here Handle Music && State " + gameWindow.state)
            break;
        }
    }

    function startMusic(music){
        if(music.playing){
            //                console.log("正在播放 && return && State "+gameWindow.state)
            return
        }
        menuBgMusic.stop();
        levelBgMusic.stop();
        gameBgMusic.stop();


        music.play()
        //            console.log("Wow !!! We finally changed the music " + music)
        //            console.log("menuBgMusic.playing "+menuBgMusic.playing
        //                        +" levelBgMusic.playing "+levelBgMusic.playing
        //                        +" gameBgMusic.playing "+gameBgMusic.playing)
    }

}
