<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tottus";

/*
PDO proporciona una capa de abstracción de acceso a datos , lo que significa que, 
independientemente de la base de datos que esté utilizando, utiliza las mismas 
funciones para emitir consultas y obtener datos. PDO no proporciona una 
abstracción de base de datos; no reescribe SQL ni emula funciones faltantes. 
Debe usar una capa de abstracción completa si necesita esa función.
*/

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  //echo "Connected successfully";
} catch(PDOException $e) {
  //echo "Connection failed: " . $e->getMessage();
}
?>