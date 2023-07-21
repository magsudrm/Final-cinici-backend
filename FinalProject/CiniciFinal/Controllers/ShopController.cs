using CiniciFinal.DAL;
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
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Detail()
        {
            return View();
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
