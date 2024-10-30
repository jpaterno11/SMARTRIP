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
  function enviarFormulario() {
    const usuarioInput = document.getElementById('usuario').value;
    const loginForm = document.getElementById('loginForm');

    const hiddenEmailField = document.querySelector("input[name='email']");
    const hiddenTelefonoField = document.querySelector("input[name='telefono']");
    if (hiddenEmailField) hiddenEmailField.remove();
    if (hiddenTelefonoField) hiddenTelefonoField.remove();

    let hiddenField;
    if (usuarioInput.includes('@')) {
        loginForm.action = '/Account/IniciarSesionEmail';
        hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = 'email';
        hiddenField.value = usuarioInput;
    } else if (/^\d+$/.test(usuarioInput)) {
        loginForm.action = '/Account/IniciarSesionTelefono';
        hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = 'telefono';
        hiddenField.value = usuarioInput;
    } else {
        alert("Por favor, ingrese un email válido o un número de teléfono.");
        return false;
    }

    loginForm.appendChild(hiddenField);
    loginForm.submit();
}
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
"", "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
"Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
];

const selectMes = document.getElementById('mes');

meses.forEach((mes, index) => {
const option = document.createElement('option');
option.value = index;
option.textContent = mes;
selectMes.appendChild(option);
});


function enviarFecha() {
const dia = document.getElementById('dia').value;
const mes = document.getElementById('mes').value;
const año = document.getElementById('año').value;
const fechaNacimiento = `${año}-${mes}-${dia}`;
console.log(fechaNacimiento);
document.getElementById('fechaNacimiento').value = fechaNacimiento;
document.getElementById('Registrarseform').action = '/Account/registrarse';
document.getElementById('Registrarseform').submit();
return fechaNacimiento; 
}
function enviarForm(){
document.getElementById('Registrarseform2').action = '/Account/registrarse2';
document.getElementById('Registrarseform2').submit();
}