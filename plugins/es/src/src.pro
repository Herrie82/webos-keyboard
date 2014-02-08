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
    spanishplugin.h

TARGET          = $$qtLibraryTarget(spanishplugin)

EXAMPLE_FILES = spanishplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${UBUNTU_KEYBOARD_LIB_DIR}/es/

lang_db_es.path = $$PLUGIN_INSTALL_PATH
lang_db_es.commands += \
  rm -f $$PWD/database_es.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_es.db $$PWD/el_quijote.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_es.db $$PWD/el_quijote.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_es.db $$PWD/el_quijote.txt

lang_db_es.files += $$PWD/database_es.db
QMAKE_EXTRA_TARGETS += lang_db_es

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += target lang_db_es

OTHER_FILES += \
    spanishplugin.json \
    el_quijote.txt

LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage

enable-hunspell {
    # hunspell
    CONFIG += link_pkgconfig
    PKGCONFIG += hunspell
    DEFINES += HAVE_HUNSPELL
}

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
