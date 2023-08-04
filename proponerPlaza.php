<?php include 'plantilla.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Enlaces a los archivos CSS de Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <form action="procesar_formulario.php" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="dirigido_a">Dirigido:</label>
                <input type="text" id="dirigido_a" name="dirigido_a" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="empresa">Empresa:</label>
                <input type="text" id="empresa" name="empresa" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="titulo_plaza">Título de la Plaza:</label>
                <input type="text" id="titulo_plaza" name="titulo_plaza" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" class="form-control" required></textarea>
            </div>



            <div class="form-group">
                <label for="archivo_excel">Subir archivo de Excel:</label>
                <input type="file" id="archivo_excel" name="archivo_excel" class="form-control-file" accept=".xlsx, .xls" required>
            </div>

            <button type="submit" class="btn btn-primary">Proponer</button>
        </form>
    </div>

    <!-- Enlaces a los archivos JS de Bootstrap si es necesario -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
