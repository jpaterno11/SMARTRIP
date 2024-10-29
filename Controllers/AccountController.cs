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


    public IActionResult OlvideMiContraseña()
    {
        return View();
    }
    [HttpPost] 
      public IActionResult registrarse(string nombre, string apellido, DateTime fecha, string genero)
     {
        USUARIO user = new USUARIO ("", "", ' ', nombre, apellido, fecha, genero); 
        ViewBag.Datos = user;
        return View("/Views/Home/Registrarse2.cshtml");
     }
     [HttpPost] 
      public IActionResult registrarse2(USUARIO user, string email, int telefono, string contraseña)
     {
        user.email = email;
        user.telefono = telefono;
        user.contraseña = contraseña; 
        BD.AgregarUsuario(user);
        return View("/Views/Home/Registrarse2.cshtml");
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
