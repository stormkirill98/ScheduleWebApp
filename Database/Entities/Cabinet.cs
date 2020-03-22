using System.Data;
using System.ComponentModel.DataAnnotations;

namespace Database.Entities
{
    public class Cabinet
    {
        [Key]
        public int Key { get; set; }
        public int Floor { get; set; }
        public int Number { get; set; }
    }
}
