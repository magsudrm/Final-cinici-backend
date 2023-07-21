using System.ComponentModel.DataAnnotations;
using CiniciFinal.Models;

namespace CiniciFinal.ViewModels
{
    public class AccountVM
    {
        public AppUser User { get; set; }
        public string Token { get; set; }
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [DataType(DataType.Password)]
        [Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }

    }
}
