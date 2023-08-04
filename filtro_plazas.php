<?php
require_once 'conexion.php';
$conexion = new Conexion();
$con = $conexion->getConexion();

if ($_POST['action'] === 'getDatosFiltrados') {
    // Obtener los datos filtrados a partir de los filtros enviados
    $busqueda = $_POST['busqueda'];
    $pais = $_POST['pais'];
    $ciudad = $_POST['ciudad'];
    $tipoEmpresa = $_POST['tipoEmpresa'];
    $empresa = $_POST['empresa'];

    // Obtener las preferencias seleccionadas desde el cliente
    $preferencias = isset($_POST['preferencias']) ? $_POST['preferencias'] : array();

    // Construir la consulta SQL con los filtros y preferencias seleccionadas
    $query = "SELECT DISTINCT p.* FROM plaza p
              INNER JOIN habilidades_requeridas hr ON p.idPlaza = hr.idPlazas
              INNER JOIN habilidad h ON hr.idHabilidades = h.idHabilidades";

    $params = array();

    if (!empty($preferencias)) {
        $query .= " WHERE (";
        $prefCount = count($preferencias);
        for ($i = 0; $i < $prefCount; $i++) {
            $query .= "h.Nombre LIKE ?";
            array_push($params, '%' . $preferencias[$i] . '%');
            if ($i < $prefCount - 1) {
                $query .= " OR ";
            }
        }
        $query .= ")";
    }

    if (trim($empresa) !== "") {
        $query .= empty($params) ? " WHERE p.Empresa = ?" : " AND p.Empresa = ?";
        array_push($params, $empresa);
    }

    if (trim($tipoEmpresa) !== "") {
        $query .= empty($params) ? " WHERE p.TipoEmpresa = ?" : " AND p.TipoEmpresa = ?";
        array_push($params, $tipoEmpresa);
    }

    if (trim($pais) !== "") {
        $query .= empty($params) ? " WHERE p.País = ?" : " AND p.País = ?";
        array_push($params, $pais);
    }

    if (trim($ciudad) !== "") {
        $query .= empty($params) ? " WHERE p.Ciudad = ?" : " AND p.Ciudad = ?";
        array_push($params, $ciudad);
    }

    if (!empty($busqueda)) {
        $query .= empty($params) ? " WHERE h.Nombre LIKE ?" : " AND h.Nombre LIKE ?";
        array_push($params, '%' . $busqueda . '%');
    }

    // Preparar y ejecutar la consulta con los parámetros
    try {
        $stmt = $con->prepare($query);

        if (!empty($params)) {
            $paramTypes = str_repeat('s', count($params)); // Tipos de parámetros (s: string)
            $stmt->bind_param($paramTypes, ...$params);
        }

        $stmt->execute();
        $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

        // Devolver los datos filtrados en formato JSON
        echo json_encode($result);
    } catch (Exception $e) {
        // Manejo de errores
        echo json_encode(array('error' => 'Error en la consulta: ' . $e->getMessage()));
    }
}
