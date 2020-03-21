CREATE TABLE 
[dbo].[Lesson]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [Number] int  NULL,
   [StartTime] nvarchar(255)  NULL,
   [EndTime] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
ALTER TABLE  [dbo].[Lesson]
 ADD DEFAULT 0 FOR [Number]
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Lesson]
 ADD CONSTRAINT [Lesson$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Lesson]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Lesson'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Lesson].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Lesson',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Lesson].[Number]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Lesson',
        N'COLUMN', N'Number'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Lesson].[StartTime]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Lesson',
        N'COLUMN', N'StartTime'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Lesson].[EndTime]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Lesson',
        N'COLUMN', N'EndTime'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Lesson].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Lesson',
        N'CONSTRAINT', N'Lesson$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH