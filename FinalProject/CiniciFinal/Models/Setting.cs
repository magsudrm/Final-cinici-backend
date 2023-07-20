using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace CiniciFinal.Models
{
    public class Setting
    {
        [Required]
        [MaxLength(50)]
        public string Key { get; set; }
        [MaxLength(1000)]
        public string Value { get; set; }
        [NotMapped]
        public IFormFile SettingFile { get; set; }
    }
}
