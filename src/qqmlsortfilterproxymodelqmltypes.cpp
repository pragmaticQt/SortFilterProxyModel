#include <QCoreApplication>
#include "qqmlsortfilterproxymodel.h"

void registerQQmlSortFilterProxyModelTypes() {
    qmlRegisterType<QQmlSortFilterProxyModel>("SortFilterProxyModel", 0, 2, "SortFilterProxyModel");
}
//#ifndef BUILT_AS_PLUGINS
//Q_COREAPP_STARTUP_FUNCTION(registerQQmlSortFilterProxyModelTypes)
//#endif
