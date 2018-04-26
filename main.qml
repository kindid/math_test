import QtQuick 2.10
import QtQuick.Controls 2.2
//import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.10
import QtQuick.Layouts 1.3
import QtMultimedia 5.9

/*
99*99

99
99

 891
891
 101
 8

carry chain...
huge carry chain as you go down the results. BUT... empty at the other end (done & done)

if you've got fifty digit numbers you've already got a LONG carry chain

        // with 3 digit numbers this stuff gets really hard.
*/
/* HOW FAR CAN YOU STRETCH PEOPLE
    only bizarre minds can remember or calculate long multiplications
    I wonder if that should even be our focus?


*/

/* ALL of this can GO!
    just leave window up here - we may need a bit or 2 but just s**** it

    It's amazing how often 'anchors.fill: parent' occurs
*/
Window {
    //footerHeight: 100

    property int ****:2
    property int current_q: 0
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    FontLoader {
        id: lavi
        source: "qrc:/fonts/Lavi.ttf"
    }

    Image {
        anchors.fill: parent
        source: "qrc:/images/grid.png"
        fillMode: Image.Tile
    }

    ViewTop {
        id: vt    // remove if this doesn't get much use
    }
}
