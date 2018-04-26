import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    x:8
    y:10

    property int destX: 0
    property int destY: 0
    property real val: 0


    Rectangle{
        id:line1
        x:0
        y:0
        height:2
        width:destX/2
        color: mouseArea.containsMouse ? '#55AA55' : "black"
    }
    Rectangle{
        id:line2
        x:destX/2
        y:0
        width:2
        height:destY
        color: mouseArea.containsMouse ? '#55AA55' : "black"
        ToolTip {
                id: toolt
                text: qsTr("Value Here")
            }
    }
    Rectangle{
        id:line3
        x:destX/2
        y:destY
        height:2
        width:destX/2
        color: mouseArea.containsMouse ? '#55AA55' : "black"
    }

    MouseArea{
        id: mouseArea
        anchors.fill: line2
        hoverEnabled: true
        anchors.margins: -10
        onHoveredChanged: {
            if(mouseArea.containsMouse){
                toolt.visible = true;
            }
            else{
                toolt.visible = false;
            }
        }
    }


}
