using System.Data;

namespace Database.Entities
{
    public struct Lesson
    {
        public int Id { get; }
        public int Number { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }

        public Lesson(DataRow row)
        {
            Id = (int)row["Key"];
            Number = (int)row["Number"];
            StartTime = (string)row["StartTime"];
            EndTime = (string)row["EndTime"];
        }
    }
}
