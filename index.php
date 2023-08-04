<?php

include 'plantilla.php';
?>

<style>


    .btn-preferencia {
        background-color: #eee;
        margin-right: 5px;
        margin-top: 6px;
        border-color: #003f70;
        transition: background-color 0.1s ease;
        padding: 5px;
    }
    .btn-preferencia:hover {
        background-color: #7c94b4; 
        color: #fff; 
       
        transform: translateY(-3px); 
    }
    .btn-preferencia.selected {
        background-color: #003f70;
        color: #fff;
    }

    /* Estilos para la tabla */
    .tablaDatos {
        width: 100%;
        border-collapse: collapse;
    }

    .tablaDatos th,
    .tablaDatos td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: left;
    }

    .tablaDatos th {
        background-color: #f2f2f2;
    }

    .tablaDatos tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .tablaDatos tr:hover {
        background-color: #cde9ff;
    }

    /* Estilos para el botón "Postular" */
    .btn-postular {
        background-color: #007bff;
        color: #fff;
        padding: 6px 12px;
        border: none;
        cursor: pointer;
        border-radius: 4px;
    }

    .btn-postular:hover {
        background-color: #0056b3;
    }
    #btnBuscar {
        background-color: #003f70; /* Color de fondo del botón */
        color: #fff; /* Color de texto del botón */
        border: none; /* Eliminamos el borde del botón */
        padding: 10px 20px; /* Ajustamos el relleno para tener un tamaño adecuado */
        border-radius: 5px; /* Agregamos bordes redondeados */
        cursor: pointer; /* Cambiamos el cursor al pasar sobre el botón */
        transition: background-color 0.1s ease; 
    }

    /* Estilos para el hover del botón */
    #btnBuscar:hover {
        background-color: #007bff; 
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
        transform: translateY(-2px); 
    }
    #contenedor-btn-buscar {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
  padding: 20px;
  background-color: #f2f2f2;
  border-radius: 10px;
}

.resultados-container {
  display: flex; /* Mostramos los elementos horizontalmente */
  align-items: center; /* Centramos verticalmente el contenido */
}

.resultados-container h3 {
  margin-right: 10px; /* Agregamos un espacio entre el texto "Resultados:" y el número de resultados */
}

#btnBuscar {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#btnBuscar:hover {
  background-color: #0056b3;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transform: translateY(-2px);
}


