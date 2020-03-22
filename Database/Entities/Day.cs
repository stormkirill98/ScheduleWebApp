using System.Collections.Generic;

namespace Database.Entities
{
    public class Day
    {
        public int number;
        public List<Lesson> Lessons { get; set; }

        public Day(int number)
        {
            this.number = number;

            Lessons = new List<Lesson>(5);

            for (int i = 0; i < 5; i++)
            {
                Lessons.Add(new Lesson());
            }
        }

        public void SetLesson(int num, Lesson lessonInfo)
        {
            if (num >= 5) return;

            Lessons[num] = lessonInfo;
        }
    }
}
