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
                roleName: emailModel.roles[0]
                sortOrder: Qt.AscendingOrder
                enabled: sortedFilteredView.selectedRole === roleName
            },
            RoleSorter {
                roleName: emailModel.roles[1]
                sortOrder: Qt.AscendingOrder
                enabled: sortedFilteredView.selectedRole === roleName
            },
            RoleSorter {
                roleName: emailModel.roles[2]
                sortOrder: Qt.DescendingOrder
                enabled: sortedFilteredView.selectedRole === roleName
            }
        ]
        filters: [

            RegExpFilter {
                roleName: sortedFilteredView.roleNames[filterPattern.currentIndex]
                pattern: filterPattern.text
                caseSensitivity: filterPattern.filterCaseSensitive ? Qt.CaseSensitive : Qt.CaseInsensitive
            }
        ]
    }

    ColumnLayout {
        id: column
        anchors.fill: parent
        readonly property int contentMargin: 10

        OriginalModelView {
            Layout.rightMargin: column.contentMargin
            Layout.leftMargin: Layout.rightMargin
            Layout.fillWidth: true

            model: emailModel
        }

        SortedFilteredModelView {
            id: sortedFilteredView

            Layout.rightMargin: column.contentMargin
            Layout.leftMargin: Layout.rightMargin
            Layout.fillWidth: true

            model: sortFilterProxyModel

            roleNames: emailModel.roles
        }

        FilterPanel {
            id: filterPattern

            Layout.rightMargin: column.contentMargin * 2
            Layout.leftMargin: Layout.rightMargin
            Layout.fillWidth: true

            filterColumns: emailModel.titleNames
        }
    }
}
