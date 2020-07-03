-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 03-07-2020 a les 19:36:10
-- Versió del servidor: 10.1.36-MariaDB
-- Versió de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `Stube`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Usuari`
--

CREATE TABLE `Usuari` (
  `email` varchar(100) NOT NULL,
  `contrassenya` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `VideosUsuari`
--

CREATE TABLE `VideosUsuari` (
  `email` varchar(100) NOT NULL,
  `titol` varchar(100) NOT NULL,
  `descripcio` varchar(250) NOT NULL,
  `url` varchar(50) NOT NULL,
  `video_id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `Usuari`
--
ALTER TABLE `Usuari`
  ADD PRIMARY KEY (`email`);

--
-- Índexs per a la taula `VideosUsuari`
--
ALTER TABLE `VideosUsuari`
  ADD PRIMARY KEY (`video_id`),
  ADD UNIQUE KEY `video_id` (`video_id`),
  ADD KEY `email` (`email`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `VideosUsuari`
--
ALTER TABLE `VideosUsuari`
  ADD CONSTRAINT `videosusuari_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Usuari` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
