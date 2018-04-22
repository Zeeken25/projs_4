import QtQuick 2.6

Item {   

    Rectangle{
            //anchors.centerIn: parent
            id:def
            width:16
            height:20

            color: mousearea1.containsMouse ? '#505050' : "#707070"
            border.color: "#000000"
            border.width: 1

            property bool inp: true

            MouseArea{
                id: mousearea1
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    parent.color = 'black';
                    console.log("type: ",inp);
                    var component = Qt.createComponent("line.qml");
                    var object = component.createObject(def);
                    //console.log("X AND Y",mouse.getLineX,mouse.getLineY);
                    object.destX = 50//mouse.getLineX(5)
                    object.destY = 100//mouse.getLineY(5)

                }
            }

        }



}
