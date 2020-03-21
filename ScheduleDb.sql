
USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_accessadmin')      
     EXEC (N'CREATE SCHEMA db_accessadmin')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_backupoperator')      
     EXEC (N'CREATE SCHEMA db_backupoperator')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_datareader')      
     EXEC (N'CREATE SCHEMA db_datareader')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_datawriter')      
     EXEC (N'CREATE SCHEMA db_datawriter')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_ddladmin')      
     EXEC (N'CREATE SCHEMA db_ddladmin')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_denydatareader')      
     EXEC (N'CREATE SCHEMA db_denydatareader')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_denydatawriter')      
     EXEC (N'CREATE SCHEMA db_denydatawriter')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_owner')      
     EXEC (N'CREATE SCHEMA db_owner')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'db_securityadmin')      
     EXEC (N'CREATE SCHEMA db_securityadmin')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'dbo')      
     EXEC (N'CREATE SCHEMA dbo')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'guest')      
     EXEC (N'CREATE SCHEMA guest')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'INFORMATION_SCHEMA')      
     EXEC (N'CREATE SCHEMA INFORMATION_SCHEMA')                                   
 GO                                                               

USE connectdb
GO
 IF NOT EXISTS(SELECT * FROM sys.schemas WHERE [name] = N'sys')      
     EXEC (N'CREATE SCHEMA sys')                                   
 GO                                                               

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Cabinet'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'Cabinet'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[Cabinet]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'DayOfWeek'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'DayOfWeek'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[DayOfWeek]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Discipline'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'Discipline'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[Discipline]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'DisciplineType'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'DisciplineType'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[DisciplineType]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[DisciplineType]
(

   /*
   *   SSMA warning messages:
   *   A2SS0030: Column 'Key' has a name that might cause problems for the Access application to function correctly against SQL Server.
   */

   [Key] int IDENTITY(1, 1)  NOT NULL,
   [Type] nvarchar(255)  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DisciplineType]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DisciplineType'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DisciplineType].[Key]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DisciplineType',
        N'COLUMN', N'Key'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DisciplineType].[Type]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DisciplineType',
        N'COLUMN', N'Type'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Lesson'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'Lesson'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[Lesson]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Parity'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'Parity'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[Parity]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[Schedule]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE 
