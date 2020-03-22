using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Database.Entities
{
    public class Teacher
    {
        [Key]
        public int Key { get; set; }
        public string FirstName { get; set; }
        public string Patronymic { get; set; }
        public string LastName { get; set; }
        public string Cathedra { get; set; }

        public string FullName { 
            get { return string.Format("{0} {1} {2}", LastName, FirstName, Patronymic); } 
        }

        public Teacher() { }

        public Teacher(string firstName, string patronymic, string lastName, string cathedra)
        {
            Key = 0;

            FirstName = firstName;
            Patronymic = patronymic;
            LastName = lastName;
            Cathedra = cathedra;
        }
    }
}
