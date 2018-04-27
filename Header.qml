import QtQuick 2.0

// don't worry about the sizes - let the parent do that - you just anchor.

// I WANT TO DO A RELATIVE SPLIT... HOW?
// surely that's easy...
//  let's say I want to split it based on quarters
//  the left bit is 1 long, the middle bit is 2 long and the right bit is 1 long
// the left starts at 0 and finishes at width*1/4 (or is width*1/4 long)
// the middle starts at width*1/4 and finishes at width*3/4
// the last bit goes from 3/4 to 4/4
//  constant propogation FTW
// height is the same all the way along

// might want a HeaderView mate -

Item {
//    id: header
    // anc.bm - shortcut
    //anchors.bottomMargin: parent.height - 40
    // bottom bit of screen is the footer (how do you abstract this e.g.
    // make a default layout and then add whatever you like to it?
    // ugly! just a ruler line would be fine
    //color:"#00ffff"
    // how much 'weight' do you want at the bottom? (20% would mean 0.2

    function setScore(score, out_of) {
        text_score.text = score + '/' + out_of
    }

    // simples - sort of - first thing is a back button

    // now i have a good use for a row layout
    //  what i want though is the wrap that info in some kinda HeaderItem and
    Row {
        id: header_row
        anchors.fill: parent
        // todo:make border look good
        anchors.bottomMargin: 6

        Image {
            source:'qrc:/images/key_bs.png'
            width: parent.height
            height: parent.height
        }

        Image {
            id: picked_pic
            source:'qrc:/images/key_blank.png'
            width: parent.height
            height: parent.height
        }

        Rectangle {
            // strings ARE hell - they need special storage - they really do.
            id: picked_nick        // id = left... but I is magic... would be :Rectangle:left:[list of stuff in here] UNLESS it's truly primitive like true/false/5/-3.141592653
            // X13 - would be better as parent.dims * vec2(0.25, 1) OR dims = mul[../dims, vec2:[0.25 1]]
            width: parent.width * 0.25 * 2
            height: parent.height
            color: Qt.rgba(0.8, 0.8, 1, 0.5)
            Text {
                anchors.fill: parent
                text: 'Charlie'
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: height * 0.5
            }
        }
        // this won't be rectangles at all - they will be further sub components
        Rectangle {
            // strings ARE hell - they need special storage - they really do.
            id: left        // id = left... but I is magic... would be :Rectangle:left:[list of stuff in here] UNLESS it's truly primitive like true/false/5/-3.141592653
            // X13 - would be better as parent.dims * vec2(0.25, 1) OR dims = mul[../dims, vec2:[0.25 1]]
            width: parent.width * 0.25
            height: parent.height
            color: Qt.rgba(0.8, 0.8, 1, 0.5)
            //opacity: 0.5
            Text {
                anchors.fill: parent
                text: Qt.formatDateTime(new Date(), 'yyyy-MM-dd')
                //text: Date().toString('yyyy-MM-dd')
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.pixelSize: height * 0.5
            }
        }
        Rectangle {
            // strings ARE hell - they need special storage - they really do.
            id: right        // id = left... but I is magic... would be :Rectangle:left:[list of stuff in here] UNLESS it's truly primitive like true/false/5/-3.141592653
            // X13 - would be better as parent.dims * vec2(0.25, 1) OR dims = mul[../dims, vec2:[0.25 1]]
            width: parent.width * 0.25
            height: parent.height
            color: Qt.rgba(0.8, 0.8, 1, 0.5)
            Text {
                id: text_score
                anchors.fill: parent
                text: '0/10'
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: height * 0.5
            }
        }
    }

    Image {
        anchors.fill: parent
        anchors.topMargin: parent.height - 6
        source: 'qrc:/images/horizontal_break.png'
    }

//    Rectangle {
//        anchors.fill: parent
//        anchors.topMargin: parent.height - 1
//        color: '#000000'
//    }


    /*
    //        Image {
    //            source:"qrc:/images/Lenna.png"
    //        }
    Row {
        id: row
        anchors.fill: parent
        Text {
            id:time
            width:100
            text:"Time goes here"
            // needs to have
            // no, this just doesn't go here. it goes WAY the **** further up the code
            Timer {
                id: timer
                property real startTime: 0
                interval: 10
                running: true
                repeat: true
                function lap() {
                    startTime = Date.now();
                    time.text = "0";
                    restart();
                }
                onTriggered: {
                    //                        if (startTime === 0) {
                    //                            startTime = Date.now();//.getTime()
                    //                        } else
                    // now it gets gnarly - the actual output type is.... WHAT?
                    // seconds.milliseconds
                    //
                    var delta = Date.now() - startTime
                    time.text = String(Math.floor(delta / 1000)) + '.' + String("000" + delta % 1000).slice(-3);
                    //Date.now() - startTime;//Date().getTime() - startTime;
                    //                        }
                }
            }
        }
        Text {
            width: header.width - 100
            text: "Up here goes the score, the clock and the child's name"
            font.pixelSize: (header.height * 0.5)
        }
    }
    */
}
