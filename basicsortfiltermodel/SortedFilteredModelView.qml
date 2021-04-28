import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15

GroupBox {

    property alias model:      sortedFilteredView.model
    property alias titleNames: sortedFilteredView.titleNames
    property alias roleNames:  sortedFilteredView.roleNames
    property alias selectedRole: sortedFilteredView.selectedRole

    title: qsTr("Sorted/Filtered Model")

    TableView {
        id: sortedFilteredView
        anchors.fill: parent

        property string selectedRole: roleNames[0]
        signal columnClicked(int column)

        readonly property var roleNames: ["subject", "sender", "date"]
        readonly property var titleNames: ["Subject", "Sender", "Date"]

//        model: sortFilterProxyModel

        sortIndicatorVisible: true

        headerDelegate: Text {
            text: styleData.value
            Connections {
                target: styleData
                onPressedChanged: {
                    if (styleData.pressed) {
                        sortedFilteredView.columnClicked(styleData.column)
                    }
                }
            }
        }

        onColumnClicked: {
            if (selectedRole !== roleNames[column]) {
                selectedRole = roleNames[column]
            }
        }

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
