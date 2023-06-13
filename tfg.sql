-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2023 a las 10:00:52
-- Versión del servidor: 10.4.25-MariaDB-log
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abordo`
--

CREATE TABLE `abordo` (
  `id` int(11) NOT NULL,
  `camarote_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `fecha_de_solicitud` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camarotes`
--

CREATE TABLE `camarotes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo_de_cama` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `crucero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `camarotes`
--

INSERT INTO `camarotes` (`id`, `nombre`, `descripcion`, `tipo_de_cama`, `precio`, `cantidad_disponible`, `crucero_id`) VALUES
(1, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 3),
(2, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 11),
(3, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 17),
(4, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 23),
(5, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 31),
(6, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 39),
(7, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 44),
(8, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 51),
(9, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 60),
(10, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 6),
(11, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 13),
(12, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 16),
(13, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 24),
(14, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 29),
(15, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 36),
(16, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 46),
(17, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 52),
(18, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 62),
(19, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 2),
(20, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 10),
(21, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 15),
(22, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 27),
(23, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 34),
(24, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 38),
(25, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 45),
(26, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 55),
(27, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 59),
(28, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 5),
(29, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 9),
(30, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 18),
(31, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 22),
(32, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 30),
(33, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 37),
(34, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 48),
(35, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 53),
(36, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 57),
(37, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 4),
(38, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 8),
(39, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 19),
(40, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 25),
(41, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 33),
(42, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 40),
(43, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 47),
(44, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 54),
(45, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 58),
(46, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 1),
(47, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 12),
(48, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 20),
(49, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 26),
(50, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 32),
(51, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 41),
(52, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 43),
(53, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 50),
(54, 'Camarote Deluxe', 'Camarote amplio con vista al mar', 'Cama Queen', '500.00', 10, 61),
(64, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 3),
(65, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 11),
(66, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 17),
(67, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 23),
(68, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 31),
(69, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 39),
(70, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 44),
(71, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 51),
(72, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 60),
(73, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 6),
(74, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 13),
(75, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 16),
(76, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 24),
(77, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 29),
(78, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 36),
(79, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 46),
(80, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 52),
(81, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 62),
(82, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 2),
(83, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 10),
(84, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 15),
(85, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 27),
(86, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 34),
(87, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 38),
(88, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 45),
(89, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 55),
(90, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 59),
(91, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 5),
(92, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 9),
(93, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 18),
(94, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 22),
(95, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 30),
(96, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 37),
(97, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 48),
(98, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 53),
(99, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 57),
(100, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 4),
(101, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 8),
(102, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 19),
(103, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 25),
(104, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 33),
(105, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 40),
(106, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 47),
(107, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 54),
(108, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 58),
(109, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 1),
(110, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 12),
(111, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 20),
(112, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 26),
(113, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 32),
(114, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 41),
(115, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 43),
(116, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 50),
(117, 'Camarote Interior', 'Camarote económico sin vista al mar', 'Cama Individual', '300.00', 20, 61),
(127, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 3),
(128, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 11),
(129, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 17),
(130, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 23),
(131, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 31),
(132, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 39),
(133, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 44),
(134, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 51),
(135, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 60),
(136, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 6),
(137, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 13),
(138, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 16),
(139, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 24),
(140, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 29),
(141, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 36),
(142, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 46),
(143, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 52),
(144, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 62),
(145, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 2),
(146, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 10),
(147, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 15),
(148, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 27),
(149, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 34),
(150, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 38),
(151, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 45),
(152, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 55),
(153, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 59),
(154, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 5),
(155, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 9),
(156, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 18),
(157, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 22),
(158, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 30),
(159, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 37),
(160, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 48),
(161, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 53),
(162, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 57),
(163, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 4),
(164, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 8),
(165, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 19),
(166, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 25),
(167, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 33),
(168, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 40),
(169, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 47),
(170, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 54),
(171, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 58),
(172, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 1),
(173, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 12),
(174, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 20),
(175, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 26),
(176, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 32),
(177, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 41),
(178, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 43),
(179, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 50),
(180, 'Camarote Balcón', 'Camarote con balcón privado', 'Cama King', '700.00', 5, 61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `crucero_id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha_de_comentario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crucero`
--

CREATE TABLE `crucero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `puerto_de_salida` varchar(255) NOT NULL,
  `puerto_de_llegada` varchar(255) NOT NULL,
  `fecha_de_salida` date NOT NULL,
  `fecha_de_llegada` date NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `crucero`
--

INSERT INTO `crucero` (`id`, `nombre`, `destino`, `descripcion`, `puerto_de_salida`, `puerto_de_llegada`, `fecha_de_salida`, `fecha_de_llegada`, `tipo_id`, `imagen`) VALUES
(1, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero especialmente diseñado para jóvenes ofrece una experiencia inolvidable en el hermoso mar Mediterráneo. Únete a nosotros y disfruta de una combinación perfecta de diversión, entretenimiento y exploración.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 6, '/images/cruceros/mediterraneo-jovenes.jpg'),
(2, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero tiene la combinación perfecta de diversión, romance y descubrimiento. Te invitamos a unirte a nosotros en un viaje lleno de emociones con otros solteros que comparten tus mismos intereses y pasiones.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 3, '/images/cruceros/mediterraneo-solteros.jpg'),
(3, 'Crucero Mediterráneo', 'Mediterráneo', 'Embárcate en una experiencia inolvidable junto a tu ser amado mientras navegamos por las aguas cristalinas del Mediterráneo. Disfruta de momentos de intimidad y conexión en un entorno idílico y romántico.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 1, '/images/cruceros/mediterraneo-pareja.jpg'),
(4, 'Crucero Mediterráneo', 'Mediterráneo', 'Experiencia tranquila y relajante, perfecta para aquellos que desean explorar esta región icónica con comodidad y en un ambiente acogedor. Disfrutaras de la paz y la belleza de destinos fascinantes.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 5, '/images/cruceros/mediterraneo-tercera.jpg'),
(5, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero en el Mediterráneo celebra la igualdad, la diversidad y el amor en todas sus formas. Te invitamos a embarcarte en un viaje único en el que podrás disfrutar de destinos increíbles mientras te rodeas de una comunidad inclusiva y vibrante.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 4, '/images/cruceros/mediterraneo-lgtbi.jpg'),
(6, 'Crucero Mediterráneo', 'Mediterráneo', 'Nuestro crucero en el Mediterráneo ofrece una experiencia divertida y emocionante para toda la familia. Te invitamos a embarcarte en un viaje lleno de aventuras, entretenimiento y momentos compartidos que crearán recuerdos inolvidables.', 'Barcelona', 'Roma', '2023-06-01', '2023-06-10', 2, '/images/cruceros/mediterraneo-familia.jpg'),
(8, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe te brindará la oportunidad de relajarte y disfrutar de la belleza tropical de la región en un ambiente tranquilo y acogedor. Te invitamos a unirte a nosotros en un viaje diseñado para satisfacer las necesidades.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 5, '/images/cruceros/caribe-tercera.jpg'),
(9, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe celebra la diversidad, la igualdad y el amor en todas sus formas. Te invitamos a unirte a nosotros en un viaje lleno de alegría, diversión y conexión con la comunidad LGTBI+ en uno de los destinos más hermosos del mundo.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 4, '/images/cruceros/caribe-lgtbi.jpg'),
(10, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe para solteros te ofrece la oportunidad de conocer a personas interesantes, disfrutar de increíbles destinos tropicales y vivir momentos inolvidables en un ambiente lleno de diversión y compañerismo.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 3, '/images/cruceros/caribe-solteros.jpg'),
(11, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe ofrece una experiencia perfecta para parejas que buscan relajarse, disfrutar del romance y crear recuerdos inolvidables juntos. Te invitamos a sumergirte en la belleza tropical del Caribe mientras disfrutas de un ambiente íntimo y romántico.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 1, '/images/cruceros/caribe-pareja.jpg'),
(12, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe para adolescentes ofrece una experiencia emocionante y llena de actividades para jóvenes que buscan divertirse y hacer nuevos amigos. Te invitamos a embarcarte en una aventura tropical llena de diversión, entretenimiento y emocionantes experiencias.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 6, '/images/cruceros/caribe-jovenes.jpg'),
(13, 'Crucero Caribe', 'Caribe', 'Nuestro crucero en el Caribe ofrece una experiencia divertida y emocionante para toda la familia. Te invitamos a disfrutar de un viaje lleno de diversión, entretenimiento y momentos compartidos que crearán recuerdos inolvidables.', 'Miami', 'Cozumel', '2023-07-01', '2023-07-10', 2, '/images/cruceros/caribe-familia.jpg'),
(15, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa para solteros te ofrece la oportunidad de explorar algunos de los destinos más fascinantes de la región mientras conoces a nuevas personas y disfrutas de experiencias inolvidables.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 3, '/images/cruceros/norte-solteros.jpg'),
(16, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa ofrece una experiencia única y divertida para toda la familia. Te invitamos a descubrir la belleza natural, la historia y la cultura de esta fascinante región mientras disfrutas de momentos inolvidables en compañía de tus seres queridos.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 2, '/images/cruceros/norte-familia.jpg'),
(17, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa ofrece una experiencia inolvidable para parejas que desean explorar la belleza natural, la historia y la cultura de esta fascinante región mientras disfrutan de momentos románticos juntos.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 1, '/images/cruceros/norte-pareja.jpg'),
(18, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa LGTBI+ te invita a explorar esta hermosa región mientras celebras la diversidad, la igualdad y el amor en todas sus formas. Te ofrecemos un ambiente seguro, acogedor y libre de prejuicios donde podrás ser tú mismo/a y disfrutar de una experiencia única junto a otros miembros de la comunidad LGTBI+.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 4, '/images/cruceros/norte-lgtbi.jpg'),
(19, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa para la tercera edad te ofrece la oportunidad de descubrir la belleza y la historia de esta fascinante región en un ambiente tranquilo y en compañía de personas de ideas afines.', 'Copenhague', 'Estocolmo', '2023-08-01', '2023-08-10', 5, '/images/cruceros/norte-tercera.jpg'),
(20, 'Crucero Norte de Europa', 'Norte de Europa', 'Nuestro crucero en el Norte de Europa para adolescentes te ofrece la oportunidad de explorar destinos fascinantes, sumergirte en la cultura y la historia de la región y disfrutar de experiencias inolvidables junto a otros jóvenes de tu edad.', 'Copenhague', 'Estocolmo', '2023-08-01', '0000-00-00', 6, '/images/cruceros/norte-jovenes.jpg'),
(22, 'Crucero Alaska', 'Alaska', 'Alaska es conocida por su impresionante belleza natural, sus paisajes majestuosos y su rica vida salvaje. Además, este destino acoge a viajeros de todas las orientaciones sexuales e identidades de género, ofreciendo un ambiente seguro y acogedor para la comunidad LGTBI+.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 4, '/images/cruceros/alaska-lgtbi.jpg'),
(23, 'Crucero Alaska', 'Alaska', 'Alaska ofrece paisajes impresionantes y románticos, desde majestuosos glaciares hasta puestas de sol sobre montañas nevadas. Puedes disfrutar de excursiones en kayak por fiordos, avistamiento de ballenas y cenas románticas a bordo de cruceros con vista al mar.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 1, '/images/cruceros/alaska-pareja.jpg'),
(24, 'Crucero Alaska', 'Alaska', 'Alaska es un paraíso natural lleno de aventuras. Pueden explorar parques nacionales, caminar por senderos escénicos, avistar osos y águilas calvas, y participar en actividades como paseos en trineo de perros y pesca en alta mar.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 2, '/images/cruceros/alaska-familia.jpg'),
(25, 'Crucero Alaska', 'Alaska', 'Alaska brinda la oportunidad de disfrutar de un ritmo más relajado y contemplar la belleza natural de la región. Pueden realizar excursiones panorámicas en autobús, visitar museos y centros culturales, y deleitarse con la tranquilidad de los paisajes impresionantes.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 5, '/images/cruceros/alaska-tercera.jpg'),
(26, 'Crucero Alaska', 'Alaska', 'Alaska ofrece emocionantes experiencias al aire libre, como caminatas por glaciares, kayak en aguas tranquilas y avistamiento de vida silvestre. También pueden disfrutar de actividades divertidas a bordo del crucero, como juegos, fiestas en la cubierta y talleres interactivos.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 6, '/images/cruceros/alaska-jovenes.jpg'),
(27, 'Crucero Alaska', 'Alaska', 'Alaska ofrece una gran variedad de experiencias emocionantes y oportunidades de conocer gente nueva para los viajeros solteros. Durante tu crucero por Alaska, tendrás la oportunidad de disfrutar de la belleza natural de la región mientras socializas y te diviertes con otros viajeros solteros.', 'Seattle', 'Anchorage', '2023-09-01', '2023-09-10', 3, '/images/cruceros/alaska-solteros.jpg'),
(29, 'Crucero Dubai', 'Dubai', 'Dubai es un destino ideal para familias, repleto de emocionantes atracciones y actividades que garantizan diversión para todas las edades. Aquí encontrarás una combinación perfecta entre modernidad y tradición, creando un entorno único para disfrutar de unas vacaciones en familia.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 2, '/images/cruceros/dubai-familia.jpg'),
(30, 'Crucero Dubai', 'Dubai', 'Dubai es un destino vibrante y emocionante que ofrece numerosas oportunidades para socializar, divertirse y conocer gente nueva. Con su arquitectura impresionante, playas de arena blanca y una vida nocturna animada, Dubai es el lugar perfecto para la comunidad LGTBI+.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 4, '/images/cruceros/dubai-lgtbi.jpg'),
(31, 'Crucero Dubai', 'Dubai', 'Dubai es un destino perfecto para parejas que buscan una escapada inolvidable llena de lujo, sofisticación y aventura. Aquí encontrarás una combinación única de paisajes deslumbrantes, arquitectura impresionante y una amplia gama de experiencias exclusivas para disfrutar juntos.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 1, '/images/cruceros/dubai-pareja.jpg'),
(32, 'Crucero Dubai', 'Dubai', 'Dubai ofrece una amplia variedad de actividades y atracciones emocionantes para jóvenes viajeros. Desde deportes extremos y actividades al aire libre hasta vibrantes lugares de entretenimiento y compras, hay algo para cada gusto y estilo en esta increíble ciudad.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 6, '/images/cruceros/dubai-jovenes.jpg'),
(33, 'Crucero Dubai', 'Dubai', 'Dubai ofrece una gran cantidad de actividades y experiencias que son adecuadas y agradables para adultos mayores. Desde recorridos panorámicos en autobús y paseos por la playa hasta visitas a museos y centros culturales, hay algo para todos los intereses y niveles de energía.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 5, '/images/cruceros/dubai-tercera.jpg'),
(34, 'Crucero Dubai', 'Dubai', 'Dubai es un destino vibrante y emocionante que ofrece numerosas oportunidades para socializar, divertirse y conocer gente nueva. Con su arquitectura impresionante, playas de arena blanca y una vida nocturna animada, Dubai es el lugar perfecto para solteros que buscan vivir experiencias únicas y emocionantes.', 'Dubai', 'Dubai', '2023-10-01', '2023-10-10', 3, '/images/cruceros/dubai-solteros.jpg'),
(36, 'Crucero Egipto', 'Egipto', 'Egipto es un destino educativo y emocionante. Los niños pueden aprender sobre la antigua civilización egipcia visitando el Museo Egipcio de El Cairo y explorando las tumbas del Valle de los Reyes en Luxor. Además, pueden disfrutar de actividades al aire libre como montar en camello y realizar un safari en el desierto.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 2, '/images/cruceros/egipto-familia.jpg'),
(37, 'Crucero Egipto', 'Egipto', 'Egipto es un país con una rica historia y una cultura fascinante que acoge a viajeros de todas las orientaciones sexuales e identidades de género. Si eres parte de la comunidad LGTBI+, encontrarás que Egipto ofrece una experiencia única y acogedora.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 4, '/images/cruceros/egipto-lgtbi.jpg'),
(38, 'Crucero Egipto', 'Egipto', 'Egipto ofrece una mezcla única de cultura, historia y diversión. Pueden explorar los zocos de El Cairo, visitar los coloridos mercados de especias y disfrutar de la animada vida nocturna de la ciudad.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 3, '/images/cruceros/egipto-solteros.jpg'),
(39, 'Crucero Egipto', 'Egipto', 'Egipto ofrece un ambiente romántico y místico. Pueden disfrutar de un crucero por el Nilo, explorar los templos antiguos de Luxor y Karnak, y maravillarse con las pirámides de Giza al atardecer.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 1, '/images/cruceros/egipto-pareja.jpg'),
(40, 'Crucero Egipto', 'Egipto', 'Egipto es un destino perfecto para los viajeros de la tercera edad que desean sumergirse en la rica historia y cultura de esta antigua tierra. Aquí encontrarás una combinación única de fascinantes monumentos, paisajes impresionantes y una hospitalidad cálida que te hará sentir bienvenido.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 5, '/images/cruceros/egipto-tercera.jpg'),
(41, 'Crucero Egipto', 'Egipto', 'Egipto ofrece una gran variedad de experiencias emocionantes y atracciones fascinantes para los viajeros jóvenes. Desde explorar los antiguos templos y pirámides hasta navegar por el Nilo y sumergirse en la rica cultura egipcia, hay algo para todos los gustos y estilos de viaje.', 'Luxor', 'Asuán', '2023-11-01', '2023-11-10', 6, '/images/cruceros/egipto-jovenes.jpg'),
(43, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica ofrece una amplia gama de experiencias emocionantes. Podrás disfrutar de safaris fotográficos en los parques nacionales, practicar surf en las playas de la costa sur y explorar la rica historia y cultura de Sudáfrica en lugares como Soweto y Robben Island.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 6, '/images/cruceros/sudafrica-jovenes.jpg'),
(44, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica ofrece románticos paisajes naturales, como el impresionante Cabo de Buena Esperanza y la hermosa Ruta Jardín. Podrás disfrutar de paseos en la playa al atardecer, degustar vinos en las bodegas del Cabo y explorar la vibrante ciudad de Ciudad del Cabo.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 1, '/images/cruceros/sudafrica-pareja.jpg'),
(45, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica tiene una vida nocturna vibrante y emocionante en ciudades como Johannesburgo y Ciudad del Cabo, donde puedes disfrutar de bares, restaurantes y clubes nocturnos de clase mundial. Además, puedes participar en actividades al aire libre como el surf, el senderismo y el paracaidismo.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 3, '/images/cruceros/sudafrica-solteros.jpg'),
(46, 'Crucero Sudáfrica', 'Sudáfrica', ' Sudáfrica ofrece emocionantes safaris en los parques nacionales, donde podrás ver de cerca a los \"cinco grandes\" (leones, elefantes, rinocerontes, búfalos y leopardos) y aprender sobre la fauna y flora local.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 2, '/images/cruceros/sudafrica-familia.jpg'),
(47, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica ofrece una gran cantidad de actividades y experiencias relajantes y culturales que son perfectas para los viajeros de la tercera edad. Desde impresionantes paisajes naturales hasta rica historia y cultura, Sudáfrica tiene mucho que ofrecer.', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 5, '/images/cruceros/sudafrica-tercera.jpg'),
(48, 'Crucero Sudáfrica', 'Sudáfrica', 'Sudáfrica es conocida por ser uno de los países más progresistas de África en términos de derechos LGBTI+. La Constitución de Sudáfrica garantiza la igualdad y la no discriminación, lo que hace que el país sea un destino acogedor para viajeros de la comunidad LGBTI+.\r\n\r\n', 'Ciudad del Cabo', 'Durban', '2023-12-01', '2023-12-10', 4, '/images/cruceros/sudafrica-lgtbi.jpg'),
(50, 'Crucero Asia', 'Asia', 'Ofrecemos aventuras emocionantes, playas de arena blanca y una vibrante escena de fiesta. Puedes disfrutar de deportes acuáticos, explorar templos antiguos y sumergirte en la cultura local.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 6, '/images/cruceros/asia-jovenes.jpg'),
(51, 'Crucero Asia', 'Asia', 'Paisajes impresionantes, playas paradisíacas y una atmósfera romántica que te permitirá disfrutar de momentos inolvidables juntos.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 1, '/images/cruceros/asia-pareja.jpg'),
(52, 'Crucero Asia', 'Asia', 'Hong Kong ofrece una gran variedad de actividades y atracciones para todas las edades. Puedes explorar parques temáticos, visitar zoológicos y acuarios, y disfrutar de la deliciosa cocina asiática.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 2, '/images/cruceros/asia-familia.jpg'),
(53, 'Crucero Asia', 'Asia', 'Asia es un destino acogedor para viajeros de la comunidad LGBTI+, con destinos y ciudades que ofrecen una vibrante escena LGBTI+ y una actitud de tolerancia y respeto hacia la diversidad.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 4, '/images/cruceros/asia-lgtbi.jpg'),
(54, 'Crucero Asia', 'Asia', 'Asia ofrece una gran cantidad de destinos y actividades adaptadas a los viajeros de la tercera edad que desean explorar y disfrutar de la cultura, la historia y la belleza natural de la región.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 5, '/images/cruceros/asia-tercera.jpg'),
(55, 'Crucero Asia', 'Asia', 'Vida nocturna vibrante, restaurantes de moda y una amplia gama de opciones de entretenimiento. También puedes participar en actividades emocionantes como el buceo, el senderismo y el ciclismo.', 'Hong Kong', 'Tokio', '2024-01-01', '2024-01-10', 3, '/images/cruceros/asia-solteros.jpg'),
(57, 'Crucero Sudamérica', 'Sudamérica', 'Sudamérica es un destino cada vez más abierto y amigable para la comunidad LGBTI+. Varios países de la región han promulgado leyes que protegen los derechos de las personas LGBTI+ y cuentan con una vibrante escena LGBTI+ en muchas de sus ciudades.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 4, '/images/cruceros/sudamerica-lgtbi.jpg'),
(58, 'Crucero Sudamérica', 'Sudamérica', 'Sudamérica ofrece una gran variedad de destinos y actividades adaptadas a los viajeros de la tercera edad que desean explorar y disfrutar de la cultura, la historia y la belleza natural de la región.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 5, '/images/cruceros/sudamerica-tercera.jpg'),
(59, 'Crucero Sudamérica', 'Sudamérica', 'Vida nocturna vibrante, una escena de fiesta emocionante y una amplia gama de opciones de entretenimiento. También puedes participar en actividades al aire libre como el trekking en la Patagonia o el surf en las playas de Ecuador.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 3, '/images/cruceros/sudamerica-solteros.jpg'),
(60, 'Crucero Sudamérica', 'Sudamérica', 'Combinación de encanto histórico, playas espectaculares y una vibrante vida nocturna que te permitirá disfrutar de momentos inolvidables juntos.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 1, '/images/cruceros/sudamerica-pareja.jpg'),
(61, 'Crucero Sudamérica', 'Sudamérica', 'Combinación de historia, cultura y vida urbana vibrante. Podrás explorar museos, probar deliciosa comida local y sumergirte en la vida nocturna de estas ciudades.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 6, '/images/cruceros/sudamerica-jovenes.jpg'),
(62, 'Crucero Sudamérica', 'Sudamérica', 'Gran variedad de actividades y atracciones para todas las edades. Podrás explorar antiguas ruinas, disfrutar de paisajes impresionantes y sumergirte en la cultura local.', 'Buenos Aires', 'Santiago de Chile', '2024-02-01', '2024-02-10', 2, '/images/cruceros/sudamerica-familia.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `body` text NOT NULL,
  `headers` text NOT NULL,
  `queue_name` varchar(255) DEFAULT NULL,
  `available_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `camarote_id` int(11) NOT NULL,
  `fecha_de_reserva` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Paquete Todo Incluido', 'Disfruta de comidas y bebidas ilimitadas a bordo', '200.00'),
(2, 'Masaje Spa', 'Relájate con un masaje en nuestro spa de lujo', '100.00'),
(3, 'Excursión en Tierra', 'Explora destinos emocionantes en nuestras excursiones en tierra', '50.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioscrucero`
--

CREATE TABLE `servicioscrucero` (
  `id` int(11) NOT NULL,
  `crucero_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicioscrucero`
--

INSERT INTO `servicioscrucero` (`id`, `crucero_id`, `servicio_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 11, 1),
(5, 11, 2),
(6, 11, 3),
(7, 17, 1),
(8, 17, 2),
(9, 17, 3),
(10, 23, 1),
(11, 23, 2),
(12, 23, 3),
(13, 31, 1),
(14, 31, 2),
(15, 31, 3),
(16, 39, 1),
(17, 39, 2),
(18, 39, 3),
(19, 44, 1),
(20, 44, 2),
(21, 44, 3),
(22, 51, 1),
(23, 51, 2),
(24, 51, 3),
(25, 60, 1),
(26, 60, 2),
(27, 60, 3),
(28, 6, 1),
(29, 6, 2),
(30, 6, 3),
(31, 13, 1),
(32, 13, 2),
(33, 13, 3),
(34, 16, 1),
(35, 16, 2),
(36, 16, 3),
(37, 24, 1),
(38, 24, 2),
(39, 24, 3),
(40, 29, 1),
(41, 29, 2),
(42, 29, 3),
(43, 36, 1),
(44, 36, 2),
(45, 36, 3),
(46, 46, 1),
(47, 46, 2),
(48, 46, 3),
(49, 52, 1),
(50, 52, 2),
(51, 52, 3),
(52, 62, 1),
(53, 62, 2),
(54, 62, 3),
(55, 2, 1),
(56, 2, 2),
(57, 2, 3),
(58, 10, 1),
(59, 10, 2),
(60, 10, 3),
(61, 15, 1),
(62, 15, 2),
(63, 15, 3),
(64, 27, 1),
(65, 27, 2),
(66, 27, 3),
(67, 34, 1),
(68, 34, 2),
(69, 34, 3),
(70, 38, 1),
(71, 38, 2),
(72, 38, 3),
(73, 45, 1),
(74, 45, 2),
(75, 45, 3),
(76, 55, 1),
(77, 55, 2),
(78, 55, 3),
(79, 59, 1),
(80, 59, 2),
(81, 59, 3),
(82, 5, 1),
(83, 5, 2),
(84, 5, 3),
(85, 9, 1),
(86, 9, 2),
(87, 9, 3),
(88, 18, 1),
(89, 18, 2),
(90, 18, 3),
(91, 22, 1),
(92, 22, 2),
(93, 22, 3),
(94, 30, 1),
(95, 30, 2),
(96, 30, 3),
(97, 37, 1),
(98, 37, 2),
(99, 37, 3),
(100, 48, 1),
(101, 48, 2),
(102, 48, 3),
(103, 53, 1),
(104, 53, 2),
(105, 53, 3),
(106, 57, 1),
(107, 57, 2),
(108, 57, 3),
(109, 4, 1),
(110, 4, 2),
(111, 4, 3),
(112, 8, 1),
(113, 8, 2),
(114, 8, 3),
(115, 19, 1),
(116, 19, 2),
(117, 19, 3),
(118, 25, 1),
(119, 25, 2),
(120, 25, 3),
(121, 33, 1),
(122, 33, 2),
(123, 33, 3),
(124, 40, 1),
(125, 40, 2),
(126, 40, 3),
(127, 47, 1),
(128, 47, 2),
(129, 47, 3),
(130, 54, 1),
(131, 54, 2),
(132, 54, 3),
(133, 58, 1),
(134, 58, 2),
(135, 58, 3),
(136, 1, 1),
(137, 1, 2),
(138, 1, 3),
(139, 12, 1),
(140, 12, 2),
(141, 12, 3),
(142, 20, 1),
(143, 20, 2),
(144, 20, 3),
(145, 26, 1),
(146, 26, 2),
(147, 26, 3),
(148, 32, 1),
(149, 32, 2),
(150, 32, 3),
(151, 41, 1),
(152, 41, 2),
(153, 41, 3),
(154, 43, 1),
(155, 43, 2),
(156, 43, 3),
(157, 50, 1),
(158, 50, 2),
(159, 50, 3),
(160, 61, 1),
(161, 61, 2),
(162, 61, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocrucero`
--

CREATE TABLE `tipocrucero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipocrucero`
--

INSERT INTO `tipocrucero` (`id`, `nombre`) VALUES
(1, 'Parejas'),
(2, 'Familias'),
(3, 'Solteros'),
(4, 'LGTBI+'),
(5, 'Tercera Edad'),
(6, 'Adolescentes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` varchar(20) NOT NULL
) ;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `roles`) VALUES
(1, 'admin@example.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 'admin'),
(2, 'user123456@gmail.com', '$2y$13$zbXpX1dcjA4ue6MtlJJMh.x.FBVsSm/BCwPc4Dvm4cySRsidbJta2', 'normal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abordo`
--
ALTER TABLE `abordo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camarote_id` (`camarote_id`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indices de la tabla `camarotes`
--
ALTER TABLE `camarotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crucero_id` (`crucero_id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `crucero_id` (`crucero_id`);

--
-- Indices de la tabla `crucero`
--
ALTER TABLE `crucero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `camarote_id` (`camarote_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicioscrucero`
--
ALTER TABLE `servicioscrucero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crucero_id` (`crucero_id`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indices de la tabla `tipocrucero`
--
ALTER TABLE `tipocrucero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abordo`
--
ALTER TABLE `abordo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `camarotes`
--
ALTER TABLE `camarotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crucero`
--
ALTER TABLE `crucero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicioscrucero`
--
ALTER TABLE `servicioscrucero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT de la tabla `tipocrucero`
--
ALTER TABLE `tipocrucero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abordo`
--
ALTER TABLE `abordo`
  ADD CONSTRAINT `abordo_ibfk_1` FOREIGN KEY (`camarote_id`) REFERENCES `camarotes` (`id`),
  ADD CONSTRAINT `abordo_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);

--
-- Filtros para la tabla `camarotes`
--
ALTER TABLE `camarotes`
  ADD CONSTRAINT `camarotes_ibfk_1` FOREIGN KEY (`crucero_id`) REFERENCES `crucero` (`id`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`crucero_id`) REFERENCES `crucero` (`id`);

--
-- Filtros para la tabla `crucero`
--
ALTER TABLE `crucero`
  ADD CONSTRAINT `crucero_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipocrucero` (`id`);

--
-- Filtros para la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD CONSTRAINT `messenger_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`camarote_id`) REFERENCES `camarotes` (`id`);

--
-- Filtros para la tabla `servicioscrucero`
--
ALTER TABLE `servicioscrucero`
  ADD CONSTRAINT `servicioscrucero_ibfk_1` FOREIGN KEY (`crucero_id`) REFERENCES `crucero` (`id`),
  ADD CONSTRAINT `servicioscrucero_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
