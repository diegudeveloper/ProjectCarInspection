-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-01-2024 a las 20:52:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carsinspection`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Grande'),
(2, 'Pequeno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coberturas`
--

CREATE TABLE `coberturas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coberturas`
--

INSERT INTO `coberturas` (`id`, `nombre`) VALUES
(1, 'Rettrovisor izquierdo con dano'),
(2, 'Rettrovisor derecho con dano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coberturas_seguros`
--

CREATE TABLE `coberturas_seguros` (
  `id` int(11) NOT NULL,
  `seguro_id` int(11) NOT NULL,
  `cobertura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coberturas_seguros`
--

INSERT INTO `coberturas_seguros` (`id`, `seguro_id`, `cobertura_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companias`
--

CREATE TABLE `companias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `nif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `companias`
--

INSERT INTO `companias` (`id`, `nombre`, `nif`) VALUES
(1, 'Sicilybycar', '1234'),
(2, 'GreenMotion', '5678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `numero_telefonico` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_entrega` date NOT NULL,
  `hora_entrega` time NOT NULL,
  `seguro_id` int(11) DEFAULT NULL,
  `vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `numero`, `nombre_cliente`, `numero_telefonico`, `email`, `fecha_inicio`, `hora_inicio`, `fecha_entrega`, `hora_entrega`, `seguro_id`, `vehiculo_id`) VALUES
(2, '830040123', 'Vicor grande', '+35699550123', 'victor@gmail.com', '2024-01-18', '07:00:00', '2024-01-25', '07:00:00', 1, 1),
(3, '830040124', 'Mauricio Lopez', '+35699550223', 'mauricio@gmail.com', '2024-01-18', '07:00:00', '2024-01-20', '07:00:00', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `danos`
--

CREATE TABLE `danos` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `fees` double NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `inspeccion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `danos`
--

INSERT INTO `danos` (`id`, `descripcion`, `fees`, `precio`, `imagen`, `inspeccion_id`) VALUES
(1, 'Dano pequeno en el retrovisor izquierdo, llantas en mal estado, Mensaje de alarma en el tablero.', 2345, 1000, 'imagen1.png', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones`
--

CREATE TABLE `inspecciones` (
  `id` int(11) NOT NULL,
  `comentarios` text NOT NULL,
  `estado` varchar(10) NOT NULL,
  `contrato_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `seguro_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inspecciones`
--

INSERT INTO `inspecciones` (`id`, `comentarios`, `estado`, `contrato_id`, `vehiculo_id`, `seguro_id`) VALUES
(3, 'Full insurence', 'activo', 2, 1, 1),
(4, 'Dano pequeno en el retrovisor izquierdo, llantas en mal estado, Mensaje de alarma en el tablero.', 'Activo', 3, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Inspector');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

CREATE TABLE `seguros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguros`
--

INSERT INTO `seguros` (`id`, `nombre`) VALUES
(1, 'Full insurence'),
(2, 'Otro seguro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `compania_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `rol_id`, `compania_id`) VALUES
(1, 'Diego ', 'Gutierrez', 'taimondg81@gmail.com', '1234', 1, 1),
(2, 'Mohammed', 'Lopez', 'mohammet@gmail.com', '5678', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `transmision` varchar(10) NOT NULL,
  `anio` int(11) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `puertas` int(11) NOT NULL,
  `tipo_tanque` varchar(10) NOT NULL,
  `cantidad_gasolina` varchar(3) NOT NULL,
  `tamano_tanque` varchar(10) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `placa`, `color`, `estado`, `modelo`, `transmision`, `anio`, `kilometraje`, `puertas`, `tipo_tanque`, `cantidad_gasolina`, `tamano_tanque`, `categoria_id`) VALUES
(1, 'XQZ456', 'Blanco', 'activo', 'Peugeot 108', 'Manual', 2019, 21000, 4, 'gasolina', '4/8', 'grande', 2),
(2, 'XQZ506', 'Blanco', 'activo', 'Peugeot 5008', 'automatica', 2020, 23000, 5, 'diesel', '8/8', 'Grande', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_img`
--

CREATE TABLE `vehiculos_img` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `vehiculo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculos_img`
--

INSERT INTO `vehiculos_img` (`id`, `url`, `vehiculo_id`) VALUES
(1, 'imagen1.png', 1),
(2, 'imagen2.png', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coberturas`
--
ALTER TABLE `coberturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coberturas_seguros`
--
ALTER TABLE `coberturas_seguros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cobertura` (`cobertura_id`),
  ADD KEY `FK_seguro` (`seguro_id`);

--
-- Indices de la tabla `companias`
--
ALTER TABLE `companias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vehiculoAluilado` (`vehiculo_id`),
  ADD KEY `FK_seguro_id` (`seguro_id`);

--
-- Indices de la tabla `danos`
--
ALTER TABLE `danos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_inspeccion` (`inspeccion_id`);

--
-- Indices de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_contrato` (`contrato_id`),
  ADD KEY `FK_vehiculos` (`vehiculo_id`),
  ADD KEY `FK_seguroId` (`seguro_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_compania` (`compania_id`),
  ADD KEY `rol` (`rol_id`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categotia` (`categoria_id`);

--
-- Indices de la tabla `vehiculos_img`
--
ALTER TABLE `vehiculos_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vehiculo` (`vehiculo_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coberturas`
--
ALTER TABLE `coberturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coberturas_seguros`
--
ALTER TABLE `coberturas_seguros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `companias`
--
ALTER TABLE `companias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `danos`
--
ALTER TABLE `danos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seguros`
--
ALTER TABLE `seguros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculos_img`
--
ALTER TABLE `vehiculos_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coberturas_seguros`
--
ALTER TABLE `coberturas_seguros`
  ADD CONSTRAINT `FK_cobertura` FOREIGN KEY (`cobertura_id`) REFERENCES `coberturas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_seguro` FOREIGN KEY (`seguro_id`) REFERENCES `seguros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `FK_seguro_id` FOREIGN KEY (`seguro_id`) REFERENCES `seguros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vehiculoAluilado` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `danos`
--
ALTER TABLE `danos`
  ADD CONSTRAINT `FK_inspeccion` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  ADD CONSTRAINT `FK_contrato` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_seguroId` FOREIGN KEY (`seguro_id`) REFERENCES `seguros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vehiculos` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_compania` FOREIGN KEY (`compania_id`) REFERENCES `companias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `FK_categotia` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculos_img`
--
ALTER TABLE `vehiculos_img`
  ADD CONSTRAINT `FK_vehiculo` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
