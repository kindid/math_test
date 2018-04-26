import QtQuick 2.0
import QtQuick.Controls 2.2
import QtMultimedia 5.9

Rectangle {
    property alias source: image.source
    property alias text: text_id.text
    property alias color: rect.color
    property string key_name
    signal clicky(string q_key_name)
    color: 'transparent'
    MediaPlayer {
        id:clack
        source: "qrc:/sounds/key0.mp3"
    }
    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.margins: 6
        //color: Qt.rgba(1,1,1,0.5)
        //color: 'transparent'
        Behavior on anchors.margins {
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 40 }// seriosuly... only milliseconds? that's ****
        }
//        visible:false
    }

    Image {
        id: image
        anchors.fill: parent
        //visible: false
        Behavior on anchors.margins {
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 40 }// seriosuly... only milliseconds? that's ****
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
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 40 }// seriosuly... only milliseconds? that's ****
        }
        Behavior on anchors.margins {
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 40 }// seriosuly... only milliseconds? that's ****
        }
    }

    // ok, all the things that need wrapping up - put them in a single item
    // and change the margins
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            clack.seek(0)
            clack.play()
            image.anchors.margins = 4
            text_id.anchors.margins = 4
            rect.anchors.margins = 10
            //text_id.scale = 0.95
            //button.background.color = "#ff0000"
        }
        onReleased: {
            clicky(key_name)
            image.anchors.margins = 0
            text_id.anchors.margins = 0
            rect.anchors.margins = 6
        }
    }
}
/*

Rectangle {
    property alias text: button.text;
    // can't get this to work.
    signal clicky()
    id: root


    Button {
        id: button
        anchors.fill: parent

        contentItem: Text {
            text: button.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 30
        }

        background: Rectangle {
            color: "#a0a0a0"
            border.width: 2
            border.color: "#ffffff"
            radius: 5
        }

        MediaPlayer {
            id:clack
            source: "qrc:/sounds/key0.mp3"
        }

        Behavior on anchors.margins {
            //  about 0.06 seconds. about 4 frames
            NumberAnimation { duration: 60 }// seriosuly... only milliseconds? that's ****
        }

        onPressed: {
            // i've got 'index' but how do i just look up the mediaplayer thing?
            // this is well hacky
            clack.source = "qrc:/sounds/key" + index + ".mp3";
           // console.log('playing ' + "qrc:/sounds/key" + index + ".mp3")
            clack.seek(0)
            clack.play()
            root.clicky()
            // emit a signal?
//            ans.text = ans.text + text

            button.anchors.margins = 3
        }
        onReleased: {
            // needs to be "active something"
            //  you can click on a sum to make it active
            //ans.text = ans.text + text
            button.anchors.margins = 0
        }

//        MouseArea {
//            anchors.fill: parent
//            hoverEnabled: true
//            onEntered: {
//                button.anchors.margins = 10
//                //button.background.color = "#ff0000"
//            }
//        }

// bogus
//////        text: modelData;
    }
}
    */
