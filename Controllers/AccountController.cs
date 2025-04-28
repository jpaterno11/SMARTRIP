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
     public IActionResult Registrarse()
    {
        return View("/Views/Home/Registrarse.cshtml");
    }
    public IActionResult OlvideMiContraseña()
    {
        return View();
    }
    [HttpPost] 
      public IActionResult registrarse(string nombre, string apellido, DateTime fechaNacimiento, string genero)
     {
        USUARIO user = new USUARIO ("", "", ' ', nombre, apellido, fechaNacimiento, genero); 
        ViewBag.Datos = user;
        return View("/Views/Home/Registrarse2.cshtml");
     }
     [HttpPost] 
      public IActionResult registrarse2(USUARIO user, string email, int? telefono, string contraseña)
     {
        user.email = email;
        user.telefono = telefono;
        user.contrasena = contraseña; 
        BD.AgregarUsuario(user);
        TempData["idUsuario"] = BD.ConseguirID(user);
        return View("/Views/Home/Index.cshtml");
     }


     [HttpPost] 
     public IActionResult IniciarSesion(string email, string contraseña, int telefono)
    {
        USUARIO user;
        if (telefono == 0){
            user = BD.VerificarUsuarioEmail(email, contraseña);
        }
        else{
            user = BD.VerificarUsuarioTelefono(telefono, contraseña);
        }
        if(user == null)
        {
            ViewBag.Mensaje = "Lo sentimos, esa cuenta no existe.";
            return View("/Views/Home/Login.cshtml");
        }
        TempData["idUsuario"] = BD.ConseguirID(user);
        return View("/Views/Home/Index.cshtml");
        
        
    }
    [HttpPost] 
      public IActionResult Olvidar(string email, int telefono)
     {
        USUARIO user = BD.VerificarEmailTelefono(email, telefono); 
        ViewBag.user = user;
        return View("/Views/Home/OlvideMiContraseña2.cshtml");
     }
     [HttpPost] 
      public IActionResult Olvidar2(USUARIO user, string contraseña)
     {
        if(contraseña == user.contrasena)
        {
            ViewBag.user = user;
            ViewBag.Mensaje = "Ingrese una contraseña diferente";
            return View("/Views/Home/OlvideMiContraseña2.cshtml");
        }
        user.contrasena = contraseña;
        BD.ActualizarContraseña(user);
        return View("/Views/Home/Index.cshtml");
     }

    //  [HttpPost] 
    //   public IActionResult Calificar()
    //  {
    //  }

    [HttpPost]
    public IActionResult guardarViaje(string ubicacionInicial, string ubicacionFinal, double costoDidi, double costoUber, double costoCabify, DateTime fecha, DateTime hora, string metodoPago, string empresa){
        int IDUsuario = (int) TempData["idUsuario"];
        double costo = 0;
        if (empresa == "DiDi")
    {
        costo = costoDidi;
    }
    else if (empresa == "Uber")
    {
        costo = costoUber;
    }
    else if (empresa == "Cabify")
    {
        costo = costoCabify;
    }
        VIAJES viaje = new VIAJES (IDUsuario, ubicacionInicial, ubicacionFinal, costo, fecha, hora, metodoPago, empresa);
        BD.AgregarViaje(viaje); 
        return View("/Views/Home/CalificarServicio.cshtml");
    }
}
