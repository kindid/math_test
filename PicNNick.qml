import QtQuick 2.0
// lauyouts is like an infection...
import QtQuick.Layouts 1.3
// it's a layout item.


// the picture is 1:1 aspect ratio (has to be)
// therefore the height is equal to the width
// the width of the text below is X. therefore
// the total height is X. But that is up to it.

// It is decided that the name underneath will be
// 1/8th of the total height.

// therefore the total height is X + X/8 for 256
// this means 256 + 32 = 288

// property alias can map to children of further "value type" property aliases do work - this is neat
Item {
    property alias pic: image.source
    property alias nick: text.text
    signal click(string child)
//    anchors.fill: parent
//    anchors.rightMargin: parent.width / 2
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.minimumWidth: 64
    Layout.minimumHeight: 64
    Layout.preferredWidth: 256  // these can be fractions of the parent width/height. neat.
    Layout.maximumWidth: 512
    Layout.maximumHeight: 576

    id: cell1
    Image {
        id:image
        // i want this to be a box
        anchors.fill: parent
        //
        anchors.bottomMargin: parent.height / 9
        fillMode: Image.PreserveAspectFit
        source: 'qrc:/images/charlie.jpg'
    }
    Text {              // text=Text would be nicer(and shorter)
        id:text
        anchors.fill: parent
        anchors.topMargin: (parent.height / 9) * 8
        text: "Charlie"
        font.pixelSize: height * 0.5
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log('bah')
            //clicked('nick') // function does not exist. explode
            // calls itself OVER AND OVER again!
            click(nick)
        }
//            clicked('nick')   // double neat
//        }
    }
}
