-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2023 a las 02:07:49
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

DELIMITER $$
--
-- Procedimientos





--


CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCategoria` (IN `p_nombre` VARCHAR(50))   BEGIN
	INSERT INTO categoria_plato (nombre)
	VALUES (p_nombre);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarEmpleados` (IN `p_nombre` VARCHAR(50), IN `p_email` VARCHAR(50), IN `p_salario` DECIMAL(10,2), IN `p_puesto` VARCHAR(50), IN `p_telefono` VARCHAR(20))   BEGIN
  INSERT INTO empleado (nombre, email, salario, puesto, telefono)
  VALUES (p_nombre, p_email, p_salario, p_puesto, p_telefono);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarIngrediente` (IN `p_nombre` VARCHAR(50), IN `p_descripcion` VARCHAR(50))   BEGIN
	
    INSERT INTO ingrediente (nombre, descripcion)
  VALUES (p_nombre, p_descripcion);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarCategoria` (IN `p_id` INT, IN `p_nombre` VARCHAR(255))   BEGIN

UPDATE categoria_plato
  SET nombre = p_nombre WHERE id = p_id;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarEmpleado` (IN `p_id_empleado` INT(50), IN `p_nombre` VARCHAR(50), IN `p_email` VARCHAR(50), IN `p_salario` DECIMAL(10,2), IN `p_puesto` VARCHAR(50), IN `p_telefono` VARCHAR(20))   BEGIN
  UPDATE empleado
  SET nombre = p_nombre, email = p_email, salario = p_salario, puesto = p_puesto, telefono = p_telefono
  WHERE id_empleado = p_id_empleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarIngredientes` (IN `p_id_ingrediente` INT(50), IN `p_nombre` VARCHAR(50), IN `p_descripcion` VARCHAR(50))   BEGIN
	UPDATE ingrediente
	SET nombre = p_nombre, descripcion = p_descripcion
	WHERE id = p_id_ingrediente;
END$$


CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarCategoria` ()   SELECT * FROM categoria_plato$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarEmpleados` ()   SELECT * from empleados$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarIngredientes` ()   SELECT * FROM ingrediente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarPlatos` ()   SELECT * FROM plato$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nombre_del_procedimiento` ()   BEGIN
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `recomendacion` (IN `id_plato` INT, IN `id_necesidad` INT)   BEGIN
	DECLARE id_ingrediente INT DEFAULT 0;
    
	SELECT Ingrediente_ID into id_ingrediente FROM `plato_ingrediente` where Plato_ID = id_plato and Prioridad = (SELECT MIN(Prioridad) FROM plato_ingrediente WHERE Plato_ID =id_plato);
    SELECT plato.ID, plato.Nombre, plato.Descripcion, plato.Precio,plato.ID_Categoria_Plato FROM plato inner join plato_ingrediente on plato_ingrediente.Plato_ID = plato.ID where plato_ingrediente.Ingrediente_ID = id_ingrediente and plato.id_nececidad = id_necesidad;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentos`
--

CREATE TABLE `alimentos` (
  `id_alimento` int(11) NOT NULL,
  `nombre_alimento` varchar(255) NOT NULL,
  `calorias` decimal(10,2) NOT NULL,
  `grasas` decimal(10,2) NOT NULL,
  `proteinas` decimal(10,2) NOT NULL,
  `carbohidratos` decimal(10,2) NOT NULL,
  `vitamina_a` decimal(10,2) NOT NULL,
  `hierro` decimal(10,2) NOT NULL,
  `calcio` decimal(10,2) NOT NULL,
  `fibra` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Cargo` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_comidas`
--

CREATE TABLE `historial_comidas` (
  `id_comida` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `comida_consumida` varchar(255) NOT NULL,
  `cantidad_consumida` decimal(10,2) NOT NULL,
  `calorias_consumidas` decimal(10,2) NOT NULL,
  `grasas_consumidas` decimal(10,2) NOT NULL,
  `proteinas_consumidas` decimal(10,2) NOT NULL,
  `carbohidratos_consumidos` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Estructura de tabla para la tabla `necesidades_usuario`
--

CREATE TABLE `necesidades_usuario` (
  `id_usuario` int(11) NOT NULL,
  `genero` enum('M','F') NOT NULL,
  `edad` int(11) NOT NULL,
  `altura` decimal(10,2) NOT NULL,
  `peso_actual` decimal(10,2) NOT NULL,
  `objetivo_perdida_peso` decimal(10,2) NOT NULL,
  `nivel_actividad_fisica` enum('sedentario','moderado','activo') NOT NULL,
  `preferencias_alimentarias` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(8, 'Moro rojo y pollo', 'moro rojo y pollo', '22.00', 5, 5);

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
(29, 8, 16, '1.00', 'Tazas', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL,
  `nombre_receta` varchar(255) NOT NULL,
  `ingredientes` text NOT NULL,
  `preparacion` text NOT NULL,
  `calorias_porcion` decimal(10,2) NOT NULL,
  `grasas_porcion` decimal(10,2) NOT NULL,
  `proteinas_porcion` decimal(10,2) NOT NULL,
  `carbohidratos_porcion` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restricciones_alimentarias`
--

CREATE TABLE `restricciones_alimentarias` (
  `id_restriccion` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo_restriccion` varchar(255) NOT NULL,
  `alimentos_a_evitar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentos`
--
ALTER TABLE `alimentos`
  ADD PRIMARY KEY (`id_alimento`);

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
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `historial_comidas`
--
ALTER TABLE `historial_comidas`
  ADD PRIMARY KEY (`id_comida`);

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
-- Indices de la tabla `necesidades_usuario`
--
ALTER TABLE `necesidades_usuario`
  ADD PRIMARY KEY (`id_usuario`);

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
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id_receta`);

--
-- Indices de la tabla `restricciones_alimentarias`
--
ALTER TABLE `restricciones_alimentarias`
  ADD PRIMARY KEY (`id_restriccion`);

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
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `plato_ingrediente`
--
ALTER TABLE `plato_ingrediente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
