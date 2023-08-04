<?php
require_once 'conexion.php';
require_once 'plantilla.php';


if ($_SERVER["REQUEST_METHOD"] === "POST") {
   
    $id_usuario_propone = $_POST['id_usuario_propone'];
    $dirigido = $_POST['dirigido'];
    $empresa = $_POST['empresa'];
    $titulo_plaza = $_POST['titulo_plaza'];
    $descripcion = $_POST['descripcion'];

    
    $conexion = new Conexion();

   
    $conn = $conexion->getConexion();

    
    $sql = "INSERT INTO proponer_plaza (id_usuario_propone, dirigido, empresa, titulo_plaza, descripcion) 
            VALUES ('$id_usuario_propone', '$dirigido', '$empresa', '$titulo_plaza', '$descripcion')";


    if ($conn->query($sql) === TRUE) {
        echo "Datos guardados correctamente.";
    } else {
        echo "Error al guardar los datos: " . $conn->error;
    }

    // Cerrar la conexión a la base de datos
    $conexion->cerrar();
}   
?>

<html>


<head>
    <title>Formulario para proponer plaza</title>
    <style>
        h1 {
            text-align: center;
            padding: 20px 0;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
    <h1>Formulario para proponer plaza</h1>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <!-- Agregar un campo oculto para enviar el id_usuario_propone desde localStorage -->
        <input type="hidden" id="id_usuario_propone" name="id_usuario_propone" value="">
        <label for="dirigido">Dirigido:</label>
        <input type="text" id="dirigido" name="dirigido" required>

        <label for="empresa">Empresa:</label>
        <input type="text" id="empresa" name="empresa" required>

        <label for="titulo_plaza">Título de la plaza:</label>
        <input type="text" id="titulo_plaza" name="titulo_plaza" required>

        <label for="descripcion">Descripción:</label>
        <textarea id="descripcion" name="descripcion" rows="4" required></textarea>

        <input type="submit" value="Enviar">
    </form>

    <script>
        
        const estudianteData = JSON.parse(localStorage.getItem("estudianteData"));
        document.getElementById("id_usuario_propone").value = estudianteData.IDEstudiante;
    </script>
</body>

</html>