</style>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <div class="contenedorBusqueda">
        <div class="container_form">
            <div class="">
                <div class="">
                    <label for="Busqueda">Busqueda:</label>
                    <input type="text" id="Busqueda" name="Busqueda" class="form-control">
                </div>
            </div>
            <div class="containerDataimput">
                <div class="containerInfo">
                    <label for="Pais">Pais:</label>
                    <select id="Pais" name="Pais" class="form-control"></select>
                </div>
                <div class="containerInfo">
                    <label for="Ciudad">Ciudad:</label>
                    <select id="Ciudad" name="Ciudad" class="form-control"></select>
                </div>
                <div class="containerInfo">
                    <label for="TipoEmpresa">Tipo de Empresa:</label>
                    <select id="TipoEmpresa" name="TipoEmpresa" class="form-control"></select>
                </div>
                <div class="containerInfo">
                    <label for="Empresa">Empresa:</label>
                    <select id="Empresa" name="Empresa" class="form-control"></select>
                </div>

            </div>



        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <h2 id="titulo" style="text-align: center;">Preferencias</h2>
                <div id="preferencias" class="mt-3"></div>
            </div>
        </div>
  
    </div>
    <div id="contenedor-btn-buscar">

    <div id="cont-btn-buscar">
        <button id="btnBuscar" type="button" class="btn btn-primary">  Buscar plaza    </button>
    </div>
        <div class="resultados-container">
        <h3>Resultados:</h3>
        <span id="numResultados">0</span>
    </div>
    </div>



    <div class="row mt-4">
        <div class="col-md-12">
            
            <div id="resultados" class="mt-3">
                
                <table class="tablaDatos table">
                    <thead>
                        <tr>
                            <th>Ciudad</th>
                            <th>Convenio</th>
                            <th>Descripción</th>
                            <th>Empresa</th>
                            <th>Fin</th>
                            <th>Inicio</th>
                            <th>Nivel inglés</th>
                            <th>País</th>
                            <th>Tema</th>
                            <th>TipoEmpresa</th>
                            <th>Tutor</th>
                            <th>Vacantes</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tablaResultados">
                        <p></p>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>



        $(document).ready(function () {
            
            var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));
            var idEstudiante = estudianteData ? estudianteData.IDEstudiante : null;

            console.log('Se envió el siguiente ID: ' + idEstudiante);
            if (idEstudiante) {
                
                function cargarOpciones() {
                    console.log('Enviando datos del estudiante...');
                    $.ajax({
                        url: 'datos_estudiante.php',
                        type: 'POST',
                        dataType: 'json',
                        data: { action: 'getEstudianteData', IDEstudiante: idEstudiante },
                        success: function (data) {
                            console.log('Éxito al enviar los datos del estudiante.');
                            console.log('Datos recibidos del servidor:');
                            console.log(data); 
                            cargarPaises(data);
                        },
                        error: function (xhr, status, error) {
                            console.log('Error al obtener los datos del estudiante.');
                            console.log('Estado del error: ' + status);
                            console.log('Error: ' + error);
                            console.log(xhr.responseText);
                        }
                    });
                }


                function cargarPaises(data) {
                    console.log('Cargando países...');
                    var paisSelect = $('#Pais');
                    $.each(data.optionsPais, function (index, pais) {
                        paisSelect.append('<option value="' + pais + '">' + pais + '</option>');
                    });
                    cargarCiudades(data);
                }

                function cargarCiudades(data) {
                    console.log('Cargando ciudades...');
                    var ciudadSelect = $('#Ciudad');
                    $.each(data.optionsCiudad, function (index, ciudad) {
                        ciudadSelect.append('<option value="' + ciudad + '">' + ciudad + '</option>');
                    });
                    cargarTipoEmpresa(data);
                }

                function cargarTipoEmpresa(data) {
                    console.log('Cargando tipo de empresa...');
                    var tipoEmpresaSelect = $('#TipoEmpresa');
                    $.each(data.optionsTipoEmpresa, function (index, tipoEmpresa) {
                        tipoEmpresaSelect.append('<option value="' + tipoEmpresa + '">' + tipoEmpresa + '</option>');
                    });
                    cargarEmpresas(data);
                }

                function cargarEmpresas(data) {
                    console.log('Cargando empresas...');
                    var empresaSelect = $('#Empresa');
                    $.each(data.optionsEmpresa, function (index, empresa) {
                        empresaSelect.append('<option value="' + empresa + '">' + empresa + '</option>');
                    });
                    cargarPreferencias(data);
                }

                function cargarPreferencias(data) {
                    console.log('Cargando preferencias...');
                    var preferenciasDiv = $('#preferencias');
                    $.each(data.preferencias, function (index, preferencia) {
                        preferenciasDiv.append('<button class="btn btn-secondary btn-preferencia">' + preferencia + '</button>');
                    });

                    $('.btn-preferencia').on('click', function () {
                        $(this).toggleClass('selected');
                    });
                }
                function mostrarPreferenciasSeleccionadas() {
                    var preferenciasSeleccionadas = [];
                    $('.btn-preferencia.selected').each(function () {
                        preferenciasSeleccionadas.push($(this).text());
                    });
                    var resultadoDiv = $('#resultados');
                    
                }

                cargarOpciones();
            } else {
                console.log('ID del estudiante no encontrado en el localStorage.');
            }
        });



        $('#btnBuscar').on('click', function () {
            buscarPlazas();
        });

        $(document).on('click', '.btn-postular', function () {
            var plazaID = $(this).data('id');
            console.log("el id plaza es" + plazaID);

            var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));

           
            $.ajax({
                url: 'postular.php', 
                type: 'POST',
                dataType: 'json',
                data: {
                    idPlaza: plazaID,
                    idEstudiante: estudianteData.IDEstudiante
                },
                success: function (data) {
                    console.log('Postulación exitosa.');
                    alert('¡Postulación exitosa!');
                },
                error: function (xhr, status, error) {
                    console.log('Error al postular.');
                    console.log('Estado del error: ' + status);
                    console.log('Error: ' + error);
                    console.log(xhr.responseText);
                }
            });
        });

        
        function buscarPlazas() {
            var busqueda = $('#Busqueda').val();
            var pais = $('#Pais').val();
            var ciudad = $('#Ciudad').val();
            var tipoEmpresa = $('#TipoEmpresa').val();
            var empresa = $('#Empresa').val();

           
            var preferenciasSeleccionadas = [];
            $('.btn-preferencia.selected').each(function () {
                preferenciasSeleccionadas.push($(this).text());
            });

            var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));
            var idEstudiante = estudianteData ? estudianteData.IDEstudiante : null;
        
            $.ajax({
                url: 'filtro_plazas.php', 
                type: 'POST',
                dataType: 'json',
                data: {
                    action: 'getDatosFiltrados',
                    IDEstudiante: idEstudiante,
                    busqueda: busqueda,
                    pais: pais,
                    ciudad: ciudad,
                    tipoEmpresa: tipoEmpresa,
                    empresa: empresa,
                    preferencias: preferenciasSeleccionadas 
                },
                success: function (data) {
                    console.log('Éxito al obtener los datos filtrados.');
                    console.log('Datos recibidos del servidor:');
                    console.log(data); 

                    var resultadosCount = data.length;
                    $('#numResultados').text(resultadosCount);

                    var tablaResultados = $('#tablaResultados');
                    tablaResultados.find('tbody').empty(); 
                    tablaResultados.empty();

                    $.each(data, function (index, resultado) {
                        var row = '<tr>';
                        row += '<td>' + resultado.Ciudad + '</td>';
                        row += '<td>' + resultado.Convenio + '</td>';
                        row += '<td>' + resultado.Descripción + '</td>';
                        row += '<td>' + resultado.Empresa + '</td>';
                        row += '<td>' + resultado.Fin + '</td>';
                        row += '<td>' + resultado.Inicio + '</td>';
                        row += '<td>' + resultado['Nivel inglés'] + '</td>';
                        row += '<td>' + resultado.País + '</td>';
                        row += '<td>' + resultado.Tema + '</td>';
                        row += '<td>' + resultado.TipoEmpresa + '</td>';
                        row += '<td>' + resultado.Tutor + '</td>';
                        row += '<td>' + resultado.Vacantes + '</td>';
                        row += '<td><button class="btn btn-primary btn-postular" data-id="' + resultado.idPlaza + '">Postular</button></td>';
                        row += '</tr>';
                        tablaResultados.append(row);
                    });
                },
                error: function (xhr, status, error) {
                    console.log('Error al obtener los datos filtrados.');
                    console.log('Estado del error: ' + status);
                    console.log('Error: ' + error);
                    console.log(xhr.responseText);
                }
            });
        }

        
        $(document).ready(function () {
            
            buscarPlazas();
        });
    </script>
</body>

</html>