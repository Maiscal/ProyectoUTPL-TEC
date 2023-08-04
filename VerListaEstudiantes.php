<?php
require_once 'conexion.php';

$conexion = new Conexion();
$con = $conexion->getConexion();

$query = "SELECT * FROM usuarios_web WHERE TipoUsuario = 'Estudiante'";
$resultado = $con->query($query);

if ($resultado === FALSE) {
    die("Error en la consulta: " . $con->error);
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Estudiantes</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Lista de Estudiantes</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre de Usuario</th>
            <th>Tipo de Usuario</th>
        </tr>
        <?php while ($row = $resultado->fetch_assoc()) : ?>
            <tr>
                <td><?php echo $row['ID']; ?></td>
                <td><?php echo $row['nombre_usuario']; ?></td>
                <td><?php echo $row['TipoUsuario']; ?></td>
            </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>

<?php
// Cerrar la conexión a la base de datos
$conexion->cerrar();
?>
