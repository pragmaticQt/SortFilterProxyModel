import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15

GroupBox {

    title: qsTr("Original Model")

    property alias model: originalView.model
    TableView {
        id: originalView

//        model: emailModel
        anchors.fill: parent
        TableViewColumn {
            role: "subject"
            title: "Subject"
            width: 200
        }
        TableViewColumn {
            role: "sender"
            title: "Sender"
            width: 120
        }
        TableViewColumn {
            role: "date"
            title: "Date"
            width: 120
        }
    }
}
