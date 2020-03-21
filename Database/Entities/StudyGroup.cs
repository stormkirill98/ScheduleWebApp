using System.Data;

namespace Database.Entities
{
    public struct StudyGroup
    {
        public int Id { get; }
        public string Name { get; }

        public StudyGroup(DataRow row)
        {
            Id = (int)row["Key"];
            Name = (string)row["Group"];
        }

        public StudyGroup(string name) : this()
        {
            Name = name;
        }
    }
}
