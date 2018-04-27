import QtQuick 2.0
import QtQuick.Layouts 1.3

// yadda yadda. some kind of model.

Item {
    // row layout is a LOT of properties man

    // shouldn't be here ; no not at all
    ListModel {
        id: children
        signal ready()
        Component.onCompleted: {
            append({ pic: 'qrc:/images/willow.jpg',
                     nick: 'Willow' })
            append({  pic: 'qrc:/images/charlie.jpg',
                      nick: 'Charlie' })
            // this is a signal - the Complete is load time
            // a - be frugal, b - wait for the event loop sometimes
            //ready() // why
        }
    }



    // probably a row

    // the picture is 1:1 aspect ratio (has to be)
    // therefore the height is equal to the width
    // the width of the text below is X. therefore
    // the total height is X. But that is up to it.

    // now make the whole thing Flickable...
    RowLayout {
        anchors.fill: parent    // god damn I wish there was a short cut for this
        PicNNick {
            pic: 'qrc:/images/willow.jpg'
            nick: 'Willow'
        }
        PicNNick {
            pic: 'qrc:/images/charlie.jpg'
            nick: 'Charlie'
        }
    }
/*        id: layout
        anchors.fill: parent
        spacing: 6

    Item {
        anchors.fill: parent
        anchors.rightMargin: parent.width / 2
        id: cell1
        Image {
            // i want this to be a box
            anchors.fill: parent
            anchors.bottomMargin: 50
            fillMode: Image.PreserveAspectFit
            source: 'qrc:/images/charlie.jpg'
        }
        Text {
            anchors.fill: parent
            anchors.topMargin: parent.height - 50
            text: "Charlie"
            font.pixelSize: height * 0.5
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Item {
        anchors.fill: parent
        anchors.rightMargin: parent.width / 2
        id: cell2
        Image {
            // i want this to be a box
            anchors.fill: parent
            anchors.bottomMargin: 50
            fillMode: Image.PreserveAspectFit
            source: 'qrc:/images/willow.jpg'
        }
        Text {
            anchors.fill: parent
            anchors.topMargin: parent.height - 50
            text: "Willow"
            font.pixelSize: height * 0.5
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
        }
    }
    */
}
