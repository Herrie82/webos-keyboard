TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TARGET = dummy
TEMPLATE = lib

lang_ar.path = "$${LUNEOS_KEYBOARD_LIB_DIR}/ar/"
lang_ar.files = *.qml *.js

INSTALLS += lang_ar

# for QtCreator
OTHER_FILES += \
    Keyboard_ar_tablet.qml \
    Keyboard_ar_phone.qml
