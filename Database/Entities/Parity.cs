using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Database.Entities
{
    public class Parity
    {
        [Key]
        public int Key { get; set; }
        public string Week { get; set; }
    }
}
