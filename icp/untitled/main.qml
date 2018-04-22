import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    id: root
    visible: true
    width: 1000
    height: 730
    title: qsTr("Block Editor")   
    maximumHeight: height
    maximumWidth: width

    minimumHeight: height
    minimumWidth: width
    /*
    Item {
        width: 200; height: 200

        DropArea {
            x: 75; y: 75
            width: 50; height: 50

            Rectangle {
                anchors.fill: parent
                color: "green"

                visible: parent.containsDrag
            }
        }

        Rectangle {
            x: 100; y: 100
            width: 20; height: 20
            color: "red"

            Drag.active: dragArea.drag.active
            Drag.hotSpot.x: 10
            Drag.hotSpot.y: 10

            MouseArea {
                id: dragArea
                anchors.fill: parent

                drag.target: parent
            }
        }
    }
    */

    Row{
        id: header

        Button {
            id:reset
            text: "Reset"
            onClicked:{
                mouse.testDebug("reset");

            }
        }
        Button {
            id:save
            text: "Save"
            onClicked:{
                mouse.testDebug("save");
            }
        }
        Button {
            id:load
            text: "Load"
            onClicked:{
                mouse.testDebug("load");
            }
        }
        Button {
            id:run
            text: "Run"
            onClicked:{
                mouse.testDebug("Run");
            }
        }
        Button {
            id:step
            text: "Step"
            onClicked:{
                mouse.testDebug("Step");
            }
        }
    }

    Row{
        id:sidepanel        
        x:500

        Button {
            id:block1
            text: "Block1"
            onClicked:{
                mouse.testDebug("Block1");
                var component = Qt.createComponent("boxCont.qml");
                var object = component.createObject(container);
                object.inCnt = 3
                object.x = container.cursX
                object.y = container.cursY


            }
        }

        Button {
            id:block2
            text: "Block2"
            onClicked:{
                mouse.testDebug("Block2");
            }
        }
        Button {
            id:block3
            text: "Block3"
            onClicked:{
                mouse.testDebug("Block3");
            }
        }
        Button {
            id:block4
            text: "Block4"
            onClicked:{
                mouse.testDebug("Block4");
            }
        }
        Button {
            id:block5
            text: "Block5"
            onClicked:{
                mouse.testDebug("Block5");
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


        /*
        Rectangle{
            width:90
            height:240

            color: "#F0A0A0"
            border.color: "#000000"
            border.width: 1
            radius: 5
        }
        */
        /*
        function drawBox(x,y)
        {
            var component = Qt.createComponent("boxCont.qml");
            var object = component.createObject(container);
            object.x = x
            object.y = y
            return 1
        }
        */
        MouseArea {
            id:mouseAreaBg
            anchors.fill: parent
            onPressed: {
                container.cursX = mouseX
                container.cursY = mouseY
            }
            onClicked: {//edit
                /*
               // console.log("X is ", container.cursX, "Y is ", container.cursY);
                var component = Qt.createComponent("boxCont.qml");
                var object = component.createObject(container);
                object.x = container.cursX
                object.y = container.cursY
                */
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

