using Database.Entities;
using Microsoft.EntityFrameworkCore;
using ScheduleWebApp.Helpers;
using System.Collections.Generic;
using System.Linq;

namespace ScheduleWebApp.Services
{
    public interface IDataService
    {
        void SaveSchedule(List<Schedule> week);
        Week GetGroupSchedule(int groupId, bool isParity);
        Week GetTeacherSchedule(int teacherId, bool isParity);
    }

    public class DataService : IDataService
    {
        private DataContext _context;

        public DataService(DataContext context)
        {
            _context = context;
            _context.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
        }

        public void SaveSchedule(List<Schedule> schedules)
        {
            schedules.ForEach(schedule => {
                int scheduleId = getScheduleId(schedule);
                if (scheduleId == 0)
                {
                    _context.Schedule.Add(schedule);
                } else
                {
                    schedule.ScheduleID = scheduleId;
                    _context.Schedule.Update(schedule);
                }
            });

            _context.SaveChanges();
        }

        public Week GetGroupSchedule(int groupId, bool isParity)
        {
            List<Schedule> scheduleList = new List<Schedule>(
                _context.Schedule
                    .ToList()
                    .Where(o => o.StudyGroupID == groupId && o.ParityID == (isParity ? 1 : 2))
            );

            return ToWeek(scheduleList);
        }

        public Week GetTeacherSchedule(int teacherId, bool isParity)
        {
            List<Schedule> scheduleList =  new List<Schedule>(
                _context.Schedule
                    .ToList()
                    .Where(o => o.TeacherId == teacherId && o.ParityID == (isParity ? 1 : 2))
            );

            return ToWeek(scheduleList);
        }

        private Week ToWeek(List<Schedule> scheduleList)
        {
            Week week = new Week();

            scheduleList.ForEach(schedule =>
            {
                Lesson lesson = ToLesson(schedule);
                week.SetLesson(
                    schedule.DayOfWeekID - 1,
                    schedule.LessonID - 1,
                    lesson
                );
            });

            return week;
        }

        private Lesson ToLesson(Schedule schedule)
        {
            Discipline discipline = _context.Discipline.Find(schedule.DisciplineID);
            DisciplineType disciplineType = _context.DisciplineType.Find(schedule.DisciplineTypeID);
            Cabinet cabinet = _context.Cabinet.Find(schedule.CabinetID);
            Teacher teacher = _context.Teacher.Find(schedule.TeacherId);
            StudyGroup group = _context.StudyGroup.Find(schedule.StudyGroupID);

            return new Lesson(discipline, disciplineType, cabinet, teacher, group);
        }

        private int getScheduleId(Schedule schedule)
        {
            Schedule foundSchedule = _context.Schedule.FirstOrDefault(
                o => o.StudyGroupID == schedule.StudyGroupID && o.LessonID == schedule.LessonID && o.ParityID == schedule.ParityID
            );
            return foundSchedule == null ? 0 : foundSchedule.ScheduleID;
        }

    }
}
