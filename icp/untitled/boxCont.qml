import QtQuick 2.6
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.3

Item {
    id: contbox


    property int inCnt:5


    Drag.active: mouseAreaBox.drag.active
    Rectangle{
        width:50
        height:10+inCnt*30
        //Drag.active: mouseAreaBox.drag.active
        color: mouseAreaBox.containsMouse ? '#BBBBBB' : "#999999"
        border.color: "#000000"
        border.width: 1
        radius: 5
        MouseArea {
            id:mouseAreaBox            
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            anchors.fill: parent
            drag.target: contbox
            onClicked: {
                if(mouse.button & Qt.RightButton){
                    contbox.destroy();

                }
            }
        }
    }


    Component.onCompleted: {
        //inCnt = mouse.objectCreated(inCnt)
        //console.log("start in is ",contbox.inCnt);
        var component = Qt.createComponent("box.qml");
        var object = component.createObject(contbox);
        object.x = 42
        object.y = inCnt * 10 + 15
        //object.inp = false
        console.log("comp:",object.parent,"\t",contbox);
        object.parent = contbox
        for (var i=0; i< inCnt; i++) {
            //console.log("cyc in is ",contbox.inCnt);
            object = component.createObject(contbox);
            object.x = -8
            object.y = 10 + 30*i
            object.parent = contbox
        }        
    }
}
