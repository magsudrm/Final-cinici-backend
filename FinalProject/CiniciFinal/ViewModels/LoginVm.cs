using System.ComponentModel.DataAnnotations;

namespace CiniciFinal.ViewModels
{
    public class LoginVm
    {
        public string UserName { get; set; }


        [DataType(DataType.Password)]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}
