<?php
class Conexion {
    private $host = "localhost";
    private $port = 3306;
    private $socket = "";
    private $user = "root";
    private $password = "";
    private $dbname = "system_sat"; // El nombre de la base de datos es con letras mayúsculas
    private $con;

    public function __construct() {
        $this->con = new mysqli($this->host, $this->user, $this->password, $this->dbname, $this->port, $this->socket);

        // Verificar si hay algún error en la conexión
        if ($this->con->connect_error) {
            die("Error al conectar a la base de datos: " . $this->con->connect_error);
        }
    }

    public function getConexion() {
        return $this->con;
    }

    public function cerrar() {
        $this->con->close();
    }

    public function consultar($query) {
        return $this->con->query($query);
    }
}
?>