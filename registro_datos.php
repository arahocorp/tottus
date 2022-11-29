<?php
include('config/config_pdo.php');
include('carrito.php');
include('templates/header.php');

?>
<br>
<br>

<div class="container mt-4  text-end mb-4 mb-lg-1">
  <button type="button" class="btn bg-info" data-bs-toggle="modal" data-bs-target="#Modal">
    Ver Pedido
  </button>
</div>

<div class="container col-12 col-sm-10 col-md-8 col-lg-6 bg-gradient p-1 p-lg-5">
  <form action="pagar.php" method="post">
    <h1 align="center">REGISTRE SUS DATOS</h1>
    <h2>Datos del Cliente</h2>
    <div class="mb-3 mt-3">
      <label for="email" class="form-label">Ciudad:</label>
      <input type="text" id="ciudad" class="form-control" name="ciudad" placeholder="Ingrese su ciudad.." required>
    </div>
    <div class="mb-3 mt-3">
      <label for="email" class="form-label">Distrito:</label>
      <input type="text" id="distrito" class="form-control" name="distrito" placeholder="Ingrese su distrito.." required>
    </div>
    <div class="mb-3 mt-3">
      <label for="email" class="form-label">Calle:</label>
      <input type="text" id="calle" class="form-control" name="calle" placeholder="Ingrese su calle.." required>
    </div>
    <div class="mb-3 mt-3">
      <label for="email" class="form-label">Nombre:</label>
      <input type="text" id="nombre" class="form-control" name="nombre" placeholder="Ingrese su nombre.." required>
    </div>
    <div class="mb-3 mt-3">
      <label for="email" class="form-label">Telefono:</label>
      <input type="number" id="telefono" class="form-control" name="telefono" placeholder="Ingrese su numero de telefono.." required>
    </div>
    <div class="mb-3 mt-3">
      <label for="email" class="form-label">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Ingrese su Email" name="email" required>
      <small id="emailhelp" clas="form-text text-muted"></small>
    </div>
    <div class="text-center col-12 col-lg-auto  mt-4">
      <button type="submit" class="btn btn-success " name="register">Registrar Datos</button>
    </div>
  </form>
  <div class="alert alert-success text-center mt-5">
    Al registrarse acepta nuestras politicas de uso y privacidad.
  </div>
</div>

<?php include('templates/footer.php'); ?>

<!-- Button trigger modal -->

<main class="container">
  <!-- The Modal -->
  <div class="modal modal-lg " id="Modal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Detalle de Pedido</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          <div class="container">
            <form action="MostrarCarrito.php" method="post">
              <div>
                <div class="mb-3 mt-3">
                  <div class="container mt-3">
                    <?php
                    if (!empty($_SESSION['carrito'])) {
                    ?>
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th width="30%">Descripcion</th>
                            <th width="15%" class="text-center">Cantidad</th>
                            <th width="25%" class="text-center">Precio S/.</th>
                            <th width="25%" class="text-center">Total S/.</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php $total = 0; ?>
                          <?php foreach ($_SESSION['carrito'] as $indice => $producto) { ?>
                            <tr>
                              <td width="30%"><?php echo $producto['nombre'] ?></td>
                              <td width="15%" class="text-center"><?php echo $producto['cantidad'] ?></td>
                              <td width="20%" class="text-center"><?php echo $producto['precio'] ?></td>
                              <td width="20%" class="text-center"><?php echo number_format($producto['precio'] * $producto['cantidad'], 2); ?></td>
                            </tr>
                            <?php $total = $total + ($producto['precio'] * $producto['cantidad']); ?>
                          <?php
                          } ?>
                          <tr>
                            <td colspan="3" align="right">
                              <h3>Total </h3>
                            </td>
                            <td align="right">
                              <h3><?php echo 'S/.' . number_format($total, 2); ?></h3>
                            </td>
                          </tr>
                        <?php } ?>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
        <!-- Modal footer -->

      </div>

    </div>
  </div>
</main>