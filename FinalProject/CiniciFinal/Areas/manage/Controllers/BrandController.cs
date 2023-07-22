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

    public class BrandController : Controller
    {
		private readonly CiniciDbContext _context;
		private readonly IWebHostEnvironment _env;

		public BrandController(CiniciDbContext context, IWebHostEnvironment env)
		{
			_context = context;
			_env = env;

		}
		public IActionResult Index(int page = 1, int size = 10)
		{
			var model = _context.Brands;
			return View(PaginatedList<Brand>.Create(model, page, size));
		}
		public IActionResult Create()
		{
			return View();
		}
		[HttpPost]
		public IActionResult Create(Brand brand)
		{
			if (!ModelState.IsValid)
				return View();

			_context.Brands.Add(brand);
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Delete(int id)
		{
			Brand brand = _context.Brands.Find(id);

			if (brand == null)
				return View("Error");

			return View(brand);
		}
        public IActionResult Edit(int id)
        {
            Brand brand = _context.Brands.Find(id);
            if (brand == null)
                return View("Error");

            return View(brand);
        }
        [HttpPost]
        public IActionResult Edit(Brand brand)
        {
            if (!ModelState.IsValid)
                return View();

            Brand existBrand = _context.Brands.Find(brand.Id);

            if (existBrand == null)
                return View("Error");

            if (brand.Name != existBrand.Name && _context.Brands.Any(x => x.Id != brand.Id && x.Name == brand.Name))
            {
                ModelState.AddModelError("BrandName", "The BrandName already taken");
                return View();
            }
            existBrand.Name = brand.Name;
            _context.SaveChanges();
            return RedirectToAction("index");
        }

        [HttpPost]
		public IActionResult Delete(Brand brand)
		{
			Brand existBrand = _context.Brands.Find(brand.Id);

			if (existBrand == null)
				return View("Error");


			_context.Brands.Remove(existBrand);
			_context.SaveChanges();
			return RedirectToAction("index");
		}
	}
}
