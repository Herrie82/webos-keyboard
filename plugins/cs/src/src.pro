TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TEMPLATE        = lib
CONFIG         += plugin
QT             += widgets
INCLUDEPATH    += \
    $${TOP_SRCDIR}/src/ \
    $${TOP_SRCDIR}/src/lib/ \
    $${TOP_SRCDIR}/src/lib/logic/
    $${TOP_SRCDIR}/plugins/westernsupport

HEADERS         = \
    czechplugin.h

TARGET          = $$qtLibraryTarget(czechplugin)

EXAMPLE_FILES = czechplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${UBUNTU_KEYBOARD_LIB_DIR}/cs/

lang_db_cs.path = $$PLUGIN_INSTALL_PATH
lang_db_cs.commands += \
  rm -f $$PWD/database_cs.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_cs.db $$PWD/free_ebook.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_cs.db $$PWD/free_ebook.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_cs.db $$PWD/free_ebook.txt

lang_db_cs.files += $$PWD/database_cs.db
QMAKE_EXTRA_TARGETS += lang_db_cs

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += target lang_db_cs

OTHER_FILES += \
    czechplugin.json \
    free_ebook.txt

LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage

enable-hunspell {
    # hunspell
    CONFIG += link_pkgconfig
    PKGCONFIG += hunspell
    DEFINES += HAVE_HUNSPELL
}

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
