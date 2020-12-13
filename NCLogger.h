#pragma once
#include <QString>

#include "Log4cxx/logger.h"
using namespace log4cxx;

#define  LOG_LOCATION_INFO __FUNCTION__,__LINE__


enum LOG_LEAVEL
{
	LEVEL_BEGIN,
	LEVEL_OFF,
	LEVEL_FATAL,
	LEVEL_ERROR,
	LEVEL_WARN,
	LEVEL_INFO,
	LEVEL_DEBUG,
	LEVEL_TRACE,
	LEVEl_ALL
};

class NCLogger
{
public:
	NCLogger(QString className = __FILE__);
	~NCLogger();

	void Logout(LOG_LEAVEL level, QString log, QString func = "UnKnow", int nLine = -1);
	
private:
	LoggerPtr m_logger;
};
