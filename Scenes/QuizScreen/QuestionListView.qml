import QtQuick 2.0

/* do i want to use the current highlight handling - there's not much to it... */

Item {
//    anchors.fill: parent      // item doesn't need this... nice
    property alias model: lv_question.model
    property int current_qi: -1
    signal updateMarks(int marks)


    function setCurrent(id) {
        if (current_qi >= 0) {
            questions.get(current_qi).select_state = false
        }
        current_qi = id
//        console.log(model.get(0))
//        console.log(current_qi)
        //console.log(questions.get(current_qi));
        model.get(current_qi).select_state = true

        var current_sum = questions.get(current_qi);
        vertical_sum.setSum(
            current_sum.a,
            current_sum.b,
            current_sum.answered ? current_sum.user_q : '')

        quiz_screen.clear_input();
    }

    function testCurrent() {
        if (model.get(current_qi).user_q == model.get(current_qi).q) {
            return true;
        } else {
            return false;
        }
    }

    function updateCurrentAnswer(text_answer) {
        // err, should this REALL happen here?!
        console.log(text_answer)
        console.log(current_qi)

        if (current_qi >= 0) {
            // no text - mark as unmarked
            if (text_answer === '') {
                model.get(current_qi).answered = false
            } else {
                model.get(current_qi).user_q = parseInt(text_answer)
                model.get(current_qi).answered = true
            }


            // won't work...
//            questions.get(current_qi).q = text_answer
            // why does this work but the above NOT work?
            //model.setProperty(current_qi, 'q', 999);
            // type mismatch - fixed

        }

        // now remark
        var marks = 0
        for (var v = 0; v < model.count; v++) {
            if (model.get(v).answered) {
                if (model.get(v).q == model.get(v).user_q) {
                    marks++
                }
            }
        }
        console.log("in mark == " + marks)
        updateMarks(marks)


//        lv_question.model

//        lv_question.currentIndex
    }

//    property QuestionModel model
    ListView {
        id: lv_question
        anchors.fill: parent

        // works with keyboard - hmm..
        focus: true

//        highlight: Rectangle {
//            color: '#00ff00'
//        }

        // not getting kicked except for keyboard (arse)
        onCurrentItemChanged: {
            console.log(lv_question.currentIndex)
            if (current_qi >= 0) {
                questions.setProperty(current_qi, 'q', 777);
            }
        }

//        highlightMoveDuration: 200

//        model: questions
        delegate: Item {
            width: lv_question.width
            height: lv_question.height / questions.count
            QuestionView {

                anchors.fill: parent

                // call back to parent - let it handle the current selection stuff
//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        lv_question.currentIndex = index
//                    }
//                }
                question_index: index
                // there's multiple handlers going on here.
                onClick: {
                    setCurrent(qi)
/*                    // turn old one off and turn new one on
                    // ALSO - Question shouldn't handle any
                    // of the multiplexing at all.
                    if (current_qi >= 0) {
                        questions.get(current_qi).select_state = false
                    }

                    var current_sum = questions.get(qi);
                    calc_pad.
                    vertical_sum.setSum(
                        current_sum.a,
                        current_sum.b,
                        current_sum.answered ? current_sum.user_q : '')
                    // ****ing A
//                    questions.get(qi).view_state = 'answered'
                    questions.get(qi).select_state = true
                    current_qi = qi */
                }
            }
        }
//        Component.onCompleted: {
//            console.log("BOOM")
//            setCurrent(0)
//        }
    }
}
