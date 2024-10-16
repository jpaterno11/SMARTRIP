using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9_MONTENEGRO_LUCERO.Models;

namespace TP9_MONTENEGRO_LUCERO.Controllers;

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

    public IActionResult Login()
    {
        return View();
    }

    
    public IActionResult Registro()
    {
        return View();
    }

    public IActionResult OlvideMiContraseña()
    {
        return View();
    }
}
