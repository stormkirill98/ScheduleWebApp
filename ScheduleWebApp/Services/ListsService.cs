using Database.Entities;
using ScheduleWebApp.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScheduleWebApp.Services
{
    public interface IListsService
    {
        List<Cabinet> GetCabinets();
        List<Discipline> GetDisciplines();
        List<DisciplineType> GetDisciplineTypes();
        List<Teacher> GetTeachers();
        List<StudyGroup> GetStudyGroups();
        void AddDiscipline(Discipline discipline);
        void AddDisciplineType(DisciplineType disciplineType);
        void AddCabinet(Cabinet cabinet);
        void AddTeacher(Teacher teacher);
        void AddGroup(StudyGroup group);
    }

    public class ListsService : IListsService
    {
        private DataContext _context;

        public ListsService(DataContext context)
        {
            _context = context;
        }

        public List<Cabinet> GetCabinets()
        {
            return _context.Cabinet.ToList();
        }

        public List<Discipline> GetDisciplines()
        {
            return _context.Discipline.ToList();
        }

        public List<DisciplineType> GetDisciplineTypes()
        {
            return _context.DisciplineType.ToList();
        }

        public List<Teacher> GetTeachers()
        {
            return _context.Teacher.ToList();
        }

        public void AddDiscipline(Discipline discipline)
        {
            _context.Discipline.Add(discipline);
            _context.SaveChanges();
        }

        public void AddDisciplineType(DisciplineType disciplineType)
        {
            _context.DisciplineType.Add(disciplineType);
            _context.SaveChanges();
        }

        public void AddCabinet(Cabinet cabinet)
        {
            _context.Cabinet.Add(cabinet);
            _context.SaveChanges();
        }

        public void AddTeacher(Teacher teacher)
        {
            _context.Teacher.Add(teacher);
            _context.SaveChanges();
        }

        public List<StudyGroup> GetStudyGroups()
        {
            return _context.StudyGroup.ToList();
        }

        public void AddGroup(StudyGroup group)
        {
            _context.StudyGroup.Add(group);
            _context.SaveChanges();
        }
    }
}
