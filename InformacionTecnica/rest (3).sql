-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2023 a las 07:57:17
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarCategoria` ()   BEGIN
	select * from categoria_plato;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarEmpleados` ()   BEGIN
 SELECT * FROM empleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarIngredientes` ()   BEGIN
	select * from ingrediente;
END$$

DELIMITER ;

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
(1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `ID_DETALLE` int(11) NOT NULL,
  `Pedido_ID` int(11) NOT NULL,
  `Producto_ID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Salario` decimal(10,2) NOT NULL,
  `Puesto` varchar(255) NOT NULL,
  `Telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_EMPLEADO`, `Nombre`, `Email`, `Salario`, `Puesto`, `Telefono`) VALUES
(1, 'Erik Eddy Cruz Garcia', 'erikrdbs@gmail.com', '25000.00', 'Administrador', '8299599496'),
(2, 'Juan Perez', 'juanperez@gmail.com', '40000.00', 'Cocinero', '8091234567'),
(3, 'Maria Rodriguez', 'mariarodriguez@hotmail.com', '25000.00', 'Mesero', '8092345678'),
(4, 'Pedro Gonzalez', 'pedrogonzalez@gmail.com', '80000.00', 'Administrador', '8093456789'),
(5, 'Luisa Ramirez', 'luisaramirez@hotmail.com', '30000.00', 'Cocinero', '8094567890'),
(6, 'Carlos Jimene', 'carlosjimenez@gmail.com', '50000.00', 'Mesero', '8095678901'),
(7, 'Erik', 'Erik@gmasdsad.com', '2.00', '2', '2'),
(8, 'Juan Hubieres', 'Juan@gamlil.com', '45555.00', 'qa', '31423');

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
(1, 'Pan de hamburguesa', 'Pan de hamburguesa artesanal'),
(2, 'Carne de res', 'Carne de res de primera calidad'),
(3, 'Queso cheddar', 'Queso cheddar fundido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID` int(11) NOT NULL,
  `Cliente_ID` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `ID_Categoria_Plato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`ID`, `Nombre`, `Descripcion`, `Precio`, `ID_Categoria_Plato`) VALUES
(1, 'Hamburguesa con queso', 'Deliciosa hamburguesa con queso cheddar', '14.50', 1);

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
(2, 1, 1, '2.00', 'unidades', 1),
(3, 1, 2, '150.00', 'gramos', 2),
(4, 1, 3, '2.00', 'rebanadas', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_plato`
--
ALTER TABLE `categoria_plato`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`ID_DETALLE`),
  ADD KEY `Pedido_ID` (`Pedido_ID`),
  ADD KEY `Producto_ID` (`Producto_ID`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_EMPLEADO`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Cliente_ID` (`Cliente_ID`);

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
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_plato`
--
ALTER TABLE `categoria_plato`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `ID_DETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_EMPLEADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plato`
--
ALTER TABLE `plato`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `plato_ingrediente`
--
ALTER TABLE `plato_ingrediente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`Pedido_ID`) REFERENCES `pedido` (`ID`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`Producto_ID`) REFERENCES `producto` (`ID`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID`);

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
