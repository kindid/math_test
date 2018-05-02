import QtQuick 2.0
import '../../Components'
import '../..'

Item {
    id: quiz_screen
    property string cInput: ''

    function clear_input() {
        cInput = ''
    }

    // reduce - this is silly
    // HEADER SHOULD NOT BE HERE!!!!
    //  this is one of a collecton of scenes inside the main view
    //   the only time main view might be different is for a splash
    //   screen but i HATE THEM!!
    Item {
        id: header_wrapper
        // or anchor fill parent and set the bottom anchor to parent.height - header_height
        x: 0
        y: 0
        height: 40
        width: parent.width
        // remove from here
        Header {
            id: header
            anchors.fill: parent
        }

//        Rectangle {
//            id: header_bg
//            anchors.fill: parent
//            color: '#ff0000'
//        }
    }

//    Component.onCompleted: {
//        console.log("BOOM")
//        lv_question.setCurrent(0)
//    }


    Item {
        anchors.fill: parent
        anchors.topMargin: header.height
        property string cInput: ''

        // pull this higher (to the top of QuizScreen)
        QuestionModel {
            id: questions
            onReady: {
                lv_question.setCurrent(0)
            }
        }

        Item {
            id: left
            x: 0
            y: 0
            width: parent.width / 2
            height: parent.height
            //color: Qt.transparent
            //        anchors.top: parent.top
            //        anchors.bottom: parent.bottom
            //        color: "#ffff00"

            //        Rectangle {
            //            anchors.fill: parent
            //            color: Qt.rgba(0, 1, 0, 0.2)
            //        }

            // just apply this to the whole scene
            //        Image {
            //            anchors.fill: parent
            //            source: "qrc:/images/grid.png"
            //            fillMode: Image.Tile
            //        }
            QuestionListView {
                id: lv_question
                model: questions
                anchors.fill: parent
                onUpdateMarks: {
                    //console.log(marks)
                    header.setScore(marks, questions.count)
                }
            }
            /*
        ListView {
            id: lv_question
            anchors.fill: parent
            model: questions
            delegate: Item {
                width: lv_question.width
                height: lv_question.height / questions.count
                Question {
                    anchors.fill: parent
                    question_index: index
                    onClick: {
                        // turn old one off and turn new one on
                        // ALSO - Question shouldn't handle any
                        // of the multiplexing at all.
                        sum.setSum(questions.get(qi).a, questions.get(qi).b)
                        //current_q = qi
                    }
                }
            }
        }\*/
        }

        Item {        // see the square peg in a rectangular hole problem - it's on doku wiki
            id: right
            x: parent.width / 2
            width: parent.width / 2
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            property int currentNumber: 0
            property string cInput: ''

            // can I alias that property to, say, a text output text property?
/*            Image {
                anchors.fill: parent
                source: "qrc:/images/grid.png"
                fillMode: Image.Tile
            }
*/
            // 0 is like 10th of a mill or something - weird. it never zooms in either. and never adds any spacing. weird.
            // how much of this do we get? not really up to us.

            // i want to give this 50% - that's still plenty of range
            // for everything else.
            SumVertical {
                id: vertical_sum
                anchors.fill: parent
                anchors.bottomMargin: parent.height * 0.5
                // you want this thing like a 10:3 (the 3 is important)
                //        width: parent.width
                //        height: parent.height /10
                //        x: 0
                //        y: 0
            }

            // displayed value MUST AT PRESENT be a signed integer


            // or do the whole thing as a column - probably not...


            Item {
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                x: (parent.width - Math.min(parent.width, parent.height)) / 2
                y: (parent.height - Math.min(parent.width, parent.height)) / 2

                // refactoring is staggeringly simple
                CalcPad {
                    id: calc_pad
                    // width and heiht
                    anchors.fill: parent
                    // this is some bollocks.
                    anchors.topMargin: parent.height / 2
                    onKey: {

                        //                console.log(key.charCodeAt(0));

                        if (key === '±') {
                            // even - 0 can be displayed - an empty display is possibly not even 0.
                            // of the display is empty it will display 0
                            // you can't type 0 if the only thing displayed is 0 or -0
                            if (cInput.charAt(0) == '-') {
                                cInput = cInput.substring(1);
                            } else {
                                cInput = '-' + cInput
                            }
                            lv_question.updateCurrentAnswer(cInput)
                        } else if (key === '?') {
                            // this is the test key - currently testing is automatic - sorry about that
                            // this should step to the next answer if you are correct
                            //console.log(parseInt(cInput));
                            //console.log(questions.get(current_q).q)
                            //console.log(questions.get(current_q).q === parseInt(cInput))

                            // mark and move to next answered or wrong question
                            // is it correct?
                            console.log(lv_question.testCurrent())

                            // test
                        } else if (key === '»') {
                            // todo - actually check there's something there
                            cInput = cInput.substring(0, cInput.length - 1)
                            lv_question.updateCurrentAnswer(cInput)
                        } else if (key !== ' ' && key !== '.') {
                            if (cInput.length < 4) {
                                cInput += key;
                                lv_question.updateCurrentAnswer(cInput)
                            }
                            // if it's the dot then you need to remember where you left it and
                            // start adding the fractional bit because you can only have one dot
                            // in a number - anything else is gluttony
                        }
                        vertical_sum.setAnswer(cInput)
                    }
                }
            }

            //    AnswerBar {
            //        id: answer
            //        anchors.fill: parent
            //        anchors.topMargin: parent.height - 100
            //    }
        }
    }
}
