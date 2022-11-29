<?php
include('config/config_pdo.php');
include('carrito.php');
include('templates/header.php');
$_mensaje = "";
?>
<div class="container mt-4  text-end mb-4 mb-lg-1">
    <a id="btnCrearPdf" type="button" class="btn bg-info" name="printPDF" onclick="imprimirRecibo();">
        Descargar PDF
    </a>
    <script>
        function imprimirRecibo() {
            window.print();
        }
    </script>
</div>
<div class="center mt-5">
    <div class="card pt-3 ">
        <div class="d-flex justify-content-end m-5">
            <img src="tottus.svg" alt="">
        </div>
        <div class="col-12 text-uppercase d-flex justify-content-center  " style="font-size: 25px;">
            <p>Recibo Electronico</p>
        </div>
        <div class="container-fluid p-2">
            <?php
            try {
                $query = $conn->prepare("SELECT * FROM `pedidos` ORDER BY pedido_id DESC LIMIT 1");
                $query->execute(array());
                $result = $query->FetchAll(PDO::FETCH_ASSOC);
            } catch (Exception $err) {
                print 'Error!: ' . $err->getMessage() . '<br>';
                die();
            }
            ?>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Distrito</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Calle</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <?php
                        foreach ($result as $key => $pedido) { ?>
                            <td><?php echo ($pedido['NOMBRE']); ?></td>
                            <td><?php echo ($pedido['DISTRITO']); ?></td>
                            <td><?php echo ($pedido['DIRECCION']); ?></td>
                            <td><?php echo ($pedido['CALLE']); ?></td>
                            <td>S/. <?php echo ($pedido['TOTAL']); ?></td>
                        <?php
                        }
                        ?>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="vh-100 row align-items-center justify-content-center col-auto">
        <div class="text-center">
            <div class="alert alert-success w-auto">¡SU PEDIDO FUE REALIZADO CON EXITO!</div>
            <a href="index.php" class="btn btn-confirmar">Seguir comprando</a>
        </div>
    </div>
</div>

<?php include('templates/footer.php'); ?>