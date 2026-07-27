SELECT 
    OBJECT_SCHEMA_NAME(m.object_id) AS SchemaName,
    OBJECT_NAME(m.object_id) AS ProcedureName, 'Update GETDATE() to SYSDATETIME() or SYSUTCDATETIME' AS 'comment'
FROM sys.sql_modules m
JOIN sys.objects o ON m.object_id = o.object_id
WHERE m.definition LIKE '%GETDATE()%' AND o.type = 'P';