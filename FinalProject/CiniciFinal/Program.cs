using CiniciFinal.DAL;
using CiniciFinal.Models;
using CiniciFinal.Service;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddScoped<LayoutService>();
// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddDbContext<CiniciDbContext>(opt =>
{
    opt.UseSqlServer("Server=DESKTOP-8VNLF73\\SQLEXPRESS;Database=CiniciDb;Trusted_Connection=True");
});
builder.Services.ConfigureApplicationCookie(opt =>
{
    opt.Events.OnRedirectToLogin = opt.Events.OnRedirectToAccessDenied = context =>
    {
        if (context.HttpContext.Request.Path.Value.StartsWith("/manage"))
        {
            var uri = new Uri(context.RedirectUri);
            context.Response.Redirect("/manage/account/login" + uri.Query);
        }
        else
        {
            var uri = new Uri(context.RedirectUri);
            context.Response.Redirect("/account/login" + uri.Query);
        }

        return Task.CompletedTask;
    };
});

builder.Services.AddIdentity<AppUser, IdentityRole>(opt =>
{
    opt.SignIn.RequireConfirmedEmail = true;
    opt.Password.RequiredUniqueChars = 1;
    opt.Password.RequireNonAlphanumeric = false;
    opt.Password.RequiredLength = 5;
    opt.Password.RequireDigit = true;
    opt.Password.RequireLowercase = true;
    opt.Password.RequireUppercase = false;


    opt.User.RequireUniqueEmail = false;

    opt.User.AllowedUserNameCharacters = "qwertyuiopasdfghjklzxcvbnm_-1234567890.QWERTYUIOPASDFGHJKLZXCVBNM:)( ";

    opt.Lockout.MaxFailedAccessAttempts = 5;
    opt.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(3);
}).AddDefaultTokenProviders().AddEntityFrameworkStores<CiniciDbContext>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "areas",
    pattern: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");


app.Run();
