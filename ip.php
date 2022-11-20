<?php
include('global/config_pdo.php');
include('carrito.php');
include('templates/header.php');

?>
<br>
<br>

<div class="container col-12 col-sm-10 col-md-8 col-lg-6 bg-gradient p-1 p-lg-5">
    <form action="pagar.php" method="post">
        <h1 align="center">REGISTRO DE PRODUCTOS</h1>
        <h2>Detalles</h2>
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">Nombre:</label>
            <input type="text" id="ciudad" class="form-control" name="ciudad" placeholder="Ingrese su ciudad.." required>
        </div>
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">Descripcion:</label>
            <input type="text" id="distrito" class="form-control" name="distrito" placeholder="Ingrese su distrito.." required>
        </div>
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">Precio:</label>
            <input type="text" id="calle" class="form-control" name="calle" placeholder="Ingrese su calle.." required>
        </div>
        <div class="mb-3 mt-3">
            <div class='mb-3'>
                <label for='imagen_producto' class='form-label'>
                    Imagen
                </label>
                <input type='file' name='imagen_producto' class='form-control' id='imagen_producto' accept='image/png, image/jpeg' required>
                <div id='imagenHelp' class='form-text'>Introduce una imagen para el producto</div>
            </div>
        </div>
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">Categoria:</label>
            <input type="text" id="telefono" class="form-control" name="telefono" placeholder="Ingrese su numero de telefono.." required>
        </div>
        <div class="text-center col-12 col-lg-auto  mt-4">
            <button type="submit" class="btn btn-success " name="register">Registrar Datos</button>
        </div>
    </form>
</div>




<?php include('templates/footer.php'); ?>

<!-- Button trigger modal -->