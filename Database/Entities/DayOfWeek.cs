using System.Data;

namespace Database.Entities
{
    public struct DayOfWeek
    {
        public int Id { get; }
        public string Day { get; }
        public string Abbreviation { get; }

        public DayOfWeek(DataRow row)
        {
            Id = (int)row["Key"];
            Day = (string)row["DayOfWeek"];
            Abbreviation = (string)row["Abbreviation"];
        }
    }
}
