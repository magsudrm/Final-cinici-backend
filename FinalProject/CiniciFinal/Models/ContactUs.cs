namespace CiniciFinal.Models
{
    public class ContactUs
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Comment { get; set; }
        public DateTime SendTime { get; set; }
        public bool IsReply { get; set; }
    }
}
