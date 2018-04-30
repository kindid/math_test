import QtQuick 2.10
import QtQuick.Controls 2.2
//import QtQuick.Controls.Styles 1.4
//import QtQuick.Window 2.10
//import QtQuick.Layouts 1.3
import QtMultimedia 5.9
import QtQuick 2.0
// wow... it's this easy - it just bring in everything (of course I've no idea how to namespace this lot)
import 'Components'

Item {
    anchors.fill: parent
    signal key(string key)
//    Rectangle {
//        anchors.fill: parent
//        color:Qt.rgba(1.0,0.0,1.0,0.5)
//    }

    // 4x4 == 16 keys. 10 are for digits
    // +- is another, . is another that's 12 down
    // +-*/ make up all the others.
    // 5x5 is TWENTY FIVE keys - that's a LOT
    Repeater {
        // internal id only
        id: calc_pad
        // need to be more conventional... probablt
        model: [
            // colours please
            { name:'7', color: '#E8DAEF' },
            { name:'8', color: '#E8DAEF' },
            { name:'9', color: '#E8DAEF' },
            { name:' ', color: '#b0b0b0' },

            { name:'6', color: '#E8DAEF' },
            { name:'5', color: '#E8DAEF' },
            { name:'4', color: '#E8DAEF' },
            { name:'»', color: '#E74C3C' },

            { name:'3', color: '#E8DAEF' },
            { name:'2', color: '#E8DAEF' },
            { name:'1', color: '#E8DAEF' },
            { name:'?', color: '#3ce74c' },

            { name:'±', color: '#f8DAEF' },
            { name:'0', color: '#E8DAEF' },
            { name:'.', color: '#b0b0b0' },
            { name:' ', color: '#b0b0b0' },
        ]

        // ****s this ****.
        // ratio 6:2
        delegate: CalcButton {
            id: button
            // square effect - look at all those 6's
            // this makes it square - i want to make it 6 by 2. this probably does the correct border? (no)
            // express this in terms of aspect ratio (and border) ORLY?
            width: Math.min(parent.width, parent.height) / 4
            height: Math.min(parent.width, parent.height) / 4

            x: Math.floor(index % 4) * Math.min(parent.width, parent.height) / 4
            y: Math.floor(index / 4) * Math.min(parent.width, parent.height) / 4

            source: 'qrc:/images/key_blank.png'
            text: modelData.name
            key_name: modelData.name
            color: modelData.color
            //text: modelData //index;
            onClicky: {
                //console.log("CLICK CLICK")
                // just pass the keys out please
                key(q_key_name)
            }
        }
    }
}
