using System.ComponentModel.DataAnnotations.Schema;

namespace CiniciFinal.Models
{
    public class Focus
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string ButtonText { get; set; }
        public string ButtonUrl { get; set; }
        public string Image { get; set; }
        [NotMapped]
        public IFormFile FocusImage { get; set; }
    }
}
