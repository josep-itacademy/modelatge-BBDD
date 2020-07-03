-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 03-07-2020 a les 17:55:33
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
-- Base de dades: `VendaQuadres`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Comprador`
--

CREATE TABLE `Comprador` (
  `comprador_id` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Cognom` varchar(50) NOT NULL,
  `DNI` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `Comprador`
--

INSERT INTO `Comprador` (`comprador_id`, `Nom`, `Cognom`, `DNI`) VALUES
(1, 'Joe', 'Lambretti', '35444555S'),
(2, 'John', 'Doe', '58744454S');

-- --------------------------------------------------------

--
-- Estructura de la taula `Quadre`
--

CREATE TABLE `Quadre` (
  `quadre_id` int(11) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `preu` float NOT NULL,
  `nomQuadre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `Quadre`
--

INSERT INTO `Quadre` (`quadre_id`, `autor`, `preu`, `nomQuadre`) VALUES
(1, 'Rembrand', 3544460, 'Jioconda'),
(2, 'Picasso', 547789000, 'Guernica'),
(3, 'Camps Elisees', 547788, 'Napoleon');

-- --------------------------------------------------------

--
-- Estructura de la taula `VendaQuadre`
--

CREATE TABLE `VendaQuadre` (
  `id_comprador` int(11) NOT NULL,
  `id_quadre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `VendaQuadre`
--

INSERT INTO `VendaQuadre` (`id_comprador`, `id_quadre`) VALUES
(1, 1),
(1, 3),
(2, 2);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `Comprador`
--
ALTER TABLE `Comprador`
  ADD PRIMARY KEY (`comprador_id`);

--
-- Índexs per a la taula `Quadre`
--
ALTER TABLE `Quadre`
  ADD PRIMARY KEY (`quadre_id`);

--
-- Índexs per a la taula `VendaQuadre`
--
ALTER TABLE `VendaQuadre`
  ADD UNIQUE KEY `id_quadre` (`id_quadre`),
  ADD KEY `id_comprador` (`id_comprador`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `Comprador`
--
ALTER TABLE `Comprador`
  MODIFY `comprador_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `Quadre`
--
ALTER TABLE `Quadre`
  MODIFY `quadre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `VendaQuadre`
--
ALTER TABLE `VendaQuadre`
  ADD CONSTRAINT `vendaquadre_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `Comprador` (`comprador_id`),
  ADD CONSTRAINT `vendaquadre_ibfk_2` FOREIGN KEY (`id_quadre`) REFERENCES `Quadre` (`quadre_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
