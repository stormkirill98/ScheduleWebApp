using System.Data;

namespace Database.Entities
{
    public struct Parity
    {
        public int Id { get; }
        public string Week { get; }

        public Parity(DataRow row)
        {
            Id = (int)row["Key"];
            Week = (string)row["Week"];
        }

        public Parity(int id, string week)
        {
            Id = id;
            Week = week;
        }
    }
}
