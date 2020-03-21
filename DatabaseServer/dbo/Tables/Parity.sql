CREATE TABLE 
[dbo].[Parity]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [Week] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Parity]
 ADD CONSTRAINT [Parity$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Parity]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Parity'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Parity].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Parity',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Parity].[Week]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Parity',
        N'COLUMN', N'Week'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Parity].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Parity',
        N'CONSTRAINT', N'Parity$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH