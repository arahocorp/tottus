<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TOTTUS</title>
	<link rel="shortcut icon" href="totus.png" type="image/png">
	<!-- CSS only -->
	<link rel="stylesheet" href="librerias/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/styles.css">
	<!-- Font Awesome -->
	<script src="https://kit.fontawesome.com/acf596811c.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="">
	<style>

	</style>
</head>

<header>
	<nav class="navbar navbar-expand-sm navbar-dark  " id="bg-h">
		<div class="container-fluid ">
			<div class="d-flex justify-align-content-start mr-3">
				<a class="navbar-brand" href="index.php">
					<img src="tottus.svg" alt="">
				</a>
			</div>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse  fs-4 " id="collapsibleNavbar">
				<ul class="navbar-nav ">
					<li class="nav-item">
						<a class="nav-link" href="tecnologia.php">Tecnologia</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="juguetes.php">Juguetes</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="panetones.php">Panetones</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="ropa.php">Ropas</a>
					</li>
				</ul>
			</div>
			<div class="d-flex justify-content-end mr-3" id="i-carrito">
				<li class="nav-item  d-flex justify-content-end">
					<a class="nav-link" href="MostrarCarrito.php">
						<i class="bi bi-cart-check-fill">
							<?php
							echo (empty($_SESSION['carrito'])) ? 0 : count($_SESSION['carrito']);
							?>
						</i>
					</a>
				</li>
			</div>
		</div>
	</nav>
</header>

<body>
	<div class="container">
		<div class="contenedor">