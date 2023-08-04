<?php
require_once 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conexion = new Conexion();
    $con = $conexion->getConexion();

    $campos = ['pais', 'ciudad', 'tipoEmpresa', 'empresa', 'carrera', 'preferencia', 'descripcion'];

    // Iniciar la consulta con un WHERE verdadero para poder concatenar
    $consulta = "SELECT * FROM datos WHERE 1=1 ";

    // Crear un array para almacenar los valores a usar en bind_param
    $valores = [];
    $tipos = '';

    // Recorrer cada campo y añadir la condición a la consulta
    foreach($campos as $campo) {
        // Comprobar si el campo fue enviado en el POST
        if (!empty($_POST[$campo])) {
            $consulta .= "AND $campo = ? ";
            $valores[] = $_POST[$campo];
            $tipos .= 's';  // Asumiendo que todos los campos son strings
        }
    }

    $stmt = $con->prepare($consulta);

    // Llamar a bind_param con parámetros dinámicos
    $stmt->bind_param($tipos, ...$valores);

    $stmt->execute();

    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
        echo "Pais: " . $row['pais'] . ", Ciudad: " . $row['ciudad'] . ", Empresa: " . $row['empresa'] . ", Carrera: " . $row['carrera'] . ", Preferencia: " . $row['preferencia'] . ", Descripción: " . $row['descripcion'] . "<br>";
    }

    $conexion->cerrar();
}
?>


