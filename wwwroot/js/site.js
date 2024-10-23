function validarContraseña() {
    let contraseña = document.getElementById('contraseña').value;
    let usuario = document.getElementById('usuario').value;
   

    if (contraseña.length < 8 || contraseña.length) {
       alert('La contraseña debe tener al menos 8 caracteres.');
    } else {
        
      alert('¡Inicio de sesión exitoso!');
      document.getElementById('loginForm').submit();
    }
}


// function EmailOTelefono(){
//   let usuario = document.getElementById('usuario').value;
//   let email;
//   let telefono;
//   if(usuario.includes("@"))
//   {
//     email = usuario;
//   }
//   else
//   {
//     telefono = usuario;
//   }

//   document.getElementById('loginForm').submit();
// }