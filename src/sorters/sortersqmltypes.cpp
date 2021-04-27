#include "sorter.h"
#include "rolesorter.h"
#include "stringsorter.h"
#include "filtersorter.h"
#include "expressionsorter.h"
#include "sortercontainer.h"
#include <QQmlEngine>
#include <QCoreApplication>

void registerSorterTypes() {
    qmlRegisterUncreatableType<Sorter>("SortFilterProxyModel", 1, 0, "Sorter", "Sorter is an abstract class");
    qmlRegisterType<RoleSorter>("SortFilterProxyModel", 1, 0, "RoleSorter");
    qmlRegisterType<StringSorter>("SortFilterProxyModel", 1, 0, "StringSorter");
    qmlRegisterType<FilterSorter>("SortFilterProxyModel", 1, 0, "FilterSorter");
    qmlRegisterType<ExpressionSorter>("SortFilterProxyModel", 1, 0, "ExpressionSorter");
    qmlRegisterUncreatableType<SorterContainerAttached>("SortFilterProxyModel", 1, 0, "SorterContainer", "SorterContainer can only be used as an attaching type");
}
//#ifndef BUILT_AS_PLUGINS
//Q_COREAPP_STARTUP_FUNCTION(registerSorterTypes)
//#endif
