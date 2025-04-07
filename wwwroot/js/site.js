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






var map = new maplibregl.Map({
    container: 'map',
    style: {
        version: 8,
        sources: {
            "osm-tiles": { // Match this name exactly in the layer
                "type": "raster",
                "tiles": [
                    "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
                ],
                "tileSize": 256
            }
        },
        layers: [
            {
                "id": "osm-layer",
                "type": "raster",
                "source": "osm-tiles", // Reference the defined source here
                "paint": {}
            }
        ]
    },
    center: [-58.3816, -34.6037],
    zoom: 12
});



let startMarker, endMarker, routeLayer;
async function obtenerCoordenadas(direccion) {
    const viewbox = "-58.5317,-34.7054,-58.3352,-34.5215";
    const bounded = 1;
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
function buscarRutaDesdeFormulario() {
    const direccionInicio = document.getElementById('start').value;
    const direccionDestino = document.getElementById('end').value;
    buscarRuta(direccionInicio, direccionDestino);
}
async function buscarRuta(direccionInicio, direccionDestino) {
    if (!direccionInicio || !direccionDestino) {
        alert("Por favor, ingresa ambas direcciones.");
        return;
    }

    try {
        const startCoords = await obtenerCoordenadas(direccionInicio);
        const endCoords = await obtenerCoordenadas(direccionDestino);

        if (!startCoords || !endCoords) return;

        // Centrar mapa
        map.fitBounds([
            [startCoords.lon, startCoords.lat],
            [endCoords.lon, endCoords.lat]
        ]);

        // Agregar marcadores
        if (startMarker) startMarker.remove();
        if (endMarker) endMarker.remove();

        startMarker = new maplibregl.Marker()
            .setLngLat([startCoords.lon, startCoords.lat])
            .setPopup(new maplibregl.Popup().setText("Salida: " + direccionInicio))
            .addTo(map);

        endMarker = new maplibregl.Marker()
            .setLngLat([endCoords.lon, endCoords.lat])
            .setPopup(new maplibregl.Popup().setText("Llegada: " + direccionDestino))
            .addTo(map);

        // Dibujar la ruta
        if (routeLayer) map.removeLayer('route');
        if (map.getSource('route')) map.removeSource('route');

        map.addSource('route', {
            type: 'geojson',
            data: {
                type: 'Feature',
                geometry: {
                    type: 'LineString',
                    coordinates: [
                        [startCoords.lon, startCoords.lat],
                        [endCoords.lon, endCoords.lat]
                    ]
                }
            }
        });
        setTimeout(() => {
            cambiarTexto(startCoords.lat, startCoords.lon, endCoords.lat, endCoords.lon);
        }, 10);
        map.addLayer({
            id: 'route',
            type: 'line',
            source: 'route',
            layout: {},
            paint: {
                'line-color': '#FF0000',
                'line-width': 4
            }
        }
    
    );
    } catch (error) {
        console.error("Error al buscar la ruta:", error);
        alert("No se pudo obtener la ruta. Por favor, verifica las direcciones ingresadas.");
    }
    
}
function cambiarTexto(lat1, lon1, lat2, lon2) {
    const precio = document.getElementById("precio");
    const precio1 = document.getElementById("precio1");
    const precio2 = document.getElementById("precio2");
    const distance = calcularDistancia(lat1, lon1, lat2, lon2);
    const precioCalculado = calcularPrecio(distance, 'precio1'); 
    const precioCalculado1 = calcularPrecio(distance, 'precio2');
    const precioCalculado2 = calcularPrecio(distance, 'precio3');
    precio.innerHTML = `$${precioCalculado.toLocaleString('es-AR')} AR$`;
    precio1.innerHTML = `$${precioCalculado1.toLocaleString('es-AR')} AR$`;
    precio2.innerHTML = `$${precioCalculado2.toLocaleString('es-AR')} AR$`;
    const hora = document.getElementById("hora").value;
    const fechaInput = document.getElementById("fecha").value;
    const fecha = fechaInput ? new Date(fechaInput) : null;
    if (!fecha && hora == "") {
    const tiempo = document.getElementById("tiempo");
    const tiempo1 = document.getElementById("tiempo1");
    const tiempo2 = document.getElementById("tiempo2");
    const [time1A, time2A] = randomizarTiempo();
    const [time1B, time2B] = randomizarTiempo();
    const [time1C, time2C] = randomizarTiempo();
    tiempo.innerHTML = `<i class="fa-regular fa-clock"></i> ${time1A} - ${time2A} min`;
    tiempo1.innerHTML = `<i class="fa-regular fa-clock"></i> ${time1B} - ${time2B} min`;
    tiempo2.innerHTML = `<i class="fa-regular fa-clock"></i> ${time1C} - ${time2C} min`;
    }
    else {
        const tiempos = document.getElementsByClassName("tiempo"); 
        for (let i = 0; i < tiempos.length; i++) {
            tiempos[i].textContent = "Estimado: " + (fecha.getDate() + 1) + "/" + (fecha.getMonth() + 1) + " " + hora;
        }
    }
   
}

function redondearADecena(precio) {
    return Math.round(precio / 50) * 50;
}
function randomizarTiempo() {
    let first = Math.floor(Math.random() * 10) + 1; 
    let second;

    do {
        second = Math.floor(Math.random() * 10) + 1; 
    } while (second <= first);

    return [first, second];
}

function calcularPrecio(distancia, tipoPrecio) {
    const tarifas = {
        precio1: { tarifaBase: 3000, costoPorKilometro: 1200 },
        precio2: { tarifaBase: 3500, costoPorKilometro: 1500 },
        precio3: { tarifaBase: 4000, costoPorKilometro: 1800 }
    };

    const { tarifaBase, costoPorKilometro } = tarifas[tipoPrecio];
    const precioTotal = tarifaBase + (distancia * costoPorKilometro);
    return redondearADecena(precioTotal);
}
function calcularDistancia(lat1, lon1, lat2, lon2) {
    const R = 6371; 
    const dLat = degToRad(lat2 - lat1);
    const dLon = degToRad(lon2 - lon1);
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
              Math.cos(degToRad(lat1)) * Math.cos(degToRad(lat2)) *
              Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
}

function degToRad(deg) {
    return deg * (Math.PI / 180);
}


$(document).ready(function () {
    $("#openModalBtn").click(function () {
        $("#overlay").fadeIn(); 
    });
    $(window).click(function (event) {
        if ($(event.target).is("#overlay")) {
            $("#overlay").fadeOut();
        }
    });
});

function EnviarCalificacion() {
    let calificacionConductor = document.getElementById('CalificacionConductor').value;
    let calificacionAuto = document.getElementById('CalificacionVehiculo').value;
    let comentario = document.getElementById('Comentario').value;

    EnviarCalificacion.submit();
}

function reservar() {
    let start = document.getElementById("start").value.trim();
    let end = document.getElementById("end").value.trim();
    let fecha = document.getElementById("fecha").value.trim();
    let hora = document.getElementById("hora").value.trim();
    let viajeSeleccionado = document.querySelector('input[name="opcionViaje"]:checked');
    let metodoPago = document.getElementById("metodoPago").value;
    
    if (!start || !end || !fecha || !hora) {
        alert("Por favor, completa todos los campos del viaje.");
        return;
    }
    if (!viajeSeleccionado) {
        alert("Por favor, selecciona una opción de viaje.");
        return;
    }
    if (metodoPago === "") {
        alert("Por favor, selecciona un método de pago.");
        return;
    }
    
    document.getElementById("viajeForm").submit();
}