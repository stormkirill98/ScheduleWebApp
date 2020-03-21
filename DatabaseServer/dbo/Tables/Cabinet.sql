CREATE TABLE 
[dbo].[Cabinet]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [Floor] int  NULL,
   [Number] int  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
ALTER TABLE  [dbo].[Cabinet]
 ADD DEFAULT 0 FOR [Floor]
GO
ALTER TABLE  [dbo].[Cabinet]
 ADD DEFAULT 0 FOR [Number]
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Cabinet]
 ADD CONSTRAINT [Cabinet$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Cabinet]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Cabinet'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Cabinet].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Cabinet',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Cabinet].[Floor]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Cabinet',
        N'COLUMN', N'Floor'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Cabinet].[Number]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Cabinet',
        N'COLUMN', N'Number'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Cabinet].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Cabinet',
        N'CONSTRAINT', N'Cabinet$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH