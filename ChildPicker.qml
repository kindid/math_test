import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

// yadda yadda. some kind of model.

Item {
    // row layout is a LOT of properties man
    signal picked()
    // shouldn't be here ; no not at all
    ListModel {
        id: children
        signal ready()
        Component.onCompleted: {
            append({ pic: 'qrc:/images/willow.jpg', nick: 'Willow' })
            append({  pic: 'qrc:/images/charlie.jpg', nick: 'Charlie' })
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
        visible: true
        anchors.fill: parent    // god damn I wish there was a short cut for this
        // not ideal - this unpacks but with don't get the binding goodness of list view etc
        // TODO; look up 'horizontal list view'


        PicNNick {
            id: blah
            pic: 'qrc:/images/willow.jpg'
            nick: 'Willow'
            onClick: {
                header.setPicNNick(pic, nick)
                // now signal this is done
                picked(pic, nick)
                // when clicked this information makes to it the header bar
                // the image needs to move from it's position HERE to the header bar
                // or at least soem decent approximation
                //console.log(nick)

                // this isn't going to work well - i need to get the 2 things to overlap
/*
                // should call main engine i guess - time for a wash!
                //console.log(header.picked_pic)
                console.log(this.x)
                // this has been mucked about by row layout
                console.log(this.y + this.parent.y)
                console.log(this.width)
                console.log(this.height)
                lena.x = this.x
                lena.y = this.y
                // it's square - cheat (a bit)
                lena.width = this.width
                lena.height = this.width
                header.setPicNNick(pic, nick)
                //
                //lena.source = pic
//                header.picked_pic.source = pic
//                header.picked_nicked.text = nick

                // if you get picked fade everything out and show just this one...
                // HOWEVER, that means figuring out the "global" position of this object
                // and then transforming from there to somewhere else (header - sort that
                // out later)
*/
            }
        }
        PicNNick {
            pic: 'qrc:/images/charlie.jpg'
            nick: 'Charlie'
            onClick: {
                console.log(nick)
            }
        }
        /*
        Repeater {
            model: children
            ItemDelegate {
                PicNNick {
                    pic: 'qrc:/images/willow.jpg'
                    nick: 'Willow'
                    // will this work? l vs r value scoping? ARGH
//                    pic: pic
//                    nick: nick
                }

//                property int column: index
                //text: qsTr("%1x%2").arg(delegate.row).arg(column)
                // ok, not bad
//                                text sums.get()
//                text:modelData
                //width: listView.headerItem.itemAt(column).width
            }
        }*/
    }

/*
        PicNNick {
            pic: 'qrc:/images/willow.jpg'
            nick: 'Willow'
        }
        PicNNick {
            pic: 'qrc:/images/charlie.jpg'
            nick: 'Charlie'
        }
    }*/
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

    /*
    Image {
        id: lena
        source: 'qrc:/images/Lenna.png'
        x: 0
        y: 0
        width: 256
        height: 256
    }
    */
}
