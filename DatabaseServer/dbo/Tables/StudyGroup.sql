CREATE TABLE 
[dbo].[StudyGroup]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Group' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Group] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[StudyGroup]
 ADD CONSTRAINT [StudyGroup$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[StudyGroup]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'StudyGroup'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[StudyGroup].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'StudyGroup',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[StudyGroup].[Group]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'StudyGroup',
        N'COLUMN', N'Group'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[StudyGroup].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'StudyGroup',
        N'CONSTRAINT', N'StudyGroup$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH