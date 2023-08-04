<?php include 'plantilla.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div>
        <!-- Formulario de búsqueda avanzada -->
        <form action="procesar_busqueda_avanzada.php" method="get" class="mt-4">
            <label for="busqueda">Búsqueda:</label>
            <input type="text" id="busqueda" name="busqueda" class="form-control" placeholder="Vinculación docente" required>
            <p>Busqueda Avanzada</p>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="pais">País:</label>
                    <input type="text" id="pais" name="pais" class="form-control" placeholder="Ingrese el país">
                </div>
                <div class="form-group col-md-4">
                    <label for="ciudad">Ciudad:</label>
                    <input type="text" id="ciudad" name="ciudad" class="form-control" placeholder="Ingrese la ciudad">
                </div>
                <div class="form-group col-md-4">
                    <label for="tipo_empresa">Tipo de Empresa:</label>
                    <input type="text" id="tipo_empresa" name="tipo_empresa" class="form-control" placeholder="Ingrese el tipo de empresa">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="empresa">Empresa:</label>
                    <input type="text" id="empresa" name="empresa" class="form-control" placeholder="Ingrese el nombre de la empresa">
                </div>
                <div class="form-group col-md-4">
                    <label for="sistema">Sistema:</label>
                    <input type="text" id="sistema" name="sistema" class="form-control" placeholder="Ingrese el nombre del sistema">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Filtrar</button>
        </form>
        
    </div>

    <hr>

    <div class="container mt-4">
        <!-- Tabla 1 -->
        <table class="table table-bordered">
            <tr>
                <td>Información de la base de datos 1</td>
                <td>
                    <button class="btn btn-primary">Mostrar más información</button>
                </td>
            </tr>
        </table>
        <div class="container" style="display: none;">
            <!-- Contenido adicional que se mostrará al hacer clic en el botón -->
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel urna nec justo tincidunt tempor. Quisque vehicula lorem eu vestibulum finibus.
        </div>

        <!-- Tabla 2 -->
        <table class="table table-bordered">
            <tr>
                <td>Información de la base de datos 2</td>
                <td>
                    <button class="btn btn-primary">Mostrar más información</button>
                </td>
            </tr>
        </table>
        <div class="container" style="display: none;">
            <!-- Contenido adicional que se mostrará al hacer clic en el botón -->
            Sed eu orci nec ipsum interdum dapibus. Etiam vel nunc sit amet eros sagittis venenatis. Vivamus ut fermentum odio.
        </div>

        <!-- Tabla 3 -->
        <table class="table table-bordered">
            <tr>
                <td>Información de la base de datos 3</td>
                <td>
                    <button class="btn btn-primary">Mostrar más información</button>
                </td>
            </tr>
        </table>
        <div class="container" style="display: none;">
            <!-- Contenido adicional que se mostrará al hacer clic en el botón -->
            Quisque eu massa ac lorem tristique consectetur. In bibendum rhoncus nibh, quis volutpat arcu pharetra nec.
        </div>
    </div>

    
    
</body>
</html>
