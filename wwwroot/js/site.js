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


function enviarFormulario() {
  let usuario = document.getElementById('usuario').value;
  let contraseña = document.getElementById('contraseña').value;

  if (usuario.includes('@')) 
  {
      document.getElementById('loginForm').action = '/Account/IniciarSesionConEmail'; // Cambia la acción del formulario
  } 
  else if (/^\d+$/.test(usuarioInput)) 
  {
      document.getElementById('loginForm').action = '/Account/IniciarSesionConTelefono'; // Cambia la acción del formulario
  } 
  else 
  {
      alert("Por favor, ingrese un email válido o un número de teléfono.");
      return false; // Evita que se envíe el formulario si no es válido
  }

  document.getElementById('loginForm').submit();
}