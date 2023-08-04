

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plataforma de Empleo</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="form-group">
                    <label for="busqueda">Búsqueda:</label>
                    <input type="text" class="form-control" id="busqueda">
                </div>
                <div class="form-group">
                    <label for="pais">País:</label>
                    <select class="form-control" id="pais">
                        <!-- Opciones de país se llenarán dinámicamente -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="ciudad">Ciudad:</label>
                    <select class="form-control" id="ciudad">
                        <!-- Opciones de ciudad se llenarán dinámicamente -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="tipo_empresa">Tipo de Empresa:</label>
                    <select class="form-control" id="tipo_empresa">
                        <!-- Opciones de tipo de empresa se llenarán dinámicamente -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="empresa">Empresa:</label>
                    <select class="form-control" id="empresa">
                        <!-- Opciones de empresa se llenarán dinámicamente -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="carrera">Carrera:</label>
                    <select class="form-control" id="carrera">
                        <!-- Opciones de carrera se llenarán dinámicamente -->
                    </select>
                </div>
                <div class="form-group">
                    <label>Preferencias:</label>
                    <div id="preferencias_buttons">
                        <!-- Botones de preferencias generados automáticamente -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Obtener los datos del estudiante desde localStorage
            var estudianteData = JSON.parse(localStorage.getItem('estudianteData'));

            // Enviar los datos del estudiante al servidor usando AJAX
            $.ajax({
                type: 'POST',
                url: 'datos_estudiante.php',
                data: { estudianteData: estudianteData },
                success: function (response) {
                    // Llenar los combobox con los datos obtenidos del servidor
                    var data = JSON.parse(response);
                    var optionsPais = data.optionsPais;
                    var optionsCiudad = data.optionsCiudad;
                    var optionsTipoEmpresa = data.optionsTipoEmpresa;
                    var optionsEmpresa = data.optionsEmpresa;
                    var optionsCarrera = data.optionsCarrera;

                    $('#pais').html(optionsPais);
                    $('#ciudad').html(optionsCiudad);
                    $('#tipo_empresa').html(optionsTipoEmpresa);
                    $('#empresa').html(optionsEmpresa);
                    $('#carrera').html(optionsCarrera);

                    // Generar los botones de preferencias
                    var preferenciasButtons = data.preferencias;
                    var preferenciasHtml = '';
                    for (var i = 0; i < preferenciasButtons.length; i++) {
                        preferenciasHtml += '<button class="btn btn-secondary mr-2">' + preferenciasButtons[i] + '</button>';
                    }
                    $('#preferencias_buttons').html(preferenciasHtml);
                },
                error: function () {
                    console.log('Error al obtener los datos del estudiante.');
                }
            });
        });
    </script>
</body>
</html>
