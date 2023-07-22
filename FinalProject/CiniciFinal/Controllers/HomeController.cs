using System.Diagnostics;
using CiniciFinal.DAL;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CiniciFinal.Controllers
{
    public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;
		private readonly CiniciDbContext _context;
        public HomeController(ILogger<HomeController> logger,CiniciDbContext context)
        {
            _context = context;
            _logger = logger;
        }

        public IActionResult Index()
        {

            HomeVM vm = new HomeVM
            {
                Sliders = _context.Sliders.OrderByDescending(x => x.Id).ToList(),
                Products = _context.Products.Include(x => x.ProductImages).Include(x => x.Brand).Where(x => x.IsDiscounted == true).Take(6).ToList(),
                Focus = _context.Focuses.ToList(),
                Brands = _context.Brands.ToList(),
                Categories = _context.Categories.ToList(),
                Settings = _context.Settings.ToList(),
            };
            return View(vm);

        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult About()
        {
            return View();
        }
        public IActionResult Branches()
        {
            return View();
        }
        public IActionResult Conditions()
        {
            return View();
        }

        public IActionResult Faq()
        {
            return View();
        }
        public IActionResult Refund()
        {
            return View();
        }
        public IActionResult Contact()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Contact(string name, string email, string phoneNumber, string comment)
        {
            ContactUs contactUs = new()
            {
                Name = name,
                Email = email,
                PhoneNumber = phoneNumber,
                Comment = comment,
                SendTime = DateTime.Now,
                IsReply = false
            };

            _context.Contacts.Add(contactUs);
            _context.SaveChanges();
            return RedirectToAction("Index", "Home");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
          public ActionResult Subscribe(string email)
        {
            TempData["Subscribe"] = false;
            bool Isdublicate = _context.Subscribes.Any(c => c.Email == email);

            if (Isdublicate)
            {
                return RedirectToAction("Index", "Home");
            }
            Subscribe subscribe = new()
            {
                Email = email
            };
            _context.Subscribes.Add(subscribe);
            _context.SaveChanges();
            TempData["Subscribe"] = true;
            return RedirectToAction("Index", "Home");
        }
    }
}