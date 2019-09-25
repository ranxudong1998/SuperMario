import QtQuick 2.0
import"../entities"

Item {

    Ground{
        widthSize: 6//要得个数
        heightSize:7//总排数
        column:0//为了算x、y
        row:7
    }

    Coin{
        column:7
        row: 7
    }
    Coin{
        column:8
        row: 7
    }

    Ground{
        widthSize:4      //10
        heightSize:6
        column:6   //开始铺设雪地
        row:6
    }

    Coin{
        column:11
        row: 6
    }
    Coin{
        column:12
        row: 6
    }
    Ground{
        widthSize:4     //16
        heightSize:5
        column:10
        row:5
    }
    Bear{
        column: 15
        row:5
    }
    Coin{
        column: 29
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 30
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 31
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 32
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 35
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 33
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 34
        row: 14        //弹簧与金币的距离8
    }
    Coin{
        column: 40
        row:16
    }
    Coin{
        column: 46
        row:16
    }
    Coin{
        column: 42
        row:16
    }
    Coin{
        column: 44
        row:16
    }
    Coin{
        column: 48
        row:16
    }
    Coin{
        column: 50
        row:16
    }
    Wall{
        column: 40
        row:14
    }
    Wall{
        column: 42
        row:14
    }
    Wall{
        column: 44
        row:14
    }
    Wall{
        column: 46
        row:14
    }
    Wall{
        column: 48
        row:14
    }
    Wall{
        column: 50
        row:14
    }
    Trampoline{
        column: 30
        row:5.4       //弹簧0.4
    }
    Trampoline{
        column: 34
        row:5.4       //弹簧0.4
    }
    Bear{
        column: 40
        row:5
    }
    Ground{
        widthSize: 40   //宽度+列数 = 下一个草地列数
        heightSize: 4
        column:14
        row:4
    }
    Spikerock{
        widthSize:5
        column: 54
        row:2
    }
    Ground{
        widthSize: 5
        heightSize: 1
        column: 54
        row:1
    }
    Coin{
        column: 60
        row:11
    }
    Coin{
        column: 61
        row:11
    }
    Coin{
        column: 62
        row:11
    }
    Coin{
        column: 63
        row:11
    }
    Ground{
        widthSize: 10
        heightSize: 4
        column: 59
        row:4
    }
    Mushroom{
        column:70
        row:6        //player和coin差6
    }
    Ground{
        widthSize: 4
        heightSize: 5
        column:69
        row:5
    }
    Bear{
        column:74
        row:6

    }
    Bear{
        column:79
        row:6
    }
    Wall{
        //widthSize: 6
        column:76
        row:14
        //heightSize: 1
    }
    Wall{

        column:78
        row:14

    }
    Wall{
        // widthSize: 6
        column:80
        row:14
        //heightSize: 1
    }
    Wall{
        // widthSize: 6
        column:82
        row:14
        //heightSize: 1
    }

    Wall{
        // widthSize: 6
        column:84
        row:14
        //heightSize: 1
    }
    Bat{
        column: 76
        row:16
    }
    Coin{
        column: 78
        row:19
    }
    Coin{
        column: 79
        row:19
    }
    Magic{
        column: 80
        row:19
    }
    Golden{
        column: 80
        row:19
    }
    Coin{
        column: 83
        row:19
    }
    Coin{
        column: 82
        row:19
    }
    Ground{
        widthSize: 20
        heightSize:6
        column: 73
        row:6
    }
    Ground{
        widthSize: 4
        heightSize: 8
        column: 93
        row:8
    }
    Ground{
        widthSize: 60
        heightSize: 10
        column: 97
        row:10
    }
    Coin{
        column: 105
        row:15
    }
    Coin{
        column: 107
        row:15
    }
    Coin{
        column: 109
        row:15
    }
    Diamond{
        column: 111
        row:15
    }
    Coin{
        column: 114
        row:15
    }
    Coin{
        column: 116
        row:15
    }
    Coin{
        column: 118
        row:15
    }
    Bear{
        column: 108
        row:13
    }
    Bat{
        column: 125
        row: 15
    }
    Bat{
        column: 130
        row: 15
    }
    Coin{
       column: 140
       row: 15
    }
    Coin{
       column: 142
       row: 15
    }
    Coin{
       column: 144
       row: 15
    }
    Coin{
       column: 146
       row: 15
    }
    Coin{
       column: 148
       row: 15
    }
    Coin{
       column: 150
       row: 15
    }
    Coin{
       column: 152
       row: 15
    }
    //第一块地刺
    Ground{
        widthSize: 4
        heightSize: 10
        column: 157
        row:4
    }
    Spikerock{
        widthSize: 4
        heightSize: 1
        column: 157
        row:5
    }
    Diamond{
        column: 162
        row: 17
    }
    Ground{
        widthSize: 3
        heightSize: 18
        column: 161
        row: 12
    }
    Ground{
        widthSize: 4
        heightSize: 4
        column: 164
        row: 4
    }
    Spikerock{
        widthSize: 4
        heightSize: 1
        column: 164
        row: 5
    }
    Ground{
        widthSize: 2
        heightSize: 14
        column: 168
        row:14
    }
    Ground{
        widthSize: 3
        heightSize: 5
        column: 170
        row:14
    }
    Ground{
        widthSize:10
        heightSize: 3
        column: 173      //边缘
        row:14
    }
    Ground{
        widthSize: 4
        heightSize:1
        column: 188
        row:8

    }
    Ground{          //第二台阶
        widthSize: 4
        heightSize:1
        column: 184
        row:6
    }
    Wheel{
        column: 178
        row:4
    }
    Wheel{
        column: 176
        row:4
    }
    Bat{
        column:178
        row:  8
    }
    Bat{
        column:175
        row:  8
    }
    Ground{
        widthSize: 4    //齿轮
        heightSize:1
        column: 180
        row:4
    }
    Coin{
        column: 170
        row: 8
    }
    Coin{
        column: 173
        row:8
    }
    Coin{
        column: 173
        row: 6
    }
    Diamond{
        column: 170
        row:6
    }
    Ground{
        widthSize: 6
        heightSize: 4
        column: 170
        row:4
    }
    Ground{
        widthSize: 10
        heightSize: 18
        column: 192
        row:10
    }
    Coin{
        column: 169
        row:19
    }
    Coin{
        column: 171
        row:19
    }
    Coin{
        column: 173
        row:19
    }
    Magic{
        column: 175
        row:19
    }
    Golden{
        column: 175
        row:19
    }
    Coin{
        column: 177
        row:19
    }
    Coin{
        column: 179
        row:19
    }
    Coin{
        column: 181
        row:19
    }



    Ground{
        widthSize: 4
        heightSize:5
        column: 202
        row: 5
    }

    Ground{
        widthSize: 4
        heightSize: 1
        column: 208
        row:4
    }

    Bear{
        column:214
        row:6
    }
    Ground{
        widthSize: 10
        heightSize: 1
        column: 214
        row: 4
    }
    Bat{
        column: 206
        row:8
    }
    Ground{
        widthSize: 5
        heightSize: 1
        column: 224
        row:2
    }
    Spikerock{
        widthSize: 5
        column: 224
        row:3
    }
    Ground{
        widthSize: 10
        heightSize: 1
        column: 229
        row:4
    }
    Trampoline{
        column: 237
        row:5.4
    }
    Ground{
        widthSize: 4
        heightSize: 1
        column: 240
        row:10
    }
    Ground{
        widthSize: 4
        heightSize: 1
        column: 246
        row:11
    }
    Ground{
        widthSize: 4
        heightSize: 1
        column: 252
        row:12
    }
    Ground{
        widthSize: 15
        heightSize: 2
        column: 258
        row:13
    }
    Home{
        column: 265
        row:16.5
    }


}

