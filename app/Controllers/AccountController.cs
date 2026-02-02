
using Microsoft.AspNetCore.Mvc;
using AspNetLoginApp.Models;
using System.Linq;

namespace AspNetLoginApp.Controllers
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;
        public AccountController(AppDbContext context) => _context = context;

        [HttpGet("/login")]
        public IActionResult Login() => View();

        [HttpPost("/login")]
        public IActionResult Login(string username, string password)
        {
            var user = _context.Users.FirstOrDefault(u => u.Username == username && u.PasswordHash == password);
            if (user != null)
                return RedirectToAction("Index", "Home");

            ViewBag.Error = "Неверные данные";
            return View();
        }
    }
}

