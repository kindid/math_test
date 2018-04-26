import QtQuick 2.10
import QtQuick.Controls 2.2
//import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.10
import QtQuick.Layouts 1.3
import QtMultimedia 5.9


Item {
    id:fullscreen
    // not here - let the thing above lay you out
    anchors.fill: parent
//    anchors.margins: 4
    // todo; there's a state machine here...
    // if you want to transition between windows FEEL FREE!!


    ChildPicker {
        anchors.fill: parent
    }


// this needs a header you know...
//  the header should have 3 parts - the middle
//  is immutable - the left & right are for the game
//  although, this could change...
//  left = back
//  next = user icon and name + game title
//  next = clock
//  next = score
//    MainMenu {
//        anchors.fill: parent
//    }

    // blend between 2 pages somehow?
    // there doesn't need to be an Item here man
    QuizScreen {
        id: quiz_screen
        anchors.fill: parent
        //            anchors.leftMargin: -fullscreen.width
        //            anchors.rightMargin: 0
        z: -100
        visible: false
        scale:1
    }

    // as this animation fades out so this one needs updating
    // how do we keep these in sync.
    // that is, over the last second I want to scale
    RSG {
        id: rsg
        anchors.fill: parent
        onPlayClicked: {
            bring_game_in.start();
            console.log("BANG");
        }
        onFinished: {
            console.log("BOOM")
            RSG.visible = false
        }
        visible:true
    }

    // do a countdown - with lights or something

    // "ready" "steady" "go!"


    // and then some sort of syncronizer

    // scale and opacity would be nice

    // set state fade in fade out
    Item {
        visible:false
        id: main_menu
        anchors.fill: parent
        MainMenu {
            onGotoPage: {
                if (page === 'quiz') {
                    disappear.start()
                    // run an animation
                    //                        main_menu.anchors.leftMargin = fullscreen.width
                }

                console.log("goto page " + page)
            }
        }

        // god damn it - this is going to be buried everywhere - or build a "tab/stack" container and be happy!
        // that is, wrap everything up nicely - still need object references or at least ref by id.
    }

    SequentialAnimation {
        id: bring_game_in
        PropertyAnimation {
            target: quiz_screen
            property: 'visible'
            from: 0
            to: 0
            duration: 0
        }
        PauseAnimation {
            duration: 2000
        }
        PropertyAnimation {
            target: quiz_screen
            property: 'visible'
            from: 0
            to: 1
            duration: 0
        }
        NumberAnimation {
            target: quiz_screen
            property: 'scale'
            from: 0
            to: 1
            duration:1000
        }
        PropertyAnimation {
            target: rsg
            property: 'visible'
            from: 1
            to: 0
            duration: 0
        }
    }


    // probably bollocks now - was nice once

    /* this needs to be able to animate any window combo c */
    //        SequentialAnimation {
    ParallelAnimation {
        id: disappear
        // can just set x and y and leave width/height setup properly - this would save some hassle
        NumberAnimation { target: main_menu; property:'anchors.leftMargin'; from: 0; to: fullscreen.width; duration:2000; /*running: true;*/ /*loops: Animation.Infinite*/}
        NumberAnimation { target: main_menu; property:'anchors.rightMargin'; from: 0; to: -fullscreen.width; duration:2000; /*running: true;*/ /*loops: Animation.Infinite*/}
        NumberAnimation { target: quiz_screen; property:'anchors.leftMargin'; from: -fullscreen.width; to:0; duration:2000; /*running: true;*/ /*loops: Animation.Infinite*/}
        NumberAnimation { target: quiz_screen; property:'anchors.rightMargin'; from: fullscreen.width; to: 0; duration:2000; /*running: true;*/ /*loops: Animation.Infinite*/}
    }
    // putting up multiple screens is easy...
    /*
    Rectangle {
        id: me
        anchors.fill: parent
        color:"#ff0000"
        opacity: 0.5
        NumberAnimation { target: me; property:'anchors.leftMargin'; from: 0; to:1000; duration:2000; running: true; loops: Animation.Infinite}
    }
*/
}
