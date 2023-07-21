using CiniciFinal.DAL;
using CiniciFinal.Enums;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    public class AdminRegisterController : Controller
    {
        private readonly UserManager<AppUser> _usermanager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly CiniciDbContext _context;

        public AdminRegisterController(UserManager<AppUser> usermanager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager, CiniciDbContext context)
        {
            _usermanager = usermanager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _context = context;
        }

        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM account)
        {
            if (!ModelState.IsValid) return View();
            AppUser user = new()
            {
                FullName = string.Concat(account.Firstname, " ", account.Lastname),
                Email = account.Email,
                UserName = account.Username,
                EmailConfirmed = true

            };
            IdentityResult result = await _usermanager.CreateAsync(user, account.Password);
            if (!result.Succeeded)
            {
                foreach (IdentityError message in result.Errors)
                {
                    ModelState.AddModelError("", message.Description);
                }
                return View();
            }
            await _usermanager.AddToRoleAsync(user, Roles.Admin.ToString());

            return RedirectToAction("login", "adminLogin");

        }


        //public async Task CreateRoles()
        //{
        //    await _roleManager.CreateAsync(new IdentityRole(Roles.Superadmin.ToString()));
        //    await _roleManager.CreateAsync(new IdentityRole(Roles.Admin.ToString()));
        //    await _roleManager.CreateAsync(new IdentityRole(Roles.User.ToString()));
        //}

    }
}
