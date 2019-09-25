import Felgo 3.0
import QtQuick 2.0

import "../entities"

Item {
    id: testlevel

    Ground{
        widthSize: 10
        heightSize:5
        column:0
        row:5
    }
    Spikerock{
        widthSize: 3
        heightSize:2
        column:10
        row:2
    }
    Ground{
        widthSize: 4
        heightSize: 4
        column: 13
        row:4
    }

    Water{
        widthSize: 3
        heightSize:2
        column:17
        row:2
    }
    Ground{
        widthSize: 50
        heightSize: 5
        column: 20
        row:5
    }

    Platform{
        widthSize: 2
        column: 10
        row: 10
    }
    Coin{
        column: 12
        row:18
    }
    Mushroom{
        column: 14
        row:18
    }
    Diamond{
        column: 16
        row:18
    }
    Magic{
        column: 22
        row:12
    }

    Golden{
        column: 22
        row:12
    }


    Bat{
        column: 30
        row:10
    }
    Snail{
        column: 35
        row:10
    }
    Scorpion{
        column: 40
        row:10
    }
    Bear{
        column: 45
        row:10
    }
    Wheel{
        column: 13
        row:6
    }
    Wheel{
        column: 15
        row:6
    }
    Trampoline{
        column: 21
        row:6
    }
    Home{
        column: 50
        row:8.5
    }
}
