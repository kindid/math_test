import QtQuick 2.0

Rectangle {
    property alias  text: text_id.text
    width:100
    height:100
    color:"#ffffff"
    CenTex {
        id: text_id
        font.pixelSize: height / 4
    }
}
