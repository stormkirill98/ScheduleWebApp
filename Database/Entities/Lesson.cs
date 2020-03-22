using System.ComponentModel.DataAnnotations;

namespace Database.Entities
{
    public class Lesson
    {
        public bool isExists { get; set; }
        public Discipline Discipline { get; set; }
        public DisciplineType DisciplineType { get; set; }
        public Cabinet Cabinet { get; set; }
        public Teacher Teacher { get; set; }
        public StudyGroup Group { get; set; }

        public Lesson() {
            isExists = false;
        }

        public Lesson(
            Discipline discipline,
            DisciplineType disciplineType,
            Cabinet cabinet, 
            Teacher teacher,
            StudyGroup studyGroup
        ) {
            isExists = true;
            Discipline = discipline;
            DisciplineType = disciplineType;
            Cabinet = cabinet;
            Teacher = teacher;
            Group = studyGroup;
        }

    }
}
