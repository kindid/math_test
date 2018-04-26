import QtQuick 2.10
import QtQuick.Controls 2.2
//import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.10
import QtQuick.Layouts 1.3
import QtMultimedia 5.9
import QtQuick 2.0

Rectangle {
    color:"#00ff00"
    Text {
        anchors.fill: parent
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: '\u2714\u2718'
        //text: "Hi there! Now scale this text…"
        font.pixelSize: (height * 0.5)
    }
}
