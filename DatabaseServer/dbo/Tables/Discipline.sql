CREATE TABLE 
[dbo].[Discipline]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [Discipline] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Discipline]
 ADD CONSTRAINT [Discipline$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
CREATE NONCLUSTERED INDEX [Discipline$DisciplineDiscipline] ON [dbo].[Discipline]
(
   [Discipline] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Discipline]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Discipline'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Discipline].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Discipline',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Discipline].[Discipline]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Discipline',
        N'COLUMN', N'Discipline'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Discipline].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Discipline',
        N'CONSTRAINT', N'Discipline$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Discipline].[DisciplineDiscipline]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Discipline',
        N'INDEX', N'Discipline$DisciplineDiscipline'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH