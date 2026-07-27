# Datetime to Datetime2 Conversion update

Why convert? 
Datetime2 has better accuracy, performance and Indexing. 

Support date range 
DATETIME2 0001-01-01 to 9999-12-31
DATETIME 1753-01-01 to 9999-12-31

Microsoft opinion on datetime?
Datetime isn't ANSI or ISO 8601 compliant.
https://learn.microsoft.com/en-us/sql/t-sql/data-types/datetime-transact-sql?view=sql-server-ver17#ansi-and-iso-8601-compliance


Functions update GETDATE() --> SYSDATETIME() 
DATETIME2 does not support shorthand addition

SYSDATETIME(): Returns the current system timestamp as a high-precision DATETIME2(7) value.
SYSUTCDATETIME(): Returns the current system timestamp in Coordinated Universal Time (UTC) as a DATETIME2(7).

Large Datasets: DATETIME vs. DATETIME2
When dealing with large datasets, choosing the appropriate date and time data type is critical for performance, storage, and compliance.

DATETIME2 is Microsoft’s modern date and time data type, introduced in SQL Server 2008. Microsoft explicitly recommends using DATETIME2 over DATETIME for new development.

DATETIME is not ANSI or ISO 8601 compliant, making it less suitable for interoperable or globally standardized systems.

Default Behavior
DATETIME2 defaults to DATETIME2(7), which follows the format:
yyyy-MM-dd HH:mm:ss[.nnnnnnn] (with 7 decimal places for fractional seconds).

Performance and Storage
DATETIME2(0)—which truncates fractional seconds to whole seconds—offers a storage size of 6 bytes, compared to DATETIME which uses 8 bytes.
This reduction in size can lead to noticeable improvements in both storage efficiency and query performance, especially in large tables or indexed columns.

Considerations for Migration
While DATETIME2 offers superior performance and compliance, migrating existing systems may require careful attention:

Functions such as GETDATE() should be replaced with SYSDATETIME().

Certain DATEADD and other date-related functions may behave differently with the increased precision.

Therefore, migrating legacy systems may not always be advisable without thorough testing.

Best Practice for New Systems
For new SQL Server and Azure SQL Database deployments, adopting DATETIME2 is strongly recommended.

However, a common pitfall is that DATETIME2(7) is not natively recognized as a date format in Excel exports, which can cause display or parsing issues.

Practical Recommendation
To avoid compatibility issues while retaining performance benefits, use DATETIME2(0) instead of DATETIME2(7).

DATETIME2(0) provides second-level precision (yyyy-MM-dd HH:mm:ss), which is sufficient for the vast majority of business use cases, while offering:

Smaller storage footprint (6 bytes)

Better performance

Improved compatibility with client tools like Excel