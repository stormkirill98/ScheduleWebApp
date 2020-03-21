﻿using System.Collections.Generic;

namespace Database.Entities
{
    public class WeekSchedule
    {
        public List<DaySchedule> DaySchedules { get; }
        public StudyGroup StudyGroup { get; }
        public Parity Parity { get; }

        public WeekSchedule()
        {
            DaySchedules = new List<DaySchedule>(6);

            for (int i = 0; i < 6; i++)
            {
                DaySchedules.Add(new DaySchedule());
            }
        }

        public WeekSchedule(StudyGroup studyGroup, Parity parity) : this()
        {
            StudyGroup = studyGroup;
            Parity = parity;
        }

        public void SetDaySchedule(int num, DaySchedule daySchedule)
        {
            if (num >= 6) return;

            DaySchedules[num] = daySchedule;
        }
    }
}
