import QtQuick 2.0
import '../..'
import '../../Components'

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

    // right align in row (somehow)
    // maybe fuck the row thing and just line it up properly
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
            //text: 'u=' + user_q + ' q=' + q //answered ? ((q == user_q) ? '√' : 'X') : ' ';
            font.pixelSize: height * 0.75
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

    Rectangle {
        id: butt
        anchors.fill: parent
        color: 'transparent'
        Behavior on color { ColorAnimation { duration: 100 } }
        SumHorizontal {
            anchors.fill: parent
            // a is bad as it is ambiguous - the other way of doing this is just cheesy
            // let's try
            text_a: a
            text_b: b
            text_op: op
            text_q: answered ? user_q : ''
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
