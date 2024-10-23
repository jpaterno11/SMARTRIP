using System.Data.SqlClient;
using Dapper;

namespace TP9_MONTENEGRO_LUCERO.Models
{
    public static class BD
    {
        private static string _connectionString = @"Server=localhost; Database=SMARTRIP;Trusted_Connection=True;";


        public static void AgregarUsuario(USUARIO user)
        {
            string sql = "INSERT INTO USUARIO (username, contraseña, email, telefono, nombre, apellido) VALUES (@Pusername, @Pcontraseña, @Pemail, @Ptelefono, @Pnombre, @Papellido)";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new { Pusername = user.username, Pcontraseña = user.contraseña, Pemail = user.email, Ptelefono = user.telefono, Pnombre = user.nombre, Papellido = user.apellido });
            }
        }

        // public static void VerificarUsuario(strin)
        // {
        //     USUARIO user = null;
        //     string sql = "SELECT * FROM USUARIOS WHERE ;
        //     using (SqlConnection db = new SqlConnection(_connectionString))
        //     {
        //         db.Execute(sql, new { Pusername = user.username, Pcontraseña = user.contraseña, Pemail = user.email, Ptelefono = user.telefono, Pnombre = user.nombre, Papellido = user.apellido });
        //     }
        // }

    }
}