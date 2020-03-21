CREATE TABLE 
[dbo].[Teacher]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [FirstName] nvarchar(255)  NULL,
   [LastName] nvarchar(255)  NULL,
   [Patronymic] nvarchar(255)  NULL,
   [Cathedra] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Teacher]
 ADD CONSTRAINT [Teacher$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher].[FirstName]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher',
        N'COLUMN', N'FirstName'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher].[LastName]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher',
        N'COLUMN', N'LastName'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher].[Patronymic]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher',
        N'COLUMN', N'Patronymic'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher].[Cathedra]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher',
        N'COLUMN', N'Cathedra'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Teacher].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Teacher',
        N'CONSTRAINT', N'Teacher$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH