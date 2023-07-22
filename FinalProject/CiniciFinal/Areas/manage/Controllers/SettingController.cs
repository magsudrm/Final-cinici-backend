using CiniciFinal.DAL;
using CiniciFinal.Enums;
using CiniciFinal.Helpers;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,Superadmin")]

    public class SettingController : Controller
    {
        private readonly CiniciDbContext _context;
        private readonly IWebHostEnvironment _env;

        public SettingController(CiniciDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public IActionResult Index(int page = 1, int size = 10)
        {
            var model = _context.Settings;
            return View(PaginatedList<Setting>.Create(model, page, size));
        }

        public IActionResult Edit(string key)
        {
            Setting setting = _context.Settings.FirstOrDefault(x => x.Key == key);

            if (setting == null)
                return View("Error");

            return View(setting);
        }

        [HttpPost]
        public IActionResult Edit(Setting setting)
        {
            if (!ModelState.IsValid) return View();

            Setting existSetting = _context.Settings
                .FirstOrDefault(x => x.Key == setting.Key);

            if (existSetting == null)
                return View("Error");

            existSetting.Value = setting.Value;

            if (setting.SettingFile != null)
            {
                string oldFileName = existSetting.Value;
                existSetting.Value = FileManager.Save(setting.SettingFile, _env.WebRootPath + "/uploads/settings");
                FileManager.Delete(_env.WebRootPath + "/uploads/settings", oldFileName);
            }

            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
