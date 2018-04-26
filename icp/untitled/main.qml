import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Window {
    id: root
    visible: true
    width: 1000
    height: 730
    title: qsTr("Block Editor")   
    maximumHeight: height
    maximumWidth: width

    property int  blockType: 0
    property int  globInputCnt: 0

    minimumHeight: height
    minimumWidth: width

    MessageDialog {
        id: helpDialog
        title: "Help"
        text: "HelpString"
        onAccepted: {
            console.log("TODO")
        }
    }

    Row{
        id: header

        Button {
            id:reset
            text: "Reset"
            width:50
            onClicked:{
                comm.testDebug("reset");

            }
        }
        Button {
            id:save
            text: "Save"
            width:50
            onClicked:{
                comm.testDebug("save");
            }
        }
        Button {
            id:load
            text: "Load"
            width:50
            onClicked:{
                comm.testDebug("load");
            }
        }
        Button {
            id:run
            text: "Run"
            width:50
            onClicked:{
                comm.testDebug("Run");
            }
        }
        Button {
            id:step
            text: "Step"
            width:50
            onClicked:{
                comm.testDebug("Step");
            }
        }
        Button {
            id:help
            text: "Help"
            width:50
            onClicked:{
                comm.testDebug("HELP!!!!!");
                helpDialog.visible = true;
            }
        }
    }

    Row{
        id:sidepanel        
        x:500

        Button {
            id:block1
            text: "Block1"
            width:50
            onClicked:{
                blockType = 1
                mouseAreaBg.cursorShape = Qt.OpenHandCursor
            }

        }

        Button {
            id:block2
            text: "Block2"
            width:50
            onClicked:{
                comm.testDebug("Block2");
                blockType = 2;
                console.log(blockType);
            }
        }
        Button {
            id:block3
            text: "Block3"
            width:50
            onClicked:{
                comm.testDebug("Block3");
            }
        }
        Button {
            id:block4
            text: "Block4"
            width:50
            onClicked:{
                comm.testDebug("Block4");
            }
        }
        Button {
            id:block5
            text: "Block5"
            width:50
            onClicked:{
                comm.testDebug("Block5");
            }
        }
        Button {
            id:input
            text: "Input"
            width:50
            onClicked:{
                comm.testDebug("input");
                var component = Qt.createComponent("inpSrc.qml");
                var object = component.createObject(container);
                object.y = globInputCnt*50;
                globInputCnt++;
                console.log(globInputCnt);
            }
        }
    }

    Item {

        id: container
        width:1000 ; height:700
        y:40
        Rectangle{
            anchors.fill: container
            color:"#F8FFF8"
        }

        property int cursX: 0
        property int cursY: 0

        MouseArea {
            id:mouseAreaBg
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            anchors.fill: parent
            onPressed: {
                container.cursX = mouseX
                container.cursY = mouseY
            }
            onClicked: {
                var object = null;
                if(mouse.button & Qt.LeftButton){
                    console.log(blockType);
                    if(blockType == 1){
                        var component = Qt.createComponent("boxCont.qml");
                        object = component.createObject(container);
                        object.inCnt = 5;
                        object.x = container.cursX;
                        object.y = container.cursY;
                        console.log(blockType);
                    }
                    mouseAreaBg.cursorShape =  Qt.ArrowCursor
                    blockType = 0
                }
            }

        }
    }
        /*
        Component.onCompleted: {
            var component = Qt.createComponent("boxCont.qml");
            var object = component.createObject(container);
            object.x = 100
            object.y = 100*/
            //object.inCnt = 3

            /*
            object.x = tmpX + 90
            object.y = 55+1*50
            for (var i=0; i<4; i++) {
                object = component.createObject(container);
                object.x = tmpX
                object.y = 30 + tmpY*i
            }*/
     /*   }
    }*/
    /*
    Canvas{
        id:bg
        x:25
        y:25


        width:500
        height: 450

        property int cursX: 0
        property int cursY: 0
        property int newX: 0
        property int newY: 0

        onPaint:{
            var cont = getContext("2d")
            cont.lineWidth = 2
            cont.strokeStyle = color.black
            cont.beginPath()
            cont.moveTo(cursX,cursY)
            newX = mouseAreaBg.mouseX
            newY = mouseAreaBg.mouseY
            cont.lineTo((cursX + newX)/2,cursY)
            cont.lineTo((cursX + newX)/2,newY)
            cont.lineTo(newX,newY)
            cont.stroke()

            mouse.testDebug("draw");
        }

        MouseArea {
            id:mouseAreaBg
            anchors.fill: parent
            onPressed: {
                bg.cursX = mouseX
                bg.cursY = mouseY
            }
            onClicked: {
                console.log("X is ", bg.cursX, "Y is ", bg.cursY);
            }
            onReleased: {
                bg.requestPaint()
            }
        }

    }
    */
}

