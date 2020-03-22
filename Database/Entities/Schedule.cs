using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Database.Entities
{
    public class Schedule
    {
        [Key]
        public int ScheduleID { get; set; }
        public int DayOfWeekID { get; set; }
        public int ParityID { get; set; }
        public int LessonID { get; set; }
        public int StudyGroupID { get; set; }
        public int DisciplineID { get; set; }
        public int DisciplineTypeID { get; set; }
        public int CabinetID { get; set; }
        public int TeacherId { get; set; }
    }
}
