using Microsoft.AspNetCore.Mvc;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    public class DashboardController : Controller
    {

        public IActionResult Index()
        {
            return View();
        }
    }
}
