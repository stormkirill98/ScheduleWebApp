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
GO
/*
*   SSMA informational messages:
*   A2SS0029: Primary key name 'PrimaryKey' was changed during conversion.
*/


ALTER TABLE [dbo].[Schedule]
 ADD CONSTRAINT [Schedule$PrimaryKey]
   PRIMARY KEY
   CLUSTERED ([ScheduleID] ASC)
GO
CREATE NONCLUSTERED INDEX [Schedule$CabinetSchedule] ON [dbo].[Schedule]
(
   [CabinetID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Schedule$Day of weekSchedule] ON [dbo].[Schedule]
(
   [DayOfWeekID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Schedule$Discipline typeSchedule] ON [dbo].[Schedule]
(
   [DisciplineTypeID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Schedule$DisciplineSchedule] ON [dbo].[Schedule]
(
   [DisciplineID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Schedule$LessonSchedule] ON [dbo].[Schedule]
(
   [LessonID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Schedule$ParitySchedule] ON [dbo].[Schedule]
(
   [ParityID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Schedule$Study groupSchedule] ON [dbo].[Schedule]
(
   [StudyGroupID] ASC
)
WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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
GO
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