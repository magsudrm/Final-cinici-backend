using System.Net.Mail;
using System.Net;

namespace CiniciFinal.Service
{
    public class EmailService
    {
        public void SendEmail(string recipientEmail, string subject, string body)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("maqsudmuslumov@gmail.com", "Cinici");
                mail.To.Add(new MailAddress(recipientEmail));
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("maqsudmuslumov@gmail.com", "rtbiusixtwlfwhcs");

                    smtp.Send(mail);
                }
            }
        }
    }
}
