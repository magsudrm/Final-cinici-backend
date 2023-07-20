using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using CiniciFinal.Enums;

namespace CiniciFinal.Models
{
    public class Product
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public bool IsDeleted { get; set; }
        public string Color { get; set; }
        public decimal Age { get; set; }
        public bool IsDiscounted { get; set; }
        public decimal DiscountPercent { get; set; }
        public string Size { get; set; }
        public Gender Gender { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }




        [NotMapped]
        public List<IFormFile> ImageFiles { get; set; } = new List<IFormFile>();

        [NotMapped]
        public IFormFile PosterFile { get; set; }
		public List<ProductImage> ProductImages { get; set; } = new List<ProductImage>();

		public Category Category { get; set; }
        public Brand Brand { get; set; }
		[NotMapped]
		public List<int> ProductImageIds { get; set; } = new List<int>();


	}
}
