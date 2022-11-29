-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2022 a las 02:23:21
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tottus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `CLIENTE_ID` int(11) NOT NULL,
  `CLIENTE_NOMBRE` varchar(50) DEFAULT NULL,
  `CLIENTE_DIRECCION_ID` int(11) NOT NULL,
  `CLIENTE_SALDO` decimal(60,2) DEFAULT NULL,
  `CLIENTE_CREDITO` decimal(24,2) DEFAULT NULL,
  `CLIENTE_EDAD` int(11) DEFAULT NULL,
  `CLIENTE_SEXO` varchar(50) DEFAULT NULL,
  `CLIENTE_TELEFONO` bigint(20) DEFAULT NULL,
  `CLIENTE_CORREO` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CLIENTE_ID`, `CLIENTE_NOMBRE`, `CLIENTE_DIRECCION_ID`, `CLIENTE_SALDO`, `CLIENTE_CREDITO`, `CLIENTE_EDAD`, `CLIENTE_SEXO`, `CLIENTE_TELEFONO`, `CLIENTE_CORREO`) VALUES
(90, 'Juan Ferruchini', 95, NULL, NULL, NULL, NULL, 968464487, 'juan@gmail.com'),
(91, 'jkjrqioeu', 96, NULL, NULL, NULL, NULL, 546489489, 'jfdj@kfj.cov'),
(92, 'jfkjs', 97, NULL, NULL, NULL, NULL, 849464, 'fdsfjq@dd.vo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `ID` int(11) NOT NULL,
  `DELIVERY` varchar(100) NOT NULL,
  `NUM_PEDIDO` int(11) NOT NULL,
  `OPERADOR` varchar(100) NOT NULL,
  `TELEFONO` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `DETALLE_VENTA_ID` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(255) NOT NULL,
  `PRECIO` decimal(20,2) NOT NULL,
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`DETALLE_VENTA_ID`, `ID_VENTA`, `ID`, `NOMBRE`, `PRECIO`, `CANTIDAD`) VALUES
(76, 85, 36, 'Dc shoes kalis lite', '499.90', 1),
(77, 85, 14, 'Asus', '2199.00', 1),
(78, 85, 20, 'Paneton gloria', '21.90', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `DIRECCION_ID` int(11) NOT NULL,
  `DIRECCION_NUMERO_CALLE` varchar(255) DEFAULT NULL,
  `DIRECCION_DISTRITO` varchar(50) DEFAULT NULL,
  `DIRECCION_CIUDAD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`DIRECCION_ID`, `DIRECCION_NUMERO_CALLE`, `DIRECCION_DISTRITO`, `DIRECCION_CIUDAD`) VALUES
