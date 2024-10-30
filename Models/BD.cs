using System.Data.SqlClient;
using Dapper;

namespace SMARTRIP.Models
{
    public static class BD
    {
        private static string _connectionString = @"Server=localhost; Database=SMARTRIP;Trusted_Connection=True;";


        public static void AgregarUsuario(USUARIO user)
        {
            string sql = "INSERT INTO USUARIO (contraseña, email, telefono, nombre, apellido, genero, fechaNacimiento) VALUES (@Pcontraseña, @Pemail, @Ptelefono, @Pnombre, @Papellido, @Pgenero, @PfechaNacimiento)";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new {Pcontraseña = user.contraseña, Pemail = user.email, Ptelefono = user.telefono, Pnombre = user.nombre, Papellido = user.apellido, Pgenero = user.genero, PfechaNacimiento = user.fechaNacimiento });
            }
        }

        public static USUARIO VerificarUsuarioEmail(string email, string contraseña)
        {
            USUARIO user = null;
            string sql = "SELECT * FROM USUARIO WHERE email = @Pemail AND contraseña = @Pcontraseña";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                user = db.QueryFirstOrDefault<USUARIO>(sql, new { Pemail = email, Pcontraseña = contraseña});
            }
            return user;
        }

         public static USUARIO VerificarUsuarioTelefono(int telefono, string contraseña)
        {
            USUARIO user = null;
            string sql = "SELECT * FROM USUARIO WHERE telefono = @Ptelefono AND contraseña = @Pcontraseña";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                user = db.QueryFirstOrDefault<USUARIO>(sql, new { Ptelefono = telefono, Pcontraseña = contraseña});
            }
            return user;
        }

    }
}