using System.Data;

namespace Database.Entities
{
    public struct Cabinet
    {
        public int Id { get; }
        public int Floor { get; set; }
        public int Number { get; set; }

        public Cabinet(DataRow row)
        {
            Id = (int)row["Key"];
            Floor = (int)row["Floor"];
            Number = (int)row["Number"];
        }
    }
}
