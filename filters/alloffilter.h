#ifndef ALLOFFILTER_H
#define ALLOFFILTER_H

#include "filtercontainerfilter.h"

namespace qqsfpm {

class AllOfFilter : public FilterContainerFilter {
    Q_OBJECT
    QML_ELEMENT
public:
    using FilterContainerFilter::FilterContainerFilter;

protected:
    bool filterRow(const QModelIndex& sourceIndex, const QQmlSortFilterProxyModel& proxyModel) const override;
};

}

#endif // ALLOFFILTER_H
