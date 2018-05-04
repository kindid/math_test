import QtQuick 2.0
import QtGraphicalEffects 1.0
import '../Components'

Item {
    signal playClicked()
    signal finished()
    // start with a ready
    //  this zooms out of the screen fading as it goes
    //  each letter does the same thing
    //  when the fade reaches 0 that's the end of the animation.


    function resetAnimation() {
        play_image.scale = 1
        play_image.opacity = 1
    }

    // i wanna name and bind this animation to each of the 3 texts
    // they execute
    // man, you could waste your life in here.
    //  adding a colour transform, some sparkles, a nice pencil edge,
    //  glyph spacing and a million more animations & combos

    // editor - man, so many things - an animator would be nice
    // I'm a bit disappointed in the syntax below TBH.


    ParallelAnimation {
        id: count_down
        NumberAnimation {
            target: play_image
            duration: 2000
            property: 'opacity'
            from:1
            to:0
        }
/*        NumberAnimation {
            target: blurring_play
            duration: 2000
            property: 'radius'
            from:0
            to:100
        }*/
        NumberAnimation {
            target: play_image
            duration: 2000
            property: 'scale'
            from:1
            to:0
        }

        SequentialAnimation {
            // height of what?

            ParallelAnimation {

                NumberAnimation {
                    target: ready_text
                    property: "font.pixelSize"
                    duration: 1000
                    easing.type: Easing.InQuad
                    from: height * 0.1
                    to: height * 10 // should be a normalised animation factor you can use here.
                }
                NumberAnimation {
                    //                target: ready_blur
                    target: ready_text
                    property: "opacity"
                    duration: 1000
                    //                easing.type: Easing.InOutQuad
                    from: 1
                    to: 0
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: steady_text
                    property: "font.pixelSize"
                    duration: 1000
                    easing.type: Easing.InQuad
                    from: height * 0.1
                    to: height * 10 // should be a normalised animation factor you can use here.
                }
                NumberAnimation {
                    target: steady_text
                    property: "opacity"
                    duration: 1000
                    //                easing.type: Easing.InOutQuad
                    from: 1
                    to: 0
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: go_text
                    property: "font.pixelSize"
                    duration: 1000
                    easing.type: Easing.InQuad
                    from: height * 0.1
                    to: height * 10 // should be a normalised animation factor you can use here.
                }
                NumberAnimation {
                    target: go_text
                    property: "opacity"
                    duration: 1000
                    //                easing.type: Easing.InOutQuad
                    from: 1
                    to: 0
                }
            }
        }

        onStopped: {
            finished();
            //resetAnimation()
            // if you want to go again call resetAnimation
            //                ready_text.enabled = false
            //                steady_text.enabled = false
            //                go_text.enabled = false
        }


        // I guess the whole game now appears on the screen (could already be there)
    }
    CenTex {
        id: ready_text
        text: "READY!"
        font.pixelSize: height * 0.1       // connection here - it's just 2D but it as a dimension in pixels
        color:'#cc3232'
        //fontSizeMode: CenTex.HorizontalFit
        //Behavior on font.pixelSize { NumberAnimation { duration: 500 } }
        opacity: 0
        visible: true
    }

    CenTex {
        id: steady_text
        text: "STEADY!"
        font.pixelSize: height * 0.1       // connection here - it's just 2D but it as a dimension in pixels
        color:'#e7b416'
        //fontSizeMode: CenTex.HorizontalFit
        //Behavior on font.pixelSize { NumberAnimation { duration: 500 } }
        opacity: 0
    }
    CenTex {
        id: go_text
        text: "GO!"
        font.pixelSize: height * 0.1       // connection here - it's just 2D but it as a dimension in pixels
        color: '#2dc937'
        //fontSizeMode: CenTex.HorizontalFit
        //Behavior on font.pixelSize { NumberAnimation { duration: 500 } }
        opacity: 0
    }
    Image {
        id: play_image
        //anchors.margins: 40
//        source: 'qrc:/images/key_play.png'
        source: 'qrc:/images/key_round_play.png'
        width: Math.min(parent.width * 0.25, parent.height * 0.25)
        height: Math.min(parent.width * 0.25, parent.height * 0.25)
        x : (parent.width * 0.5) - Math.min(parent.width, parent.height) * 0.25 * 0.5
        y : (parent.height * 0.5) - Math.min(parent.width, parent.height) * 0.25 * 0.5
        // centering is "interesting"
        //visible: false
    }
    MouseArea {
        anchors.fill: play_image
        onClicked: {
            count_down.start()
            playClicked()
            // you can't make this 0... weird
            //ready_text.font.pixelSize = ready_text.height * 5
        }
    }
    /*
      problems with blurring into borders and the like - need a bit of extra blulr room or
      the blur will "pseudo" clip
    FastBlur {
        id: blurring_play
        anchors.fill: play_image
        anchors.margins: -40
        source: play_image
        radius: 0
        MouseArea {
            anchors.fill: parent
            onClicked: {
                count_down.start()
                // you can't make this 0... weird
                //ready_text.font.pixelSize = ready_text.height * 5
            }
        }
    } */

}
