function validarContraseña() {
    let contraseña = document.getElementById('contraseña').value;
    let confirmar_contraseña = document.getElementById('confirmar_contraseña').value;


    const tieneMayuscula = /[A-Z]/.test(contraseña);
    const tieneCaracterEspecial = /[!@#$%^&*(),.?":{}|<>]/.test(contraseña);

    if (contraseña.length < 8) {
        alert('La contraseña debe tener al menos 8 caracteres.');
        return false;
    } else if (!tieneMayuscula) {
        alert('La contraseña debe contener al menos una letra mayúscula.');
        return false;
    } else if (!tieneCaracterEspecial) {
        alert('La contraseña debe contener al menos un carácter especial.');
        return false;
    }
    else if (confirmar_contraseña != contraseña)
    {
        alert('Las contraseñas deben ser iguales.');
        return false;
    }

    return true;
}


function mostrarMensaje(mensaje) {
    const contenedorMensaje = document.getElementById('mensaje');
    contenedorMensaje.textContent = mensaje;
    contenedorMensaje.style.display = 'block'; 
}

function enviarFormulario() {
    let usuarioInput = document.getElementById('usuario').value;

    let hiddenEmailField = document.querySelector("input[name='email']");
    let hiddenTelefonoField = document.querySelector("input[name='telefono']");
    if (hiddenEmailField) hiddenEmailField.remove();
    if (hiddenTelefonoField) hiddenTelefonoField.remove();

    let hiddenField;
    if (usuarioInput.includes('@')) {
        document.getElementById('loginForm').action = '/Account/IniciarSesionEmail';
        hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = 'email';
        hiddenField.value = usuarioInput;
    } else if (/^\d+$/.test(usuarioInput)) {
        document.getElementById('loginForm').action = '/Account/IniciarSesionTelefono';
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
if (validarContraseña)
{
    document.getElementById('Registrarseform2').action = '/Account/registrarse';
}
document.getElementById('Registrarseform2').submit();
}
function enviarForm2(){
    document.getElementById('Olvidar').action = '/Account/Olvidar';
    document.getElementById('Olvidar').submit();
    }
    function enviarForm3(){
        document.getElementById('Olvidar2').action = '/Account/Olvidar2';
        document.getElementById('Olvidar2').submit();
        }