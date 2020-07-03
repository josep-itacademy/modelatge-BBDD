-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 03-07-2020 a les 22:50:36
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
-- Base de dades: `Optica`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `adresa_client`
--

CREATE TABLE `adresa_client` (
  `id_client` int(11) NOT NULL,
  `adresa_id` int(11) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` int(11) DEFAULT NULL,
  `porta` int(11) DEFAULT NULL,
  `ciutat` varchar(50) NOT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  `id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `Adresa_provehidor`
--

CREATE TABLE `Adresa_provehidor` (
  `adresa_id` int(11) NOT NULL,
  `id_provehidor` int(11) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `num` int(11) NOT NULL,
  `pis` int(11) DEFAULT NULL,
  `porta` int(11) DEFAULT NULL,
  `ciutat` varchar(50) NOT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  `id_pais` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `data_registre` date NOT NULL,
  `id_client_recomanat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `color_montura`
--

CREATE TABLE `color_montura` (
  `color_id` int(11) NOT NULL,
  `nom_color` varchar(25) NOT NULL,
  `preu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `color_vidre`
--

CREATE TABLE `color_vidre` (
  `color_vidre_id` int(11) NOT NULL,
  `nom_color` varchar(30) NOT NULL,
  `preu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `empleat`
--

CREATE TABLE `empleat` (
  `empleat_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `factura`
--

CREATE TABLE `factura` (
  `factura_id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_empleat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `factura_row`
--

CREATE TABLE `factura_row` (
  `factura_row_id` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_model` int(11) NOT NULL,
  `preu_total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `marca`
--

CREATE TABLE `marca` (
  `marca_id` int(11) NOT NULL,
  `id_provehidor` int(11) NOT NULL,
  `nom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `model`
--

CREATE TABLE `model` (
  `model_id` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `nom_model` varchar(30) NOT NULL,
  `id_tipus_montura` int(11) NOT NULL,
  `id_graduacio_dreta` int(11) NOT NULL,
  `id_graduacio_esq` int(11) NOT NULL,
  `id_color_montura` int(11) NOT NULL,
  `id_color_vidre` int(11) NOT NULL,
  `preu_basic` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `pais`
--

CREATE TABLE `pais` (
  `pais_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `proveidor`
--

CREATE TABLE `proveidor` (
  `proveidor_id` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `nif` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `tipus_montura`
--

CREATE TABLE `tipus_montura` (
  `tipus_montura_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `preu_inicial` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `vidre_graduat`
--

CREATE TABLE `vidre_graduat` (
  `graduacio_id` int(11) NOT NULL,
  `graduacio` varchar(25) NOT NULL,
  `preu` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `adresa_client`
--
ALTER TABLE `adresa_client`
  ADD PRIMARY KEY (`adresa_id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Índexs per a la taula `Adresa_provehidor`
--
ALTER TABLE `Adresa_provehidor`
  ADD PRIMARY KEY (`adresa_id`),
  ADD KEY `id_provehidor` (`id_provehidor`),
  ADD KEY `adresa_provehidor_ibfk_2` (`id_pais`);

--
-- Índexs per a la taula `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `id_client_recomanat` (`id_client_recomanat`);

--
-- Índexs per a la taula `color_montura`
--
ALTER TABLE `color_montura`
  ADD PRIMARY KEY (`color_id`);

--
-- Índexs per a la taula `color_vidre`
--
ALTER TABLE `color_vidre`
  ADD PRIMARY KEY (`color_vidre_id`);

--
-- Índexs per a la taula `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`empleat_id`);

--
-- Índexs per a la taula `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`factura_id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_empleat` (`id_empleat`);

--
-- Índexs per a la taula `factura_row`
--
ALTER TABLE `factura_row`
  ADD PRIMARY KEY (`factura_row_id`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_model` (`id_model`);

--
-- Índexs per a la taula `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`marca_id`),
  ADD KEY `id_provehidor` (`id_provehidor`);

--
-- Índexs per a la taula `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_color_montura` (`id_color_montura`),
  ADD KEY `id_graduacio_dreta` (`id_graduacio_dreta`),
  ADD KEY `id_graduacio_esq` (`id_graduacio_esq`),
  ADD KEY `id_tipus_montura` (`id_tipus_montura`),
  ADD KEY `id_color_vidre` (`id_color_vidre`);

--
-- Índexs per a la taula `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pais_id`);

--
-- Índexs per a la taula `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`proveidor_id`);

--
-- Índexs per a la taula `tipus_montura`
--
ALTER TABLE `tipus_montura`
  ADD PRIMARY KEY (`tipus_montura_id`);

--
-- Índexs per a la taula `vidre_graduat`
--
ALTER TABLE `vidre_graduat`
  ADD PRIMARY KEY (`graduacio_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `adresa_client`
--
ALTER TABLE `adresa_client`
  MODIFY `adresa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `Adresa_provehidor`
--
ALTER TABLE `Adresa_provehidor`
  MODIFY `adresa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `color_montura`
--
ALTER TABLE `color_montura`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `color_vidre`
--
ALTER TABLE `color_vidre`
  MODIFY `color_vidre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `empleat`
--
ALTER TABLE `empleat`
  MODIFY `empleat_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT per la taula `marca`
--
ALTER TABLE `marca`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `model`
--
ALTER TABLE `model`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pais`
--
ALTER TABLE `pais`
  MODIFY `pais_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `proveidor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `tipus_montura`
--
ALTER TABLE `tipus_montura`
  MODIFY `tipus_montura_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `vidre_graduat`
--
ALTER TABLE `vidre_graduat`
  MODIFY `graduacio_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `adresa_client`
--
ALTER TABLE `adresa_client`
  ADD CONSTRAINT `adresa_client_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `adresa_client_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`pais_id`);

--
-- Restriccions per a la taula `Adresa_provehidor`
--
ALTER TABLE `Adresa_provehidor`
  ADD CONSTRAINT `adresa_provehidor_ibfk_1` FOREIGN KEY (`id_provehidor`) REFERENCES `proveidor` (`proveidor_id`),
  ADD CONSTRAINT `adresa_provehidor_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`pais_id`);

--
-- Restriccions per a la taula `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_client_recomanat`) REFERENCES `client` (`client_id`);

--
-- Restriccions per a la taula `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_empleat`) REFERENCES `empleat` (`empleat_id`);

--
-- Restriccions per a la taula `factura_row`
--
ALTER TABLE `factura_row`
  ADD CONSTRAINT `factura_row_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`factura_id`),
  ADD CONSTRAINT `factura_row_ibfk_2` FOREIGN KEY (`id_model`) REFERENCES `model` (`model_id`);

--
-- Restriccions per a la taula `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`id_provehidor`) REFERENCES `proveidor` (`proveidor_id`);

--
-- Restriccions per a la taula `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`marca_id`),
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`id_color_montura`) REFERENCES `color_montura` (`color_id`),
  ADD CONSTRAINT `model_ibfk_3` FOREIGN KEY (`id_graduacio_dreta`) REFERENCES `vidre_graduat` (`graduacio_id`),
  ADD CONSTRAINT `model_ibfk_4` FOREIGN KEY (`id_graduacio_esq`) REFERENCES `vidre_graduat` (`graduacio_id`),
  ADD CONSTRAINT `model_ibfk_5` FOREIGN KEY (`id_tipus_montura`) REFERENCES `tipus_montura` (`tipus_montura_id`),
  ADD CONSTRAINT `model_ibfk_6` FOREIGN KEY (`id_color_vidre`) REFERENCES `color_vidre` (`color_vidre_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
