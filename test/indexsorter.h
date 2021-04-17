#ifndef INDEXSORTER_H
#define INDEXSORTER_H

#include "sorters/sorter.h"

class IndexSorter : public Sorter
{
public:
    using Sorter::Sorter;
    int compare(const QModelIndex& sourceLeft, const QModelIndex& sourceRight, const QQmlSortFilterProxyModel& proxyModel) const override;
};

class ReverseIndexSorter : public Sorter
{
public:
    using Sorter::Sorter;
    int compare(const QModelIndex& sourceLeft, const QModelIndex& sourceRight, const QQmlSortFilterProxyModel& proxyModel) const override;
};

#endif // INDEXSORTER_H
