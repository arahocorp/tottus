<?php
include('config/config_pdo.php');
include('carrito.php');
include('templates/header.php');
$_mensaje = "";
?>
<div class="vh-100 row align-items-center justify-content-center col-auto">
    <div class="text-center">
        <div class="alert alert-success w-auto">¡SU PEDIDO FUE REALIZADO CON EXITO!</div>
        <a href="index.php" class="btn btn-confirmar">Seguir comprando</a>
    </div>
</div>
<?php include('templates/footer.php'); ?>