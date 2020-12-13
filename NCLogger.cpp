#include "NCLogger.h"
#include <QApplication>
#include <QDebug>
#include "Log4cxx/propertyconfigurator.h"

NCLogger::NCLogger(QString className)
{
	//初始化Logger
	std::locale loc = std::locale::global(std::locale(""));
	QString qstrLogCfg = qApp->applicationDirPath() + "/log4cxx.cfg";
	std::string strLogCfg = std::string((const char *)qstrLogCfg.toLocal8Bit());
	log4cxx::File fileCfg(strLogCfg);
	PropertyConfigurator::configure(fileCfg);
	m_logger = Logger::getLogger(className.toLocal8Bit());
}

NCLogger::~NCLogger()
{

}

void NCLogger::Logout(LOG_LEAVEL level, QString log, QString func /*= "UnKnow"*/, int nLine /*= -1*/)
{
	QString logTmp = QString("Function:[%1] Line:[%2] --OutMsg:[%3]").arg(func).arg(nLine).arg(log);
	std::string strLog = std::string((const char *)logTmp.toLocal8Bit());
	switch (level)
	{
	case LEVEL_ERROR:
		m_logger->error(strLog);
		break;
	case LEVEL_WARN:
		m_logger->warn(strLog);
		break;
	case LEVEL_INFO:
		m_logger->info(strLog);
		break;
	case LEVEL_DEBUG:
		m_logger->debug(strLog);
		break;
	default:
		m_logger->debug(strLog);
		break;
	}
}
