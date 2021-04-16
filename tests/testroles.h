#ifndef TESTROLES_H
#define TESTROLES_H

#include "proxyroles/singlerole.h"
#include <QVariant>

class StaticRole : public SingleRole
{
    Q_OBJECT
    Q_PROPERTY(QVariant value READ value WRITE setValue NOTIFY valueChanged)
public:
    using SingleRole::SingleRole;

    QVariant value() const;
    void setValue(const QVariant& value);

Q_SIGNALS:
    void valueChanged();

protected:

private:
    QVariant data(const QModelIndex& sourceIndex, const QQmlSortFilterProxyModel& proxyModel) override;
    QVariant m_value;
};

class SourceIndexRole : public SingleRole
{
public:
    using SingleRole::SingleRole;

private:
    QVariant data(const QModelIndex& sourceIndex, const QQmlSortFilterProxyModel& proxyModel) override;
};

class MultiRole : public ProxyRole
{
public:
    using ProxyRole::ProxyRole;

    QStringList names() override;

private:
    QVariant data(const QModelIndex &sourceIndex, const QQmlSortFilterProxyModel &proxyModel, const QString &name) override;
};

#endif // TESTROLES_H
