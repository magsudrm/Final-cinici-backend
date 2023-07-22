using CiniciFinal.Enums;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,Superadmin")]

    public class DashboardController : Controller
    {

        public IActionResult Index()
        {
            return View();
        }
    }
}
