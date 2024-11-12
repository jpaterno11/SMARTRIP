function validarContraseñayMail() {
    let contacto = document.getElementById('contacto').value;
    let contraseña = document.getElementById('contraseña').value;
    let confirmar_contraseña = document.getElementById('confirmar_contraseña').value;
    let contraseña_valida = false;
    const mailValido = /^[a-z0-9]+@(gmail|hotmail|outlook)\.com$/.test(contacto);
    const telefonoValido = /^\+54(?:15[0-9]{8}|11[0-9]{8})$/.test(contacto);
    const tieneMayuscula = /[A-Z]/.test(contraseña);
    const tieneCaracterEspecial = /[!@#$%^&*(),.?":{}|<>-_]/.test(contraseña);
    contraseña_valida = (contraseña.length >= 8 && tieneMayuscula && tieneCaracterEspecial && (contraseña === confirmar_contraseña));
    if (!contraseña_valida) {
        alert('Las contraseñas deben ser iguales, contener mayúsculas y caracteres especiales y tener al menos 8 caracteres.');
        return false;
    }
    if (!mailValido && !telefonoValido) {
        console.log("no paso")
        alert('El contacto debe ser un email válido o un número de teléfono válido.');
        return false;
    }
    else {
        console.log("paso")
        return true;
    }
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
let inputType = (inputField.type  === 'email' ? true : false);
inputField.type = (inputType ? 'tel' : 'email');
inputField.placeholder = 'Introducir' + (inputType ? ' número de teléfono' : ' email') ;
toggleLink.textContent = '¿Usar' + (inputType ? ' correo electrónico?' : ' número de teléfono?') ;
labelField.textContent = 'Ingrese su' + (inputType ? ' teléfono:' : ' email:') ;
inputField.name = (inputType ? 'telefono' : 'email') ;
}




    if (window.location.pathname.includes('/Home/Registrarse')) {
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
    }


function enviarFechayValidar() {
const dia = document.getElementById('dia').value;
const mes = document.getElementById('mes').value;
const año = document.getElementById('año').value;
const fechaNacimiento = `${año}-${mes}-${dia}`;
const nombre = document.getElementById('nombre').value;
const apellido = document.getElementById('apellido').value;
const genero = document.getElementById('genero').value;
document.getElementById('fechaNacimiento').value = fechaNacimiento;
document.getElementById('Registrarseform').setAttribute('asp-controller', 'Account');
document.getElementById('Registrarseform').action = '/Account/registrarse';
let mensajeError = '';
mensajeError += (dia < 1 || dia > 31 ? 'El día debe estar entre 1 y 31.' : '') + (mes == 0 ? ' El mes no puede ser 0.' : '') + (año > 9999 || año < 1753 ? ' El año debe estar entre 1753 y 9999.' : '') + (genero == 0 ? ' Por favor seleccione un género.' : '') + (nombre.length < 3 ? ' El nombre debe tener al menos 3 caracteres.' : '') + (apellido.length < 3 ? ' El apellido debe tener al menos 3 caracteres.' : '');
if (mensajeError !=  '') {
    alert(mensajeError);
    document.getElementById('Registrarseform').setAttribute('asp-controller', 'Home');
    document.getElementById('Registrarseform').action = '/Home/Registrarse';
}
document.getElementById('Registrarseform').submit();
return fechaNacimiento;
}


function enviarForm(){
document.getElementById('Registrarseform2').action = (validarContraseñayMail ? '/Account/registrarse2' : '/Account/registrarse');
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











var map = L.map('map').setView([-34.6062, -58.4359], 15);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 18,
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    let startMarker, endMarker;
    async function obtenerCoordenadas(direccion) {
        // Define los límites de la Ciudad Autónoma de Buenos Aires
        const viewbox = "-58.5317,-34.7054,-58.3352,-34.5215"; // Suroeste y noreste de CABA
        const bounded = 1; // Limita los resultados a la vista de la caja
    
        // Construye la URL de búsqueda con los parámetros de limitación
        const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(direccion)}&viewbox=${viewbox}&bounded=${bounded}`;
    
        try {
            const response = await fetch(url);
            const data = await response.json();
            if (data.length > 0) {
                return {
                    lat: parseFloat(data[0].lat),
                    lon: parseFloat(data[0].lon)
                };
            } else {
                alert("Dirección no encontrada en Buenos Aires: " + direccion);
                return null;
            }
        } catch (error) {
            console.error("Error al obtener coordenadas:", error);
            alert("Hubo un problema al buscar la dirección.");
            return null;
        }
    }
    async function buscarRuta() {
        const start = document.getElementById('start').value;
        const end = document.getElementById('end').value;
        if (!start || !end) {
            alert("Por favor, ingresa ambos lugares.");
            return;
        }
        const startCoords = await obtenerCoordenadas(start);
        const endCoords = await obtenerCoordenadas(end);
        if (startCoords && endCoords) {
            map.fitBounds([
                [startCoords.lat, startCoords.lon],
                [endCoords.lat, endCoords.lon]
            ]);
            if (startMarker) map.removeLayer(startMarker);
            if (endMarker) map.removeLayer(endMarker);
            startMarker = L.marker([startCoords.lat, startCoords.lon]).addTo(map)
                .bindPopup("Salida: " + start).openPopup();
            endMarker = L.marker([endCoords.lat, endCoords.lon]).addTo(map)
                .bindPopup("Llegada: " + end).openPopup();
            // Opcional: Dibujar una línea entre los puntos
            const routeLine = L.polyline([[startCoords.lat, startCoords.lon], [endCoords.lat, endCoords.lon]], {
                color: 'blue'
            }).addTo(map);
        }
    }