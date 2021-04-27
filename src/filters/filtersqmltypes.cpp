#include "filter.h"
#include "valuefilter.h"
#include "indexfilter.h"
#include "regexpfilter.h"
#include "rangefilter.h"
#include "expressionfilter.h"
#include "anyoffilter.h"
#include "alloffilter.h"
#include <QQmlEngine>
#include <QCoreApplication>

void registerFiltersTypes() {
//    qDebug() << "registerFiltersTypes";
    qmlRegisterUncreatableType<Filter>("SortFilterProxyModel", 1, 0, "Filter", "Filter is an abstract class");
    qmlRegisterType<ValueFilter>("SortFilterProxyModel", 1, 0, "ValueFilter");
    qmlRegisterType<IndexFilter>("SortFilterProxyModel", 1, 0, "IndexFilter");
    qmlRegisterType<RegExpFilter>("SortFilterProxyModel", 1, 0, "RegExpFilter");
    qmlRegisterType<RangeFilter>("SortFilterProxyModel", 1, 0, "RangeFilter");
    qmlRegisterType<ExpressionFilter>("SortFilterProxyModel", 1, 0, "ExpressionFilter");
    qmlRegisterType<AnyOfFilter>("SortFilterProxyModel", 1, 0, "AnyOf");
    qmlRegisterType<AllOfFilter>("SortFilterProxyModel", 1, 0, "AllOf");
    qmlRegisterUncreatableType<FilterContainerAttached>("SortFilterProxyModel", 1, 0, "FilterContainer", "FilterContainer can only be used as an attaching type");
}

//Q_COREAPP_STARTUP_FUNCTION(registerFiltersTypes)

