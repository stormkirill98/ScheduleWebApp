using System.Data;

namespace Database.Entities
{
    public struct Discipline
    {
        public int Id { get; }
        public string Name { get; set; }

        public Discipline(DataRow row)
        {
            Id = (int)row["Key"];
            Name = (string)row["Discipline"];
        }

        public Discipline(string name) : this()
        {
            Name = name;
        }
    }
}
