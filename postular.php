<?php
require_once 'conexion.php';

// Verificar si la solicitud es a través de POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos enviados a través de POST
    $idPlaza = $_POST['idPlaza'];
    $idEstudiante = $_POST['idEstudiante'];
    error_log("..............: " . $idPlaza . " " . $idEstudiante);


    // Obtener la conexión a la base de datos
    $conexion = new Conexion();
    $con = $conexion->getConexion();

    // Verificar si la conexión fue exitosa
    if ($con->connect_error) {
        die('Error de conexión: ' . $con->connect_error);
    }

    // Crear la consulta SQL para insertar la postulación en la tabla 'postulación'
    $sql = "INSERT INTO `postulación` (`idPlaza`, `idEstudiante`) VALUES ('$idPlaza', '$idEstudiante')";

    // Ejecutar la consulta
    if ($con->query($sql) === TRUE) {
        // La postulación fue insertada exitosamente
        echo json_encode(['success' => true]);
    } else {
        // Hubo un error al insertar la postulación
        echo json_encode(['success' => false, 'error' => 'Error al insertar la postulación: ' . $con->error]);
    }

    // Cerrar la conexión a la base de datos
    $con->close();
}
?>