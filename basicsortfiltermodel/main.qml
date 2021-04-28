import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15
import SortFilterProxyModel 1.0

Window {
    id: window
    width: 500
    height: 600
    visible: true
    title: qsTr("Basic Sort/Filter Model")

    EmailModel {
        id: emailModel
    }

    SortFilterProxyModel {
        id: sortFilterProxyModel
        sourceModel: emailModel
        sorters: [
            RoleSorter {
                roleName: "subject"
                sortOrder: Qt.AscendingOrder
                enabled: sortedFilteredView.selectedRole === roleName
            },
            RoleSorter {
                roleName: "sender"
                sortOrder: Qt.AscendingOrder
                enabled: sortedFilteredView.selectedRole === roleName
            },
            RoleSorter {
                roleName: "date"
                sortOrder: Qt.DescendingOrder
                enabled: sortedFilteredView.selectedRole === roleName
            }
        ]
        filters: [

            RegExpFilter {
                roleName: sortedFilteredView.roleNames[filterColumnComboBox.currentIndex]
                pattern: filterPattern.text
                caseSensitivity: filteCaseSensitiveCheckBox.checked ? Qt.CaseSensitive : Qt.CaseInsensitive
            }
        ]
    }
    ColumnLayout {
        id: column
        anchors.fill: parent
        GroupBox {
            Layout.fillWidth: true
            title: qsTr("Original Model")

            TableView {
                id: originalView

                model: emailModel
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
        GroupBox {
            title: qsTr("Sorted/Filtered Model")
            Layout.fillWidth: true

            TableView {
                id: sortedFilteredView
                anchors.fill: parent
                property string selectedRole: roleNames[0]
                signal columnClicked(int column)

                readonly property var roleNames: ["subject", "sender", "date"]
                readonly property var titleNames: ["Subject", "Sender", "Date"]

                model: sortFilterProxyModel

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
        GridLayout {
            Layout.rightMargin: 20
            Layout.leftMargin: 20
            Layout.fillWidth: true

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
    }
}
