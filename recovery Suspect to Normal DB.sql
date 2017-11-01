USE master
GO
ALTER DATABASE RedGateMonitor SET EMERGENCY;
GO
ALTER DATABASE RedGateMonitor SET SINGLE_USER;
GO
DBCC CHECKDB (N'RedGateMonitor', REPAIR_ALLOW_DATA_LOSS) WITH NO_INFOMSGS, ALL_ERRORMSGS;
GO
ALTER DATABASE RedGateMonitor SET MULTI_USER