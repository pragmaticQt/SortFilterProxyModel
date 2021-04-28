import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15

GroupBox {

    property alias model: originalView.model

    title: qsTr("Original Model")

    SharedTableView {
        id: originalView
        anchors.fill: parent
    }

}
