#ifndef ANYOFFILTER_H
#define ANYOFFILTER_H

#include "filtercontainerfilter.h"

namespace qqsfpm {

class AnyOfFilter : public FilterContainerFilter {
    Q_OBJECT
    QML_ELEMENT

public:
    using FilterContainerFilter::FilterContainerFilter;

protected:
    bool filterRow(const QModelIndex& sourceIndex, const QQmlSortFilterProxyModel& proxyModel) const override;
};

}

#endif // ANYOFFILTER_H
