-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2022 a las 18:28:13
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
(79, 'alan', 84, NULL, NULL, NULL, NULL, 987454654, 'contac@soriam.net'),
(80, 'fdsaf', 85, NULL, NULL, NULL, NULL, 0, 'alan@gmai.com');

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
  `COMIDA_ID` int(11) NOT NULL,
  `COMIDA_NOMBRE` varchar(255) NOT NULL,
  `PRECIO` decimal(20,2) NOT NULL,
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`DETALLE_VENTA_ID`, `ID_VENTA`, `COMIDA_ID`, `COMIDA_NOMBRE`, `PRECIO`, `CANTIDAD`) VALUES
(41, 72, 14, 'Chaufa de pollo ', '10.00', 1),
(42, 72, 14, 'Chaufa de pollo ', '10.00', 1),
(43, 73, 15, 'DELL', '1599.00', 1),
(44, 73, 13, 'huawei', '2799.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `DIRECCION_ID` int(11) NOT NULL,
  `DIRECCION_NUMERO_CALLE` varchar(255) DEFAULT NULL,
  `DIRECCION_COMUNA` varchar(50) DEFAULT NULL,
  `DIRECCION_CIUDAD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`DIRECCION_ID`, `DIRECCION_NUMERO_CALLE`, `DIRECCION_COMUNA`, `DIRECCION_CIUDAD`) VALUES
(84, 'fdsfs', 'jfkdjskj', 'arequipa'),
(85, 'fdsaf', 'fdsaf', 'fdasf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `PEDIDO_ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  `COMUNA` varchar(100) NOT NULL,
  `CALLE` varchar(200) NOT NULL,
  `VENTA_PEDIDO` int(11) NOT NULL,
  `TOTAL` decimal(20,2) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`PEDIDO_ID`, `NOMBRE`, `DIRECCION`, `COMUNA`, `CALLE`, `VENTA_PEDIDO`, `TOTAL`, `FECHA`) VALUES
(4, 'alan', 'arequipa', 'jfkdjskj', 'fdsfs', 72, '20.00', '2022-11-18 16:45:41'),
(5, 'fdsaf', 'fdasf', 'fdsaf', 'fdsaf', 73, '4398.00', '2022-11-18 17:26:36');

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
(13, 'Arequipa', '10', 'huawei', 'Laptop Huawei Matebook D15 i5 15.6\" 8GB RAM 512GB SSD BohrD-WDH9D\r\nS/ 2,799.00', '2799.00', 'huawei.png', 'tecnologia'),
(14, 'Arequipa', '10', 'Asus', 'Laptop ASUS 15 X515EA 15.6\'\' Ci5-1135G7 512SSD 8GB', '2199.00', 'asuslap.png', 'tecnologia'),
(15, 'Arequipa', '10', 'DELL', 'Laptop Dell 15.6\" W - CE AMD Ryzen™ 5 3450U 8GB RAM 256GB', '1599.00', 'dell.png', 'tecnologia'),
(16, 'Arequipa', '10', 'Lenovo', 'LLaptop Lenovo IdeaPad 5 15.6\" FHD AMD Ryzen 7 16GB RAM 512GB SSD', '3199.00', 'lenovo.png', 'tecnologia'),
(17, 'Arequipa', '10', 'Acer', 'Laptop Acer Aspire 15.6\" Intel Core i5 1135G7 8GB RAM 512GB SSD Silver', '2199.00', 'acer.png', 'tecnologia'),
(18, 'Arequipa', '10', 'HP', 'Laptop Huawei Matebook D15 i5 15.6\" 8GB RAM 512GB SSD BohrD-WDH9D', '2199.00', 'HP.png', 'tecnologia');

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
(72, '2022-11-18 16:45:41', '4nm8qj9fsbfaeikf8euqu7f05c', '', '20.00', 79, 'pendiente'),
(73, '2022-11-18 17:26:35', 'og4f2kcc0q77c0pmtqh0bea6gi', '', '4398.00', 80, 'pendiente');

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
  ADD KEY `COMIDA_ID` (`COMIDA_ID`);

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
  MODIFY `CLIENTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `DETALLE_VENTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `DIRECCION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PEDIDO_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VENTA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

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
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`COMIDA_ID`) REFERENCES `productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
