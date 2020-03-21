namespace Database.Entities
{
    public class LessonInfo
    {
        public int Id { get; }
        public Lesson Lesson { get; set; }
        public Discipline Discipline { get; set; }
        public DisciplineType DisciplineType { get; set; }
        public Cabinet Cabinet { get; set; }
        public Teacher Teacher { get; set; }
        public StudyGroup StudyGroup { get; set; }
        public bool Remove { get; set; } = false;

        public LessonInfo() { }

        public LessonInfo(Discipline discipline, DisciplineType disciplineType,
            Cabinet cabinet, Teacher teacher,
            Lesson lesson = new Lesson(),
            StudyGroup studyGroup = new StudyGroup())
        {
            Lesson = lesson;
            Discipline = discipline;
            DisciplineType = disciplineType;
            Cabinet = cabinet;
            Teacher = teacher;
            StudyGroup = studyGroup;
        }

        public LessonInfo(int id, Discipline discipline, DisciplineType disciplineType,
            Cabinet cabinet, Teacher teacher,
            Lesson lesson = new Lesson(),
            StudyGroup studyGroup = new StudyGroup())
            : this(discipline, disciplineType, cabinet, teacher, lesson, studyGroup)
        {
            Id = id;
        }
    }
}
