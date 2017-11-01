USE AccountOMS
GO
SET NOCOUNT ON
--CREATE ROLE db_AccountOMS;

SELECT type,'grant select on object::'+name+' to db_AccountOMS' FROM sys.objects WHERE type IN ('U','V','TF') AND name NOT LIKE 'sy%'
SELECT 'grant insert on object::'+name+' to db_AccountOMS' FROM sys.objects WHERE type IN ('U')
SELECT  'grant execute on object::'+name+' to db_AccountOMS' FROM    sys.objects WHERE   type IN('P','TT','FN','FS','FT') AND name NOT LIKE 'sp_%';
