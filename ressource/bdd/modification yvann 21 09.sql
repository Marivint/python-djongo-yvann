ALTER TABLE `reservation` CHANGE `date_depart` `date_debut` DATE NOT NULL DEFAULT '0000-00-00';

ALTER TABLE `reservation` CHANGE `date_arrivee` `date_fin` DATE NOT NULL DEFAULT '0000-00-00';