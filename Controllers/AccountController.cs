using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using SMARTRIP.Models;

namespace SMARTRIP.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;

    public AccountController(ILogger<AccountController> logger)
    {
        _logger = logger;
    }

  public IActionResult Login()
    {
        return View();
    }

    [HttpPost] 
    public IActionResult Registrarse(string email, string contraseña)
     {

         
         return View("Index");
     }


    public IActionResult OlvideMiContraseña()
    {
        return View();
    }


//      [HttpPost] 
//      public IActionResult IniciarSesionEmail(string email, string contraseña)
//     {

//         USUARIO user = BD.VerificarUsuarioEmail(email, contraseña);
//         if(user == null)
//         {
//             ViewBag.Mensaje = "Lo sentimos, esa cuenta no existe.";
//             return View("Registro");
//         }
//         return View("Index");
//     }
//    [HttpPost] 
//     public IActionResult IniciarSesionTelefono(int telefono, string contraseña)
//     {
//         USUARIO user = BD.VerificarUsuarioTelefono(telefono, contraseña);
//         if(user == null)
//         {
//             ViewBag.Mensaje = "Lo sentimos, esa cuenta no existe.";
//             return View("Registro");
//         }
//         return View("Index");
//     }
}
