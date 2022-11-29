<?php
include('config/config_pdo.php');
include('carrito.php');
include('templates/header.php');

$_mensaje = "";
?>

<?php
if (!empty($_SESSION['carrito'])) {
  $total = 0;
  $sid = session_id();

  foreach ($_SESSION['carrito'] as $indice => $producto) {
    $total = $total + ($producto['precio'] * $producto['cantidad']);
  }

?>
  <div class="container mt-3  col-12 col-sm-10 col-md-8 col-lg-6 bg-gradient p-1 p-lg-5">
    <h2>Confirmacion de Pedido</h2>
    <table class="table table-bordered table-sm">
      <thead>
        <tr>
          <th>Monto a Cancelar</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><?php echo 'S/. ' . number_format($total, 2); ?></td>
        </tr>
      </tbody>
    </table>
    <form action="confirmar_pedido.php" method="post">
      <button class="btn btn-confirmar w-100" type="submit" name="btnConfirmar">Confirmar Pedido</button>
    </form>
    <br>
    <?php
    //Captura de variables  

    $ciudad = ($_POST['ciudad']);
    $distrito = ($_POST['distrito']);
    $calle = ($_POST['calle']);
    $nombre = ($_POST['nombre']);
    $telefono = ($_POST['telefono']);
    $correo = ($_POST['email']);
    /* Se registra direccion de cliente */
    $reg_sql = $conn->prepare("INSERT INTO direccion( DIRECCION_NUMERO_CALLE, DIRECCION_DISTRITO, DIRECCION_CIUDAD) VALUES ( :DIRECCION_NUMERO_CALLE, :DIRECCION_DISTRITO, :DIRECCION_CIUDAD)");
    $reg_sql->bindParam(':DIRECCION_NUMERO_CALLE', $calle);
    $reg_sql->bindParam(':DIRECCION_DISTRITO', $distrito);
    $reg_sql->bindParam(':DIRECCION_CIUDAD', $ciudad);
    /*------------------------------------------------------------------------- */
    /*bind_param — Vincula una variable PHP a un parámetro de sentencia SQL     */
    /*------------------------------------------------------------------------- */
    $reg_sql->execute();

    $last_id = $conn->lastInsertId(); //funcion insert_id 

    /* Registro de datos del cliente*/
    $reg_sql = $conn->prepare("INSERT INTO clientes( CLIENTE_NOMBRE, CLIENTE_TELEFONO, CLIENTE_CORREO, CLIENTE_DIRECCION_ID) VALUES (:CLIENTE_NOMBRE, :CLIENTE_TELEFONO, :CLIENTE_CORREO, :CLIENTE_DIRECCION_ID)");
    $reg_sql->bindParam(':CLIENTE_NOMBRE', $nombre);
    $reg_sql->bindParam(':CLIENTE_TELEFONO', $telefono);
    $reg_sql->bindParam(':CLIENTE_CORREO', $correo);
    $reg_sql->bindParam(':CLIENTE_DIRECCION_ID', $last_id);

    $reg_sql->execute();
    $last_id_2 = $conn->lastInsertId(); //funcion insert_id

    $status = "pendiente";

    $reg_sql = $conn->prepare("INSERT INTO `ventas`( CLAVE_TRANSACCION , TOTAL , CLIENTE_VENTA_ID , ESTADO ) VALUES (:CLAVE_TRANSACCION ,:TOTAL , :CLIENTE_VENTA_ID , :ESTADO)");
    $reg_sql->bindParam(':CLAVE_TRANSACCION', $sid);
    $reg_sql->bindParam(':TOTAL', $total);
    $reg_sql->bindParam(':CLIENTE_VENTA_ID', $last_id_2);
    $reg_sql->bindParam(':ESTADO', $status);

    $reg_sql->execute();
    $last_id_3 =  $conn->lastInsertId(); //funcion insert_id

    if (!empty($_SESSION['carrito'])) {

      foreach ($_SESSION['carrito'] as $indice => $producto) {
        $reg_sql = $conn->prepare("INSERT INTO `detalle_ventas`( ID_VENTA, ID, NOMBRE, PRECIO, CANTIDAD ) VALUES (:ID_VENTA, :ID, :NOMBRE, :PRECIO, :CANTIDAD)");
        $reg_sql->bindParam(':ID_VENTA', $last_id_3);
        $reg_sql->bindParam(':ID', $producto['id']);
        $reg_sql->bindParam(':NOMBRE', $producto['nombre']);
        $reg_sql->bindParam(':PRECIO', $producto['precio']);
        $reg_sql->bindParam(':CANTIDAD', $producto['cantidad']);
        $reg_sql->execute();
      }
    }

    $reg_sql = $conn->prepare("INSERT INTO `pedidos`(NOMBRE, DIRECCION, DISTRITO, CALLE, VENTA_PEDIDO, TOTAL) VALUES (:NOMBRE, :DIRECCION, :DISTRITO, :CALLE, :VENTA_PEDIDO, :TOTAL)");
    $reg_sql->bindParam(':NOMBRE', $nombre);
    $reg_sql->bindParam(':DIRECCION', $ciudad);
    $reg_sql->bindParam(':DISTRITO', $distrito);
    $reg_sql->bindParam(':CALLE', $calle);
    $reg_sql->bindParam(':VENTA_PEDIDO', $last_id_3);
    $reg_sql->bindParam(':TOTAL', $total);
    $reg_sql->execute();

    if ($reg_sql = 1) {
    ?>
      <div class="alert alert-success text-center">¡DATOS REGISTRADOS CORRECTAMENTE!</div>
    <?php
    } else {
    ?>
      <div class="alert alert-danger text-center">¡UPS HA OCURRIDO UN ERROR !</div>
    <?php
    }
    ?>
  </div>
<?php
}
session_unset();
$conn = null;
?>

<?php include('templates/footer.php'); ?>