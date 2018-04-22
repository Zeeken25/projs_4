import QtQuick 2.6


Item {
    id: contbox

    property int inCnt:0

    Rectangle{
        width:50
        height:10+inCnt*30

        color: "#A0A0A0"
        border.color: "#000000"
        border.width: 1
        radius: 5

    }

    Component.onCompleted: {
        inCnt = mouse.objectCreated(inCnt)
        //console.log("start in is ",contbox.inCnt);
        var component = Qt.createComponent("box.qml");
        var object = component.createObject(contbox);
        object.x = 42
        object.y = inCnt * 10 + 10
        object.inp = false
        for (var i=0; i< inCnt; i++) {
            //console.log("cyc in is ",contbox.inCnt);
            object = component.createObject(contbox);
            object.x = -8
            object.y = 10 + 30*i
        }        
    }
}
