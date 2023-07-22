using CiniciFinal.DAL;
using CiniciFinal.Enums;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
	[Area("manage")]
    [Authorize(Roles = "Admin,Superadmin")]

    public class CategoryController : Controller
    {
		private readonly CiniciDbContext _context;
		public CategoryController(CiniciDbContext context)
		{
			_context = context;
		}

		public IActionResult Index(int page = 1, int size = 10)
		{
			var query = _context.Categories;
			return View(PaginatedList<Category>.Create(query, page, size));
		}
		public IActionResult Create()
		{
			return View();
		}

		[HttpPost]
		public IActionResult Create(Category category)
		{
			if (!ModelState.IsValid)
				return View();

			if (_context.Categories.Any(x => x.Name == category.Name))
			{
				ModelState.AddModelError("CategoryName", "The CategoryName already taken");
				return View();
			}
			_context.Categories.Add(category);
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Edit(int id)
		{
			Category category = _context.Categories.Find(id);
			if (category == null)
				return View("Error");

			return View(category);
		}
		[HttpPost]
		public IActionResult Edit(Category category)
		{
			if (!ModelState.IsValid)
				return View();

			Category existCategory = _context.Categories.Find(category.Id);

			if (existCategory == null)
				return View("Error");

			if (category.Name != existCategory.Name && _context.Categories.Any(x => x.Id != category.Id && x.Name == category.Name))
			{
				ModelState.AddModelError("CategoryName", "The CategoryName already taken");
				return View();
			}
			existCategory.Name = category.Name;
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Delete(int id)
		{
			Category category = _context.Categories.Find(id);

			if (category == null)
				return View("Error");

			return View(category);
		}

		[HttpPost]
		public IActionResult Delete(Category category)
		{
			Category existCategory = _context.Categories.Find(category.Id);

			if (existCategory == null)
				return View("Error");

			_context.Categories.Remove(existCategory);
			_context.SaveChanges();
			return RedirectToAction("index");
		}
	}
}
