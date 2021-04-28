import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15

GridLayout {

    property alias text: filterPattern.text
    property alias currentIndex: filterColumnComboBox.currentIndex
    property alias filterCaseSensitive: filteCaseSensitiveCheckBox.checked
    property alias sorterCaseSensitive: sorterCaseSensitiveCheckBox.checked

    rows: 4
    columns: 2

    Label {
        text: qsTr("Filter pattern: ")
    }

    TextField {
        id: filterPattern
        Layout.fillWidth: true
        text: qsTr("Andy|Grace")
    }

    Label {
        text: qsTr("Filter syntax: ")
    }
    ComboBox {
        id: filterSyntaxComboBox
        Layout.fillWidth: true
        model: ["Regular expression", "Wildcard", "Fixed string"]
    }

    Label {
        text: qsTr("Filter column: ")
    }
    ComboBox {
        id: filterColumnComboBox
        currentIndex: 1
        Layout.fillWidth: true
        model: sortedFilteredView.titleNames
    }

    CheckBox {
        id: filteCaseSensitiveCheckBox
        text: qsTr("Case sensitive filter")
    }
    CheckBox {
        id: sorterCaseSensitiveCheckBox
        text: qsTr("Case sensitive sorter")
        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
    }
}
