﻿namespace CiniciFinal.Models
{
    public class ProductImage
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public string Image { get; set; }
        public bool? PosterStatus { get; set; }
        public Product Product { get; set; }
    }
}
