//#include <QtQuickTest/quicktest.h>
//QUICK_TEST_MAIN(SortFilterProxyModel)

//// tst_mytest.cpp
#include <QObject>
#include <QtQuickTest>
#include <QQmlEngine>
#include <QQmlContext>
#include "qqmlsortfilterproxymodel.h"

class Setup : public QObject
{
    Q_OBJECT

public:
    Setup() {
        qDebug() << "Setup";
        registerAllTypes();
    }

    void qmlEngineAvailable(QQmlEngine *engine)
    {
        Q_UNUSED(engine)
        qDebug() << "qmlEngineAvailable";
    }

};

QUICK_TEST_MAIN_WITH_SETUP(mytest, Setup)

#include "tst_sortfilterproxymodel.moc"
