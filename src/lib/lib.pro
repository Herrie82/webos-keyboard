include(../config.pri)

VERSION = 0.2.0
TARGET = $${LUNEOS_KEYBOARD_TARGET}
TEMPLATE = lib
QT += core gui quick
CONFIG += staticlib

CONFIG += link_pkgconfig
enable-pinyin {
    PKGCONFIG += libpinyin
    LIBS += libpinyin
}

include(models/models.pri)
include(logic/logic.pri)

HEADERS += coreutils.h
SOURCES += coreutils.cpp

include(../word-prediction.pri)

# for plugins
API_HEADERS = logic/languageplugininterface.h

api_headers.files = $$API_HEADERS
api_headers.path = $$LUNEOS_KEYBOARD_HEADERS_DIR
INSTALLS += api_headers
