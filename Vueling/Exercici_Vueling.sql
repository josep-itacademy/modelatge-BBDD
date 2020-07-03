-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 03-07-2020 a les 17:38:23
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
-- Base de dades: `Exercici_Vueling`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Avio`
--

CREATE TABLE `Avio` (
  `id_avio` int(11) NOT NULL,
  `capacitat` int(11) NOT NULL,
  `model` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `Avio`
--

INSERT INTO `Avio` (`id_avio`, `capacitat`, `model`) VALUES
(1, 384, 'boeing 347'),
(2, 545, 'jumbo');

-- --------------------------------------------------------

--
-- Estructura de la taula `Seient`
--

CREATE TABLE `Seient` (
  `id_seient` int(11) NOT NULL,
  `avio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `Seient`
--

INSERT INTO `Seient` (`id_seient`, `avio_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `Avio`
--
ALTER TABLE `Avio`
  ADD UNIQUE KEY `id_avio` (`id_avio`);

--
-- Índexs per a la taula `Seient`
--
ALTER TABLE `Seient`
  ADD PRIMARY KEY (`avio_id`,`id_seient`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `Avio`
--
ALTER TABLE `Avio`
  MODIFY `id_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `Seient`
--
ALTER TABLE `Seient`
  ADD CONSTRAINT `seient_ibfk_1` FOREIGN KEY (`avio_id`) REFERENCES `Avio` (`id_avio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
