using CiniciFinal.DAL;
using CiniciFinal.Models;
using Microsoft.AspNetCore.Identity;
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

   

    }
}
