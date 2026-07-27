# Datetime to Datetime2 Conversion update

Why convert? 
Datetime2 has better accuracy. 

Support date range 
DATETIME2 0001-01-01 to 9999-12-31
DATETIME 1753-01-01 to 9999-12-31

Microsoft opinion on datetime?
Datetime isn't ANSI or ISO 8601 compliant.
https://learn.microsoft.com/en-us/sql/t-sql/data-types/datetime-transact-sql?view=sql-server-ver17#ansi-and-iso-8601-compliance


Functions update GETDATE() --> SYSDATETIME() 
DATETIME2 does not support shorthand addition

Update GETDATE() to either

SYSDATETIME(): Returns the current system timestamp as a high-precision DATETIME2(7) value.
SYSUTCDATETIME(): Returns the current system timestamp in Coordinated Universal Time (UTC) as a DATETIME2(7).

Do not use the default  unless necessary, for instance there is no need to have millisecond’s when not required. Set datetime2(0) when appropriate, this also resolves Excel to read the field as a date.  

Size difference  for datetime2(0)
Datetime to Datetime2 Conversion update
datetime2(0), datetime2(1), datetime2(2) 6 bytes
datetime 8 bytes.
