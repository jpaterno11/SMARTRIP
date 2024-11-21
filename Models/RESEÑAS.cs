using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMARTRIP.Models
{
    public class RESEÑAS
    {
        public int IDUsuario {get; set;}
        public int IDViaje {get; set;}
        public int CalificacionAuto {get; set;}
        public int CalificacionConductor {get; set;}
        public string Mensaje {get; set;}
        public DateTime fecha {get; set;}
        
        
        public RESEÑAS()
        {}

        public RESEÑAS(int IDUsuario, DateTime fecha, int IDViaje, string Mensaje, int CalificacionAuto, int CalificacionConductor)
        {
           this.IDUsuario= IDUsuario;
           this.IDViaje = IDViaje;
           this.fecha = fecha;
           this.Mensaje = Mensaje;
           this.CalificacionAuto = CalificacionAuto;
           this.CalificacionConductor = CalificacionConductor;
        }
    }   
}