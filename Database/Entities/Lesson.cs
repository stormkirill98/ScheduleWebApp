using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Database.Entities
{
    public class Lesson
    {
        [Key]
        public int Key { get; set; }
        public int Number { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }

        public Lesson() {
            Key = 0;
            Number = 0;
            StartTime = "";
            EndTime = "";
        }
    }
}
