IF EXISTS (SELECT * FROM sys.server_triggers  
    WHERE name = 'ddl_trig_database')  
DROP TRIGGER ddl_trig_database  
ON ALL SERVER;  
GO  
CREATE TRIGGER ddl_trig_database   
ON ALL SERVER   
FOR DROP_LOGIN   
AS   
   INSERT master.dbo.t_LogDrop(command,LoginExec)    
    SELECT EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)'),ORIGINAL_LOGIN()  
GO  
DROP TRIGGER ddl_trig_database  
ON ALL SERVER;  
GO  