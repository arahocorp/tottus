-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2022 a las 06:40:36
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL,
  `DELIVERY` varchar(50) NOT NULL,
  `PROMOCION` varchar(255) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `PRECIO` decimal(20,2) NOT NULL,
  `IMAGEN` varchar(255) NOT NULL,
  `CATEGORIA` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `DELIVERY`, `PROMOCION`, `NOMBRE`, `DESCRIPCION`, `PRECIO`, `IMAGEN`, `CATEGORIA`) VALUES
(13, 'Arequipa', '10', 'huawei', 'Laptop Huawei Matebook D15 i5 15.6\" 8GB RAM 512GB SSD BohrD-WDH9D\r\nS/ 2,799.00', '2799.00', 'huawei.png', '1'),
(14, 'Arequipa', '10', 'Asus', 'Laptop ASUS 15 X515EA 15.6\'\' Ci5-1135G7 512SSD 8GB', '2199.00', 'asuslap.png', '1'),
(15, 'Arequipa', '10', 'DELL', 'Laptop Dell 15.6\" W - CE AMD Ryzen™ 5 3450U 8GB RAM 256GB', '1599.00', 'dell.png', '1'),
(16, 'Arequipa', '10', 'Lenovo', 'LLaptop Lenovo IdeaPad 5 15.6\" FHD AMD Ryzen 7 16GB RAM 512GB SSD', '3199.00', 'lenovo.png', '1'),
(17, 'Arequipa', '10', 'Acer', 'Laptop Acer Aspire 15.6\" Intel Core i5 1135G7 8GB RAM 512GB SSD Silver', '2199.00', 'acer.png', '1'),
(18, 'Arequipa', '10', 'HP', 'Laptop Huawei Matebook D15 i5 15.6\" 8GB RAM 512GB SSD BohrD-WDH9D', '2199.00', 'HP.png', '1'),
(19, '', '', 'Paneton buon natales', 'Contiene 800 gramos paneton clasico relleno de pasas y frutas confitadas alto en azucar alto en grasas saturadas', '20.60', 'buon_natale.png', '2'),
(20, '', '', 'Paneton gloria', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas\nalto en azucar\nalto en grasas saturadas', '21.90', 'gloria.png', '2'),
(22, '', '', 'Paneton donofrio', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas\n', '24.90', 'donofrio.png', '2'),
(23, '', '', 'Paneton bimbo', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas\n', '21.10', 'bimbo.png', '2'),
(24, '', '', 'Paneton blanca', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas\n', '21.60', 'blanca_flor.png', '2'),
(25, '', '', 'Paneton todinno', 'Contiene 900 gramos paneton clasico relleno de pasas y frutas confitadas\n', '24.60', 'todinno.png', '2'),
(26, '', '', 'Funko pop kratos', 'Producto coleccionable\r\nmaterial vinilo\r\nmodelo kratos', '317.90', 'kratos.png', '3'),
(27, '', '', 'Funko pop draugr', 'Producto coleccionable\r\nmaterial vinilo\r\nmodelo draugr', '49.90', 'draugr.png', '3'),
(28, '', '', 'Funko pop fire troll\r\n', 'Producto coleccionable\r\nmaterial vinilo\r\nmodelo fire troll', '69.90', 'troll.png', '3'),
(29, '', '', 'Funko pop darth vader', 'Producto coleccionable\r\nmaterial vinilo\r\nmodelo darth vader', '65.90', 'troll.png', '3'),
(30, '', '', 'Funko pop mandalorian', 'Producto coleccionable\r\nmaterial vinilo\r\nmodelo mandalorian', '81.90', 'mandalorian.png', '3'),
(31, '', '', 'Funko pop grogu', 'Producto coleccionable\r\nmaterial vinilo\r\nmodelo grogu', '81.90', 'grogu.png', '3'),
(32, '', '', 'Nike Essentials', 'Ppolera urbana\r\nfabricado con algodon y poliester\r\nbolsillo espacioso\r\nlook clasico', '169.90', 'polera_nike_essentials.png', '4'),
(33, '', '', 'Nike sportswear', 'Polera urbana\r\nfabricado con algodon, poliester y sherpa\r\nbolsillos con cremalleras\r\npolera de la coleccion Nike_30', '107.90', 'polera_nike_sportswear.png', '4'),
(34, '', '', 'North face Half Dome Tee ', 'Polo deportivo\r\nfabricado con algodon\r\nmanga corta\r\nlook casual', '129.90', 'polo_north face_half dome tee.png', '4'),
(35, '', '', 'North face Half Dome', 'Polera urbana\r\nfabricado con poliester\r\nbolsillo espacioso\r\nlook clasico', '493.90', 'polera_north face_half dome.png', '4'),
(36, '', '', 'Dc shoes kalis lite', 'Capellada de cuero\r\nsistema clasico de cordones\r\nlogo TPU en el costado\r\nEntresuela de goma eva liviana\r\nsuela de caucho', '499.90', 'zapatilla_dc_kalis lyte.png', '4'),
(37, '', '', 'Dc shoes pure high', 'Parte superior de cuero, nobuck, gamuza y / o lona con cuarto de tela.\r\nForro de malla.\r\nCuello y lengua acolchados con espuma para mayor comodidad y soporte.\r\nConstrucción Cupsole.\r\nSuela DC con estampado Pill Pattern registrado.\r\nSuela de goma resistent', '399.90', 'zapatilla_dc_pure high.png', '4');

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
  ADD KEY `ID` (`ID`);

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
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `DETALLE_VENTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `DIRECCION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PEDIDO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VENTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

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
