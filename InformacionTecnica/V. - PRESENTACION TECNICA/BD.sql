-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2023 a las 07:02:34
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_plato`
--

CREATE TABLE `categoria_plato` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_plato`
--

INSERT INTO `categoria_plato` (`ID`, `Nombre`) VALUES
(1, 'Bebidas'),
(2, 'Pizzas'),
(3, 'Tacos'),
(4, 'Hamburguesa'),
(5, 'Tradicional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID`, `Nombre`, `Correo`, `Telefono`, `Direccion`) VALUES
(1, 'juan', 'sadsa@gmail.com', '9299599482', 'Topito'),
(2, 'Ana García', 'ana.garcia@example.com', '555-5678', 'Avenida Principal 456'),
(3, 'Pedro Martínez', 'pedro.martinez@example.com', '555-9876', 'Calle 789, Ciudad'),
(4, 'María Rodríguez', 'maria.rodriguez@example.com', '555-2468', 'Calle 234, Ciudad'),
(5, 'Sofía Torres', 'sofia.torres@example.com', '555-8642', 'Calle 222, Ciudad'),
(6, 'Alberto Paul', 'goti@gmail', '4234234', 'Calle 42'),
(7, 'Lukas', 'lukas@correo', '342422', '45 city'),
(8, 'Lukas', 'lukas@correo', '342422', '45 city');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `ID` int(11) NOT NULL,
  `ID_Pedido` int(11) NOT NULL,
  `Plato_ID` int(11) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`ID`, `ID_Pedido`, `Plato_ID`, `Cantidad`, `Precio`) VALUES
