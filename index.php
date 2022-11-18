<?php
include('global/config_pdo.php');
include('carrito.php');
include('templates/header.php');

$_mensaje = "";
?>
<br>

<hr>
<?php
if ($_mensaje != "") { ?>
	<div class="alert alert-success">
		<?php echo $mensaje; ?>
		<a href="MostrarCarrito.php" class="badge text-bg-success">Ver carrito</a>

	</div>

<?php
}

?>

<div class="col-12 text-center text-uppercase">
	<h1>TODOS LOS PRODUCTOS</h1>
</div>
<hr>
<br>


<div class="row">

	<?php
	try {
		$query = $conn->prepare("SELECT * FROM productos");
		$query->execute(array());
		$result = $query->FetchAll(PDO::FETCH_ASSOC);
	} catch (Exception $err) {
		print 'Error!: ' . $err->getMessage() . '<br>';
		die();
	}
	?>
	<?php
	foreach ($result as $key => $producto) { ?>
		<div class="col-3" margin botton="20px">
			<div class="card">
				<img src="<?php echo 'img/' . $producto['IMAGEN']; ?>" class="card-img-top" alt="<?php echo $producto['NOMBRE']; ?>" data-bs-toggle="popover" data-trigger="hover" title="<?php echo $producto['DESCRIPCION']; ?>" data-bs-content="<?php echo $producto['DESCRIPCION']; ?>" height="290px">
				<div class="card-body">
					<span><strong><?php echo $producto['NOMBRE']; ?></strong></span>
					<h5 class="card-title">S/. <?php echo $producto['PRECIO']; ?></h5>
					<p class="card-text"> <?php echo $producto['DESCRIPCION']; ?></p>

					<form action="" method="post">
						<input type="hidden" name="id" id="id" value="<?php echo ($producto['ID']); ?>">
						<input type="hidden" name="nombre" id="nombre" value="<?php echo ($producto['NOMBRE']); ?>">
						<input type="hidden" name="precio" id="precio" value="<?php echo ($producto['PRECIO']); ?>">
						<input type="hidden" name="cantidad" id="cantidad" value="<?php echo 1; ?>">


						<button type="submit" class="btn btn-danger" value="Agregar" name="btnAccion">Agregar al pedido</button>
					</form>

				</div>
			</div>

		</div>


	<?php

	}
	?>
</div>
</div>

<script>
	$(function() {
		$('[data-bs-toggle="popover"]').popover()
	});
</script>

<?php include('templates/footer.php'); ?>