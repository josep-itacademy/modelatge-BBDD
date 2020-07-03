-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 03-07-2020 a les 18:28:59
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
-- Base de dades: `Exercici_Amazon`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `autor`
--

CREATE TABLE `autor` (
  `autor_id` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `llibres_publicats` int(11) NOT NULL,
  `direccio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `factura`
--

CREATE TABLE `factura` (
  `factura_id` int(11) NOT NULL,
  `usuari_nom` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `factura_row`
--

CREATE TABLE `factura_row` (
  `id_factura` int(11) NOT NULL,
  `factura_row_id` int(11) NOT NULL,
  `id_llibre` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `Llibre`
--

CREATE TABLE `Llibre` (
  `llibre_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `preu` decimal(10,0) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `usuari`
--

CREATE TABLE `usuari` (
  `usuari_nom` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasenya` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`autor_id`);

--
-- Índexs per a la taula `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`factura_id`),
  ADD KEY `usuari_nom` (`usuari_nom`);

--
-- Índexs per a la taula `factura_row`
--
ALTER TABLE `factura_row`
  ADD PRIMARY KEY (`factura_row_id`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_llibre` (`id_llibre`);

--
-- Índexs per a la taula `Llibre`
--
ALTER TABLE `Llibre`
  ADD PRIMARY KEY (`llibre_id`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Índexs per a la taula `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`usuari_nom`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `autor`
--
ALTER TABLE `autor`
  MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `factura`
--
ALTER TABLE `factura`
  MODIFY `factura_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `factura_row`
--
ALTER TABLE `factura_row`
  MODIFY `factura_row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `Llibre`
--
ALTER TABLE `Llibre`
  MODIFY `llibre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuari_nom`) REFERENCES `usuari` (`usuari_nom`);

--
-- Restriccions per a la taula `factura_row`
--
ALTER TABLE `factura_row`
  ADD CONSTRAINT `factura_row_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`factura_id`),
  ADD CONSTRAINT `factura_row_ibfk_2` FOREIGN KEY (`id_llibre`) REFERENCES `Llibre` (`llibre_id`);

--
-- Restriccions per a la taula `Llibre`
--
ALTER TABLE `Llibre`
  ADD CONSTRAINT `llibre_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`autor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
