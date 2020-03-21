CREATE TABLE 
[dbo].[User]
(
   [Id] int IDENTITY(1, 1)  NOT NULL,
   [FirstName] nvarchar(255)  NULL,
   [LastName] nvarchar(255)  NULL,
   [Username] nvarchar(255)  NULL,
   [PasswordHash] nvarchar(max)  NULL,
   [PasswordSalt] nvarchar(max)  NULL,
   [Role] nvarchar(255)  NULL,
   [SSMA_TimeStamp] timestamp  NOT NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[User]
 ADD CONSTRAINT [User$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Id] ASC)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[Id]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'Id'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[FirstName]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'FirstName'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[LastName]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'LastName'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[Username]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'Username'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[PasswordHash]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'PasswordHash'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[PasswordSalt]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'PasswordSalt'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[Role]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'COLUMN', N'Role'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[User].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'User',
        N'CONSTRAINT', N'User$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH