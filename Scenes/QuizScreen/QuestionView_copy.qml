import QtQuick 2.0

// rename QuestionView
// make row in row - left row is question, right row is the tick or cross
//  if you further sub rows dividing the question that's fine
//   ideally they'd be centered, maybe on the operator
// each has a state
//  initial (obscured, not answered)
//  clicked (visible, not answered)
//  right (visible, answered right)
//  wrong (visible, answer wrong)
// there's also a 'selected/not selected' option
//  you can't be selected and initial - this would move you to
//   state clicked
//
// one can't have a 2d state e.g. selected +

// initial, selected, right, wrong, right + selected, wrong + selected
// 6 states?

// graphically - lines are too wide

// guess this should be QuestionView or QuestionItem

// there's no actual description of the model in use here
// there are references to 'a' 'b' 'q' etc
// these are part of a model - there's no "name" for that
// model, I'm not type checking. It's all dynamic - is that
// a problem.

Item {
    id: root
//    anchors.fill: parent
    property int question_index: 0
    signal click(int qi)
//    height: lv_question.height / questions.count
    Image {
        anchors.fill: parent
        anchors.margins: 4
        // could be BorderImage
        source: 'qrc:/images/question_block.png'
        z: 100
    }

    state: view_state
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
                text: view_state === 'unanswered' ? '???' : a
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
                //font.pixelSize: height
            }
            Text {
                height: parent.height
                text: ' ' + op + ' '
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }
            Text {
                height: parent.height
                text: b
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }
            Text {
                height: parent.height
                text: ' = '
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }
            Text {
                height: parent.height
                text: view_state === 'unanswered' ? '???' : q;
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }
            Text {
                height: parent.height
                text: user_q
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }
            // want this one at the right hand end.
            // also, it can be HUGE
            Text {
                id: user_tick
                height: parent.height
                text: '√'
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: row.height * 0.75
            }
        }
    }

    states: [
        State {
            name: 'answered'
//            PropertyChanges { target: butt; color:'#ff0000' }
            PropertyChanges { target: root; rotation: 10 }
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

    // when pressed emit a signal
    MouseArea {
        id: myMouse
        anchors.fill: parent
        onPressed: {
//            butt.color = '#ffffff'
            click(question_index)
            //
//            console.log(root.state)
            anim_select.restart()
//            root.state = root.state === 'current' ? 'not_current' : 'current'
//            console.log(root.state)
//            butt.color = "#0000ff"
        }
    }
}
