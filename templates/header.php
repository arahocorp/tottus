<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TOTTUS</title>
	<!-- CSS only -->
	<link rel="stylesheet" href="librerias/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<script src="https://kit.fontawesome.com/acf596811c.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="">
	<style>
		html {
			height: 100%;
		}

		body {
			display: flex;
			flex-direction: column;
			min-height: 100%;
		}

		footer {
			margin-top: auto;
		}

		.col-3 {
			margin-bottom: 30px;
		}
	</style>
</head>

<header>
	<nav class="navbar navbar-expand-sm bg-success navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.php">TOTTUS</a>


			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="ropa.php">Ropas</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="juguetes.php">juguetes</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="tecnologia.php">Tecnologia</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="panetones.php">Panetones</a>
					</li>

					<li class="nav-item">
						<a class="nav-link" href="MostrarCarrito.php">
							<i class="fa-solid fa-cart-shopping"></i>(
							<?php
							echo (empty($_SESSION['carrito'])) ? 0 : count($_SESSION['carrito']);
							?>)</a>
					</li>

				</ul>


			</div>
		</div>

	</nav>

</header>


<body>

	<div class="container">