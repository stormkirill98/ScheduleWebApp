using System.Collections.Generic;

namespace Database.Entities
{
    public class Week
    {
        public List<Day> Days { get; }

        public Week()
        {
            Days = new List<Day>(6);

            for (int i = 0; i < 6; i++)
            {
                Days.Add(new Day(i));
            }
        }

        public void SetLesson(int dayNum, int lessonNum, Lesson lesson)
        {
            Days[dayNum].SetLesson(lessonNum, lesson);
        }
    }
}
