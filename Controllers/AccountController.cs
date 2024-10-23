using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP9_MONTENEGRO_LUCERO.Models;

namespace TP9_MONTENEGRO_LUCERO.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;

    public AccountController(ILogger<AccountController> logger)
    {
        _logger = logger;
    }

     public IActionResult IniciarSesion(string usuario, string contraseña)
    {
        return View();
    }
   
}
