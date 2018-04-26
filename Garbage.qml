import QtQuick 2.10
import QtQuick.Controls 2.2
import QtMultimedia 5.9

Item {





    // you want an array of these and an "active" one too.
    Row {
        Text {
            id: a
            text: '99'
            //validator:    // no need
        }
        Text {
            id: op
            text: '+'
            //validator:    // no need
        }
        Text {
            id: b
            text: '99'
            //validator:    // no need
        }
        Text {
            id: eq
            text: '='
            //validator:    // no need
        }
        Text {
            id: ans
            text: ''
            //validator:    // no need
        }

    }

    ListView {
        flickableDirection: Flickable.HorizontalAndVerticalFlick

        id: listView
        anchors.fill: parent
        clip: true
        model:100

        // this is one way to create a grid.
        delegate: Column {
            id: delegate
            property int row: index
            Row {
                spacing: 1
                Repeater {
                    model: sums
                    ItemDelegate {
                        property int column: index
                        //text: qsTr("%1x%2").arg(delegate.row).arg(column)
                        // ok, not bad
//                                text sums.get()
                        text:modelData
                        //width: listView.headerItem.itemAt(column).width
                    }
                }
            }
            Rectangle {
                color: "silver"
                width: parent.width
                height: 1
            }
        }
        //                model: sums
    }

// set anchors.margins is you want

    // shame this doesn't work TBH
    //  you have to use Component.onCompleted - *meh*
    //            Repeater {
    //                //model: new Array(10)
    //                model: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    //                ListElement {
    //                    a : Math.random()
    //                    b : Math.random()
    //                    q : 'a + b'   // does this actually work?
    //                }
    //            }

    RoundButton {
        id: butt
        x:100
        y:200
        text: 'not yet'
        radius: 100
        width:100
        height:width
        SequentialAnimation {
            id:rbanim
            // give it an ID if you need to change things
            //  realistically it should also be touchable
            running: true
            loops: Animation.Infinite
            // looks like **** - want easing...
            // anchor this inside an item - with a margin - then pump the margin
            NumberAnimation { target: butt; property: "width"; from: 90; to: 110; duration: 500; easing.type: Easing.OutElastic }
            NumberAnimation { target: butt; property: "width"; from: 110; to: 90; duration: 500 }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { rbanim.start(); console.log("BLERUGH") }
        }

        // put clicked here
    }

    Item {
        id: b2
        x:400
        y:200
        width:100
        height:width
        Button {
            id: in_b2
            anchors.fill: parent
            anchors.margins: 25
            text: "BUTT"
            background: Rectangle {
                anchors.fill: parent
                color: "#808080"
            }
        }
        SequentialAnimation {
            id:b2anim
            // give it an ID if you need to change things
            //  realistically it should also be touchable
            running: true
            loops: Animation.Infinite
            // looks like **** - want easing...
            // anchor this inside an item - with a margin - then pump the margin
            // surely I don't need both of these.
            NumberAnimation { target: in_b2; property: "anchors.margins"; from: 0; to: 10; duration: 500; easing.type: Easing.OutElastic }
            NumberAnimation { target: in_b2; property: "anchors.margins"; from: 10; to: 0; duration: 500 }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: { b2anim.start(); console.log("BLERUGH") }
        }

        // put clicked here
    }

    /*

Repeater {
    id: rep
    model: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110]

    delegate: Button {
        height: 100
//            radius:100
//            palette: "red"
        background: Rectangle {
            width:100
            height:100
//                implicitWidth: 100
//                implicitHeight: 40
//                opacity: enabled ? 1 : 0.3
//                border.color: control.down ? "#17a81a" : "#21be2b"
            border.width: 1
            radius: 100
        }
        anchors.bottom: parent.verticalCenter
        anchors.left: parent.horizontalCenter
        transformOrigin: Item.Bottom
        rotation: 360 / rep.model.length * index
        Text {
            text: modelData
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: -parent.rotation // If you want to have them upright
        }
    }
}
*/



    // I'd happily just have a List mate. Why are these compositions missing? Arrays are god
    //List
    // I've got friggin hundreds of these.
    // Repeat won't work. dynamic c reation? evil
    MediaPlayer {
        id: key0
        source: "qrc:/sounds/key0.mp3"
    }
    MediaPlayer {
        id: key1
        source: "qrc:/sounds/key1.mp3"
    }
    MediaPlayer {
        id: key2
        source: "qrc:/sounds/key2.mp3"
    }
    MediaPlayer {
        id: key3
        source: "qrc:/sounds/key3.mp3"
    }
    MediaPlayer {
        id: key4
        source: "qrc:/sounds/key4.mp3"
    }

}
