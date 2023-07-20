using CiniciFinal.DAL;
using CiniciFinal.Helpers;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CiniciFinal.Areas.manage.Controllers
{
	[Area("manage")]
    public class ProductController : Controller
    {
		private readonly CiniciDbContext _context;
		private readonly IWebHostEnvironment _env;
		public ProductController(CiniciDbContext context, IWebHostEnvironment env)
		{
			_context = context;
			_env = env;
		}
		public IActionResult Index(int page = 1, int size = 4)
		{
			var query = _context.Products
			.Include(x => x.ProductImages)
			.Include(x => x.Brand)
			.Where(x => !x.IsDeleted);
			return View(PaginatedList<Product>.Create(query, page, size));
		}

		public IActionResult Create()
		{
			ViewBag.Categories = _context.Categories.ToList();
			ViewBag.Brands = _context.Brands.ToList();
			return View();
		}

		[HttpPost]
		public IActionResult Create(Product product)
		{
			CheckCreate(product);
			if (!ModelState.IsValid)
			{
				ViewBag.Categories = _context.Categories.ToList();
				ViewBag.Brands = _context.Brands.ToList();
				return View();
			}

			AddProductImages(product);

			_context.Products.Add(product);
			_context.SaveChanges();
			return RedirectToAction("index");
		}

		public IActionResult Edit(int id)
		{
			Product product = _context.Products
				.Include(x => x.ProductImages)
				.FirstOrDefault(x => x.Id == id && !x.IsDeleted);
			if (product == null)
				return View("Error");

			ViewBag.Categories = _context.Categories.ToList();
			ViewBag.Brands = _context.Brands.ToList();
			return View(product);
		}


		[HttpPost]
		public IActionResult Edit(Product product)
		{
			Product existProduct = _context.Products
			.Include(x => x.ProductImages).FirstOrDefault(x => x.Id == product.Id);
			if (existProduct == null)
				return View("Error");

			CheckEdit(product, existProduct);
			existProduct.Price = product.Price;
			existProduct.Name = product.Name;
			existProduct.Category = product.Category;
			existProduct.Description = product.Description;
			existProduct.IsDiscounted = product.IsDiscounted;
			existProduct.IsDeleted = product.IsDeleted;
			existProduct.DiscountPercent = product.DiscountPercent;
			existProduct.Age = product.Age;
			existProduct.Brand = product.Brand;
			existProduct.Color = product.Color;
			existProduct.Gender = product.Gender;
			existProduct.Size = product.Size;

			UpdateProductImages(product, existProduct);
			_context.SaveChanges();
			return RedirectToAction("index");

		}
		private void UpdateProductImages(Product product, Product existProduct)
		{
			if (product.PosterFile != null)
			{
				var poster = existProduct.ProductImages.FirstOrDefault(x => x.PosterStatus == true);
				string oldImageName = poster.Image;
				poster.Image = FileManager.Save(product.PosterFile, _env.WebRootPath + "/uploads/products");
				FileManager.Delete(_env.WebRootPath + "/uploads/products", oldImageName);
			}

			var removedFiles = existProduct.ProductImages.FindAll(x => x.PosterStatus == null && !product.ProductImageIds.Contains(x.Id));
			FileManager.DeleteAll(_env.WebRootPath + "/uploads/products", removedFiles.Select(x => x.Image).ToList());
			existProduct.ProductImages.RemoveAll(x => removedFiles.Contains(x));

			foreach (var piFile in product.ImageFiles)
			{
				ProductImage pi = new ProductImage
				{
					Image = FileManager.Save(piFile, _env.WebRootPath + "/uploads/products"),
					PosterStatus = null,
				};
				existProduct.ProductImages.Add(pi);
			}
		}
		private void CheckEdit(Product product, Product existProduct)
		{
			if (existProduct.CategoryId != product.CategoryId && !_context.Categories.Any(x => x.Id == product.CategoryId))
				ModelState.AddModelError("CategoryId", "Category not found");
			if (existProduct.BrandId != product.BrandId && !_context.Brands.Any(x => x.Id == product.BrandId))
				ModelState.AddModelError("BrandId", "Brand not found");
		}
		private void CheckCreate(Product product)
		{
			if (!_context.Categories.Any(x => x.Id == product.CategoryId))
			{
				ModelState.AddModelError("CategoryId", "Category not found");
				return;
			}
			if (!_context.Brands.Any(x => x.Id == product.BrandId))
			{
				ModelState.AddModelError("BrandId", "Broker not found");
				return;
			}
			if (product.PosterFile == null)
				ModelState.AddModelError("PosterFile", "PosterFile is required");

		}

		private void AddProductImages(Product product)
		{
			ProductImage posterPi = new ProductImage
			{
				Image = FileManager.Save(product.PosterFile, _env.WebRootPath + "/uploads/products"),
				PosterStatus = true,
			};
			product.ProductImages.Add(posterPi);

			foreach (var piFile in product.ImageFiles)
			{
				ProductImage pi = new ProductImage
				{
					Image = FileManager.Save(piFile, _env.WebRootPath + "/uploads/products"),
					PosterStatus = null,
				};
				product.ProductImages.Add(posterPi);
			}
		}
		public IActionResult Delete(int id)
		{
			Product product = _context.Products.Find(id);

			if (product == null)
				return View("Error");

			return View(product);
		}

		[HttpPost]
		public IActionResult Delete(Product product)
		{
			Product existProduct = _context.Products.Include(x => x.ProductImages).FirstOrDefault(x => x.Id == product.Id);

			if (existProduct == null)
				return View("Error");
			if (existProduct.PosterFile != null)
			{
				FileManager.Delete(_env.WebRootPath + "/uploads/products", existProduct.PosterFile.Name);
			}
			var otherImages = existProduct.ProductImages.FindAll(x => x.PosterStatus == null && !product.ProductImageIds.Contains(x.Id));

			FileManager.DeleteAll(_env.WebRootPath + "/uploads/products", otherImages.Select(x => x.Image).ToList());

			_context.Products.Remove(existProduct);
			_context.SaveChanges();
			return RedirectToAction("index");
		}
	}
}
