using System.Collections.Generic;

namespace Database.Entities
{
    public class DaySchedule
    {
        public List<LessonInfo> Lessons { get; set; }

        public DaySchedule()
        {
            Lessons = new List<LessonInfo>(5);

            for (int i = 0; i < 5; i++)
            {
                Lessons.Add(new LessonInfo());
            }
        }

        public void SetLesson(int num, LessonInfo lessonInfo)
        {
            if (num >= 5) return;

            Lessons[num] = lessonInfo;
        }
    }
}
