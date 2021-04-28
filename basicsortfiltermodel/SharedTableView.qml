import QtQuick 2.0
import QtQuick.Controls 1.4

TableView {
    id: originalView

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
