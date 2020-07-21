-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 21-07-2020 a les 14:04:27
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
-- Estructura de la taula `llistat`
--

CREATE TABLE `llistat` (
  `email` varchar(100) NOT NULL,
  `id_video` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de la taula `video`
--

CREATE TABLE `video` (
  `video_id` varchar(12) NOT NULL,
  `titol` varchar(50) NOT NULL,
  `descripcio` varchar(500) NOT NULL,
  `url` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `llistat`
--
ALTER TABLE `llistat`
  ADD PRIMARY KEY (`email`,`id_video`),
  ADD KEY `id_video` (`id_video`);

--
-- Índexs per a la taula `Usuari`
--
ALTER TABLE `Usuari`
  ADD PRIMARY KEY (`email`);

--
-- Índexs per a la taula `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`),
  ADD UNIQUE KEY `video_id` (`video_id`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `llistat`
--
ALTER TABLE `llistat`
  ADD CONSTRAINT `llistat_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Usuari` (`email`),
  ADD CONSTRAINT `llistat_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `video` (`video_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
