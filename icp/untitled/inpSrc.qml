import QtQuick 2.6
import QtQuick.Dialogs 1.2
Item {   
    id:inpSrc

    MessageDialog {
        id: messageDialog
        title: "select value of input"
        text: "Value here:"
        onAccepted: {
            console.log("TODO")
        }
    }
    Drag.active: mouseareaInp.drag.active
    Rectangle{
            //anchors.centerIn: parent
            id:def
            width:20
            height:20
            radius: 10

            color:  mouseareaInp.containsMouse ? '#FFFFFF' : "#707070"
            border.color: "#000000"
            border.width: 1
            //Drag.active: mouseAreaBox.drag.active


            MouseArea{
                id: mouseareaInp
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                anchors.fill: parent
                hoverEnabled: true
                drag.target: inpSrc
                onClicked: {
                    if(mouse.button & Qt.LeftButton){
                    console.log("input type",def.isInput);
                    var component = Qt.createComponent("line.qml");
                    var object = component.createObject(def);

                    object.destX = 50//mouse.getLineX(5)
                    object.destY = 100//mouse.getLineY(5)
                    }
                    else if(mouse.button & Qt.RightButton){
                        messageDialog.visible = true;
                    }
                }
            }

        }

}
