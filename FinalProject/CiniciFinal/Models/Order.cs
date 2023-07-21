﻿namespace CiniciFinal.Models
{
    public class Order 
    {
        public int Id { get; set; }
        public string City { get; set; }

        public string Address { get; set; }

        public double TotalPrice { get; set; }

        public bool? Status { get; set; }
        public string? Message { get; set; }
        public int Number { get; set; }
        public DateTime Date { get; set; }
        public string AppUserId { get; set; }

        public AppUser AppUser { get; set; }

        public List<OrderItem>? OrderItems { get; set; }
    }
}
