<?php
// mis_postulaciones.php
//require_once 'plantilla.php';
require_once 'conexion.php';
$conexion = new Conexion();
$con = $conexion->getConexion();

// Verificar si se recibió el ID del estudiante desde el localStorage
if (isset($_POST['idEstudiante'])) {
    $idEstudiante = $_POST['idEstudiante'];

    // Consulta SQL para obtener las postulaciones del estudiante
    $sql = "SELECT * FROM plaza p
    INNER JOIN postulación po ON p.idPlaza = po.idPlaza
    WHERE po.idEstudiante= '$idEstudiante'";

    // Ejecutar la consulta
    $result = $conexion->consultar($sql);

    // Verificar si se obtuvieron resultados
    if ($result->num_rows > 0) {
        // Crear un array para almacenar las postulaciones
        $postulaciones = array();

        // Obtener los resultados y almacenarlos en el array
        while ($row = $result->fetch_assoc()) {
            $postulaciones[] = $row;
        }

        // Mostrar las postulaciones en formato JSON
        echo json_encode($postulaciones);
    } else {
        // Si no se encontraron postulaciones, mostrar un mensaje de error
        echo json_encode(array('error' => 'No se encontraron postulaciones.'));
    }

    // Cerrar la conexión a la base de datos
    $conexion->cerrar();

    // Terminar la ejecución del script aquí, ya que no se necesita más HTML.
    exit;
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Postulaciones</title>
    
    
    <link rel="stylesheet" href="plantilla.css">
    <link rel="stylesheet" href="postulaciones.css"> 

</head>
<body>
<header class="inicio">
        <div class="logo">
            <img src="./imagenes/Captura.PNG" alt="" width="100px">
            <p>UTPL<br>GESTIÓN DE PLAZAS<br> G-PLAZ</p>
        </div>
        <section class="usuario">
        <div class="info">
            <!-- Aquí mostrarás el nombre de usuario -->
            <p id="nombreUsuario"></p>
            <hr>
            <p>Estudiante UTPL</p>
        </div>
        <div class="img-btn"> 
            <img src="./imagenes/perfil.png" alt="" width="50px">
            <button class="btn">Cerrar Sesión</button>
        </div>
      </section> 
    </header>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <form action="index.php" method="post">
                    <button type="submit" class="btn1">Postulación</button>
                </form>
            </div>
            <div class="col-md-4">
                <form action="proponer_plaza.php" method="post">
                    <button type="submit" class="btn1">Proponer Plaza</button>
                </form>
            </div>
            <div class="col-md-4">
                <form action="mis_postulaciones.php" method="post">
                    <button type="submit" class="btn1">Mis Postulaciones</button>
                </form>
            </div>
        </div>
        <div id="content">
            <!-- Contenido de la página -->
        </div>
    </div>
    <div class="container-title">
        <h1 id="titlePost">Mis Postulaciones</h1>
        <div id="postulaciones-lista">
            <!-- Aquí se mostrarán las postulaciones -->
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            // Obtener el ID del estudiante desde el localStorage
            var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));
            if (estudianteData && estudianteData.IDEstudiante) {
                var idEstudiante = estudianteData.IDEstudiante;
                // Realizar la consulta AJAX para obtener las postulaciones del estudiante
                $.ajax({
                    url: 'mis_postulaciones.php',
                    type: 'POST',
                    dataType: 'json',
                    data: { idEstudiante: idEstudiante },
                    success: function (data) {
                        console.log('Éxito al obtener las postulaciones.');
                        console.log('Datos recibidos del servidor:');
                        console.log(data); // Mostrar los datos recibidos en la consola

                        var postulacionesLista = $('#postulaciones-lista');
                        if (data.length > 0) {
                            // Si hay postulaciones, mostrarlas en forma de tarjetas
                            var listaHTML = '<div class="postulaciones-container">'; // Agregar contenedor para ordenamiento horizontal
                            $.each(data, function (index, postulacion) {
                                listaHTML += '<div class="card">'; // Inicio de la tarjeta de postulación
                                listaHTML += '<h1>' + postulacion.Empresa + '</h1>';
                                listaHTML += '<h2>' + postulacion.Tema + '</h2>';
                                listaHTML += '<p>Tutor: ' + postulacion.Tutor + '</p>';
                                listaHTML += '<h3>' + postulacion.Descripción + '</h3>';
                                listaHTML += '<p>id: ' + postulacion.idPlaza + '</p>';
                                listaHTML += '<p>Ciudad: ' + postulacion.Ciudad + '</p>';
                                listaHTML += '</div>'; // Fin de la tarjeta de postulación
                            });
                            listaHTML += '</div>'; // Cierre del contenedor para ordenamiento horizontal
                            postulacionesLista.html(listaHTML);
                        } else {
                            // Si no hay postulaciones, mostrar un mensaje
                            postulacionesLista.html('<p>No se encontraron postulaciones.</p>');
                        }



                    },
                    error: function (xhr, status, error) {
                        console.log('Error al obtener las postulaciones.');
                        console.log('Estado del error: ' + status);
                        console.log('Error: ' + error);
                        console.log(xhr.responseText);
                        // Mostrar un mensaje de error en caso de que ocurra un problema al obtener las postulaciones
                        $('#postulaciones-lista').html('<p>Error al obtener las postulaciones.</p>');
                    }
                });
            } else {
                console.log('ID del estudiante no encontrado en el localStorage.');
                // Mostrar un mensaje de error si no se encontró el ID del estudiante en el localStorage
                $('#postulaciones-lista').html('<p>ID del estudiante no encontrado en el localStorage.</p>');
            }
        });
    </script>
    <script>
    // Obtener el nombre de usuario desde el localStorage
    $(document).ready(function () {
        var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));
        if (estudianteData && estudianteData.Nombre) {
            var nombreEstudiante = estudianteData.Nombre;
            $('#nombreUsuario').text(nombreEstudiante);
        } else {
            console.log('Nombre del estudiante no encontrado en el localStorage.');
        }
    });
</script>
</body>
</html>
