using CiniciFinal.DAL;
using CiniciFinal.Helpers;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
	[Area("manage")]
    public class FocusController : Controller
    {
		private readonly CiniciDbContext _context;
		private readonly IWebHostEnvironment _env;

		public FocusController(CiniciDbContext context, IWebHostEnvironment env)
		{
			_context = context;
			_env = env;

		}

		public IActionResult Index(int page = 1, int size = 10)
		{
			var model = _context.Focuses
				.Skip((page - 1) * 6)
				.Take(6);
			return View(PaginatedList<Focus>.Create(model, page, size));
		}
		public IActionResult Create()
		{
			return View();
		}

		[HttpPost]
		public IActionResult Create(Focus focus)
		{
			if (focus.FocusImage == null)
			{
				ModelState.AddModelError("FocusImage", "FocusImage is required");
				return View();
			}
			if (focus.FocusImage.ContentType != "image/jpeg" && focus.FocusImage.ContentType != "image/png")
				ModelState.AddModelError("FocusImage", "FocusImage must be image/png or image/jpeg");

			if (focus.FocusImage.Length > 2097152)
				ModelState.AddModelError("FocusImage", "FocusImage must be less or equal than 2MB");
			focus.Image = FileManager.Save(focus.FocusImage, _env.WebRootPath + "/uploads/focus");
			if (!ModelState.IsValid)
				return View();

			if (_context.Focuses.Any(x => x.Title == focus.Title))
			{
				ModelState.AddModelError("Title", "The Title already taken");
				return View();
			}
			_context.Focuses.Add(focus);
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Edit(int id)
		{
			Focus focus = _context.Focuses.Find(id);
			if (focus == null)
				return View("Error");

			return View(focus);
		}
		[HttpPost]
		public IActionResult Edit(Focus focus)
		{
			if (!ModelState.IsValid)
				return View();

			Focus existFocus = _context.Focuses.Find(focus.Id);

			if (existFocus == null)
				return View("Error");

			if (focus.Title != existFocus.Title && _context.Focuses.Any(x => x.Id != focus.Id && x.Title == focus.Title))
			{
				ModelState.AddModelError("Title", "The BrokerName already taken");
				return View();
			}

			existFocus.Title = focus.Title;
			existFocus.ButtonText = focus.ButtonText;
			existFocus.ButtonUrl = focus.ButtonUrl;


			if (focus.FocusImage != null)
			{
				string oldFileName = existFocus.Image;
				existFocus.Image = FileManager.Save(focus.FocusImage, _env.WebRootPath + "/uploads/focus");
				FileManager.Delete(_env.WebRootPath + "/uploads/focus", oldFileName);
			}
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Delete(int id)
		{
			Focus focus = _context.Focuses.Find(id);

			if (focus == null)
				return View("Error");

			return View(focus);
		}

		[HttpPost]
		public IActionResult Delete(Focus focus)
		{
			Focus existFocus = _context.Focuses.Find(focus.Id);

			if (existFocus == null)
				return View("Error");

			FileManager.Delete(_env.WebRootPath + "/uploads/focus", existFocus.Image);

			_context.Focuses.Remove(existFocus);
			_context.SaveChanges();
			return RedirectToAction("index");
		}
	}
}
