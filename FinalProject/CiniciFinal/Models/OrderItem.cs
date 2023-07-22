namespace CiniciFinal.Models
{
    public class OrderItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public int? ProductId { get; set; }
        public int Quantity { get; set; }
        public string Size { get; set; }

        public int OrderId { get; set; }

        public Product Product { get; set; }

        public Order Order { get; set; }


    }
}
