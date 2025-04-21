using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMARTRIP.Models
{
    public class VIAJES
    {
        public string ubicacionInicial {get; set;}
        public string ubicacionFinal {get; set;}
        public DateTime fecha {get;set;}
        public int IDUsuario {get;set;}
        public double costo {get; set;}
        public DateTime hora {get; set;}
        public string empresa {get; set;}
        public string metodoPago {get; set;}
        
        
        public VIAJES()
        {}

        public VIAJES(int IDUsuario, string ubicacionInicial, string ubicacionFinal, double costo, DateTime fecha, DateTime hora, string metodoPago, string empresa)
        {
           this.IDUsuario= IDUsuario;
           this.ubicacionInicial = ubicacionInicial;
           this.ubicacionFinal = ubicacionFinal;
           this.costo = costo;
           this.fecha = fecha;
           this.hora = hora;
           this.empresa=empresa;
           this.metodoPago=metodoPago;
        }
    }   
}