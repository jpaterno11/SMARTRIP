using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMARTRIP.Models
{
    public class USUARIO
    {
        public string contrasena {get; set;}
        public string nombre {get; set;}
        public string apellido {get; set;}
        public DateTime fechaNacimiento {get;set;}
        public string genero {get;set;}
        public string email {get; set;}
        public int? telefono {get; set;}
        
        
        public USUARIO()
        {}

        public USUARIO(string contrasena, string email, int? telefono, string nombre, string apellido, DateTime fechaNacimiento, string genero)
        {
            this.contrasena = contrasena;
            this.email = email;
            this.telefono = telefono;
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaNacimiento = fechaNacimiento;
            this.genero = genero;
        }
    }   
} 