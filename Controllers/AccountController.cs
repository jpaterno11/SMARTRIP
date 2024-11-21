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

    // Vista Login
    public IActionResult Login()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("Index", "Home");
        }
        return View("/Views/Home/Login.cshtml");
    }

    [HttpPost]
    public IActionResult IniciarSesionEmail(string email, string contraseña)
    {
        var user = BD.VerificarUsuarioEmail(email, contraseña);
        if (user == null)
        {
            ViewBag.Mensaje = "Lo sentimos, esa cuenta no existe.";
            return View("/Views/Home/Login.cshtml");
        }
        HttpContext.Session.SetString("user", user.email);
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
    public IActionResult IniciarSesionTelefono(int telefono, string contraseña)
    {
        var user = BD.VerificarUsuarioTelefono(telefono, contraseña);
        if (user == null)
        {
            ViewBag.Mensaje = "Lo sentimos, esa cuenta no existe.";
            return View("/Views/Home/Login.cshtml");
        }
        HttpContext.Session.SetString("user", user.email);
        return RedirectToAction("Index", "Home");
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        return RedirectToAction("Login");
    }

    // Registro de usuario
    public IActionResult Registrarse()
    {
        return View("/Views/Home/Registrarse.cshtml");
    }

    [HttpPost]
    public IActionResult Registrarse(string nombre, string apellido, DateTime fechaNacimiento, string genero)
    {
        var user = new USUARIO("", "", ' ', nombre, apellido, fechaNacimiento, genero);
        ViewBag.Datos = user;
        return View("/Views/Home/Registrarse2.cshtml");
    }

    [HttpPost]
    public IActionResult Registrarse2(USUARIO user, string email, int? telefono, string contraseña)
    {
        user.email = email;
        user.telefono = telefono;
        user.contraseña = contraseña;
        BD.AgregarUsuario(user);
        return RedirectToAction("Index", "Home");
    }

    // Recuperar contraseña
    public IActionResult OlvideMiContraseña()
    {
        return View("/Views/Home/OlvideMiContraseña.cshtml");
    }

    [HttpPost]
    public IActionResult Olvidar(string email, int telefono)
    {
        var user = BD.VerificarEmailTelefono(email, telefono);
        if (user == null)
        {
            ViewBag.Mensaje = "Usuario no encontrado.";
            return View("/Views/Home/OlvideMiContraseña.cshtml");
        }
        ViewBag.User = user;
        return View("/Views/Home/OlvideMiContraseña2.cshtml");
    }

    [HttpPost]
    public IActionResult Olvidar2(USUARIO user, string contraseña)
    {
        if (contraseña == user.contraseña)
        {
            ViewBag.User = user;
            ViewBag.Mensaje = "Ingrese una contraseña diferente.";
            return View("/Views/Home/OlvideMiContraseña2.cshtml");
        }
        user.contraseña = contraseña;
        BD.ActualizarContraseña(user);
        return RedirectToAction("Index", "Home");
    }
}
