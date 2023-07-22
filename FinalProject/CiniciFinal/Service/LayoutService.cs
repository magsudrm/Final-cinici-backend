using CiniciFinal.DAL;
using CiniciFinal.Models;
using CiniciFinal.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace CiniciFinal.Service
{
    public class LayoutService
    {
        private readonly CiniciDbContext _context;
        private readonly IHttpContextAccessor _accessor;
        private readonly UserManager<AppUser> _userManager;

        public LayoutService(CiniciDbContext context, IHttpContextAccessor accessor, UserManager<AppUser> userManager)
        {
            _context = context;
            _accessor = accessor;
            _userManager = userManager;
        }

        public async Task<AppUser> GetUserFullName()
        {
            var user = await _userManager.GetUserAsync(_accessor.HttpContext.User);
            return user;
        }

        public Dictionary<string, string> GetSettings()
        {
            Dictionary<string, string> settings = _context.Settings.ToDictionary(s => s.Key, s => s.Value);

            return settings;
        }

        public BasketVm GetBaskets()
        {
            BasketVm basketData = new BasketVm()
            {
                TotalPrice = 0,
                BasketItems = new(),
                Count = 0
            };
            if (_accessor.HttpContext.User.Identity.IsAuthenticated)
            {

                List<BasketItem> basketItems = _context.BasketItems.Include(b => b.AppUser).Where(b => b.AppUser.UserName == _accessor.HttpContext.User.Identity.Name).ToList();
                foreach (BasketItem item in basketItems)
                {
                    Product product = _context.Products.FirstOrDefault(f => f.Id == item.ProductId);
                    if (product != null)
                    {
                        BasketItem basket = new BasketItem()
                        {
                            Product = product,
                            Count = item.Count
                        };
                        basket.Product.Price = product.Price;///
						basketData.BasketItems.Add(basket);
                        basketData.Count++;
                        basketData.TotalPrice += item.Product.Price * item.Count;///
					}
                }
            }

            return basketData;
        }

        public List<Product> GetProducts()
        {
            List<Product> products = _context.Products.Include(x=>x.ProductImages).ToList();
            return products;
        }

    }
}
