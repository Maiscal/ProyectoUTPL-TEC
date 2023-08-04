<?php
require_once 'conexion.php';
$conexion = new Conexion();
$con = $conexion->getConexion();


if (isset($_POST['action']) && $_POST['action'] === 'getEstudianteData') {
    
    $estudianteData = $_POST;
    $idEstudiante = $estudianteData['IDEstudiante'];

    
    $optionsPais = obtenerOpcionesPais($idEstudiante);
    $optionsCiudad = obtenerOpcionesCiudad($idEstudiante);
    $optionsTipoEmpresa = obtenerOpcionesTipoEmpresa($idEstudiante);
    $optionsEmpresa = obtenerOpcionesEmpresa($idEstudiante);
    $preferencias = obtenerPreferenciasEstudiante($idEstudiante);


    $result = array(
        'optionsPais' => $optionsPais,
        'optionsCiudad' => $optionsCiudad,
        'optionsTipoEmpresa' => $optionsTipoEmpresa,
        'optionsEmpresa' => $optionsEmpresa,
        'preferencias' => $preferencias
    );

    echo json_encode($result);
} else {
   
    echo json_encode(array('error' => 'Datos del estudiante no recibidos.'));
}


function obtenerOpcionesPais($idEstudiante)
{
    
    $conexion = new Conexion();
    $con = $conexion->getConexion();
    $con->set_charset("utf8");



    $queryPais = "SELECT DISTINCT p.País
    FROM estudiante e
    JOIN carrera c ON e.idCarrera = c.idCarrera
    JOIN plaza p ON c.idCampo_Estudio = p.idCampo_Estudio
    WHERE e.idEstudiante = '$idEstudiante'";

    

    $idEstudianteValor = $idEstudiante;

    $stmt = $con->prepare($queryPais);
  
    $stmt->execute();

    $resultadoPais = $stmt->get_result();

    if ($resultadoPais === false) {
        
        die("Error en la consulta de opciones de país: " . $con->error);
    }

    $options = array("  ");
    while ($fila = $resultadoPais->fetch_assoc()) {
        $options[] = $fila['País'];
    }

    return $options;
}




function obtenerOpcionesCiudad($idEstudiante)
{
    require_once 'conexion.php';
    $conexion = new Conexion();
    $con = $conexion->getConexion();

    if ($conexion->getConexion()->connect_error) {
        die("Error de conexión: " . $conexion->getConexion()->connect_error);
    }

   
    $idEstudiante = $conexion->getConexion()->real_escape_string($idEstudiante);



    $queryCiudad = "SELECT DISTINCT p.Ciudad
    FROM estudiante e
    JOIN carrera c ON e.idCarrera = c.idCarrera
    JOIN plaza p ON c.idCampo_Estudio = p.idCampo_Estudio
    WHERE e.idEstudiante = '$idEstudiante'";

    $resultadoCiudad = $conexion->consultar($queryCiudad);

    if (!$resultadoCiudad) {
       
        die("Error en la consulta de opciones de ciudad: " . $conexion->getConexion()->error);
    }

    $options = array("  ");
    while ($fila = $resultadoCiudad->fetch_assoc()) {
        $options[] = $fila['Ciudad'];
    }



    return $options;
}


function obtenerOpcionesTipoEmpresa($idEstudiante)
{
    
    $conexion = new Conexion();

    if ($conexion->getConexion()->connect_error) {
        die("Error de conexión: " . $conexion->getConexion()->connect_error);
    }


    $idEstudiante = $conexion->getConexion()->real_escape_string($idEstudiante);



    $queryTipoEmpresa = "SELECT DISTINCT p.TipoEmpresa
    FROM estudiante e
    JOIN carrera c ON e.idCarrera = c.idCarrera
    JOIN plaza p ON c.idCampo_Estudio = p.idCampo_Estudio
    WHERE e.idEstudiante = '$idEstudiante'";

    $resultadoTipoEmpresa = $conexion->consultar($queryTipoEmpresa);

    if (!$resultadoTipoEmpresa) {
     
        die("Error en la consulta de opciones de tipo de empresa: " . $conexion->getConexion()->error);
    }

    $options = array("  ");
    while ($fila = $resultadoTipoEmpresa->fetch_assoc()) {
        $options[] = $fila['TipoEmpresa'];
    }



    return $options;
}


function obtenerOpcionesEmpresa($idEstudiante)
{
 
    $conexion = new Conexion();

    if ($conexion->getConexion()->connect_error) {
        die("Error de conexión: " . $conexion->getConexion()->connect_error);
    }

   
    $idEstudiante = $conexion->getConexion()->real_escape_string($idEstudiante);

    $queryEmpresa = "SELECT DISTINCT p.Empresa
    FROM estudiante e
    JOIN carrera c ON e.idCarrera = c.idCarrera
    JOIN plaza p ON c.idCampo_Estudio = p.idCampo_Estudio
    WHERE e.idEstudiante = '$idEstudiante'";


    $resultadoEmpresa = $conexion->consultar($queryEmpresa);

    if (!$resultadoEmpresa) {
        
        die("Error en la consulta de opciones de empresa: " . $conexion->getConexion()->error);
    }

    $options = array("  ");
    while ($fila = $resultadoEmpresa->fetch_assoc()) {
        $options[] = $fila['Empresa'];
    }

   

    return $options;
}


function obtenerPreferenciasEstudiante($idEstudiante)
{
    
    $conexion = new Conexion();

    if ($conexion->getConexion()->connect_error) {
        die("Error de conexión: " . $conexion->getConexion()->connect_error);
    }

    
    $idEstudiante = $conexion->getConexion()->real_escape_string($idEstudiante);



    $queryPreferencias = "SELECT DISTINCT  h.Nombre
    FROM habilidad h
    JOIN campo_estudio ce ON h.idCampo_Estudio = ce.idCampo_Estudio
    JOIN carrera c ON ce.idCampo_Estudio = c.idCampo_Estudio
    JOIN estudiante e ON c.idCarrera = e.idCarrera
    JOIN habilidades_requeridas hr ON h.idHabilidades = hr.idHabilidades
    JOIN plaza p ON hr.idPlazas = p.idPlaza
    WHERE e.idEstudiante =  '$idEstudiante'";

    $resultadoPreferencias = $conexion->consultar($queryPreferencias);

    if (!$resultadoPreferencias) {
       
        die("Error en la consulta de preferencias del estudiante: " . $conexion->getConexion()->error);
    }

    $preferencias = array("Todos");
    while ($fila = $resultadoPreferencias->fetch_assoc()) {
        $preferencias[] = $fila['Nombre'];
    }

    

    return $preferencias;
}



