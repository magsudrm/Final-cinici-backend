using CiniciFinal.Areas.manage.ViewModels;
using CiniciFinal.DAL;
using CiniciFinal.Enums;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    public class AdminLoginController : Controller
    {
        private readonly UserManager<AppUser> _usermanager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly CiniciDbContext _context;

        public AdminLoginController(UserManager<AppUser> usermanager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager, CiniciDbContext context)
        {
            _usermanager = usermanager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _context = context;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(AdminLoginViewModel account)
        {
            if (!ModelState.IsValid) return View();

            AppUser user = await _usermanager.FindByNameAsync(account.UserName);
            if (user is null)
            {
                ModelState.AddModelError("", "Username or password is incorrect");
                return View();
            }

            var userRoles = await _usermanager.GetRolesAsync(user);

            if (userRoles.Contains(Roles.Superadmin.ToString()) || userRoles.Contains(Roles.Admin.ToString()))
            {
                Microsoft.AspNetCore.Identity.SignInResult result = await _signInManager.PasswordSignInAsync(user, account.Password, account.RememberMe, true);

                if (!result.Succeeded)
                {
                    if (result.IsLockedOut)
                    {
                        ModelState.AddModelError("", "Due to your efforts, our account was blocked for 5 minutes");
                    }
                    ModelState.AddModelError("", "Username or password is incorrect");
                    return View();
                }
            }
            return RedirectToAction("Index", "Dashboard");

        }

        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction(nameof(Login));
        }


    }
}
