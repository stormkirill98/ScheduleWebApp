using Database.Entities;
using ScheduleWebApp.Helpers;
using System.Collections.Generic;

namespace ScheduleWebApp.Services
{
    public interface IDataService
    {
        void SaveSchedule(List<Schedule> week);
    }

    public class DataService : IDataService
    {
        private DataContext _context;

        public DataService(DataContext context)
        {
            _context = context;
        }

        public void SaveSchedule(List<Schedule> schedules)
        {
            schedules.ForEach(schedule => _context.Schedule.Add(schedule));
            _context.SaveChanges();
        }
    }
}
