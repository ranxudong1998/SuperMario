import Felgo 3.0
import QtQuick 2.0
import "../entities"

Item{
    id: level3

    function reset(){
        l3_77.reset()
        l3_10_2.reset()
        l3_10_1.reset()
        l3_11.reset()
        l3_12.reset()
        l3_13.reset()
        l3_13_1.reset()
        l3_13_2.reset()
        l3_13_3.reset()
        l3_14.reset()
        l3_14_1.reset()
        l3_14_2.reset()
        l3_14_3.reset()
        l3_15_1.reset()
        l3_14_13.reset()
        l3_14_12.reset()
        l3_14_14.reset()
        l3_16_1.reset()
        l3_16_11.reset()
        l3_16_10.reset()
        l3_18_1_1_1.reset()
        l3_18_1_1_2.reset()
        l3_18_1_1_3.reset()
        l3_18_1_1_4.reset()
        l3_18_1_1_5.reset()
        l3_18_1_1_6.reset()
        l3_18_1_1_7.reset()
        l3_18_1_1_8.reset()
        l3_18_1_1_9.reset()
        l3_18_1_1_10.reset()
        l3_18_1_1_11.reset()
        l3_18_1_1_12.reset()
        l3_18_1_1_13.reset()
        l3_18_1_1_14.reset()
        l3_18_1_1_15.reset()
        l3_18_1_1_16.reset()
        l3_18_1_1_17.reset()
        l3_18_1_1_18.reset()
        l3_18_1_1_19.reset()
        l3_18_1_1_20.reset()
        l3_19_1.reset()
        l3_19_2.reset()
        l3_19_3.reset()
        l3_19_4.reset()
        l3_20_3.reset()
        l3_26_1.reset()
        l3_26_2.reset()
        l3_26_3.reset()
        l3_26_4.reset()
        l3_26_5.reset()
        l3_26_6.reset()
        l3_26_7.reset()
    }

    Ground{
        id:l3_1
        widthSize:5
        heightSize:2
        column:1
        row:heightSize
    }
    Ground{
        id:l3_2
        widthSize:5
        heightSize:2
        column:l3_1.widthSize
        row:heightSize
    }
    Ground{
        id:l3_3
        widthSize:5
        heightSize:2
        column:l3_2.column+l3_2.widthSize
        row:heightSize
    }
    Spikerock{
        id:l3_4
        widthSize:40
        heightSize:1
        column:l3_3.column+l3_3.widthSize
        row:heightSize
    }
    Platform{
        id:l3_5
        column:l3_3.column+l3_3.widthSize+3
        row:6
    }
    Wheel{
        id:l3_55
        column:l3_3.column+l3_3.widthSize+5
        row: 8
    }
    Platform{
        id:l3_6
        column:l3_3.column+l3_3.widthSize+8
        row:9
    }
    Wheel{
        id:l3_66
        column:l3_3.column+l3_3.widthSize+10
        row: 11
    }

    Platform{
        id:l3_7
        column:l3_3.column+l3_3.widthSize+13
        row:12
    }
    Mushroom{
        id:l3_77
        column:l3_3.column+l3_3.widthSize+14
        row:14
    }

    Platform{
        id:l3_8
        column:l3_3.column+l3_3.widthSize+21
        row:9
    }
    Wheel{
        id:l3_88
        column:l3_3.column+l3_3.widthSize+21
        row: 11
    }

    Platform{
        id:l3_9
        column:l3_3.column+l3_3.widthSize+29
        row:6
    }
    Wheel{
        id:l3_99
        column:l3_3.column+l3_3.widthSize+29
        row: 8
    }
    Ground{
        id:l3_10
        widthSize:50
        heightSize:2
        column:l3_4.column+l3_4.widthSize
        row:heightSize
    }
    Magic{
        id:l3_10_2
        column:l3_10.column+l3_10.widthSize/2
        row:10
    }
    Golden{
        id:l3_10_1
        column:l3_10.column+l3_10.widthSize/2
        row:10
    }
    Scorpion{
        id:l3_11
        column: l3_10.column+l3_10.widthSize/3
        row:10
    }
    Scorpion{
        id:l3_12
        column: l3_10.column+l3_10.widthSize/3*2
        row:10
    }
    Coin{
        id:l3_13
        column: l3_10.column+l3_10.widthSize/3*2
        row:11
    }
    Coin{
        id:l3_13_1
        column: l3_10.column+l3_10.widthSize/3*2+2
        row:11
    }
    Coin{
        id:l3_13_2
        column: l3_10.column+l3_10.widthSize/3*2+6
        row:11
    }
    Coin{
        id:l3_13_3
        column: l3_10.column+l3_10.widthSize/3*2+8
        row:11
    }
    Coin{
        id:l3_14
        column: l3_10.column+5
        row:11
    }
    Coin{
        id:l3_14_1
        column: l3_10.column+7
        row:11
    }
    Coin{
        id:l3_14_2
        column: l3_10.column+9
        row:11
    }
    Coin{
        id:l3_14_3
        column: l3_10.column+11
        row:11
    }
    Water{
        id:l3_17
        widthSize: 33
        heightSize: 1
        column:l3_10.column+l3_10.widthSize
        row:heightSize
    }
    Trampoline{
        id:l3_15
        column:l3_10.column+l3_10.widthSize - 2
        row:3
    }
    Diamond{
        id:l3_15_1
        column:l3_10.column+l3_10.widthSize - 8
        row:18
    }


    Platform{
        id:l3_16
        widthSize: 6
        column:l3_10.column+l3_10.widthSize + 3
        row:10 + 2
    }
//    Platform{
////        id:l3_16
//        widthSize: 6
//        column:l3_10.column+l3_10.widthSize + 3
//        row:2
//    }
    Wheel{
        id:l3_16_2
        column: l3_10.column+l3_10.widthSize + 4
        row: 20
    }
    Wheel{
        id:l3_16_3
        column: l3_10.column+l3_10.widthSize + 7
        row: 20
    }
    Wheel{
        id:l3_16_4
        column: l3_10.column+l3_10.widthSize + 11
        row: 20
    }
    Coin{
        id:l3_14_13
        column: l3_10.column+l3_10.widthSize +14
        row:22
    }
    Coin{
        id:l3_14_12
        column: l3_10.column+l3_10.widthSize +15
        row:22
    }
    Coin{
        id:l3_14_14
        column: l3_10.column+l3_10.widthSize +16
        row:22
    }

    Wheel{
        id:l3_16_7
        column: l3_10.column+l3_10.widthSize + 19
        row: 20
    }
    Wheel{
        id:l3_16_8
        column: l3_10.column+l3_10.widthSize + 22
        row: 20
    }
    Wheel{
        id:l3_16_9
        column: l3_10.column+l3_10.widthSize + 25
        row: 20
    }

    Snail{
        id:l3_16_1
        column: l3_10.column+l3_10.widthSize + 22
        row: 20
    }
    Scorpion{
        id:l3_16_10
        column: l3_10.column+l3_10.widthSize + 22
        row: 20
    }
    Bear{
        id:l3_16_11
        column: l3_10.column+l3_10.widthSize + 5
        row: 20
    }



    Ground{
        id:l3_18
        widthSize: 5
        heightSize: 8
        column:l3_17.column+l3_17.widthSize
        row:heightSize
    }
    Water{
        id:l3_18_1
        widthSize: 8
        heightSize: 2
        column: l3_18.column+l3_18.widthSize
        row:2
    }
    Wheel{
        id:l3_18_1_1
        column: l3_18.column+l3_18.widthSize +0
        row: 7
    }
    Wheel{
        id:l3_18_1_2
        column: l3_18.column+l3_18.widthSize +1.5
        row: 8
    }
    Wheel{
        id:l3_18_1_3
        column: l3_18.column+l3_18.widthSize +3
        row: 9
    }
    Wheel{
        id:l3_18_1_4
        column: l3_18.column+l3_18.widthSize+ 4.5
        row: 8
    }
    Wheel{
        id:l3_18_1_5
        column: l3_18.column+l3_18.widthSize +6
        row: 7
    }
    Coin{
        id:l3_18_1_1_1
        column: l3_18.column+l3_18.widthSize +0
        row:14
    }
    Coin{
        id:l3_18_1_1_2
        column: l3_18.column+l3_18.widthSize +1.5
        row:15
    }
    Coin{
        id:l3_18_1_1_3
        column: l3_18.column+l3_18.widthSize +3
        row:16
    }
    Coin{
        id:l3_18_1_1_4
        column: l3_18.column+l3_18.widthSize+ 4.5
        row:15
    }
    Coin{
        id:l3_18_1_1_5
        column: l3_18.column+l3_18.widthSize +6
        row:14
    }

    Ground{
        id:l3_18_2
        widthSize: 4
        heightSize: 8
        column:l3_18_1.column+l3_18_1.widthSize
        row:heightSize
    }
    Water{
        id:l3_18_3
        widthSize: 8
        heightSize: 2
        column: l3_18_2.column+l3_18_2.widthSize
        row:2
    }
    Wheel{
        id:l3_18_1_6
        column: l3_18_2.column+l3_18_2.widthSize +0
        row: 7
    }
    Wheel{
        id:l3_18_1_7
        column: l3_18_2.column+l3_18_2.widthSize +1.5
        row: 8
    }
    Wheel{
        id:l3_18_1_8
        column: l3_18_2.column+l3_18_2.widthSize +3
        row: 9
    }
    Wheel{
        id:l3_18_1_9
        column: l3_18_2.column+l3_18_2.widthSize+ 4.5
        row: 8
    }
    Wheel{
        id:l3_18_1_0
        column: l3_18_2.column+l3_18_2.widthSize +6
        row: 7
    }
    Coin{
        id:l3_18_1_1_6
        column: l3_18_2.column+l3_18_2.widthSize +0
        row:14
    }
    Coin{
        id:l3_18_1_1_7
        column: l3_18_2.column+l3_18_2.widthSize +1.5
        row:15
    }
    Coin{
        id:l3_18_1_1_8
        column: l3_18_2.column+l3_18_2.widthSize +3
        row:16
    }
    Coin{
        id:l3_18_1_1_9
        column: l3_18_2.column+l3_18_2.widthSize+ 4.5
        row:15
    }
    Coin{
        id:l3_18_1_1_10
        column: l3_18_2.column+l3_18_2.widthSize +6
        row:14
    }

    Ground{
        id:l3_18_4
        widthSize: 3
        heightSize: 8
        column:l3_18_3.column+l3_18_3.widthSize
        row:heightSize
    }
    Water{
        id:l3_18_5
        widthSize: 8
        heightSize: 2
        column: l3_18_4.column+l3_18_4.widthSize
        row:2
    }
    Wheel{
        id:l3_18_1_11
        column: l3_18_4.column+l3_18_4.widthSize +0
        row: 7
    }
    Wheel{
        id:l3_18_1_12
        column: l3_18_4.column+l3_18_4.widthSize +1.5
        row: 8
    }
    Wheel{
        id:l3_18_1_13
        column: l3_18_4.column+l3_18_4.widthSize +3
        row: 9
    }
    Wheel{
        id:l3_18_1_14
        column: l3_18_4.column+l3_18_4.widthSize+ 4.5
        row: 8
    }
    Wheel{
        id:l3_18_1_15
        column: l3_18_4.column+l3_18_4.widthSize +6
        row: 7
    }
    Coin{
        id:l3_18_1_1_11
        column: l3_18_4.column+l3_18_4.widthSize +0
        row:14
    }
    Coin{
        id:l3_18_1_1_12
        column: l3_18_4.column+l3_18_4.widthSize +1.5
        row:15
    }
    Coin{
        id:l3_18_1_1_13
        column: l3_18_4.column+l3_18_4.widthSize +3
        row:16
    }
    Coin{
        id:l3_18_1_1_14
        column: l3_18_4.column+l3_18_4.widthSize+ 4.5
        row:15
    }
    Coin{
        id:l3_18_1_1_15
        column: l3_18_4.column+l3_18_4.widthSize +6
        row:14
    }

    Ground{
        id:l3_18_6
        widthSize: 2
        heightSize: 8
        column:l3_18_5.column+l3_18_5.widthSize
        row:heightSize
    }
    Water{
        id:l3_18_7
        widthSize: 8
        heightSize: 2
        column: l3_18_6.column+l3_18_6.widthSize
        row:2
    }
    Wheel{
        id:l3_18_1_16
        column: l3_18_6.column+l3_18_6.widthSize +0
        row: 7
    }
    Wheel{
        id:l3_18_1_17
        column: l3_18_6.column+l3_18_6.widthSize +1.5
        row: 8
    }
    Wheel{
        id:l3_18_1_18
        column: l3_18_6.column+l3_18_6.widthSize +3
        row: 9
    }
    Wheel{
        id:l3_18_1_19
        column: l3_18_6.column+l3_18_6.widthSize+ 4.5
        row: 8
    }
    Wheel{
        id:l3_18_1_20
        column: l3_18_6.column+l3_18_6.widthSize +6
        row: 7
    }
    Coin{
        id:l3_18_1_1_16
        column: l3_18_6.column+l3_18_6.widthSize +0
        row:14
    }
    Coin{
        id:l3_18_1_1_17
        column: l3_18_6.column+l3_18_6.widthSize +1.5
        row:15
    }
    Diamond{
        id:l3_18_1_1_18
        column: l3_18_6.column+l3_18_6.widthSize +3
        row: 16
    }
    Coin{
        id:l3_18_1_1_19
        column: l3_18_6.column+l3_18_6.widthSize+ 5
        row:15
    }
    Coin{
        id:l3_18_1_1_20
        column: l3_18_6.column+l3_18_6.widthSize +6.5
        row:14
    }

    Ground{
        id:l3_18_8
        widthSize: 1
        heightSize: 8
        column:l3_18_7.column+l3_18_7.widthSize
        row:heightSize
    }
    Water{
        id:l3_18_9
        widthSize: 8
        heightSize: 2
        column: l3_18_8.column+l3_18_8.widthSize
        row:heightSize
    }

    Ground{
        id:l3_19
        widthSize: 20
        heightSize: 2
        column: l3_18_9.column+l3_18_9.widthSize
        row:heightSize
    }
    Wheel{
        id:l3_18_1_21
        column: l3_18_8.column+l3_18_8.widthSize +2
        row: 8
    }
    Wheel{
        id:l3_18_1_22
        column: l3_18_8.column+l3_18_8.widthSize +4.5
        row: 6.5
    }
    Wheel{
        id:l3_18_1_23
        column: l3_18_8.column+l3_18_8.widthSize +6
        row: 4
    }

    Snail{
        id: l3_19_1
        column: l3_19.column+l3_19.widthSize
        row:5
    }
    Bat{
        id: l3_19_2
        column: l3_18_9.column+l3_18_9.widthSize+3
        row:7
    }
    Bat{
        id: l3_19_3
        column: l3_18_9.column+l3_18_9.widthSize+6
        row:7
    }
    Bat{
        id: l3_19_4
        column: l3_18_9.column+l3_18_9.widthSize+9
        row:7
    }

    Ground{
        id:l3_20
        widthSize: 4
        heightSize: 4
        column: l3_19.column+l3_19.widthSize
        row:heightSize
    }
    Ground{
        id:l3_21
        widthSize: 4
        heightSize: 6
        column: l3_20.column+l3_20.widthSize
        row:heightSize
    }
    Ground{
        id:l3_22
        widthSize: 4
        heightSize: 8
        column: l3_21.column+l3_21.widthSize
        row:heightSize
    }
    Ground{
        id:l3_23
        widthSize: 4
        heightSize: 6
        column: l3_22.column+l3_22.widthSize
        row:heightSize
    }
    Ground{
        id:l3_24
        widthSize: 4
        heightSize: 4
        column: l3_23.column+l3_23.widthSize
        row:heightSize
    }

    Wheel{
        id:l3_20_1
        column: l3_19.column+l3_19.widthSize+0.1
        row:6
    }
    Wheel{
        id:l3_20_2
        column: l3_20.column+l3_20.widthSize+0.1
        row:8
    }
    Diamond{
        id:l3_20_3
        column: l3_21.column+l3_21.widthSize+1
        row:10
    }

    Wheel{
        id:l3_20_4
        column: l3_22.column+l3_22.widthSize+2
        row:8
    }
    Wheel{
        id:l3_20_5
        column: l3_23.column+l3_23.widthSize+2
        row:6
    }
    Ground{
        id:l3_25
        widthSize: 20
        heightSize: 2
        column: l3_24.column+l3_24.widthSize
        row:heightSize
    }
    Trampoline{
        id:l3_25_1
        column: l3_25.column+l3_25.widthSize-10
        row:3
    }
    Trampoline{
        id:l3_25_2
        column: l3_25.column+l3_25.widthSize-6
        row:3
    }
    Trampoline{
        id:l3_25_3
        column: l3_25.column+l3_25.widthSize-2
        row:3
    }
    Wheel{
        id:l3_25_4
        column: l3_25.column+l3_25.widthSize-12
        row:15
    }
    Wheel{
        id:l3_25_5
        column: l3_25.column+l3_25.widthSize-10
        row:15
    }
    Wheel{
        id:l3_25_6
        column: l3_25.column+l3_25.widthSize-8
        row:15
    }
    Wheel{
        id:l3_25_7
        column: l3_25.column+l3_25.widthSize-6
        row:15
    }
    Wheel{
        id:l3_25_8
        column: l3_25.column+l3_25.widthSize-4
        row:15
    }
    Wheel{
        id:l3_25_9
        column: l3_25.column+l3_25.widthSize-2
        row:15
    }
    Wheel{
        id:l3_25_10
        column: l3_25.column+l3_25.widthSize
        row:15
    }


    Ground{
        id:l3_26
        widthSize: 30
        heightSize: 2
        column: l3_25.column+l3_25.widthSize
        row:heightSize
    }
    Snail{
        id:l3_26_1
        column: l3_24.column+l3_24.widthSize+10
        row: 5
    }
    Scorpion{
        id:l3_26_6
        column: l3_24.column+l3_24.widthSize+20
        row:7
    }
    Bear{
        id:l3_26_2
        column:  l3_24.column+l3_24.widthSize+5
        row: 5
    }
    Bear{
        id:l3_26_7
        column:  l3_24.column+l3_24.widthSize+15
        row: 5
    }
    Bat{
        id:l3_26_3
        column: l3_24.column+l3_24.widthSize +9
        row:7
    }
    Bat{
        id:l3_26_4
        column: l3_24.column+l3_24.widthSize+2 + 9
        row:7
    }
    Bat{
        id:l3_26_5
        column: l3_24.column+l3_24.widthSize+4 + 9
        row:7
    }
    Home{
        id:l3_27
        column: l3_26.column+l3_26.widthSize-10
        row:6-0.2
    }
}

