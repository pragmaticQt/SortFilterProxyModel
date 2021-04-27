#include "proxyrole.h"
#include "joinrole.h"
#include "switchrole.h"
#include "expressionrole.h"
#include "regexprole.h"
#include "filterrole.h"
#include <QQmlEngine>
#include <QCoreApplication>

void registerProxyRoleTypes() {
    qmlRegisterUncreatableType<ProxyRole>("SortFilterProxyModel", 1, 0, "ProxyRole", "ProxyRole is an abstract class");
    qmlRegisterType<JoinRole>("SortFilterProxyModel", 1, 0, "JoinRole");
    qmlRegisterType<SwitchRole>("SortFilterProxyModel", 1, 0, "SwitchRole");
    qmlRegisterType<ExpressionRole>("SortFilterProxyModel", 1, 0, "ExpressionRole");
    qmlRegisterType<RegExpRole>("SortFilterProxyModel", 1, 0, "RegExpRole");
    qmlRegisterType<FilterRole>("SortFilterProxyModel", 1, 0, "FilterRole");
}
//#ifndef BUILT_AS_PLUGINS
//Q_COREAPP_STARTUP_FUNCTION(registerProxyRoleTypes)
//#endif
