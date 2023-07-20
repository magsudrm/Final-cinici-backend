using System.ComponentModel.DataAnnotations.Schema;

namespace CiniciFinal.Models
{
    public class Collection
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string ButtonUrl { get; set; }
        public string Image { get; set; }
        [NotMapped]
        public IFormFile CollectionImage { get; set; }
    }
}
