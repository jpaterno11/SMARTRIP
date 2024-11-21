using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.Json;

namespace SMARTRIP.Models
{
    [Serializable]
    public class USUARIO
    {
        public string? email { get; set; }
        public string? contraseña { get; set; }
        public string? nombre { get; set; }
        public string? apellido { get; set; }
        public DateTime? fechaNacimiento { get; set; }
        public string? genero { get; set; }
        public int? telefono { get; set; }

        // Constructor sin parámetros
        public USUARIO() { }

        // Constructor básico para email y contraseña
        public USUARIO(string email, string contraseña)
        {
            this.email = email;
            this.contraseña = contraseña;
        }

        // Constructor completo
        public USUARIO(string contraseña, string email, int? telefono, string nombre, string apellido, DateTime fechaNacimiento, string genero)
        {
            this.contraseña = contraseña;
            this.email = email;
            this.telefono = telefono;
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaNacimiento = fechaNacimiento;
            this.genero = genero;
        }

        // Serialización a JSON
        public override string ToString()
        {
            return JsonSerializer.Serialize(this);
        }

        // Deserialización desde JSON
        public static USUARIO? FromString(string? json)
        {
            if (string.IsNullOrWhiteSpace(json))
            {
                return null;
            }
            return JsonSerializer.Deserialize<USUARIO>(json);
        }
    }
}