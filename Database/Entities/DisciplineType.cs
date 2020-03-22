using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Database.Entities
{
    public class DisciplineType
    {
        [Key]
        public int Key { get; set; }
        public string Type { get; set; }
    }
}
