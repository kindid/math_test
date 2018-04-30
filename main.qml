import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Window 2.10

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Image {
        anchors.fill: parent
        source: "qrc:/images/grid.png"
        fillMode: Image.Tile
    }

    ViewTop {
        id: vt    // remove if this doesn't get much use
    }
}
