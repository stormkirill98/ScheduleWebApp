using System.Data;

namespace Database.Entities
{
    public struct DisciplineType
    {
        public int Id { get; }
        public string Type { get; }

        public DisciplineType(DataRow row)
        {
            Id = (int)row["Key"];
            Type = (string)row["Type"];
        }
    }
}
