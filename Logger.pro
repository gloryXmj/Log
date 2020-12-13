#-------------------------------------------------
#
# Project created by QtCreator 2020-01-03T22:18:09
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Logger
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#指定Moc_xxx.cxx文件，xxx.obj文件目录
MOC_DIR = $$OUT_PWD/MocDir
OBJECTS_DIR = $$OUT_PWD/ObjectsDir
#Release生成时，exe文件生成目录设置
win32:CONFIG(release, debug|release): DESTDIR = $$PWD/Release
win32:CONFIG(debug, debug|release): DESTDIR = $$OUT_PWD/Debug

INCLUDEPATH += $$PWD/ \
               $$PWD/Libs/Win/Log4cxx/ \
               $$PWD/Libs/Linux/Log4cxx/

win32:DEPENDPATH += $$PWD/Libs/Win/Log4cxx/Debug \
              $$PWD/Libs/Win/Log4cxx/Release \

unix:DEPENDPATH += $$PWD/Libs/Linux/Log4cxx/Libs \

CONFIG += c++11

SOURCES += \
        main.cpp \
        mainwindow.cpp \
        NCLogger.cpp
HEADERS += \
        mainwindow.h \
        NCLogger.h

FORMS += \
        mainwindow.ui

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Libs/Win/Log4cxx/release/ -llog4cxx \

win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Libs/Win/Log4cxx/debug/ -llog4cxx \


unix:CONFIG(release, debug|release): LIBS += -L$$PWD/Libs/Linux/Log4cxx/Libs/ -llog4cxx \
unix:CONFIG(debug, debug|release): LIBS += -L$$PWD/Libs/Linux/Log4cxx/Libs/ -llog4cxx \

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
66
