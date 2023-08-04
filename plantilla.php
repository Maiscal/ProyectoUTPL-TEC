<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="plantilla.css">
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
                <button id="btnCerrarSesion" class="btn">Cerrar Sesión</button>
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
                <form action="proponer_plaza.php">
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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // Obtener el nombre de usuario desde el localStorage
        $(document).ready(function () {
            var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));
            if (estudianteData) {
                var nombreEstudiante = estudianteData.Nombre;
                $('#nombreUsuario').text(nombreEstudiante);
            }
        });
    </script>

    <script>
        $(document).ready(function () {
            // Agregar un evento de clic al botón con el id único
            $('#btnCerrarSesion').on('click', function () {
                // Eliminar los datos del estudiante del localStorage
                localStorage.removeItem('estudianteData');

                // Redirigir a la página de login
                window.location.href = 'login.php';
            });
        });
    </script>
</body>

</html>