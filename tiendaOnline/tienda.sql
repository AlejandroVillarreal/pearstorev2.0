-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2019 a las 20:17:14
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`) VALUES
(1, 'boscan', '123456', 'Anyelber');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carro`
--

CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carro`
--

INSERT INTO `carro` (`id`, `id_cliente`, `id_producto`, `cant`) VALUES
(8, 1, 2, 3),
(9, 6, 4, 1),
(12, 8, 4, 2),
(13, 8, 11, 1),
(14, 8, 1, 1),
(15, 8, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(2, 'Tecnologia'),
(3, 'Alimentos'),
(4, 'En Linea');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `username`, `password`, `name`) VALUES
(1, 'boscan', '123456', 'Anyelber'),
(3, 'anyelber', 'anyelber', 'Anyelber'),
(6, 'test', 'test', 'test'),
(7, 'ususarioprueba', '123', 'Ususario Prueba'),
(8, 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` float NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `id_cliente`, `fecha`, `monto`, `estado`) VALUES
(8, 1, '2019-05-22 18:03:44', 1360, 1),
(9, 1, '2019-05-29 22:31:14', 2360, 0),
(10, 1, '2019-05-29 23:02:19', 2860, 0),
(11, 7, '2019-10-29 18:11:32', 400, 0),
(12, 8, '2019-10-29 18:14:44', 400, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `comprobante` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `id_cliente`, `id_compra`, `comprobante`, `nombre`, `fecha`, `estado`) VALUES
(4, 1, 8, '01055363.png', 'Anyelber Boscan', '2019-05-22 18:05:53', 1),
(5, 8, 12, '1.png', '', '2019-10-29 18:52:54', 0),
(6, 8, 12, '1.png', '', '2019-10-29 19:29:43', 0),
(7, 8, 12, '1.png', '', '2019-10-29 19:34:42', 0),
(8, 8, 12, '1.png', '', '2019-10-29 19:35:12', 0),
(9, 8, 12, '1.png', '', '2019-10-29 19:37:49', 0),
(10, 8, 12, '1.png', '', '2019-10-29 19:42:03', 0),
(11, 8, 12, '1.png', '', '2019-10-29 19:42:11', 0),
(12, 8, 12, '1.png', '', '2019-10-30 14:43:15', 0),
(13, 8, 12, '1.png', '', '2019-10-30 14:43:43', 0),
(14, 8, 12, '1.png', '', '2019-10-30 14:46:50', 0),
(15, 8, 12, '1.png', '', '2019-10-30 14:48:15', 0),
(16, 8, 12, '1.png', '', '2019-10-30 14:52:15', 0),
(17, 8, 12, '1.png', '', '2019-10-30 14:58:13', 0),
(18, 8, 12, '1.png', '', '2019-10-30 14:58:33', 0),
(19, 8, 12, '1.png', '', '2019-10-30 21:12:08', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `oferta` int(11) NOT NULL,
  `cat` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `price`, `imagen`, `name`, `id_categoria`, `oferta`, `cat`) VALUES
(1, 19999, 'asuslaptop369.png', 'Asus ROG: CPU i7, 8GB RAM, 512GB SSD, GTX 1650', 3, 0, 1),
(2, 4999, 'hplaptop581.png', 'HP Elite Book: CPU i5 2.5GHZ, 8GB RAM, 500 HDD', 3, 0, 1),
(4, 18400, 'huaweilaptop.png', 'Huawei MateBook: CPU AMD Ryzen 5, 8GB RAM, 256GB SSD', 3, 50, 1),
(5, 29999, 'macbookpro.png', 'MacBook Pro: CPU Core i9 2.4GHZ, 23GB RAM, 2TB SSD', 3, 10, 1),
(6, 5999, 'xperia.jpg', 'Sony Xperia XZ1: 64GB 19Mpx 4k FullHD', 0, 0, 2),
(7, 20499, 'iphone11.jpg', 'Iphone X: 64 GB iOS', 0, 0, 2),
(8, 5740, 'huaweip30.jpg', 'Huawei P30 Lite: 256GB 16Mpx FullHD', 0, 0, 2),
(9, 2725, 'skullcandy.jpg', 'Skull Candy Crusher', 0, 0, 3),
(10, 467, 'caseiphone.jpg', 'CandyShell for Iphone', 0, 0, 3),
(11, 153, 'cablehdmi.jpg', 'Cable HDMI 1.8mts', 0, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_compra`
--

CREATE TABLE `productos_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `monto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_compra`
--

INSERT INTO `productos_compra` (`id`, `id_compra`, `id_producto`, `cantidad`, `monto`) VALUES
(1, 3, 5, 7, 400),
(2, 3, 4, 4, 1000),
(3, 3, 3, 4, 1200),
(4, 3, 2, 4, 200),
(5, 3, 1, 4, 1000),
(6, 4, 5, 1, 400),
(7, 4, 7, 1, 1000),
(8, 5, 5, 1, 400),
(9, 5, 4, 1, 1000),
(10, 5, 7, 1, 1000),
(11, 6, 5, 1, 400),
(12, 7, 7, 1, 1000),
(13, 7, 2, 1, 200),
(14, 7, 1, 1, 1000),
(15, 8, 7, 1, 1000),
(16, 8, 5, 1, 400),
(17, 9, 7, 2, 1000),
(18, 9, 5, 1, 400),
(19, 10, 5, 1, 400),
(20, 10, 4, 1, 1000),
(21, 10, 7, 1, 1000),
(22, 10, 1, 1, 1000),
(23, 11, 5, 1, 400),
(24, 12, 2, 2, 200);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_compra`
--
ALTER TABLE `productos_compra`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `carro`
--
ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos_compra`
--
ALTER TABLE `productos_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