(95, 'Peru', 'Socabaya', 'Arequipa'),
(96, 'kfjd', 'kfdj', 'kfjdskj'),
(97, 'kfjqewf', 'kfjdsjrjqw', 'jkjfds');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `PEDIDO_ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  `DISTRITO` varchar(100) NOT NULL,
  `CALLE` varchar(200) NOT NULL,
  `VENTA_PEDIDO` int(11) NOT NULL,
  `TOTAL` decimal(20,2) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`PEDIDO_ID`, `NOMBRE`, `DIRECCION`, `DISTRITO`, `CALLE`, `VENTA_PEDIDO`, `TOTAL`, `FECHA`) VALUES
(14, 'Juan Ferruchini', 'Arequipa', 'Socabaya', 'Peru', 83, '4897.90', '2022-11-28 19:55:50'),
(15, 'jkjrqioeu', 'kfjdskj', 'kfdj', 'kfjd', 84, '4400.40', '2022-11-29 01:10:07'),
(16, 'jfkjs', 'jkjfds', 'kfjdsjrjqw', 'kfjqewf', 85, '2720.80', '2022-11-29 01:19:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `PRECIO` decimal(20,2) NOT NULL,
  `IMAGEN` varchar(255) NOT NULL,
  `CATEGORIA` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `NOMBRE`, `DESCRIPCION`, `PRECIO`, `IMAGEN`, `CATEGORIA`) VALUES
(13, 'huawei', 'Laptop Huawei Matebook D15 i5 15.6 8GB RAM 512GB SSD BohrD-WDH9D S/ 2,799.00', '2799.00', 'huawei.png', '1'),
(14, 'Asus', 'Laptop ASUS 15 X515EA 15.6 Ci5-1135G7 512SSD 8GB', '2199.00', 'asuslap.png', '1'),
(15, 'DELL', 'Laptop Dell 15.6 W - CE AMD Ryzen™ 5 3450U 8GB RAM 256GB', '1599.00', 'dell.png', '1'),
(16, 'Lenovo', 'LLaptop Lenovo IdeaPad 5 15.6 FHD AMD Ryzen 7 16GB RAM 512GB SSD', '3199.00', 'lenovo.png', '1'),
(17, 'Acer', 'Laptop Acer Aspire 15.6 Intel Core i5 1135G7 8GB RAM 512GB SSD Silver', '2199.00', 'acer.png', '1'),
(18, 'Victus', 'LAPTOP HP VICTUS 16-D0521LA INTEL CORE I5 8GB RAM 512GB SSD 16.1''', '3199.00', 'hp.png', '1'),
(19, 'Paneton buon natales', 'Contiene 800 gramos paneton clasico relleno de pasas y frutas confitadas alto en azucar alto en grasas saturadas', '20.60', 'buon_natale.png', '2'),
(20, 'Paneton gloria', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas alto en azucar alto en grasas saturadas', '21.90', 'gloria.png', '2'),
(22, 'Paneton donofrio', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas ', '24.90', 'donofrio.png', '2'),
(23, 'Paneton bimbo', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas ', '21.10', 'bimbo.png', '2'),
(24, 'Paneton blanca', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas ', '21.60', 'blanca_flor.png', '2'),
(25, 'Paneton todinno', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas ', '24.60', 'todinno.png', '2'),
(26, 'Funko pop kratos', 'Producto coleccionable material vinilo modelo kratos', '317.90', 'kratos.png', '3'),
(27, 'Funko pop draugr', 'Producto coleccionable material vinilo modelo draugr', '49.90', 'draugr.png', '3'),
(28, 'Funko pop fire troll ', 'Producto coleccionable material vinilo modelo fire troll', '69.90', 'troll.png', '3'),
(29, 'Funko pop darth vader', 'Producto coleccionable material vinilo modelo darth vader', '65.90', 'troll.png', '3'),
(30, 'Funko pop mandalorian', 'Producto coleccionable material vinilo modelo mandalorian', '81.90', 'mandalorian.png', '3'),
(31, 'Funko pop grogu', 'Producto coleccionable material vinilo modelo grogu', '81.90', 'grogu.png', '3'),
(32, 'Nike Essentials', 'Ppolera urbana fabricado con algodon y poliester bolsillo espacioso look clasico', '169.90', 'polera_nike_essentials.png', '4'),
(33, 'Nike sportswear', 'Polera urbana fabricado con algodon, poliester y sherpa bolsillos con cremalleras polera de la coleccion Nike_30', '107.90', 'polera_nike_sportswear.png', '4'),
(34, 'North face Half Dome Tee ', 'Polo deportivo fabricado con algodon manga corta look casual', '129.90', 'polo_north face_half dome tee.png', '4'),
(35, 'North face Half Dome', 'Polera urbana fabricado con poliester bolsillo espacioso look clasico', '493.90', 'polera_north face_half dome.png', '4'),
(36, 'Dc shoes kalis lite', 'Capellada de cuero sistema clasico de cordones logo TPU en el costado Entresuela de goma eva liviana suela de caucho', '499.90', 'zapatilla_dc_kalis lyte.png', '4'),
(37, 'Dc shoes pure high', 'Parte superior de cuero, nobuck, gamuza y / o lona con cuarto de tela. Forro de malla. ', '399.90', 'zapatilla_dc_pure high.png', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VENTA_ID` int(11) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CLAVE_TRANSACCION` varchar(255) NOT NULL,
  `PAY_PAL_DATOS` text NOT NULL,
  `TOTAL` decimal(60,2) NOT NULL,
  `CLIENTE_VENTA_ID` int(11) NOT NULL,
  `ESTADO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`VENTA_ID`, `FECHA`, `CLAVE_TRANSACCION`, `PAY_PAL_DATOS`, `TOTAL`, `CLIENTE_VENTA_ID`, `ESTADO`) VALUES
(83, '2022-11-28 19:55:50', '7sgs6ahc6onlb61ehv26e6rqci', '', '4897.90', 90, 'pendiente'),
(84, '2022-11-29 01:10:07', '7sgs6ahc6onlb61ehv26e6rqci', '', '4400.40', 91, 'pendiente'),
(85, '2022-11-29 01:19:04', '7gbj3cba5v6dbceidbl8c2dk33', '', '2720.80', 92, 'pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CLIENTE_ID`),
  ADD KEY `FK_CLIENTE_DIRECCION_1` (`CLIENTE_DIRECCION_ID`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`DETALLE_VENTA_ID`),
  ADD KEY `ID_VENTA` (`ID_VENTA`),
  ADD KEY `COMIDA_ID` (`ID`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`DIRECCION_ID`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`PEDIDO_ID`),
  ADD KEY `VENTA_PEDIDO` (`VENTA_PEDIDO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VENTA_ID`),
  ADD KEY `FK_CLIENTE_VENTA_1` (`CLIENTE_VENTA_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `DETALLE_VENTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `DIRECCION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PEDIDO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VENTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_CLIENTE_DIRECCION_1` FOREIGN KEY (`CLIENTE_DIRECCION_ID`) REFERENCES `direccion` (`DIRECCION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`VENTA_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`VENTA_PEDIDO`) REFERENCES `ventas` (`VENTA_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_CLIENTE_VENTA_1` FOREIGN KEY (`CLIENTE_VENTA_ID`) REFERENCES `clientes` (`CLIENTE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
