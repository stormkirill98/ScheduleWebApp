using System.ComponentModel.DataAnnotations;

namespace Database.Entities
{
    public class LessonInfo
    {
        [Key]
        public int Key { get; set; }
        public Lesson Lesson { get; set; }
        public Discipline Discipline { get; set; }
        public DisciplineType DisciplineType { get; set; }
        public Cabinet Cabinet { get; set; }
        public Teacher Teacher { get; set; }
        public StudyGroup StudyGroup { get; set; }
        public bool Remove { get; set; } = false;

        public LessonInfo() { }

        public LessonInfo(
            Discipline discipline,
            DisciplineType disciplineType,
            Cabinet cabinet, 
            Teacher teacher,
            Lesson lesson,
            StudyGroup studyGroup
        ) {
            Lesson = lesson;
            Discipline = discipline;
            DisciplineType = disciplineType;
            Cabinet = cabinet;
            Teacher = teacher;
            StudyGroup = studyGroup;
        }

        public LessonInfo(
            int id, 
            Discipline discipline, 
            DisciplineType disciplineType,
            Cabinet cabinet, 
            Teacher teacher,
            Lesson lesson,
            StudyGroup studyGroup
        ) : this(discipline, disciplineType, cabinet, teacher, lesson, studyGroup)
        {
            Key = id;
        }
    }
}
