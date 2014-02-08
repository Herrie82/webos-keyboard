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
    englishplugin.h

TARGET          = $$qtLibraryTarget(englishplugin)

EXAMPLE_FILES = englishplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${UBUNTU_KEYBOARD_LIB_DIR}/en/

lang_db_en.path = $$PLUGIN_INSTALL_PATH
lang_db_en.commands += \
  rm -f $$PWD/database_en.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_en.db $$PWD/the_picture_of_dorian_gray.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_en.db $$PWD/the_picture_of_dorian_gray.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_en.db $$PWD/the_picture_of_dorian_gray.txt

lang_db_en.files += $$PWD/database_en.db
QMAKE_EXTRA_TARGETS += lang_db_en

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += target lang_db_en

OTHER_FILES += \
    englishplugin.json \
    the_picture_of_dorian_gray.txt

LIBS += $${TOP_BUILDDIR}/plugins/plugins/libwesternsupport.a -lpresage

enable-hunspell {
    # hunspell
    CONFIG += link_pkgconfig
    PKGCONFIG += hunspell
    DEFINES += HAVE_HUNSPELL
}

INCLUDEPATH += $$PWD/../../westernsupport
DEPENDPATH += $$PWD/../../westernsupport
