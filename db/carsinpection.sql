-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-01-2024 a las 21:20:36
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carsinpection`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coberturas`
--

DROP TABLE IF EXISTS `coberturas`;
CREATE TABLE IF NOT EXISTS `coberturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coberturas_seguros`
--

DROP TABLE IF EXISTS `coberturas_seguros`;
CREATE TABLE IF NOT EXISTS `coberturas_seguros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seguro_id` int(11) NOT NULL,
  `cobertura_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cobertura` (`cobertura_id`),
  KEY `FK_seguro` (`seguro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companias`
--

DROP TABLE IF EXISTS `companias`;
CREATE TABLE IF NOT EXISTS `companias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nif` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

DROP TABLE IF EXISTS `contratos`;
CREATE TABLE IF NOT EXISTS `contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_cliente` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_telefonico` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `fecha_entrega` date NOT NULL,
  `hora_entrega` time NOT NULL,
  `seguro_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vehiculoAluilado` (`vehiculo_id`),
  KEY `FK_seguro_id` (`seguro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `danos`
--

DROP TABLE IF EXISTS `danos`;
CREATE TABLE IF NOT EXISTS `danos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text COLLATE utf8mb4_general_ci NOT NULL,
  `fees` double NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inspeccion` (`inspeccion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones`
--

DROP TABLE IF EXISTS `inspecciones`;
CREATE TABLE IF NOT EXISTS `inspecciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentarios` text COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrato_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `seguro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contrato` (`contrato_id`),
  KEY `FK_vehiculos` (`vehiculo_id`),
  KEY `FK_seguroId` (`seguro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguros`
--

DROP TABLE IF EXISTS `seguros`;
CREATE TABLE IF NOT EXISTS `seguros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  `compania_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_compania` (`compania_id`),
  KEY `rol` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `transmision` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `anio` int(11) NOT NULL,
  `kilometraje` int(11) NOT NULL,
  `puertas` int(11) NOT NULL,
  `tipo_tanque` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `cantidad_gasolina` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `tamano_tanque` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categotia` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos_img`
--

DROP TABLE IF EXISTS `vehiculos_img`;
CREATE TABLE IF NOT EXISTS `vehiculos_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vehiculo` (`vehiculo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
