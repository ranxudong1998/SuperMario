import QtQuick 2.0
import Felgo 3.0
Item {
    id: button

    signal clicked
    signal pressed
    signal released

    property string defaultColor: "#99ffffff"
    property string hoverColor: "#66ccffff"
    property alias text: buttonText
    property alias buttonText: buttonText

    Rectangle {
        id: background
        radius: 20
        color: mouseArea.containsMouse ? hoverColor : defaultColor
        anchors.fill: parent
    }

    FontLoader{
        id: font
        source: "../../assets/font/PepitaMT.ttf"
    }

    width: text.width
    height: text.height

    Text {
        id: buttonText
        width: 302
        height: 108
        color: "#fd3939"
        text: "Here Text"
        font.family: font.name
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        font.capitalization: Font.MixedCase
        font.italic: false
        styleColor: "#b2f622"
        font.bold: true
        font.pointSize: 30
        style: Text.Sunken
        font.weight: Font.Bold
        lineHeight: 1.7
        textFormat: Text.AutoText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: background
    }

    MouseArea {
        id: mouseArea
        anchors.fill: background
        hoverEnabled: true

        onPressed: {button.pressed()}
        onReleased:{button.released()}
        onClicked:{button.clicked()}
    }

    onPressed: {
        opacity = 0.5
//        console.log("onPress")
    }

    onReleased: {
        opacity = 1.0
//        console.log("onRelease")
    }
}
