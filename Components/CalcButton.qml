import QtQuick 2.0
import QtQuick.Controls 2.2
import QtMultimedia 5.9

// make this a rectangle and all shit breaks loose
// I _THINK_ the property alias stops me being able to set the
// colour of the outer rect. this isn't important anyway
Item {
    property alias source: image.source
    property alias text: text_id.text
    property alias color: rect.color
    // todo; add 'disable' state
    property string key_name

    signal clicky(string q_key_name)

//    color: '#0000ff'

    // needs fixing up - there are lot of sounds you see
    // BUG: doesn't work on iOS
    MediaPlayer {
        id:clack
        source: "qrc:/sounds/key0.mp3"
    }
    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.margins: 6
        radius: 3
        //color: '#00ff00'
        Behavior on anchors.margins {
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 40 }
        }
    }
    // what's supposed to be in here!
    Image {
        id: image
        anchors.fill: parent
        Behavior on anchors.margins {
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 40 }
        }
    }
    Text {
        anchors.fill: parent
        id: text_id
        text: 'nothing'
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: height * 0.5
        scale: 1.0
        Behavior on scale {
            NumberAnimation { duration: 40 }
        }
        Behavior on anchors.margins {
            NumberAnimation { duration: 40 }
        }
    }
    // if the button is disabled then don't do any animations
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            console.log('t == [' + text_id.text + ']')
            if (text_id.text !== '') {
                clack.seek(0)
                clack.play()
                image.anchors.margins = 4
                text_id.anchors.margins = 4
                rect.anchors.margins = 10
            }
        }
        onReleased: {
            if (text_id.text !== '') {
                clicky(key_name)
                image.anchors.margins = 0
                text_id.anchors.margins = 0
                rect.anchors.margins = 6
            }
        }
    }
}

