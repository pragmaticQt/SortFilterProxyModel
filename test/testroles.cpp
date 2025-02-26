#include "testroles.h"
#include <QtQml>

QVariant StaticRole::value() const
{
    return m_value;
}

void StaticRole::setValue(const QVariant& value)
{
    if (m_value == value)
        return;

    m_value = value;
    Q_EMIT valueChanged();
    invalidate();
}

QVariant StaticRole::data(const QModelIndex& sourceIndex, const QQmlSortFilterProxyModel& proxyModel)
{
    Q_UNUSED(sourceIndex)
    Q_UNUSED(proxyModel)
    return m_value;
}

QVariant SourceIndexRole::data(const QModelIndex& sourceIndex, const QQmlSortFilterProxyModel& proxyModel)
{
    Q_UNUSED(proxyModel)
    return sourceIndex.row();
}

QStringList MultiRole::names()
{
    return {"role1", "role2"};
}

QVariant MultiRole::data(const QModelIndex&, const QQmlSortFilterProxyModel&, const QString& name)
{
    return "data for " + name;
}

void registerTestRolesTypes() {
    qmlRegisterType<StaticRole>("SortFilterProxyModel.Test", 1, 0, "StaticRole");
    qmlRegisterType<SourceIndexRole>("SortFilterProxyModel.Test", 1, 0, "SourceIndexRole");
    qmlRegisterType<MultiRole>("SortFilterProxyModel.Test", 1, 0, "MultiRole");
}

Q_COREAPP_STARTUP_FUNCTION(registerTestRolesTypes)
