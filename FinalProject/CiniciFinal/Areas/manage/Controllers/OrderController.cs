using CiniciFinal.DAL;
using CiniciFinal.Enums;
using CiniciFinal.Models;
using CiniciFinal.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,Superadmin")]
    public class OrderController : Controller
    {
        private readonly CiniciDbContext _context;
        private readonly EmailService _emailService;

        public OrderController(CiniciDbContext context, EmailService emailService)
        {
            _context = context;
            _emailService = emailService;
        }
        public IActionResult Index()
        {
            List<Order> orders = _context.Orders.ToList();
            return View(orders);
        }
        public IActionResult Edit(int id)
        {
            Order order = _context.Orders.Include(o => o.OrderItems).Include(o => o.AppUser).FirstOrDefault(o => o.Id == id);
            ViewBag.Products = _context.Products.Include(x=>x.ProductImages).ToList();
            if (order == null) return NotFound();

            return View(order);
        }
        public IActionResult Accept(int id)
        {


            Order order = _context.Orders.Include(x => x.AppUser).FirstOrDefault(o => o.Id == id);
            if (order == null) return NotFound();

            order.Status = true;

            _context.SaveChanges();
            string recipientEmail = order.AppUser.Email;
            string subject = "Your order has been accepted";
            string body = "Your order has been accepted. Thank you! The total amount to be paid is " + order.TotalPrice + "₼";


            _emailService.SendEmail(recipientEmail, subject, body);
            return RedirectToAction("Index", "Order");

        }
        public IActionResult Reject(int id)
        {
            Order order = _context.Orders.Include(x => x.AppUser).FirstOrDefault(o => o.Id == id);
            if (order == null) return NotFound();

            order.Status = false;

            _context.SaveChanges();
            string recipientEmail = order.AppUser.Email;
            string subject = "Your order has been rejected";
            string body = "Your order has been rejected. Unfortunately, the products you ordered are currently out of stock.Thank you for your understanding.";


            _emailService.SendEmail(recipientEmail, subject, body);
            return RedirectToAction("Index", "Order");

        }
    }
}
