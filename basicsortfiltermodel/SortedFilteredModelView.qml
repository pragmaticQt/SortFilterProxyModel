import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15

GroupBox {

    property var    roleNames:    []
    property alias  model:        sortedFilteredView.model
    property string selectedRole: roleNames.length ? roleNames[0] : ""

    title: qsTr("Sorted/Filtered Model")

    SharedTableView {
        id: sortedFilteredView
        anchors.fill: parent

        signal columnClicked(int column)

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

    }
}
