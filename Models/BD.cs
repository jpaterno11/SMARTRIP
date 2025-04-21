using System.Data.SqlClient;
using Dapper;

namespace SMARTRIP.Models
{
    public static class BD
    {
        private static string _connectionString = @"Server=localhost; Database=SMARTRIP;Trusted_Connection=True;";


        public static void AgregarUsuario(USUARIO user)
        {
            string sql = "INSERT INTO USUARIO (contrasena, email, telefono, nombre, apellido, genero, fechaNacimiento) VALUES (@Pcontraseña, @Pemail, @Ptelefono, @Pnombre, @Papellido, @Pgenero, @PfechaNacimiento)";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new {Pcontraseña = user.contrasena, Pemail = user.email, Ptelefono = user.telefono, Pnombre = user.nombre, Papellido = user.apellido, Pgenero = user.genero, PfechaNacimiento = user.fechaNacimiento });
            }
        }

        public static USUARIO VerificarUsuarioEmail(string email, string contraseña)
        {
            USUARIO user = null;
            string sql = "SELECT * FROM USUARIO WHERE email = @Pemail AND contrasena = @Pcontraseña";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                user = db.QueryFirstOrDefault<USUARIO>(sql, new { Pemail = email, Pcontraseña = contraseña});
            }
            return user;
        }

         public static USUARIO VerificarUsuarioTelefono(int telefono, string contraseña)
        {
            USUARIO user = null;
            string sql = "SELECT * FROM USUARIO WHERE telefono = @Ptelefono AND contrasena = @Pcontraseña";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                user = db.QueryFirstOrDefault<USUARIO>(sql, new { Ptelefono = telefono, Pcontraseña = contraseña});
            }
            return user;
        }

         public static USUARIO VerificarEmailTelefono(string email, int telefono)
        {
            USUARIO user = null;
            string sql = "SELECT * FROM USUARIO WHERE email = @Pemail OR telefono = @Ptelefono AND @Ptelefono != 0";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                user = db.QueryFirstOrDefault<USUARIO>(sql, new { Pemail = email, Ptelefono = telefono});
            }
            return user;
        }
        public static int ConseguirID(USUARIO user)
        {
            int id;
            string sql = "SELECT idUsuario from USUARIO where email = @Pemail AND contrasena = @Pcontraseña";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                id = db.QueryFirstOrDefault<int>(sql, new { Pemail = user.email, Pcontraseña = user.contrasena});
            }
            return id;
        }

         public static void ActualizarContraseña(USUARIO user)
        {
            string sql = "UPDATE USUARIO SET contrasena = @Pcontraseña WHERE email = @Pemail OR telefono = @Ptelefono AND @Ptelefono != 0";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new { Pcontraseña = user.contrasena, Pemail = user.email, Ptelefono = user.telefono});
            }
        }

        public static void AgregarViaje(VIAJES viaje)
        {
            string sql = "INSERT INTO VIAJES (Fecha, UbicacionInicial, UbicacionFinal, IDUsuario, Costo, Hora, Empresa, MetodoPago) VALUES (@PFecha, @PUbicacionInicial, @PUbicacionFinal, @PIDUsuario, @PCosto, @PHora, @Empresa, @MetodoPago)";
            using (SqlConnection db = new SqlConnection(_connectionString))
            {
                db.Execute(sql, new {PFecha = viaje.fecha, PUbicacionInicial = viaje.ubicacionInicial, PUbicacionFinal = viaje.ubicacionFinal, PIDUsuario = viaje.IDUsuario, PCosto = viaje.costo, PHora = viaje.hora, PEmpresa=viaje.empresa, PMetodoPago=viaje.metodoPago});
            }
        }


    }
}