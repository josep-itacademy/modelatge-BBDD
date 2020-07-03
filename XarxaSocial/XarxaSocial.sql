-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 03-07-2020 a les 19:32:29
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
-- Base de dades: `XarxaSocial`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `fotografies_usuari`
--

CREATE TABLE `fotografies_usuari` (
  `foto_id` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `url_fotografia` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `Motiu_Coneixensa`
--

CREATE TABLE `Motiu_Coneixensa` (
  `motiu_coneixensa_id` int(11) NOT NULL,
  `motiu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `Motiu_Coneixensa`
--

INSERT INTO `Motiu_Coneixensa` (`motiu_coneixensa_id`, `motiu`) VALUES
(1, 'Amics infancia'),
(2, 'Companys escola primaria'),
(3, 'Coneguts xarxa social'),
(4, 'Companys de feina'),
(5, 'En una relació');

-- --------------------------------------------------------

--
-- Estructura de la taula `relacio_usuari`
--

CREATE TABLE `relacio_usuari` (
  `id_usuari_1` int(11) NOT NULL,
  `id_usuari_2` int(11) NOT NULL,
  `id_motiu_coneixensa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `relacio_usuari`
--

INSERT INTO `relacio_usuari` (`id_usuari_1`, `id_usuari_2`, `id_motiu_coneixensa`) VALUES
(1, 2, 3),
(1, 3, 4),
(3, 1, 4),
(1, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de la taula `usuari`
--

CREATE TABLE `usuari` (
  `usuari_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasenya` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcament de dades per a la taula `usuari`
--

INSERT INTO `usuari` (`usuari_id`, `nom`, `email`, `contrasenya`) VALUES
(1, 'Pep', 'pep@gmail.com', 'contrasenya1'),
(2, 'Juan', 'juan@gmail.com', 'contrasenya2'),
(3, 'Ramon', 'ramon@gmail.com', 'contrasenya3'),
(4, 'Lluis', 'lluis@gmail.com', 'contrasenya4');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `fotografies_usuari`
--
ALTER TABLE `fotografies_usuari`
  ADD PRIMARY KEY (`foto_id`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Índexs per a la taula `Motiu_Coneixensa`
--
ALTER TABLE `Motiu_Coneixensa`
  ADD PRIMARY KEY (`motiu_coneixensa_id`);

--
-- Índexs per a la taula `relacio_usuari`
--
ALTER TABLE `relacio_usuari`
  ADD PRIMARY KEY (`id_usuari_1`,`id_usuari_2`),
  ADD KEY `id_usuari_2` (`id_usuari_2`),
  ADD KEY `id_motiu_coneixensa` (`id_motiu_coneixensa`);

--
-- Índexs per a la taula `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`usuari_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `fotografies_usuari`
--
ALTER TABLE `fotografies_usuari`
  MODIFY `foto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `Motiu_Coneixensa`
--
ALTER TABLE `Motiu_Coneixensa`
  MODIFY `motiu_coneixensa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `usuari`
--
ALTER TABLE `usuari`
  MODIFY `usuari_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `fotografies_usuari`
--
ALTER TABLE `fotografies_usuari`
  ADD CONSTRAINT `fotografies_usuari_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuari` (`usuari_id`);

--
-- Restriccions per a la taula `relacio_usuari`
--
ALTER TABLE `relacio_usuari`
  ADD CONSTRAINT `relacio_usuari_ibfk_1` FOREIGN KEY (`id_usuari_1`) REFERENCES `usuari` (`usuari_id`),
  ADD CONSTRAINT `relacio_usuari_ibfk_2` FOREIGN KEY (`id_usuari_2`) REFERENCES `usuari` (`usuari_id`),
  ADD CONSTRAINT `relacio_usuari_ibfk_3` FOREIGN KEY (`id_motiu_coneixensa`) REFERENCES `Motiu_Coneixensa` (`motiu_coneixensa_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
