import QtQuick 2.0

// slight annoyance with Z here - we're a wrapper
// background first then border

Item {
    id: root
    property int question_index: 0
    signal click(int qi)
//    height: lv_question.height / questions.count

    // this is staggering - view_state is from the model. its bound here are dynamic
    state: view_state

    Rectangle {
        id: background
        anchors.fill: parent
        color: select_state ? Qt.rgba(0.8,0.6,0,0.5) : Qt.rgba(1,1,1,0)//'transparent'
        Behavior on color { ColorAnimation { duration: 100 } }
    }

    // this is the border - fugly
//    Image {
//        anchors.fill: parent
//        anchors.margins: 4
//        // could be BorderImage
//        source: 'qrc:/images/question_block.png'
//        z: 100
//    }

    Item {
        id: mark_background
        x: parent.width - parent.height
        y: 0
        width: parent.height
        height: parent.height
//        Rectangle {
//            anchors.fill: parent
//            color: '#ff00ff'
//        }
        Image {
            anchors.fill: parent
            source: 'qrc:/images/key_circle.png'
        }

        CenTex {
            id: user_tick
            text: answered ? ((q == user_q) ? '√' : 'X') : ' ';
            font.pixelSize: row.height * 0.75
        }
    }

//    Behavior on rotation { NumberAnimation { duration: 1000; easing.type: Easing.InElastic } }

    // do this when state is selected
    NumberAnimation on rotation {
        id: anim_select
        running: false //myMouse.pressed
        from: 3
        to: 0
        easing.type: Easing.OutElastic
        easing.amplitude: 3
    }

    // pointless
    Rectangle {
        id: butt
        anchors.fill: parent
        // NOT final color!!!
        //color: '#008080' //.'transparent' //'"#00ff00"
        //color: '#ffffc0'
        //color: Qt.transparent
        color: 'transparent'
        Behavior on color { ColorAnimation { duration: 100 } }

//        transitions: [
//            Tran]

        //radius: height * 0.25
        anchors.margins: 0
        //width:200
        Row {
            // need a few bumps on this - lining the sums up is weird
            // maybe they should be *meh* -

            // eventually the children should be able to write the program for mulitply.
            // THAT'S the beautiful dynamic system.
            id: row
            height: parent.height
            Text {
                height: parent.height
                text: a
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
                //font.pixelSize: height
            }
            QuestionViewText {
                text: ' ' + op + ' '
            }
            QuestionViewText {
                text: b
            }
            QuestionViewText {
                text: ' = '
            }
            QuestionViewText {
                text: answered ? user_q : ''
            }
/*
            Text {
                height: parent.height
                //text: view_state === 'unanswered' ? '???' : q;
                // duh! put the USER answer in here (live and realtime please)
                //text: view_state === q;
                text: q
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }*/
//            Text {
//                height: parent.height
//                // should mimic real results
//                text: '???'
//                verticalAlignment: Text.AlignVCenter
//                font.pixelSize: row.height * 0.75
//            }
            // want this one at the right hand end.
            // also, it can be HUGE
//            Text {
//                id: user_tick
//                height: parent.height
//                text: '√'
//                verticalAlignment: Text.AlignVCenter
//                font.pixelSize: row.height * 0.75
//            }
        }
    }

    // interlocking states...
    //  current/selected vs not current not selected
    //  also right, wrong, unanswered

    states: [
        State {
            name: 'answered'
//            PropertyChanges { target: butt; color:'#ff0000' }
            PropertyChanges { target: root; rotation: 10 }
//            PropertyChanges { target: background; color: '#0000ff' }
        },
        State {
            name: 'unanswered'
//            PropertyChanges { target: butt; color:'#ffffff' }
            PropertyChanges { target: root; rotation: 0 }
        },
        State {
            name: 'correct'
//            PropertyChanges { target: butt; color:'#ffffff' }
            PropertyChanges { target: root; rotation: 0 }
        },
        State {
            name: 'incorrect'
//            PropertyChanges { target: butt; color:'#ffffff' }
            PropertyChanges { target: root; rotation: 0 }
        }
    ]



    // make an animation and play/stop it

    // alright
//    states: [
//        State {
//            name: 'current'
//            PropertyChanges { target: butt; color:'#ff0000' }
//            PropertyChanges { target: root; rotation: 10 }
//        },
//        State {
//            name: 'not_current'
//            PropertyChanges { target: butt; color:'#ffffff' }
//            PropertyChanges { target: root; rotation: 0 }
//        }
//    ]

    // DO THIS IN THE PARENT DELEGATE - although the animation is nice (could be animated state transition)
    // when pressed emit a signal
    MouseArea {
        id: myMouse
        anchors.fill: parent
        onPressed: {
//            butt.color = '#ffffff'
            click(question_index)
            //
//            console.log(root.state)
            // handle this as a transition please (means using the state in here... urgh...)
            //  that might be fine - sum state is somewhere else
            anim_select.restart()
//            root.state = root.state === 'current' ? 'not_current' : 'current'
//            console.log(root.state)
//            butt.color = "#0000ff"
        }
    }
}
