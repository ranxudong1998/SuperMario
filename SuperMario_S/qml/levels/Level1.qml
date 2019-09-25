import Felgo 3.0
import QtQuick 2.0
import "../entities"

Item {
    id: level1
//    property int currentLevel: 1
    Ground{
         //        x:0
         //        y:0
         widthSize: 8//要得个数
         heightSize:5//总排数
         column:1//为了算x、y
         row:5
     }

//    Home{
//          column: 20
//          row:7
//      }
    Ground{
        widthSize:17
        heightSize:3
        column: 9
        row:3

    }

    Scorpion{
        column: 20
        row:5

    }
    WaterNew{
        widthSize: 2
        heightSize:2
        column:26
        row:2

    }
    Coin{
        column: 27
        row:8
    }
    Coin{
        column: 28
        row:9

    }
    Ground{
         widthSize: 15//要得个数
         heightSize: 4//总排数
         column:30//为了算x、y
         row:4
     }//下一次的column就是上一次的column+widthSize
    Scorpion{
        column: 41
        row:4

    }

    Magic{
        column: 37
        row:11
    }
    Golden{
        column: 37
        row:11
    }


    Diamond{
        column: 40
        row:15
    }

    Ground{
        widthSize: 4
        heightSize: 5
        column: 45
        row:5

    }
    WaterNew{
        widthSize: 18
        heightSize: 4
        column: 49
        row:4

    }
    Platform{
        widthSize: 1
        heightSize: 1
        column:52
        row:7
    }
    Coin{
        column: 52
        row:11
    }
    Coin{
        column: 53.2
        row:11
    }
    Coin{
        column: 54.4
        row:11
    }
    Platform{
        widthSize: 1
        heightSize: 1
        column:58
        row:11
    }//

    Platform{
        widthSize: 1
        heightSize: 1
        column:64
        row:11
    }
    Platform{
        widthSize: 1
        heightSize: 1
        column: 70
        row:11
    }
    Bat{
        column: 61
        row:18
    }
    Bat{
        column: 64
        row:18
    }
    Platform{
        widthSize: 1
        heightSize: 1
        column: 76
        row:7
    }

    Mushroom{
        column: 78
        row:8

    }

    Ground{
         widthSize: 20
         heightSize: 5
         column:84
         row:5
     }

    Snail{
        column: 95
        row:5

    }
    Wall{
        column: 91.6
        row:13
    }
    Wall{
        column: 93.2
        row:13
    }
    Wall{
        column: 94.8
        row:13
    }
    Wall{
        column: 96.4
        row:13
    }
    Wall{
        column: 98
        row:13
    }
    Coin{
        column: 91.6
        row:16
    }
    Coin{
        column: 93.2
        row:16

    }
    Coin{
        column: 94.8
        row:16

    }
    Coin{
        column: 96.4
        row:16
    }
    Coin{
        column: 98
        row:16

    }
    Ground{
         widthSize: 6
         heightSize: 8
         column:104
         row:8
     }
//    Wheel{
//        column: 108
//        row:11

//    }
    Ground{
         widthSize: 6
         heightSize: 11
         column:110
         row:11
     }
//    Wheel{
//        column: 116
//        row:11
//    }
    Ground{
         widthSize: 6
         heightSize: 8
         column:116
         row:8
     }
    Spikerock{
        widthSize: 4
        heightSize: 2
        column: 122
        row:2

    }
    Ground{
         widthSize: 6
         heightSize: 8
         column:126
         row:8
     }
    Ground{
        widthSize: 15
        heightSize: 5
        column: 132
        row:5

    }
    Trampoline{
        column: 140
        row:6

    }
    Bat{
        column: 137
        row:14
    }
    Bat{
        column: 140
        row:14
    }
    Bat{
        column: 143
        row:14
    }
    Coin{
        column: 137
        row:17
    }
    Coin{
        column: 140
        row:17
    }
    Coin{
        column: 143
        row:17
    }
    WaterNew{
        widthSize: 10
        heightSize: 4
        column: 147
        row:4

    }
    Platform_litter{
        column: 150
        row:4.8
    }
    Platform_litter{
        column: 155
        row:4.8
    }
    Platform_litter{
        column: 160
        row:4.8
    }
    Ground{
        widthSize: 10
        heightSize: 5
        column: 167.5
        row:5
    }
    //这里设置头顶的效果

    Bat{
        column: 170
        row:12

    }
    Bat{
        column: 172
        row:12

    }
    Trampoline{
        column: 173
        row:6
    }

    Wall{
        column: 166.6
        row:20
    }
    Wall{
        column: 166.6
        row:18.4
    }
    Wall{
        column: 166.6
        row:16.8
    }
    Wall{
        column: 166.6
        row:15.2
    }
    Wall{
        column: 166.6
        row:13.6
    }
    Wall{
        column: 168.2
        row:13.6
    }
    Wall{
        column: 169.8
        row:13.6
    }
    Wall{
        column:175.6
        row:13.6
    }
    Wall{
        column: 177.2
        row:13.6
    }
    Wall{
        column: 178.8
        row:13.6
    }
    Wall{
        column: 178.8
        row:15.2
    }
    Wall{
        column: 178.8
        row:16.8
    }
    Wall{
        column: 178.8
        row:18.4
    }
    Wall{
        column: 178.8
        row:20
    }

    Coin{
        column: 168.2
        row:19.6
    }
    Coin{
        column: 168.2
        row:18.4

    }
    Coin{
        column: 168.2
        row:17.2

    }
    Coin
    {
        column: 168.2
        row:16
    }
    Coin{
        column: 168.2
        row:14.8
    }
    Coin{
        column: 169.4
        row:19.6

    }
    Coin{
        column: 169.4
        row:18.4

    }
    Coin{
        column: 169.4
        row:17.2

    }
    Coin
    {
        column: 169.4
        row:16
    }
    Coin{
        column: 169.4
        row:14.8
    }

    Coin{
        column: 170.6
        row:19.6

    }
    Coin{
        column:  170.6
        row:18.4

    }
    Coin{
        column:  170.6
        row:17.2

    }
    Coin
    {
        column:  170.6
        row:16
    }
    Coin{
        column:  170.6
        row:14.8
    }
    //后面
    Diamond{
        column: 172.5
        row:19.6
    }
    Coin{
        column: 172.9
        row:17.2
    }
    Coin{
        column: 172.9
        row:16

    }
    Coin{
        column: 172.9
        row:14.8

    }

    Coin{
        column: 174.8
        row:19.6

    }
    Coin{
        column:  174.8
        row:18.4

    }
    Coin{
        column:  174.8
        row:17.2

    }
    Coin
    {
        column:174.8
        row:16
    }
    Coin{
        column:  174.8
        row:14.8
    }


    Coin{
        column: 176
        row:19.6

    }
    Coin{
        column:  176
        row:18.4

    }
    Coin{
        column:  176
        row:17.2

    }
    Coin
    {
        column: 176
        row:16
    }
    Coin{
        column:  176
        row:14.8
    }

    Coin{
        column: 177.2
        row:19.6

    }
    Coin{
        column:  177.2
        row:18.4

    }
    Coin{
        column:  177.2
        row:17.2

    }
    Coin
    {
        column: 177.2
        row:16
    }
    Coin{
        column:  177.2
        row:14.8
    }
    WaterNew{
        widthSize: 10
        heightSize: 4
        column: 177.5
        row:4
    }
    Platform_litter{
        column: 180.5
        row:4.8
    }
    Platform_litter{
        column: 185.5
        row:4.8
    }
    Platform_litter{
        column: 190.5
        row:4.8
    }
    Ground{
        widthSize: 22
        heightSize: 5
        column: 198
        row:5
    }

    Snail{
        column: 205
        row:5

    }
    WaterNew{
        widthSize: 3 //6
        heightSize: 4
        column: 220
        row:4
    }
    Coin{
        column: 226
        row:9
    }
    Coin{
        column: 228
        row:9
    }

    Ground{
        widthSize: 5
        heightSize: 5
        column: 225
        row:5
    }
    Coin{
        column: 231
        row:12

    }
    Coin{
        column: 233.5
        row:12
    }
    Coin{
        column: 236
        row:12
    }
    Ground{
        widthSize: 8
        heightSize: 8
        column: 230
        row:8
    }
    Bat{
        column: 238
        row:18
    }
    Bat{
        column: 241
        row:18

    }

    Ground{
        widthSize: 10
        heightSize: 11
        column: 238
        row:11
    }
    Coin{
        column: 249
        row:12

    }
    Coin{
        column: 251.5
        row:12
    }
    Coin{
        column: 254
        row:12
    }
    Ground{
        widthSize: 8
        heightSize: 8
        column: 248
        row:8
    }
    Coin{
        column: 257
        row:9
    }
    Coin{
        column: 259
        row:9
    }
    Ground{
        widthSize: 6
        heightSize: 5
        column: 256
        row:5
    }
    WaterNew{
        widthSize: 24
        heightSize: 4
        column: 262
        row:4
    }
    Platform{
        widthSize: 1
        heightSize: 1
        platformCheck: false
        column: 266
        row:4.8
    }

    Platform{
        widthSize: 1
        heightSize: 1
        platformCheck: false
        column: 276
        row:4.8
    }
    Platform{
        widthSize: 1
        heightSize: 1
        platformCheck: false
        column: 287
        row:6
    }
    Platform{
        widthSize: 1
        heightSize: 1
        platformCheck: false
        column: 298
        row:6
    }
    Ground{
        widthSize: 10
        heightSize: 8
        column: 308
        row:8
    }
    Ground{
        widthSize: 6
        heightSize: 11
        column: 318
        row:11
    }
    Ground{
        widthSize: 10
        heightSize: 8
        column: 324
        row:8
    }
    Ground{
        widthSize: 15
        heightSize:8
        column: 334
        row:8
    }
    Ground{
        widthSize: 6
        heightSize: 8
        column: 349
        row:8
    }
    Snail{
        column: 340
        row:8
    }
    Snail{
        column: 343
        row:8
    }
    Ground{

        widthSize: 25
        heightSize: 11
        column: 355
        row:11
    }

    Diamond{
        column: 365
        row:17

    }

    Home{
        column: 370
        row:14.5

    }

}

