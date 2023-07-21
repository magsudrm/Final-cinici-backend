using System.ComponentModel.DataAnnotations;
using CiniciFinal.Enums;

namespace CiniciFinal.ViewModels
{
    public class RegisterVM
    {
        public string Firstname { get; set; }

        public string Lastname { get; set; }

        public string Username { get; set; }

        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }


        [DataType(DataType.Password)]
        public string Password { get; set; }
        [DataType(DataType.Password), Compare(nameof(Password))]

        public string ConfirmPassword { get; set; }
        public bool Terms { get; set; }
    }
}
