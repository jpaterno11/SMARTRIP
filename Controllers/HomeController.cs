using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using SMARTRIP.Models;

namespace SMARTRIP.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
        public IActionResult Registrarse()
    {
        return View();
    }
    public IActionResult Registrarse2()
    {
        return View();
    }

    public IActionResult Login()
    {
        return View();
    }

    public IActionResult OlvideMiContraseña()
    {
        return View();
    }

    public IActionResult OlvideMiContraseña2()
    {
        return View();
    }
}
