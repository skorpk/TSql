WITH doubleRun
AS(
SELECT cp.objtype AS ObjectType,DB_NAME(st.dbid) AS DBName,
OBJECT_NAME(st.objectid,st.dbid) AS ObjectName,
cp.usecounts AS ExecutionCount,
st.TEXT AS QueryText,
qp.query_plan AS QueryPlan
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) AS qp
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) AS st
--WHERE  DB_NAME(st.dbid)='PeopleAttach'
)
SELECT  ObjectType ,
        DBName ,
        ObjectName ,
        ExecutionCount ,
        QueryText ,
        QueryPlan 
FROM doubleRun 
WHERE DBName IS NOT NULL AND ObjectName IS NOT null
ORDER BY DBName,ObjectName
--SELECT ObjectName, QueryPlan FROM doubleRun WHERE ObjectName IS NOT NULL ORDER BY ObjectName


SELECT cp.objtype AS ObjectType,DB_NAME(st.dbid) AS DBName,
OBJECT_NAME(st.objectid,st.dbid) AS ObjectName,
cp.usecounts AS ExecutionCount,
st.TEXT AS QueryText,
qp.query_plan AS QueryPlan
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) AS qp
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) AS st
WHERE  OBJECT_NAME(st.objectid,st.dbid)= 'usp_selectReportPaymentCostsByMO'
