#include "indexsorter.h"
#include <QtQml>

int IndexSorter::compare(const QModelIndex &sourceLeft, const QModelIndex &sourceRight, const QQmlSortFilterProxyModel& proxyModel) const
{
    Q_UNUSED(proxyModel)
    return sourceLeft.row() - sourceRight.row();
}

int ReverseIndexSorter::compare(const QModelIndex &sourceLeft, const QModelIndex &sourceRight, const QQmlSortFilterProxyModel& proxyModel) const
{
    Q_UNUSED(proxyModel)
    return sourceRight.row() - sourceLeft.row();
}

void registerIndexSorterTypes() {
    qmlRegisterType<IndexSorter>("SortFilterProxyModel.Test", 1, 0, "IndexSorter");
    qmlRegisterType<ReverseIndexSorter>("SortFilterProxyModel.Test", 1, 0, "ReverseIndexSorter");
}

Q_COREAPP_STARTUP_FUNCTION(registerIndexSorterTypes)
