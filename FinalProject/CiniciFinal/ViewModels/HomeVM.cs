using CiniciFinal.Models;

namespace CiniciFinal.ViewModels
{
    public class HomeVM
    {
        public List<Slider> Sliders { get; set; }
        public List<Product> Products { get; set; }
        public List<Focus> Focus { get; set; }
        public List<Brand> Brands { get; set; }
        public List<Category> Categories { get; set; }
        public List<Collection> Collections { get; set; }
        public List<Setting> Settings { get; set; }
    }
}