(1, 2, 1, '1.00', '12.99'),
(2, 3, 1, '2.00', '25.98'),
(3, 4, 1, '1.00', '12.99'),
(4, 5, 1, '1.00', '12.99'),
(5, 5, 6, '1.00', '4.99'),
(6, 6, 4, '1.00', '5.99'),
(7, 7, 4, '1.00', '5.99'),
(8, 8, 4, '1.00', '5.99'),
(9, 9, 5, '1.00', '9.99'),
(10, 10, 7, '1.00', '5.99'),
(11, 11, 3, '1.00', '15.99'),
(12, 13, 3, '1.00', '15.99'),
(13, 14, 7, '1.00', '5.99'),
(14, 15, 5, '1.00', '9.99'),
(15, 16, 5, '1.00', '9.99'),
(16, 17, 8, '1.00', '22.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`ID`, `Nombre`, `Descripcion`) VALUES
(1, 'Pan de agua', 'Pan de agua'),
(2, 'Pan de Sandwich', 'Pan para realizar Sadwich'),
(3, 'Pan de hamburguesa', 'Pan de hamburguesa artesanal'),
(4, 'Carne de res', 'Carne de res de primera calidad'),
(5, 'Queso cheddar', 'Queso cheddar fundido'),
(6, 'Tortilla de maíz', 'Tortilla de maí '),
(7, 'Cebolla', 'Cebolla'),
(8, 'Cilantro', 'Cilantro'),
(9, 'Limón', 'Limón'),
(10, 'Carne de pollo ', 'Carne de pollo frita wwww'),
(11, 'Tomate', 'Fruta roja de sabor ácido y ligeramente dulce'),
(12, 'Lechuga', 'Vegetal verde y crujiente, rico en fibra'),
(13, 'Carne molida', 'Carne de res picada finamente'),
(14, 'Salsa de tomate', 'Salsa hecha a base de tomates maduros'),
(15, 'Arroz', 'Arroz '),
(16, 'Habichuelas rojas', 'Habichuelas'),
(17, 'Spagueti', 'S'),
(18, 'Habichuelas negras', 'Hbn'),
(19, 'Guandules', 'Gdls'),
(20, 'Maiz', 'm'),
(21, 'Salchicha', 'Slch'),
(22, 'Bacon', 'Bcn'),
(23, 'Aguacate', 'Agtc'),
(24, 'Platano verde', 'Pltn vrd'),
(25, 'Platano maduro', 'Platano mdr'),
(26, 'Huevos', 'hvs'),
(27, 'Jamon', 'Jam'),
(28, 'Aceite', 'Aceite '),
(29, 'Salami', 'Salam'),
(30, 'Carne de cerdo', 'Crn Crdo'),
(31, 'Yuca', 'Yca'),
(32, 'Agua', 'a'),
(33, 'Auyama', 'auyma'),
(34, 'Naranja', 'a'),
(35, 'Leche', 'Lc'),
(36, 'Hot dogs', 'hTDoG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `necesidad`
--

CREATE TABLE `necesidad` (
  `ID` int(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `necesidad`
--

INSERT INTO `necesidad` (`ID`, `Descripcion`) VALUES
(1, 'Deficit calorico'),
(2, '0 Azucar'),
(3, 'Superhabit calorico'),
(4, 'Bajo en sal'),
(5, 'Mantenimiento calorico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID`, `Fecha`, `ID_Cliente`, `Total`) VALUES
(2, '2023-04-25', 1, '12.99'),
(3, '2023-04-25', 1, '25.98'),
(4, '2023-04-26', 2, '12.99'),
(5, '2023-04-26', 1, '17.98'),
(6, '2023-04-26', 4, '5.99'),
(7, '2023-04-26', 3, '5.99'),
(8, '2023-04-26', 3, '5.99'),
(9, '2023-04-26', 3, '9.99'),
(10, '2023-04-26', 5, '5.99'),
(11, '2023-04-26', 5, '15.99'),
(12, '2023-04-26', 5, '0.00'),
(13, '2023-04-26', 5, '15.99'),
(14, '2023-04-26', 5, '5.99'),
(15, '2023-04-26', 4, '9.99'),
(16, '2023-04-26', 4, '9.99'),
(17, '2023-04-26', 6, '22.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `ID_Categoria_Plato` int(11) NOT NULL,
  `id_nececidad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`ID`, `Nombre`, `Descripcion`, `Precio`, `ID_Categoria_Plato`, `id_nececidad`) VALUES
(1, 'Hamburguesa', 'Hamburguesa rica', '12.99', 4, 3),
(2, 'Hamburguesa de pollo', 'Hamburguesa de pollo', '10.99', 4, 3),
(3, 'Bandera ', 'Arroz, habichuela y carne', '15.99', 5, 3),
(4, 'Fritos con salami', 'Platano y salami frito', '5.99', 5, 3),
(5, '3 GOLPES', 'Platano verde, salami, queso y huevos', '9.99', 5, 3),
(6, 'MORIR SONANDO', 'Juego de naranja con leche', '4.99', 1, 3),
(7, 'Moro de guandules y pollo', 'Moro', '5.99', 5, 5),
(8, 'Moro rojo y pollo', 'moro rojo y pollo', '22.00', 5, 5),
(9, 'ENSALADA DE POLLO', 'ENSALADA DE POLLO', '10.99', 5, 1),
(10, 'Pechuga a la plancha', 'a', '10.99', 1, 1),
(11, 'JUGO DE NARANJA SIN AZUCAR', 'JUGO', '4.99', 1, 1),
(12, 'AGUA', '', '0.00', 1, 1),
(13, 'YAROA DE RES', 'a', '4.99', 5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato_ingrediente`
--

CREATE TABLE `plato_ingrediente` (
  `ID` int(11) NOT NULL,
  `Plato_ID` int(11) NOT NULL,
  `Ingrediente_ID` int(11) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `Unidad` varchar(50) NOT NULL,
  `Prioridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plato_ingrediente`
--

INSERT INTO `plato_ingrediente` (`ID`, `Plato_ID`, `Ingrediente_ID`, `Cantidad`, `Unidad`, `Prioridad`) VALUES
(1, 1, 3, '2.00', 'Unidad', 2),
(2, 1, 4, '1.00', 'Unidad', 1),
(3, 1, 5, '1.00', 'Unidad', 3),
(4, 2, 3, '1.00', 'Unidad', 2),
(5, 2, 10, '1.00', 'Unidad', 1),
(6, 2, 12, '1.00', 'Unidad', 3),
(7, 2, 14, '1.00', 'Cucharadas', 5),
(8, 3, 15, '2.00', 'Tazas', 2),
(9, 3, 16, '1.00', 'Tazas', 2),
(10, 3, 10, '3.00', 'Unidad', 1),
(11, 3, 7, '1.00', 'Unidad', 4),
(12, 4, 24, '2.00', 'Unidad', 1),
(13, 4, 29, '2.00', 'Unidad', 2),
(14, 4, 7, '1.00', 'Cucharadas', 4),
(15, 5, 24, '2.00', 'Unidad', 1),
(16, 5, 26, '2.00', 'Unidad', 2),
(17, 5, 29, '1.00', 'Unidad', 2),
(18, 5, 5, '1.00', 'Unidad', 2),
(19, 5, 7, '1.00', 'Cucharadas', 4),
(20, 5, 23, '1.00', 'Unidad', 5),
(21, 6, 34, '1.00', 'Unidad', 1),
(22, 6, 35, '2.00', 'Tazas', 5),
(23, 7, 15, '1.00', 'Libras', 2),
(24, 7, 19, '1.00', 'Tazas', 3),
(25, 7, 7, '1.00', 'Unidad', 2),
(26, 7, 10, '1.00', 'Unidad', 1),
(27, 8, 10, '3.00', 'Unidad', 1),
(28, 8, 15, '3.00', 'Tazas', 3),
(29, 8, 16, '1.00', 'Tazas', 3),
(30, 9, 10, '1.00', 'Gramos', 1),
(31, 9, 26, '1.00', 'Unidad', 2),
(32, 9, 12, '2.00', 'Unidad', 2),
(33, 10, 10, '3.00', 'Unidad', 1),
(34, 10, 12, '1.00', 'Unidad', 2),
(35, 10, 11, '1.00', 'Unidad', 2),
(36, 11, 32, '1.00', 'Tazas', 2),
(37, 11, 34, '1.00', 'Unidad', 1),
(38, 12, 32, '1.00', 'Tazas', 1),
(39, 13, 4, '1.00', 'Unidad', 1),
(40, 13, 5, '1.00', 'Unidad', 2),
(41, 13, 25, '1.00', 'Unidad', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_plato`
--
ALTER TABLE `categoria_plato`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Pedido` (`ID_Pedido`),
  ADD KEY `Plato_ID` (`Plato_ID`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `necesidad`
--
ALTER TABLE `necesidad`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Categoria_Plato` (`ID_Categoria_Plato`);

--
-- Indices de la tabla `plato_ingrediente`
--
ALTER TABLE `plato_ingrediente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Plato_ID` (`Plato_ID`),
  ADD KEY `Ingrediente_ID` (`Ingrediente_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_plato`
--
ALTER TABLE `categoria_plato`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `necesidad`
--
ALTER TABLE `necesidad`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `plato_ingrediente`
--
ALTER TABLE `plato_ingrediente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`ID_Pedido`) REFERENCES `pedido` (`ID`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`Plato_ID`) REFERENCES `plato` (`ID`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`ID_Categoria_Plato`) REFERENCES `categoria_plato` (`ID`);

--
-- Filtros para la tabla `plato_ingrediente`
--
ALTER TABLE `plato_ingrediente`
  ADD CONSTRAINT `plato_ingrediente_ibfk_1` FOREIGN KEY (`Plato_ID`) REFERENCES `plato` (`ID`),
  ADD CONSTRAINT `plato_ingrediente_ibfk_2` FOREIGN KEY (`Ingrediente_ID`) REFERENCES `ingrediente` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
