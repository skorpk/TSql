
--SELECT DB_NAME(qp.dbid),qp.query_plan,t.text,cp.objtype
--FROM sys.dm_exec_cached_plans cp CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) qp
--			CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) t
--WHERE qp.dbid IN (7,25,10) AND CAST(qp.query_plan AS NVARCHAR(max)) LIKE '%<MissingIndexes>%' 
--GO

WITH XMLNAMESPACES(DEFAULT'http://schemas.microsoft.com/sqlserver/2004/07/showplan')
SELECT DB_NAME(qp.dbid),qp.query_plan,t.text,cp.objtype
FROM sys.dm_exec_cached_plans cp CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) qp
			CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) t
WHERE  qp.dbid IN (7,25,10) AND  qp.query_plan.exist('//MissingIndexes')=1
