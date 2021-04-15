TEMPLATE = lib
TARGET = sortfilterproxymodelplugin
QT += qml
CONFIG += qt plugin qmltypes c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = SortFilterProxyModel

QML_IMPORT_NAME = $$uri
QML_IMPORT_MAJOR_VERSION = 1
DESTDIR = imports/$$QML_IMPORT_NAME

include(../SortFilterProxyModel.pri)
SOURCES += plugins.cpp

HEADERS +=

DISTFILES = qmldir

# copy files list here to DESTDIR
PLUGINFILES = \
    qmldir \
    $$OUT_PWD/plugins.qmltypes

pluginfiles_copy.files = $$PLUGINFILES
pluginfiles_copy.path = $$DESTDIR

COPIES += pluginfiles_copy

DEFINES += BUILT_AS_PLUGINS

#!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
#    copy_qmldir.target = DESTDIR/qmldir
#    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
#    copy_qmldir.commands = $(COPY_FILE) "$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)" "$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)"
#    QMAKE_EXTRA_TARGETS += copy_qmldir
#    PRE_TARGETDEPS += $$copy_qmldir.target
#}

#qmldir.files = qmldir
#unix {
#    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
#    qmldir.path = $$installPath
#    target.path = $$installPath
#    INSTALLS += target qmldir
#}
