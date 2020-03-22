using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Database.Entities
{
    public class StudyGroup
    {
        [Key]
        public int Key { get; set; }
        public string Name { get; set; }
    }
}
