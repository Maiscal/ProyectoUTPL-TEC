<?php
require_once 'conexion.php';

// Función para cargar los datos del CSV en la base de datos
function cargarDatosDesdeCSV($rutaCSV)
{
    $conexion = new Conexion();
    $con = $conexion->getConexion();

    // Abrir el archivo CSV en modo lectura
    if (($archivo = fopen($rutaCSV, 'r')) !== FALSE) {
        // Ignorar la primera línea que contiene los encabezados
        fgetcsv($archivo);

        while (($fila = fgetcsv($archivo)) !== FALSE) {
            // Limpiar y escapar los valores de la fila
            $pais = mysqli_real_escape_string($con, $fila[0]);
            $ciudad = mysqli_real_escape_string($con, $fila[1]);
            $tipoEmpresa = mysqli_real_escape_string($con, $fila[2]);
            $empresa = mysqli_real_escape_string($con, $fila[3]);
            $carrera = mysqli_real_escape_string($con, $fila[4]);
            $preferencia = mysqli_real_escape_string($con, $fila[5]);
            $descripcion = mysqli_real_escape_string($con, $fila[6]);

            // Crear la consulta para insertar la fila en la base de datos
            $query = "INSERT INTO datos (pais, ciudad, tipoEmpresa, empresa, carrera, preferencia, descripcion) VALUES ('$pais', '$ciudad', '$tipoEmpresa', '$empresa', '$carrera', '$preferencia', '$descripcion')";

            // Ejecutar la consulta
            $result = $con->query($query);

            if ($result === FALSE) {
                die("Error al insertar datos: " . $con->error);
            }
        }

        // Cerrar el archivo CSV
        fclose($archivo);

        $conexion->cerrar();
    } else {
        die("Error al abrir el archivo CSV: " . $rutaCSV);
    }
}

// Procesar el archivo CSV si se ha enviado
if (isset($_FILES['csv_file']) && $_FILES['csv_file']['error'] === 0) {
    $nombreTempArchivo = $_FILES['csv_file']['tmp_name'];
    $nombreArchivo = $_FILES['csv_file']['name'];

    // Llamar a la función para cargar los datos desde el CSV
    cargarDatosDesdeCSV($nombreTempArchivo);

    echo 'Los datos han sido cargados exitosamente desde el CSV.';
}
?>

<html>
<body>
<!-- Formulario para cargar el archivo CSV -->
<form action="CargarDatos.php" method="post" enctype="multipart/form-data">
    <label for="csv_file">Seleccionar archivo CSV:</label>
    <input type="file" name="csv_file" id="csv_file" accept=".csv">
    <input type="submit" value="Cargar datos">
</form>
</body>
</html>
