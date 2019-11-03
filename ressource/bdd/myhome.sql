-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 21 sep. 2018 à 14:12
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

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
  `equipements` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `logement`
--

INSERT INTO `logement` (`id`, `titre`, `adresse`, `ville`, `cp`, `tel`, `type`, `chambres`, `position`, `src_image`, `date_crea`, `date_modif`, `auteur_crea`, `auteur_modif`, `actif`, `suppr`, `equipements`, `description`, `prix`) VALUES
(1, 'Appartement Cornelia', 'Paseig del mar', 'L’Escala', 17130, 725372, 'Appart', 2, '42.120206 3.137685', 'logement1.jpg', '0000-00-00', '0000-00-00', '', '', 0, 0, 'barbecue', 'Au centre d\'un quartier animé', NULL),
(2, 'Pilay guest house', 'Mon Choisy', 'Grand Baie', 0, 187328713, 'Appart', 2, '-20.014175 57.572904', 'logement2.jpg', '0000-00-00', '0000-00-00', '', '', 0, 0, 'seche cheveux', 'Belles plages', NULL),
(3, 'Rincón de Loix, Avenida Madrid', 'Rincón de Loix, Avenida Madrid', 'Benidorm', 3503, 7326782, 'Appart', 2, '38.5326449 -0.1071743', 'logement3.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'serviettes', 'superbe terrasse', NULL),
(4, 'Appartement Las Terrazas', 'Camí Vell d\'Altea, 56', 'Alfàs del Pi', 3581, 32874892, 'Appart', 4, '38.575135 -0.072135', 'logement4.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'coffre fort', 'plage à 50m', NULL),
(5, 'Studio Torre Coblanca', 'Calle de Amsterdam, 9', 'Benidorm', 3503, 388732, 'Appart', 3, '38.534848 -0.104572', 'logement5.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'tv dvd bouilloire', 'piscine nombreuses activités', NULL),
(6, 'Le Penthouse', 'Arrondissement de Kesklinn', 'Tallinn', 0, 81739821, 'Hotel', 4, '59.4459613 24.7352288', 'logement6.jpg', '2018-11-01', '2018-12-07', '', '', 1, 0, 'peignoir jacuzzi', 'hotel elegant', NULL),
(7, 'Riad', 'Diour Jdad', 'Marrakech', 40000, 2736478, 'Hotel', 1, '31.638166 -7.995505', 'logement7.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'hammam', 'quartier festif', NULL),
(8, 'Six Degrees North Beach Villa', 'Province du sud', 'Ambalangoda', 0, 217467816, 'Hotel', 1, '6.217989 80.057870', 'logement8.jpg', '2018-09-21', '2018-09-30', '', '', 1, 0, 'rangements', 'nombreux restaurants à proximité', NULL),
(9, 'Hotel de la Plage Mahogany', '19 Avenue Amiral Ganteaumne', 'Cassis\r\n', 0, 678216378, 'Hotel', 2, '43.213466 5.531234', 'logement9.jpg', '2018-09-05', '2018-09-27', '', '', 1, 0, 'tv', 'quartier tranquille', 140),
(10, 'Reykjavik Lights by Keahotels', 'Suðurlandsbraut 16, Suðurlandsbraut 16,', 'Reykjavik', 0, 938249279, 'Hotel', 1, '64.140515 -21.882736', 'logement10.jpg', '2019-03-06', '2019-03-13', '', '', 1, 0, 'Parking à disposition', 'Hotel trois etoiles', 80),
(11, 'Hotel Le Soleil', '98-2 W 36th St', 'New-York', 10018, 876877832, 'Hotel', 2, '40.752064 -73.985713', 'logement11.jpg', '2018-09-06', '2018-09-21', '', '', 1, 0, 'Parking', 'En plein centre de Manhattan', 300),
(13, 'Hilton Hotel Rio De Janeiro', ' Av. Atlântica', 'Rio De Janeiro', 0, 736587365, 'Hotel', 1, '-22.964149 -43.173286', 'logement13.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'Piscine avec vue sur la mer', 'Hotel situé en bord de mer', 108),
(16, 'Serengeti Serena Safari Lodge', 'Serengeti National Park, TANZANIE', 'Plaine du Serengeti', 0, 342432, 'Hotel', 1, '-2.358989 34.698849', 'logement16.jpg', '2019-05-01', '2019-05-11', '', '', 1, 0, NULL, 'Safari', 300),
(17, 'Four Seasons Hotel Hong Kong', 'Finance St', 'Hong-Kong', 0, 5276573, 'Hotel', 1, '22.286560, 114.156664', 'logement17.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'piscine', 'bien situé', 682),
(18, 'Lotte Hotel Moscow', 'Novinskiy boulevard, 8 Russie', 'Moscou', 0, 7638383, 'Hotel', 1, '55.750621, 37.583814', 'logement18.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'Seche cheveux', 'Superbe vue', 400),
(12, 'Hotel Dorf', 'Dorfstrasse 33', 'Engelberg', 0, 8632876, 'Hotel', 0, '46.820689 8.404178', 'logement12.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'Seche-cheveux', 'Superbe vue', 89),
(14, 'Relexa Hotel Berlin', 'Anhalter Str. 8-9', 'Berlin', 0, 487368736, 'Hotel', 0, '52.504907 13.385170', 'logement14.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'Seche-cheveux', 'Superbe vue', 115),
(15, 'Pine Marten East Lothian', 'Spott Rd', 'Dunbar ', 0, 487387, 'Hotel', 0, '55.988689, 2.512026', 'logement15.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'Seche-cheveux', 'Superbe vue', 210),
(19, 'Hotel Sant\'Angelo', 'Via Marianna Dionigi, 16', 'Rome', 0, 8742874, 'Hotel', 1, '41.905686, 12.472515', 'logement19.jpg', '0000-00-00', '0000-00-00', '', '', 1, 0, 'Seche-cheveux', 'Superbe vue', 150);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_logement` int(11) NOT NULL DEFAULT '0',
  `id_utilisateur` int(11) NOT NULL DEFAULT '0',
  `date_debut` date NOT NULL DEFAULT '0000-00-00',
  `date_fin` date NOT NULL DEFAULT '0000-00-00',
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `nom`, `prenom`, `mail`, `mdp`, `date_crea`, `date_modif`, `auteur_crea`, `auteur_modif`, `actif`, `suppr`) VALUES
(1, 'ymarivint', 'Marivint', 'Yvann', 'marivint.yvann@gmail.com', 'f7aa73b1a672825046b4437a8edea1da', '2018-09-18', '0000-00-00', '', '', 1, 0),
(2, 'cblaix', 'Blaix', 'Camille', '', '098f6bcd4621d373cade4e832627b4f6', '2018-09-18', '0000-00-00', '', '', 1, 0),
(3, 'ttest', 'test', 'test', 'test@test.com', '5a105e8b9d40e1329780d62ea2265d8a', '2018-09-20', '0000-00-00', '0000-00-00', '0000-00-00', 1, 0),
(4, 'sobrir', 'Obrir', 'Sofiane', 'obrirsofiane@gmail.com', '0a5b3913cbc9a9092311630e869b4442', '2018-09-20', '0000-00-00', '0000-00-00', '0000-00-00', 1, 0),
(5, 'user', 'Patrick', 'Toto', 'bot@gmail.com', '63a9f0ea7bb98050796b649e85481845', '2018-09-21', '0000-00-00', '', '', 1, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
