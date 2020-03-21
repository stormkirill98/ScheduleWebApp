using System.Data;

namespace Database.Entities
{
    public class Teacher
    {
        public int Id { get; }
        public string FirstName { get; set; }
        public string Patronymic { get; set; }
        public string LastName { get; set; }
        public string Cathedra { get; set; }

        public string FullName { get; set; }

        public Teacher(DataRow row)
        {
            Id = (int)row["Key"];
            FirstName = (string)row["FirstName"];
            Patronymic = (string)row["Patronymic"];
            LastName = (string)row["LastName"];
            Cathedra = (string)row["Cathedra"];

            FullName = string.Format("{0} {1} {2}", LastName, FirstName, Patronymic);
        }

        public Teacher(string firstName, string patronymic, string lastName, string cathedra)
        {
            Id = 0;

            FirstName = firstName;
            Patronymic = patronymic;
            LastName = lastName;
            Cathedra = cathedra;

            FullName = string.Format("{0} {1} {2}", LastName, FirstName, Patronymic);
        }
    }
}
