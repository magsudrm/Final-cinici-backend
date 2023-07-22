using CiniciFinal.DAL;
using CiniciFinal.Enums;
using CiniciFinal.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CiniciFinal.Controllers
{
    public class ShopController : Controller
    {
        private readonly CiniciDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public ShopController(CiniciDbContext context,UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public IActionResult Index(int gender)
        {
            List<Product> products = _context.Products.Include(x => x.ProductImages).ToList();

            if (gender == 1)
            {
                products = products.Where(x => x.Gender == Gender.Male).ToList();
            }
            if (gender == 2)
            {
                products = products.Where(x => x.Gender == Gender.Famale).ToList();
            }
            if (gender == 3)
            {
                products = products.Where(x => x.Gender == Gender.Child).ToList();
            }
            else
            {
                products = products;
            }
            return View(products);
        }

        public IActionResult Detail(int id)
        {
            if(id<=0) return NotFound();
            Product product = _context.Products.Include(x => x.ProductImages).FirstOrDefault(x=>x.Id==id);
            if (product is null) return NotFound();
            return View(product);
        }

        public async Task<IActionResult> AddBasket(int id, string size)
        {

            Product product = _context.Products.FirstOrDefault(p => p.Id == id);

            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
                BasketItem basketItem = _context.BasketItems.FirstOrDefault(b => b.ProductId == product.Id && b.AppUserId == user.Id);
                if (basketItem == null)
                {
                    basketItem = new BasketItem()
                    {
                        AppUserId = user.Id,
                        ProductId = product.Id,
                        Size = size,
                        Count= 1
                    };
                    _context.BasketItems.Add(basketItem);
                }
                else
                {
                    basketItem.Count++;
                }
                _context.SaveChanges();
            }

            return Redirect(Request.Headers["Referer"].ToString());
        }

        public async Task<IActionResult> RemoveBasketItem(int id)
        {
            Product product = _context.Products.FirstOrDefault(p => p.Id == id);

            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
                BasketItem basketItem = _context.BasketItems.FirstOrDefault(b => b.ProductId == product.Id && b.AppUserId == user.Id);
                if (basketItem != null)
                {

                    _context.BasketItems.Remove(basketItem);
                    _context.SaveChanges();
                }
            }

            return Redirect(Request.Headers["Referer"].ToString());
        }
    }
}
