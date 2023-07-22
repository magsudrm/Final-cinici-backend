using CiniciFinal.Models;
using System.Net.Mail;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using CiniciFinal.DAL;
using CiniciFinal.Enums;
using Microsoft.AspNetCore.Authorization;

namespace CiniciFinal.Areas.manage.Controllers
{
    [Area("manage")]
    [Authorize(Roles = "Admin,Superadmin")]

    public class ContactController : Controller
    {
        private readonly CiniciDbContext _context;

        public ContactController(CiniciDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            List<ContactUs> messages = _context.Contacts.ToList();
            return View(messages);
        }

        public IActionResult Replace(int id)
        {
            if (id == 0) return NotFound(); 
            ContactUs contact = _context.Contacts.FirstOrDefault(x => x.Id == id);
            if (contact is null) return NotFound();
            return View(contact);
        }

        [HttpPost]
        public async Task<IActionResult> Replace(int id, string replace)
        {
            if (id == 0) return NotFound();
            ContactUs contact = _context.Contacts.FirstOrDefault(x => x.Id == id);
            if (contact is null) return NotFound();
            MailMessage message = new MailMessage();
            message.From = new MailAddress("maqsudmuslumov@gmail.com", "Cinici");
            message.To.Add(new MailAddress(contact.Email));
            message.Subject = "Cinici Support";
            message.Body = string.Empty;
            message.Body = $"{replace}";

            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.Credentials = new NetworkCredential("maqsudmuslumov@gmail.com", "rtbiusixtwlfwhcs"); 
            smtpClient.Send(message);
            contact.IsReply = true;
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        public IActionResult Delete(int id)
        {
            if (id == 0) return NotFound();
            ContactUs contact = _context.Contacts.FirstOrDefault(x => x.Id == id);
            if (contact is null) return NotFound();
            _context.Contacts.Remove(contact);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
    }
}