[dbo].[Schedule]
(
   [ScheduleID] int IDENTITY(1, 1)  NOT NULL,
   [DayOfWeekID] int  NOT NULL,
   [ParityID] int  NOT NULL,
   [LessonID] int  NOT NULL,
   [StudyGroupID] int  NOT NULL,
   [DisciplineID] int  NOT NULL,
   [DisciplineTypeID] int  NOT NULL,
   [CabinetID] int  NOT NULL,
   [TeacherId] int  NULL
)
WITH (DATA_COMPRESSION = NONE)
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[ScheduleID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'ScheduleID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[DayOfWeekID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'DayOfWeekID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[ParityID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'ParityID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[LessonID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'LessonID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[StudyGroupID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'StudyGroupID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[DisciplineID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'DisciplineID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[DisciplineTypeID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'DisciplineTypeID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[CabinetID]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'CabinetID'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[TeacherId]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'COLUMN', N'TeacherId'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'StudyGroup'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'StudyGroup'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[StudyGroup]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Teacher'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'Teacher'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[Teacher]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'User'  AND sc.name = N'dbo'  AND type in (N'U'))
BEGIN

  DECLARE @drop_statement nvarchar(500)

  DECLARE drop_cursor CURSOR FOR
      SELECT 'alter table '+quotename(schema_name(ob.schema_id))+
      '.'+quotename(object_name(ob.object_id))+ ' drop constraint ' + quotename(fk.name) 
      FROM sys.objects ob INNER JOIN sys.foreign_keys fk ON fk.parent_object_id = ob.object_id
      WHERE fk.referenced_object_id = 
          (
             SELECT so.object_id 
             FROM sys.objects so JOIN sys.schemas sc
             ON so.schema_id = sc.schema_id
             WHERE so.name = N'User'  AND sc.name = N'dbo'  AND type in (N'U')
           )

  OPEN drop_cursor

  FETCH NEXT FROM drop_cursor
  INTO @drop_statement

  WHILE @@FETCH_STATUS = 0
  BEGIN
     EXEC (@drop_statement)

     FETCH NEXT FROM drop_cursor
     INTO @drop_statement
  END

  CLOSE drop_cursor
  DEALLOCATE drop_cursor

  DROP TABLE [dbo].[User]
END 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Cabinet$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[Cabinet] DROP CONSTRAINT [Cabinet$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Cabinet]
 ADD CONSTRAINT [Cabinet$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'DayOfWeek$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[DayOfWeek] DROP CONSTRAINT [DayOfWeek$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[DayOfWeek]
 ADD CONSTRAINT [DayOfWeek$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Discipline$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[Discipline] DROP CONSTRAINT [Discipline$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Discipline]
 ADD CONSTRAINT [Discipline$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'DisciplineType$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[DisciplineType] DROP CONSTRAINT [DisciplineType$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[DisciplineType]
 ADD CONSTRAINT [DisciplineType$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[DisciplineType].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'DisciplineType',
        N'CONSTRAINT', N'DisciplineType$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Lesson$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[Lesson] DROP CONSTRAINT [Lesson$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Lesson]
 ADD CONSTRAINT [Lesson$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Parity$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[Parity] DROP CONSTRAINT [Parity$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Parity]
 ADD CONSTRAINT [Parity$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([ScheduleID] ASC)
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[PrimaryKey]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$PrimaryKey'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'StudyGroup$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[StudyGroup] DROP CONSTRAINT [StudyGroup$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[StudyGroup]
 ADD CONSTRAINT [StudyGroup$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Teacher$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[Teacher] DROP CONSTRAINT [Teacher$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Teacher]
 ADD CONSTRAINT [Teacher$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Key] ASC)
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

GO


USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'User$PrimaryKey'  AND sc.name = N'dbo'  AND type in (N'PK'))
ALTER TABLE [dbo].[User] DROP CONSTRAINT [User$PrimaryKey]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[User]
 ADD CONSTRAINT [User$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([Id] ASC)
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

GO


USE connectdb
GO

   /*
   *   SSMA informational messages:
   *   A2SS0029: Index name 'DisciplineDiscipline' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Discipline'  AND sc.name = N'dbo'  AND si.name = N'Discipline$DisciplineDiscipline' AND so.type in (N'U'))
   DROP INDEX [Discipline$DisciplineDiscipline] ON [dbo].[Discipline] 
GO
CREATE NONCLUSTERED INDEX [Discipline$DisciplineDiscipline] ON [dbo].[Discipline]
(
   [Discipline] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
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
GO

USE connectdb
GO

   /*
   *   SSMA informational messages:
   *   A2SS0029: Index name 'CabinetSchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$CabinetSchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$CabinetSchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$CabinetSchedule] ON [dbo].[Schedule]
(
   [CabinetID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[CabinetSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$CabinetSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO

   /*
   *   SSMA warning messages:
   *   A2SS0030: Index 'Day of weekSchedule' has a name that might cause problems for the Access application to function correctly against SQL Server.

   *   SSMA informational messages:
   *   A2SS0029: Index name 'Day of weekSchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$Day of weekSchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$Day of weekSchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$Day of weekSchedule] ON [dbo].[Schedule]
(
   [DayOfWeekID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[Day of weekSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$Day of weekSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO

   /*
   *   SSMA warning messages:
   *   A2SS0030: Index 'Discipline typeSchedule' has a name that might cause problems for the Access application to function correctly against SQL Server.

   *   SSMA informational messages:
   *   A2SS0029: Index name 'Discipline typeSchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$Discipline typeSchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$Discipline typeSchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$Discipline typeSchedule] ON [dbo].[Schedule]
(
   [DisciplineTypeID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[Discipline typeSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$Discipline typeSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO

   /*
   *   SSMA informational messages:
   *   A2SS0029: Index name 'DisciplineSchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$DisciplineSchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$DisciplineSchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$DisciplineSchedule] ON [dbo].[Schedule]
(
   [DisciplineID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[DisciplineSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$DisciplineSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO

   /*
   *   SSMA informational messages:
   *   A2SS0029: Index name 'LessonSchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$LessonSchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$LessonSchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$LessonSchedule] ON [dbo].[Schedule]
(
   [LessonID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[LessonSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$LessonSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO

   /*
   *   SSMA informational messages:
   *   A2SS0029: Index name 'ParitySchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$ParitySchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$ParitySchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$ParitySchedule] ON [dbo].[Schedule]
(
   [ParityID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[ParitySchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$ParitySchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO

   /*
   *   SSMA warning messages:
   *   A2SS0030: Index 'Study groupSchedule' has a name that might cause problems for the Access application to function correctly against SQL Server.

   *   SSMA informational messages:
   *   A2SS0029: Index name 'Study groupSchedule' was changed during conversion.
   */


IF EXISTS (
       SELECT * FROM sys.objects  so JOIN sys.indexes si
       ON so.object_id = si.object_id
       JOIN sys.schemas sc
       ON so.schema_id = sc.schema_id
       WHERE so.name = N'Schedule'  AND sc.name = N'dbo'  AND si.name = N'Schedule$Study groupSchedule' AND so.type in (N'U'))
   DROP INDEX [Schedule$Study groupSchedule] ON [dbo].[Schedule] 
GO
CREATE NONCLUSTERED INDEX [Schedule$Study groupSchedule] ON [dbo].[Schedule]
(
   [StudyGroupID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] 
GO
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[Study groupSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'INDEX', N'Schedule$Study groupSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH
GO

USE connectdb
GO
IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$CabinetSchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$CabinetSchedule]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Foreign key name 'CabinetSchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$CabinetSchedule]
 FOREIGN KEY 
   ([CabinetID])
 REFERENCES 
   [connectdb].[dbo].[Cabinet]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[CabinetSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$CabinetSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$Day of weekSchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$Day of weekSchedule]
 GO


/*
*   SSMA warning messages:
*   A2SS0030: Foreign key 'Day of weekSchedule' has a name that might cause problems for the Access application to function correctly against SQL Server.

*   SSMA informational messages:
*   A2SS0029: Foreign key name 'Day of weekSchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$Day of weekSchedule]
 FOREIGN KEY 
   ([DayOfWeekID])
 REFERENCES 
   [connectdb].[dbo].[DayOfWeek]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[Day of weekSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$Day of weekSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$Discipline typeSchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$Discipline typeSchedule]
 GO


/*
*   SSMA warning messages:
*   A2SS0030: Foreign key 'Discipline typeSchedule' has a name that might cause problems for the Access application to function correctly against SQL Server.

*   SSMA informational messages:
*   A2SS0029: Foreign key name 'Discipline typeSchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$Discipline typeSchedule]
 FOREIGN KEY 
   ([DisciplineTypeID])
 REFERENCES 
   [connectdb].[dbo].[DisciplineType]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[Discipline typeSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$Discipline typeSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$DisciplineSchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$DisciplineSchedule]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Foreign key name 'DisciplineSchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$DisciplineSchedule]
 FOREIGN KEY 
   ([DisciplineID])
 REFERENCES 
   [connectdb].[dbo].[Discipline]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[DisciplineSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$DisciplineSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$LessonSchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$LessonSchedule]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Foreign key name 'LessonSchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$LessonSchedule]
 FOREIGN KEY 
   ([LessonID])
 REFERENCES 
   [connectdb].[dbo].[Lesson]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[LessonSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$LessonSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$ParitySchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$ParitySchedule]
 GO


/*
*   SSMA informational messages:
*   A2SS0029: Foreign key name 'ParitySchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$ParitySchedule]
 FOREIGN KEY 
   ([ParityID])
 REFERENCES 
   [connectdb].[dbo].[Parity]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[ParitySchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$ParitySchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO

IF EXISTS (SELECT * FROM sys.objects so JOIN sys.schemas sc ON so.schema_id = sc.schema_id WHERE so.name = N'Schedule$Study groupSchedule'  AND sc.name = N'dbo'  AND type in (N'F'))
ALTER TABLE [dbo].[Schedule] DROP CONSTRAINT [Schedule$Study groupSchedule]
 GO


/*
*   SSMA warning messages:
*   A2SS0030: Foreign key 'Study groupSchedule' has a name that might cause problems for the Access application to function correctly against SQL Server.

*   SSMA informational messages:
*   A2SS0029: Foreign key name 'Study groupSchedule' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$Study groupSchedule]
 FOREIGN KEY 
   ([StudyGroupID])
 REFERENCES 
   [connectdb].[dbo].[StudyGroup]     ([Key])
    ON DELETE CASCADE
    ON UPDATE CASCADE
BEGIN TRY
    EXEC sp_addextendedproperty
        N'MS_SSMA_SOURCE', N'ScheduleBD.[Schedule].[Study groupSchedule]',
        N'SCHEMA', N'dbo',
        N'TABLE', N'Schedule',
        N'CONSTRAINT', N'Schedule$Study groupSchedule'
END TRY
BEGIN CATCH
    IF (@@TRANCOUNT > 0) ROLLBACK
    PRINT ERROR_MESSAGE()
END CATCH

GO


USE connectdb
GO
ALTER TABLE  [dbo].[Cabinet]
 ADD DEFAULT 0 FOR [Floor]
GO

ALTER TABLE  [dbo].[Cabinet]
 ADD DEFAULT 0 FOR [Number]
GO


USE connectdb
GO
ALTER TABLE  [dbo].[Lesson]
 ADD DEFAULT 0 FOR [Number]
GO

