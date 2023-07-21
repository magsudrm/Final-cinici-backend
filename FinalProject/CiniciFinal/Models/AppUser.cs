using Microsoft.AspNetCore.Identity;

namespace CiniciFinal.Models
{
	public class AppUser:IdentityUser
	{
		public string FullName { get; set; }
		public bool IsAdmin { get; set; }
		public bool IsSuperAdmin { get; set; }
        //public List<BasketItem> BasketItems { get; set; }
    }
}
