<?php
include 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $Correo = $_POST['Correo'];
    $Teléfono = $_POST['Teléfono'];

    $conexion = new Conexion();

    if ($conexion->getConexion()->connect_error) {
        die("Error de conexión: " . $conexion->getConexion()->connect_error);
    }
    $username = $conexion->getConexion()->real_escape_string($Correo);
    $password = $conexion->getConexion()->real_escape_string($Teléfono);

    $query = "SELECT IDEstudiante, Nombre, Apellido, Dirección, Correo, Teléfono, idCarrera FROM estudiante WHERE Correo = '$username' AND Teléfono = '$password'";
    echo "Query: $query"; // Imprimir la consulta SQL para ver si los valores se escapan correctamente
    
    $resultado = $conexion->consultar($query);

    if ($resultado->num_rows > 0) {
        $fila = $resultado->fetch_assoc();
        $estudianteID = $fila['IDEstudiante'];
        $nombre = $fila['Nombre'];
        $apellido = $fila['Apellido'];
        $direccion = $fila['Dirección'];
        $correo = $fila['Correo'];
        $telefono = $fila['Teléfono'];
        $idCarrera = $fila['idCarrera'];

        $estudianteData = array(
            'IDEstudiante' => $estudianteID,
            'Nombre' => $nombre,
            'Apellido' => $apellido,
            'Dirección' => $direccion,
            'Correo' => $correo,
            'Teléfono' => $telefono,
            'idCarrera' => $idCarrera
        );

        $estudianteJSON = json_encode($estudianteData);
        echo '<script>localStorage.setItem("estudianteData", \'' . $estudianteJSON . '\');</script>';

        // Mensaje de bienvenida
        echo '<script>alert("¡Bienvenido, ' . $nombre . '!");</script>';

        // Redirigir a la página de inicio
        echo '<script>window.location.href = "index.php";</script>';
        exit();
    } else {
        $mensajeError = "Correo o contraseña incorrectos";
    }
    $conexion->cerrar();
}
?>
<!DOCTYPE html>
<html>

<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">Iniciar sesión</h2>
                    </div>
                    <div class="card-body">
                        <form action="login.php" method="post">
                            <div class="form-group">
                                <label for="Correo">Correo:</label>
                                <input type="text" id="Correo" name="Correo" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="Teléfono">Teléfono:</label>
                                <input type="password" id="Teléfono" name="Teléfono" class="form-control" required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                            </div>
                        </form>
                        <?php
                        if (isset($mensajeError)) {
                            echo '<div class="alert alert-danger mt-3">' . $mensajeError . '</div>';
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.querySelector('.btn-primary').addEventListener('click', function (e) {
                e.preventDefault();
                var username = document.getElementById('Correo').value;
                var password = document.getElementById('Teléfono').value;
                var estudianteData = {
                    'Correo': username,
                    'Teléfono': password
                };
                localStorage.setItem('estudianteData', JSON.stringify(estudianteData));
                document.querySelector('form').submit();
            });
        });
    </script>
</body>

</html>