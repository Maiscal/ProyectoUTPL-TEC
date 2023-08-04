<!DOCTYPE html>
<html>

<head>
    <title>Prueba</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <h2>Tabla de Opciones de País</h2>
    <table>
        <thead>
            <tr>
                <th>País</th>
            </tr>
        </thead>
        <tbody>
            <?php
            require_once 'conexion.php';

            // ID del estudiante constante
            $idEstudiante = '2023000014';

            function obtenerOpcionesPais($idEstudiante)
            {
                // Obtener la instancia de la conexión existente
                $conexion = new Conexion();
                $con = $conexion->getConexion();
                $con->set_charset("utf8");

                // Utilizar una consulta preparada para prevenir inyección de SQL
                $queryPais = "SELECT DISTINCT p.País
                  FROM estudiante e, carrera c, plazas p
                  WHERE p.idCarrera = c.idCarrera
                  AND c.idCampo_Estudio = e.idCarrera
                  AND e.idEstudiante = ?";

                error_log("Consulta SQL: " . $queryPais);

                $stmt = $con->prepare($queryPais);
                $stmt->bind_param("s", $idEstudiante); // "s" indica que el valor es una cadena (string)
                $stmt->execute();

                $resultadoPais = $stmt->get_result();

                if ($resultadoPais === false) {
                    // Error en la consulta
                    die("Error en la consulta de opciones de país: " . $con->error);
                }

                $options = array();
                while ($fila = $resultadoPais->fetch_assoc()) {
                    $options[] = $fila['País'];
                }

                return $options;
            }


            $opcionesPais = obtenerOpcionesPais($idEstudiante);

            foreach ($opcionesPais as $pais) {
                echo '<tr><td>' . $pais . '</td></tr>';
            }
            ?>
        </tbody>
    </table>
</body>

</html>