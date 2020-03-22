using Database.Entities;
using Microsoft.EntityFrameworkCore;
using ScheduleWebApp.Entities;

namespace ScheduleWebApp.Helpers
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<User> User { get; set; }

        public DbSet<Discipline> Discipline { get; set; }
        public DbSet<DisciplineType> DisciplineType { get; set; }
        public DbSet<Cabinet> Cabinet { get; set; }
        public DbSet<Teacher> Teacher { get; set; }
        public DbSet<StudyGroup> StudyGroup { get; set; }
    }
}
