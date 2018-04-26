import QtQuick 2.6

Item {   

    Rectangle{
            //anchors.centerIn: parent
            id:def
            width:16
            height:20

            property bool isInput: false

            color:  mousearea1.containsMouse ? '#505050' : "#707070"
            border.color: "#000000"
            border.width: 1
            //Drag.active: mouseAreaBox.drag.active


            MouseArea{
                id: mousearea1
                anchors.fill: parent
                hoverEnabled: true                
                onClicked: {
                    //def.color = 'black';
                    console.log("input type",def.isInput);
                    var component = Qt.createComponent("line.qml");
                    var object = component.createObject(def);
                    //console.log("X AND Y",mouse.getLineX,mouse.getLineY);
                    object.destX = 200//mouse.getLineX(5)
                    object.destY = 0//mouse.getLineY(5)

                }
            }

        }

}
