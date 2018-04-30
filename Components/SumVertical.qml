
import QtQuick 2.0

// componentise this
//ReadOut

// this needs to be "quite big" about a 10th of the display i'd guess
Item {
    // on iPad 1:2 split is not square it goes 4:3 to 2:3. You can put it in a box
    // by adding a border. 2:3 - you get 2:2 and the remaining 1:3 is split
    // 1:6 top and bottom.
    anchors.fill: parent
    id: read_out
    Rectangle {
        anchors.fill: parent
        radius: 10
        color: Qt.rgba(1.0, 1.0, 0.0, 0.5)
    }

    // user answer could be complete ****
    function setSum(new_top, new_bottom, user_answer) {
        top.text = new_top
        bottom.text = new_bottom
        answer.text = user_answer
    }

    function setAnswer(text) {
        answer.text = text
    }

    // like "nano-cell" - must be a good way to refactor this
    // in many ways the QML guys are right. You DO need this kind of
    // grammar - it is still possible visually (in all sorts of ways and combos)
    // but just seems easier this way - the amount of "coding" you'll end up
    // needing for a responsive app is staggering

    // numbers are annoying. NO UK DIGITS EXTEND BELOW
    // THE BASE LINE SO CENTERING THEM LOOKS REALLY BAD
    //  The only solution is to hack - probably add margins to this or something

    // this is the "vertical question"

    // it's a grid I guess. I mean, it really could be
    // right down to the numbers - which means it COULD
    // line up with the grid paper(!)

    Column {
        anchors.fill: parent
        Text {
            id: top
            //baselineOffset: 100 //interesting
            //anchors.fill: parent
            width:parent.width
            height:parent.height / 3
//            anchors.topMargin: this.height / 8
            text: ""
            font.pixelSize: this.height
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
        }
        Item {
            height:parent.height / 3
            width:parent.width
            Text {
                id: bottom
                //baselineOffset: 100 //interesting
                width:parent.width
                height:parent.height
//                anchors.fill: parent
    //            anchors.topMargin: this.height / 8
                text: ""
                font.pixelSize: this.height
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                id: op
                //baselineOffset: 100 //interesting
                width:parent.width
                height:parent.height
//                anchors.fill: parent
    //            anchors.topMargin: this.height / 8
                text: '+'
                font.pixelSize: this.height
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }
        Item {
            height:parent.height / 3
            width:parent.width
            Text {
                id: answer
                width:parent.width
                height:parent.height

                //baselineOffset: 100 //interesting
                //anchors.fill: parent
    //            anchors.topMargin: this.height / 8
                text: ""
                font.pixelSize: this.height
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }
            Text {
                //baselineOffset: 100 //interesting
                width:parent.width
                height:parent.height
//                anchors.fill: parent
    //            anchors.topMargin: this.height / 8
                text: '='
                font.pixelSize: this.height
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
