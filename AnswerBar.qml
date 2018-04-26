import QtQuick 2.0

Rectangle {
    property alias text: text.text
    color:"#ff0000"
    Text {
        id:text
        //font: lavi.name
        font.pixelSize: height * 0.75
        anchors.fill: parent
        text:"i luv u"
        horizontalAlignment: Text.AlignTop
        //font.pixelSize: height * 0.75
    }

    function spit(x) {
        text.text = 'spittin ' + x
    }
}
