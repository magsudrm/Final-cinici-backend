using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace CiniciFinal.Models
{
    public class Slider
    {
        public int Id { get; set; }

        public int Order { get; set; }

        [MaxLength(30)]
        public string Title1 { get; set; }
        [MaxLength(30)]
        public string Title2 { get; set; }

        [MaxLength(150)]
        public string Image { get; set; }
        public string ButtonText { get; set; }
        [MaxLength(220)]
        public string ButtonUrl { get; set; }
        [NotMapped]
        public IFormFile ImageFile { get; set; }
    }
}
