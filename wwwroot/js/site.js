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
      document.getElementById('loginForm').action = '/Account/IniciarSesionConEmail';
  } 
  else if (/^\d+$/.test(usuarioInput)) 
  {
      document.getElementById('loginForm').action = '/Account/IniciarSesionConTelefono';
  } 
  else 
  {
      alert("Por favor, ingrese un email válido o un número de teléfono.");
      return false; 
  }

  document.getElementById('loginForm').submit();
}





function toggleEmailPhone() {
  var inputField = document.getElementById('contacto');
  var toggleLink = document.getElementById('toggleLink');
  var labelField = document.getElementById('contactoLabel');
  if (inputField.type === 'email') {
      inputField.type = 'tel';
      inputField.placeholder = 'Introducir número de teléfono';
      toggleLink.textContent = '¿Usar correo electrónico?';
      labelField.textContent = 'Ingrese su teléfono:';
      inputField.name = 'telefono';
  } else {
      inputField.type = 'email';
      inputField.placeholder = 'Introducir email';
      toggleLink.textContent = '¿Usar número de teléfono?';
      labelField.textContent = 'Ingrese su email:';
      inputField.name = 'email';
  }
}
const meses = [
"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
"Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
];

const selectMes = document.getElementById('mes');

meses.forEach((mes, index) => {
const option = document.createElement('option');
option.value = index + 1;
option.textContent = mes;
selectMes.appendChild(option);
});


function enviarFecha() {
const dia = document.getElementById('dia').value;
const mes = document.getElementById('mes').value;
const año = document.getElementById('año').value;
const fecha = `${año}-${mes}-${dia}`;
console.log(fecha);
document.getElementById('Registrarseform').action = '/Account/registrarse';
document.getElementById('Registrarseform').submit();
return fecha; 
}
function enviarForm(){
document.getElementById('Registrarseform').action = '/Account/registrarse2';
document.getElementById('Registrarseform').submit();
}