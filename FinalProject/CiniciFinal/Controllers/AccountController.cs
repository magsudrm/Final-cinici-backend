using Microsoft.AspNetCore.Identity;
using System.Data;
using System.Net.Mail;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using CiniciFinal.Models;
using CiniciFinal.Enums;
using CiniciFinal.ViewModels;

namespace CiniciFinal.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public AccountController(UserManager<AppUser> userManager,SignInManager<AppUser> signInManager )
        {
            _userManager = userManager;
           _signInManager = signInManager;
        }
        public IActionResult Register()
        {
            return View();
        }


        public async Task<IActionResult> Register(RegisterVM account)
        {
            if (!ModelState.IsValid) return Redirect(Request.Headers["Referer"].ToString());
            AppUser user = new()
            {
                FullName = string.Concat(account.Firstname, " ", account.Lastname),
                Email = account.Email,
                UserName = account.Username,
                IsAdmin=false,
                IsSuperAdmin=false
            };
            if (_userManager.Users.Any(x => x.NormalizedEmail == account.Email.ToUpper()))
            {
                ModelState.AddModelError("Email", "Bu e-poçtda istifadəçi mövcuddur");
                return RedirectToAction("Index", "Home");
            }
            IdentityResult result = await _userManager.CreateAsync(user, account.Password);
            if (!result.Succeeded)
            {
                foreach (IdentityError message in result.Errors)
                {
                    ModelState.AddModelError("", message.Description);
                }
                return RedirectToAction("Index", "Home");
            }



            string token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
            string link = Url.Action(nameof(VerifyEmail), "Account", new { email = user.Email, token }, Request.Scheme, Request.Host.ToString());
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("maqsudmuslumov@gmail.com", "CINICI");
            mail.To.Add(new MailAddress(user.Email));

            mail.Subject = "Verify Email";


            mail.Body = string.Empty;
            string body = string.Empty;
            using (StreamReader reader = new StreamReader("wwwroot/manage/assets/template/verifyemail.html"))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{{userFullName}}", user.FullName);
            mail.Body = body.Replace("{{link}}", link);
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;


            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("maqsudmuslumov@gmail.com", "rtbiusixtwlfwhcs");
            smtp.Send(mail);
            await _userManager.AddToRoleAsync(user, Roles.User.ToString());
            return RedirectToAction("Index", "Home");

        }
        public async Task<IActionResult> VerifyEmail(string email, string token)
        {
            AppUser user = await _userManager.FindByEmailAsync(email);
            if (user == null) return BadRequest();
            await _userManager.ConfirmEmailAsync(user, token);
            await _signInManager.SignInAsync(user, true);
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginVm account)
        {
            if (!ModelState.IsValid) return Redirect(Request.Headers["Referer"].ToString());

            AppUser user = await _userManager.FindByNameAsync(account.UserName);
            if (user is null)
            {
                ModelState.AddModelError("", "Username or password is incorrect");
                return Redirect(Request.Headers["Referer"].ToString());
            }

            Microsoft.AspNetCore.Identity.SignInResult result = await _signInManager.PasswordSignInAsync(user, account.Password, account.RememberMe, true);

            if (!result.Succeeded)
            {
                if (result.IsLockedOut)
                {
                    ModelState.AddModelError("", "Due to your efforts, our account was blocked for 5 minutes");
                }
                ModelState.AddModelError("", "Username or password is incorrect");
                return Redirect(Request.Headers["Referer"].ToString());
            }
            return RedirectToAction("Index", "Home");

        }

        public IActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> ForgotPassword(AccountVM account)
        {
            if (account.User.Email is null) return Redirect(Request.Headers["Referer"].ToString());
            AppUser user = await _userManager.FindByEmailAsync(account.User.Email);

            if (user is null) return Redirect(Request.Headers["Referer"].ToString());

            string token = await _userManager.GeneratePasswordResetTokenAsync(user);
            string link = Url.Action(nameof(ResetPassword), "Account", new { email = user.Email, token }, Request.Scheme, Request.Host.ToString());


            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("maqsudmuslumov@gmail.com", "CINICI");
            mail.To.Add(new MailAddress(user.Email));

            mail.Subject = "Reset Password";
            string body = string.Empty;
            using (StreamReader reader = new StreamReader("wwwroot/assets/template/ResetPassword.html"))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{{userFullName}}", user.FullName);
            mail.Body = body.Replace("{{link}}", link);
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("maqsudmuslumov@gmail.com", "rtbiusixtwlfwhcs");
            smtp.Send(mail);
            return Redirect(Request.Headers["Referer"].ToString());


        }

        public async Task<IActionResult> ResetPassword(string email, string token)
        {

            AppUser user = await _userManager.FindByEmailAsync(email);
            if (user == null) BadRequest();

            AccountVM model = new()
            {
                User = user,
                Token = token
            };
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetPassword(AccountVM account)
        {
            AppUser user = await _userManager.FindByEmailAsync(account.User.Email);
            AccountVM model = new()
            {
                User = user,
                Token = account.Token
            };
            if (!ModelState.IsValid)
            {
                foreach (string message in ModelState.Values.SelectMany(e => e.Errors).Select(e => e.ErrorMessage))
                {
                    ModelState.AddModelError("", message);
                }
            }
            await _userManager.ResetPasswordAsync(user, account.Token, account.Password);
            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction(nameof(Login));
        }

    }
}
