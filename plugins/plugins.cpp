//#include <QQmlEngineExtensionPlugin>

//class SortFilterProxyModelPlugin : public QQmlEngineExtensionPlugin
//{
//    Q_OBJECT
//    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)
//};
#include "../src/qqmlsortfilterproxymodel.h"
#include <QQmlExtensionPlugin>
class SortFilterProxyModelPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "SortFilterProxyModel/1.0")
public:

    /**
     * @brief registerTypes Overrided function that should register all
     * C++ classes exported by this plugin.
     * @param uri           Plugin uri.
     */
    void registerTypes(const char* uri) override
    {
        Q_ASSERT(uri == QLatin1String("SortFilterProxyModel"));
        registerAllTypes();
    }
};

#include "plugins.moc"
