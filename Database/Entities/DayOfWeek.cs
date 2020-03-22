using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Database.Entities
{
    public class DayOfWeek
    {
        [Key]
        public int Key { get; set; }
        public string Day { get; set; }
        public string Abbreviation { get; set; }
    }
}
