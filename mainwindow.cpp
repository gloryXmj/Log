#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    m_logger.Logout(LEVEL_DEBUG,u8"Init MainWindow",LOG_LOCATION_INFO);
}

MainWindow::~MainWindow()
{
    delete ui;
}
