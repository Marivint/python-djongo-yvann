-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 20 sep. 2018 à 12:09
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `myhome`
--

-- --------------------------------------------------------

--
-- Structure de la table `logement`
--

DROP TABLE IF EXISTS `logement`;
CREATE TABLE IF NOT EXISTS `logement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `cp` int(11) NOT NULL,
  `tel` int(11) NOT NULL,
  `type` text NOT NULL,
  `chambres` int(50) NOT NULL,
  `position` varchar(250) NOT NULL,
  `src_image` varchar(255) NOT NULL DEFAULT '',
  `date_crea` date NOT NULL DEFAULT '0000-00-00',
  `date_modif` date NOT NULL DEFAULT '0000-00-00',
  `auteur_crea` varchar(50) NOT NULL,
  `auteur_modif` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `suppr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logement`
--

INSERT INTO `logement` (`id`, `titre`, `adresse`, `ville`, `cp`, `tel`, `type`, `chambres`, `position`, `src_image`, `date_crea`, `date_modif`, `auteur_crea`, `auteur_modif`, `actif`, `suppr`) VALUES
(1, 'logement1', 'Rincón de Loix, Avenida Madrid', 'Paris', 0, 0, '', 0, '38.525965 -0.1651289', 'logement1.jpg', '0000-00-00', '0000-00-00', '', '', 0, 0),
(2, 'logement2', 'Rincón de Loix, Avenida Madrid', 'Paris', 0, 0, '', 0, '45.9016798 6.4285479', 'logement2.jpg', '0000-00-00', '0000-00-00', '', '', 0, 0),
(3, 'La siesta lot n°1', 'Rincón de Loix, Avenida Madrid', 'Paris', 0, 0, '', 0, '38.5326449 -0.1071743', 'logement3.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0),
(4, 'Appartement Las Terrazas', 'Carrer Garbí, 5', 'Paris', 0, 0, '', 0, '38.5271855 -0.1717785', 'logement4.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0),
(5, 'Studio Torre Coblanca', 'Rincón de Loix, Avenida Madrid', 'Paris', 0, 0, '', 0, '38.536205 -0.1251627', 'logement5.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0),
(6, 'Tallinn Kalju rez de chaussée', 'Rincón de Loix, Avenida Madrid', 'Paris', 0, 0, '', 0, '59.4459613 24.7352288', 'logement6.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0),
(7, 'Beccaria', '12e Arrondissement, Paris', 'Paris', 0, 0, '', 0, '48.8293647 2.4265406', 'logement7.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0),
(8, '', 'test', 'Paris', 0, 0, '', 0, '', 'logement8.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_depart` date NOT NULL DEFAULT '0000-00-00',
  `date_arrivee` date NOT NULL DEFAULT '0000-00-00',
  `date_crea` date NOT NULL DEFAULT '0000-00-00',
  `date_modif` date NOT NULL DEFAULT '0000-00-00',
  `auteur_crea` varchar(50) NOT NULL,
  `auteur_modif` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `suppr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `date_crea` date NOT NULL DEFAULT '0000-00-00',
  `date_modif` date NOT NULL DEFAULT '0000-00-00',
  `auteur_crea` varchar(50) NOT NULL,
  `auteur_modif` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `suppr` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `nom`, `prenom`, `mail`, `mdp`, `date_crea`, `date_modif`, `auteur_crea`, `auteur_modif`, `actif`, `suppr`) VALUES
(1, 'ymarivint', 'Marivint', 'Yvann', 'marivint.yvann@gmail.com', 'f7aa73b1a672825046b4437a8edea1da', '2018-09-18', '0000-00-00', '', '', 1, 0),
(2, 'cblaix', 'Blaix', 'Camille', '', '098f6bcd4621d373cade4e832627b4f6', '2018-09-18', '0000-00-00', '', '', 1, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
