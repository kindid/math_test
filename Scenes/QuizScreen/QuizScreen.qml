import QtQuick 2.0
import '../../Components'
import '../..'

Item {
    id: quiz_screen
    property string cInput: ''
    function clear_input() {
        cInput = ''
    }
    Item {
        property string cInput: ''
        anchors.fill: parent
        QuestionModel {
            id: questions
            onReady: {
                lv_question.setCurrent(0)
            }
        }
        Item {
            id: question_list_view
            anchors.fill: parent
            anchors.rightMargin: parent.width / 2
            QuestionListView {
                id: lv_question
                model: questions
                anchors.fill: parent
                // BUG: header is not defined (because I changed the code!)
                onUpdateMarks: {
                    header.setScore(marks, questions.count)
                }
            }
        }

        Item {        // see the square peg in a rectangular hole problem - it's on doku wiki
            id: vsum_calc_pad
            anchors.fill: parent
            anchors.leftMargin: parent.width / 2

            property int currentNumber: 0
            property string cInput: ''

            SumVertical {
                id: vertical_sum
                anchors.fill: parent
                anchors.bottomMargin: parent.height / 2
            }

            Item {
                anchors.fill: parent
                anchors.topMargin: parent.height / 2

                // move to another Component and have a 'stringChanged' or similar signal
                CalcPad {
                    id: calc_pad
                    width: Math.min(parent.width, parent.height)
                    height: Math.min(parent.width, parent.height)
                    x: (parent.width - Math.min(parent.width, parent.height)) / 2
                    y: (parent.height - Math.min(parent.width, parent.height)) / 2
                    onKey: {
                        if (key === '±') {
                            // even - 0 can be displayed - an empty display is possibly not even 0.
                            // of the display is empty it will display 0
                            // you can't type 0 if the only thing displayed is 0 or -0
                            if (cInput.charAt(0) == '-') {
                                cInput = cInput.substring(1);
                            } else {
                                // check the string has any chars or you'll get 'NaN'
                                // OTOH you should probably remember something or this gets tedious fast
                                if (cInput.length) {
                                    cInput = '-' + cInput
                                }
                            }
                            lv_question.updateCurrentAnswer(cInput)
                        } else if (key === '?') {
                            // mark and move to next answered or wrong question
                            // is it correct? IF CORRECT MOVE TO NEXT QUESTION
                            console.log(lv_question.testCurrent())
                        } else if (key === '»') {
                            // todo - actually check there's something there
                            cInput = cInput.substring(0, cInput.length - 1)
                            lv_question.updateCurrentAnswer(cInput)
                        } else if (key !== ' ' && key !== '.') {
                            if (cInput.length < 4) {
                                cInput += key;
                                lv_question.updateCurrentAnswer(cInput)
                            }
                        }
                        vertical_sum.setAnswer(cInput)
                    }
                }
            }
        }
    }
}
