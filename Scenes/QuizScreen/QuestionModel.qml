import QtQuick 2.0

/*
    2 numbers
    the result
    whether the card has been turned over yet
    the answer the user has given
*/

ListModel {
    id: questions
    signal ready()
    Component.onCompleted: {
        for (var i = 0; i < 10; i++) {
            var a = Math.floor(Math.random() * 10)
            //var a = i
            var b = Math.floor(Math.random() * 10)
            // how hard or easy do you want it?
            append({
                       'a': a,      // JSON note - just use ****ing equals syntax...
                       'b': b,
                       'op' : '+',
                       'q': a + b,
                       'answered': false,
                       'user_q': 0, // doesn't
                       'view_state': 'unanswered',
                       'select_state': false
                       })
        }
        ready()
    }
    function listViewSaysHi() {
        console.log('hi from questions model function')
    }
}
