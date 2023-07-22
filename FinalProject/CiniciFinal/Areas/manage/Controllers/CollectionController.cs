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

    public class CollectionController : Controller
    {
		private readonly CiniciDbContext _context;
		private readonly IWebHostEnvironment _env;

		public CollectionController(CiniciDbContext context, IWebHostEnvironment env)
		{
			_context = context;
			_env = env;

		}

		public IActionResult Index(int page = 1, int size = 10)
		{
			var model = _context.Collections;
			return View(PaginatedList<Collection>.Create(model, page, size));
		}
		public IActionResult Create()
		{
			return View();
		}

		[HttpPost]
		public IActionResult Create(Collection collection)
		{
			if (collection.CollectionImage == null)
			{
				ModelState.AddModelError("CollectionImage", "CollectionImage is required");
				return View();
			}
			if (collection.CollectionImage.ContentType != "image/jpeg" && collection.CollectionImage.ContentType != "image/png")
				ModelState.AddModelError("CollectionImage", "CollectionImage must be image/png or image/jpeg");

			if (collection.CollectionImage.Length > 2097152)
				ModelState.AddModelError("CollectionImage", "CollectionImage must be less or equal than 2MB");
			collection.Image = FileManager.Save(collection.CollectionImage, _env.WebRootPath + "/uploads/collections");
			if (!ModelState.IsValid)
				return View();

			if (_context.Collections.Any(x => x.Title == collection.Title))
			{
				ModelState.AddModelError("Title", "The Title already taken");
				return View();
			}
			_context.Collections.Add(collection);
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Edit(int id)
		{
			Collection collection = _context.Collections.Find(id);
			if (collection == null)
				return View("Error");

			return View(collection);
		}
		[HttpPost]
		public IActionResult Edit(Collection collection)
		{
			if (!ModelState.IsValid)
				return View();

			Collection existCollection = _context.Collections.Find(collection.Id);

			if (existCollection == null)
				return View("Error");

			if (collection.Title != existCollection.Title && _context.Collections.Any(x => x.Id != collection.Id && x.Title == collection.Title))
			{
				ModelState.AddModelError("Title", "The Title already taken");
				return View();
			}

			existCollection.Title = collection.Title;
			existCollection.ButtonUrl = collection.ButtonUrl;


			if (collection.CollectionImage != null)
			{
				string oldFileName = existCollection.Image;
				existCollection.Image = FileManager.Save(collection.CollectionImage, _env.WebRootPath + "/uploads/collections");
				FileManager.Delete(_env.WebRootPath + "/uploads/collcetions", oldFileName);
			}
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Delete(int id)
		{
			Collection collection = _context.Collections.Find(id);

			if (collection == null)
				return View("Error");

			return View(collection);
		}

		[HttpPost]
		public IActionResult Delete(Collection collection)
		{
			Collection existCollection = _context.Collections.Find(collection.Id);

			if (existCollection == null)
				return View("Error");

			FileManager.Delete(_env.WebRootPath + "/uploads/collections", existCollection.Image);

			_context.Collections.Remove(existCollection);
			_context.SaveChanges();
			return RedirectToAction("index");
		}
	}
}
