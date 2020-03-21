CREATE TABLE 
[dbo].[DayOfWeek]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [DayOfWeek] nvarchar(255)  NULL,
   [Abbreviation] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[DayOfWeek]
 ADD CONSTRAINT [DayOfWeek$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DayOfWeek]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DayOfWeek'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DayOfWeek].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DayOfWeek',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DayOfWeek].[DayOfWeek]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DayOfWeek',
        N'COLUMN', N'DayOfWeek'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DayOfWeek].[Abbreviation]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DayOfWeek',
        N'COLUMN', N'Abbreviation'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DayOfWeek].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DayOfWeek',
        N'CONSTRAINT', N'DayOfWeek$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH