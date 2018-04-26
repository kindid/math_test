import QtQuick 2.0
import QtQuick.Controls 2.2


// rotation gesture thing - nice.
Rectangle {
    signal gotoPage(string page)
    id: sheet2
    anchors.fill: parent
    color: "#0000ff"
    //opacity: 0.5

    Row {
        anchors.fill: parent
        Image {
            width: parent.width / 4
            height: parent.height / 4
            fillMode: Image.PreserveAspectFit
            source: 'qrc:/images/menu_button_add.png'
        }
        Image {
            width: parent.width / 4
            height: parent.height / 4
            fillMode: Image.PreserveAspectFit
            source: 'qrc:/images/menu_button_add_sub.png'
        }
        Image {
            width: parent.width / 4
            height: parent.height / 4
            fillMode: Image.PreserveAspectFit
            source: 'qrc:/images/menu_button_sub.png'
        }
        Image {
            width: parent.width / 4
            height: parent.height / 4
            fillMode: Image.PreserveAspectFit
            source: 'qrc:/images/menu_button_tables.png'
        }
    }


/*
    Row {
        spacing: 10
        MainMenuButton {
            text: "Adding"
        }
        MainMenuButton {
            text: "Princess\nTowers"
        }
        MainMenuButton {
            text: "Make\na\nBook"
        }
    }

*/
    // put some butons up
    // tables, fill the chasm, and more... gotta go

    MouseArea {
        anchors.fill: parent
        // MCP: this is fine for a demo BUT(!)
        // this state machine should be handled by the parent
        // all we should do is emit state change signals.
        onClicked: {
            gotoPage("quiz")
//            sheet2.visible = false
        }
    }
}
