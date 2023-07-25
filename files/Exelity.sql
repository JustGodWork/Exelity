-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.28-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de la table exelity. account_info
CREATE TABLE IF NOT EXISTS `account_info` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) NOT NULL,
  `steam` varchar(22) DEFAULT NULL,
  `xbl` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `live` varchar(50) DEFAULT NULL,
  `fivem` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `guid` varchar(20) DEFAULT NULL,
  `first_connection` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `license` (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.account_info : 0 rows
/*!40000 ALTER TABLE `account_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_info` ENABLE KEYS */;

-- Listage de la structure de la table exelity. addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.addon_account : ~46 rows (environ)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('property_black_money', 'Argent Sale Propriété', 0),
	('property_dirtycash', 'Argent Sale Propriété', 0),
	('society_Douanier', 'douanier', 1),
	('society_Freres', 'frere', 1),
	('society_Hollystreet', 'Hollystreet', 1),
	('society_Les 4 Frères', 'frere', 1),
	('society_Terro', 'Terro', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_balkan', 'balkan', 1),
	('society_bcso', 'B.C.S.O', 0),
	('society_bestbuds', 'Bestbuds', 1),
	('society_boatseller', 'Concessionnaire Beneteau', 1),
	('society_boatshop', 'Concessionnaire Bateaux', 1),
	('society_bratva', 'Bratva', 1),
	('society_cardealer', 'Concessionnaire', 1),
	('society_carshop', 'Concessionnaire Voitures', 1),
	('society_durex', 'Durex', 1),
	('society_fib', 'FIB', 1),
	('society_frere', 'Les 4 Frères', 1),
	('society_gophone', 'GoPhone', 1),
	('society_gouv', 'Gouvernement', 1),
	('society_journalist', 'Journaliste', 1),
	('society_karting', 'Karting', 1),
	('society_la_passione', 'La Passione', 1),
	('society_lmf', 'LMF', 1),
	('society_marchand', 'marchand', 1),
	('society_marocain', 'marocain', 1),
	('society_massimo', 'massimo', 1),
	('society_mecano', 'Benny\'s', 1),
	('society_mecano2', 'Ls Custom', 1),
	('society_medicalcenter', 'MedicalCenter', 1),
	('society_mine_dlcx', 'Mine DLCX', 1),
	('society_nvidia', 'Nvidia', 1),
	('society_planeseller', 'Concessionnaire aéronotique', 1),
	('society_planeshop', 'Concessionnaire Avions', 1),
	('society_police', 'Police', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_roxsherif', 'R.S.D', 1),
	('society_tabac', 'Tabac', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_vigne', 'Vigneron', 1),
	('society_vigneron', 'Vigneron', 1),
	('trunk_dirtycash', 'Argent Sale Coffre Véhicule', 0);

-- Listage de la structure de la table exelity. addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_addon_account_data_account_name` (`account_name`(191)) USING BTREE,
  KEY `index_addon_account_data_account_name_owner` (`account_name`(191),`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.addon_account_data : ~0 rows (environ)

-- Listage de la structure de la table exelity. addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.addon_inventory : ~49 rows (environ)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_Douanier', 'douanier', 1),
	('society_Fabulous', 'Fabulous', 1),
	('society_Freres', 'frere', 1),
	('society_Holly Street', 'Holly Street', 1),
	('society_Hollystreet', 'Hollystreet', 1),
	('society_Les 4 Frères', 'frere', 1),
	('society_Sixnueve', 'Sixnueve', 1),
	('society_Terro', 'Terro', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_balkan', 'balkan', 1),
	('society_bcso', 'B.C.S.O', 1),
	('society_bestbuds', 'Bestbuds', 1),
	('society_boatseller', 'Concesionnaire Beneteau', 1),
	('society_boatshop', 'Concessionnaire Bateaux', 1),
	('society_cardealer', 'Concesionnaire', 1),
	('society_carshop', 'Concessionnaire Voitures', 1),
	('society_casino', 'Casino', 1),
	('society_durex', 'Durex', 1),
	('society_fib', 'FIB', 1),
	('society_frere', 'Les 4 Frères', 1),
	('society_gophone', 'GoPhone', 1),
	('society_gouv', 'Gouvernement', 1),
	('society_journalist', 'Journaliste', 1),
	('society_karting', 'Karting', 1),
	('society_krzcorp', 'Korioz Corp.', 1),
	('society_la_passione', 'La Passione', 1),
	('society_lmf', 'LMF', 1),
	('society_marchand', 'marchand', 1),
	('society_massimo', 'massimo', 1),
	('society_mecano', 'Benny\'s', 1),
	('society_mecano2', 'Ls Custom', 1),
	('society_medicalcenter', 'MedicalCenter', 1),
	('society_mine_dlcx', 'Mine DLCX', 1),
	('society_nvidia', 'Nvidia', 1),
	('society_planeseller', 'Concesionnaire aéronotique', 1),
	('society_planeshop', 'Concessionnaire Avions', 1),
	('society_police', 'Police', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_roxsherif', 'R.S.D', 1),
	('society_tabac', 'Tabac', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_unicorn_fridge', 'Unicorn (frigo)', 1),
	('society_vigne', 'Vigneron', 1),
	('society_vigneron', 'Vigneron', 1),
	('trunk', 'Coffre Véhicule', 0);

-- Listage de la structure de la table exelity. addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.addon_inventory_items : ~0 rows (environ)

-- Listage de la structure de la table exelity. amandes
CREATE TABLE IF NOT EXISTS `amandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.amandes : ~52 rows (environ)
INSERT INTO `amandes` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Usage abusif du klaxon', 30, 0),
	(2, 'Franchir une ligne continue', 40, 0),
	(3, 'Circulation à contresens', 250, 0),
	(4, 'Demi-tour non autorisé', 250, 0),
	(5, 'Circulation hors-route', 170, 0),
	(6, 'Non-respect des distances de sécurité', 30, 0),
	(7, 'Arrêt dangereux / interdit', 150, 0),
	(8, 'Stationnement gênant / interdit', 70, 0),
	(9, 'Non respect  de la priorité à droite', 70, 0),
	(10, 'Non-respect à un véhicule prioritaire', 90, 0),
	(11, 'Non-respect d\'un stop', 105, 0),
	(12, 'Non-respect d\'un feu rouge', 130, 0),
	(13, 'Dépassement dangereux', 100, 0),
	(14, 'Véhicule non en état', 100, 0),
	(15, 'Conduite sans permis', 1500, 0),
	(16, 'Délit de fuite', 800, 0),
	(17, 'Excès de vitesse < 5 kmh', 90, 0),
	(18, 'Excès de vitesse 5-15 kmh', 120, 0),
	(19, 'Excès de vitesse 15-30 kmh', 180, 0),
	(20, 'Excès de vitesse > 30 kmh', 300, 0),
	(21, 'Entrave de la circulation', 110, 1),
	(22, 'Dégradation de la voie publique', 90, 1),
	(23, 'Trouble à l\'ordre publique', 90, 1),
	(24, 'Entrave opération de police', 130, 1),
	(25, 'Insulte envers / entre civils', 75, 1),
	(26, 'Outrage à agent de police', 110, 1),
	(27, 'Menace verbale ou intimidation envers civil', 90, 1),
	(28, 'Menace verbale ou intimidation envers policier', 150, 1),
	(29, 'Manifestation illégale', 250, 1),
	(30, 'Tentative de corruption', 1500, 1),
	(31, 'Arme blanche sortie en ville', 120, 2),
	(32, 'Arme léthale sortie en ville', 300, 2),
	(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
	(34, 'Port d\'arme illégal', 700, 2),
	(35, 'Pris en flag lockpick', 300, 2),
	(36, 'Vol de voiture', 1800, 2),
	(37, 'Vente de drogue', 1500, 2),
	(38, 'Fabriquation de drogue', 1500, 2),
	(39, 'Possession de drogue', 650, 2),
	(40, 'Prise d\'ôtage civil', 1500, 2),
	(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
	(42, 'Braquage particulier', 650, 2),
	(43, 'Braquage magasin', 650, 2),
	(44, 'Braquage de banque', 1500, 2),
	(45, 'Tir sur civil', 2000, 3),
	(46, 'Tir sur agent de l\'état', 2500, 3),
	(47, 'Tentative de meurtre sur civil', 3000, 3),
	(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
	(49, 'Meurtre sur civil', 10000, 3),
	(50, 'Meurte sur agent de l\'état', 30000, 3),
	(51, 'Meurtre involontaire', 1800, 3),
	(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- Listage de la structure de la table exelity. banlist
CREATE TABLE IF NOT EXISTS `banlist` (
  `licenseid` varchar(50) NOT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetName` varchar(32) DEFAULT NULL,
  `sourceName` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`licenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.banlist : ~0 rows (environ)

-- Listage de la structure de la table exelity. banlisthistory
CREATE TABLE IF NOT EXISTS `banlisthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licenseid` varchar(50) NOT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetName` varchar(50) DEFAULT NULL,
  `sourceName` varchar(50) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.banlisthistory : ~0 rows (environ)

-- Listage de la structure de la table exelity. bbanque
CREATE TABLE IF NOT EXISTS `bbanque` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `nivcompte` varchar(50) DEFAULT NULL,
  `motdepasse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `statemdp` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.bbanque : ~0 rows (environ)

-- Listage de la structure de la table exelity. billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_billing_identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.billing : ~0 rows (environ)

-- Listage de la structure de la table exelity. calendar
CREATE TABLE IF NOT EXISTS `calendar` (
  `identifier` varchar(100) NOT NULL,
  `palier` varchar(30) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.calendar : ~0 rows (environ)

-- Listage de la structure de la table exelity. cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT '',
  `price` int(11) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.cardealer_vehicles : ~0 rows (environ)

-- Listage de la structure de la table exelity. casier
CREATE TABLE IF NOT EXISTS `casier` (
  `identifier` varchar(255) DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.casier : ~0 rows (environ)

-- Listage de la structure de la table exelity. casier2
CREATE TABLE IF NOT EXISTS `casier2` (
  `identifier` varchar(255) DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.casier2 : ~0 rows (environ)

-- Listage de la structure de la table exelity. casier3
CREATE TABLE IF NOT EXISTS `casier3` (
  `identifier` varchar(255) DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `naissance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.casier3 : ~0 rows (environ)

-- Listage de la structure de la table exelity. characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_characters_identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.characters : ~0 rows (environ)

-- Listage de la structure de la table exelity. clothes_data
CREATE TABLE IF NOT EXISTS `clothes_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` longtext NOT NULL,
  `name` longtext NOT NULL DEFAULT '**NIL**',
  `data` longtext DEFAULT NULL,
  `type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.clothes_data : ~0 rows (environ)

-- Listage de la structure de la table exelity. crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.crypto_transactions : ~0 rows (environ)

-- Listage de la structure de la table exelity. darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.darkchat_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.datastore : ~48 rows (environ)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_Balkan', 'Balkan', 1),
	('society_Douanier', 'douanier', 1),
	('society_Freres', 'frere', 1),
	('society_Hollystreet', 'Hollystreet', 1),
	('society_Les 4 Frères', 'frere', 1),
	('society_Terro', 'Terro', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahamas', 'Bahmas', 1),
	('society_balkan', 'balkan', 1),
	('society_bestbuds', 'Bestbuds', 1),
	('society_boatshop', 'Concessionnaire Bateaux', 1),
	('society_bratva', 'Bratva', 1),
	('society_carshop', 'Concessionnaire Voitures', 1),
	('society_durex', 'Durex', 1),
	('society_frere', 'Les 4 Frères', 1),
	('society_gophone', 'GoPhone', 1),
	('society_gouv', 'Gouvernement', 1),
	('society_journalist', 'Journaliste', 1),
	('society_la_passione', 'La Passione', 1),
	('society_lmf', 'LMF', 1),
	('society_madrazo', 'madrazo', 1),
	('society_marchand', 'marchand', 1),
	('society_marocain', 'marocain', 1),
	('society_massimo', 'massimo', 1),
	('society_mecano', 'Benny\'s', 1),
	('society_mecano2', 'Ls Custom', 1),
	('society_medicalcenter', 'MedicalCenter', 1),
	('society_mine_dlcx', 'Mine DLCX', 1),
	('society_nil', 'balkan', 1),
	('society_nvidia', 'Nvidia', 1),
	('society_planeshop', 'Concessionnaire Avions', 1),
	('society_police', 'Police', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_roxsherif', 'R.S.D', 1),
	('society_sinaloa', 'Sinaloa', 1),
	('society_tabac', 'Tabac', 1),
	('society_taxi', 'Taxi', 1),
	('society_test', 'test', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_vigne', 'Vigneron', 1),
	('society_vigneron', 'Vigneron', 1),
	('trunk', 'Coffre Véhicule', 0),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Listage de la structure de la table exelity. datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `data` longtext DEFAULT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_datastore_data_name` (`name`) USING BTREE,
  KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.datastore_data : ~0 rows (environ)

-- Listage de la structure de la table exelity. dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table exelity.dpkeybinds : ~0 rows (environ)

-- Listage de la structure de la table exelity. drugs
CREATE TABLE IF NOT EXISTS `drugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdBy` text NOT NULL,
  `createdAt` text NOT NULL,
  `label` varchar(50) NOT NULL,
  `drugsInfos` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.drugs : ~0 rows (environ)

-- Listage de la structure de la table exelity. drugss
CREATE TABLE IF NOT EXISTS `drugss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdBy` text NOT NULL,
  `createdAt` text NOT NULL,
  `label` varchar(50) NOT NULL,
  `drugsInfos` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.drugss : ~7 rows (environ)
INSERT INTO `drugss` (`id`, `createdBy`, `createdAt`, `label`, `drugsInfos`) VALUES
	(6, 'none', 'none', 'weed', '{"rawItem":"weed","harvest":{"z":33.44686,"y":-5251.685,"x":5373.437},"sellRewardPerCount":"73","name":"weed","treatmentCount":"1","treatmentReward":"1","sale":"1","treatedItem":"weed_pooch","vendor":{"z":-316.3931,"y":-9935.881,"x":816.6109},"treatement":{"z":112.6432,"y":-1595.618,"x":1756.67},"sellCount":"1","harvestCount":"1"}'),
	(7, 'none', 'none', 'coke', '{"rawItem":"coke","harvest":{"z":12.30333,"y":-5173.824,"x":5209.943},"sellRewardPerCount":"81","name":"coke","treatmentCount":"1","treatmentReward":"1","sale":"1","treatedItem":"coke_pooch","vendor":{"z":-2583.606,"y":-4629.874,"x":448.5531},"treatement":{"z":6.472113,"y":-2671.019,"x":-265.968},"sellCount":"1","harvestCount":"1"}'),
	(8, 'none', 'none', 'meth', '{"rawItem":"meth","harvest":{"z":42.34762,"y":4971.525,"x":2433.021},"sellRewardPerCount":"87","name":"meth","treatmentCount":"1","treatmentReward":"1","sale":"1","treatedItem":"meth_pooch","vendor":{"z":2432.153,"y":6194.414,"x":-6358.568},"treatement":{"z":38.15809,"y":4348.816,"x":1299.258},"sellCount":"1","harvestCount":"1"}'),
	(9, 'none', 'none', 'opium', '{"rawItem":"opium","harvest":{"z":11.34855,"y":5027.253,"x":3616.719},"sellRewardPerCount":"118","name":"opium","treatmentCount":"1","treatmentReward":"1","sale":"1","treatedItem":"opium_pooch","vendor":{"z":2365.183,"y":8526.312,"x":-308.1102},"treatement":{"z":52.65165,"y":3752.741,"x":-334.5743},"sellCount":"1","sale":"1","harvestCount":"1"}'),
	(10, 'none', 'none', 'Bitcoin', '{"harvest":{"x":1273.3175048828126,"y":-1711.863037109375,"z":54.77141952514648},"sellCount":"1","treatedItem":"bitcoin","harvestCount":"1","rawItem":"bitcoin","treatmentReward":"1","name":"Bitcoin","treatement":{"x":6945.98388671875,"y":-668.0714721679688,"z":-188.35848999023438},"treatmentCount":"1","sale":"0","sellRewardPerCount":"47","vendor":{"x":605.7781372070313,"y":-3088.163330078125,"z":6.06926107406616}}'),
	(11, 'none', 'none', 'Tabac', '{"sellCount":"1","harvestCount":"1","name":"Tabac","harvest":{"y":4597.51220703125,"x":2854.02587890625,"z":47.86069107055664},"treatmentCount":"1","treatedItem":"tabacbrun","sellRewardPerCount":"63","treatement":{"y":3128.61376953125,"x":2340.943603515625,"z":48.20868301391601},"treatmentReward":"1","vendor":{"y":3842.948974609375,"x":1953.5892333984376,"z":32.18350982666015},"rawItem":"tabac","sale":"0"}'),
	(12, 'none', 'none', 'LSD', '{"rawItem":"lsd","harvest":{"z":42.63747,"y":6152.836,"x":-177.7927},"sellRewardPerCount":"87","name":"lsd","treatmentCount":"1","treatmentReward":"1","sale":"1","treatedItem":"lsd_pooch","vendor":{"z":2432.153,"y":6194.414,"x":-6358.568},"treatement":{"z":16.88037,"y":5197.82,"x":-2166.827},"sellCount":"1","harvestCount":"1"}');

-- Listage de la structure de la table exelity. einvest
CREATE TABLE IF NOT EXISTS `einvest` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) DEFAULT NULL,
  `time` int(25) NOT NULL DEFAULT 0,
  `type` int(25) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.einvest : ~0 rows (environ)

-- Listage de la structure de la table exelity. esx_leboncoin
CREATE TABLE IF NOT EXISTS `esx_leboncoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(80) NOT NULL,
  `name` text NOT NULL,
  `description` varchar(150) NOT NULL,
  `model` text NOT NULL,
  `price` int(10) NOT NULL,
  `createdAt` text NOT NULL,
  `plate` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.esx_leboncoin : ~0 rows (environ)

-- Listage de la structure de la table exelity. fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.fine_types : ~60 rows (environ)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Usage abusif du klaxon', 50, 0),
	(2, 'Franchir une ligne continue', 100, 0),
	(3, 'Circulation à contresens', 150, 0),
	(4, 'Demi-tour non autorisé', 250, 0),
	(5, 'Circulation hors-route', 300, 0),
	(6, 'Non-respect des distances de sécurité', 100, 0),
	(7, 'Arrêt dangereux / interdit', 300, 0),
	(8, 'Stationnement gênant / interdit', 300, 0),
	(9, 'Non respect  de la priorité à droite', 200, 0),
	(10, 'Non-respect à un véhicule prioritaire', 300, 0),
	(11, 'Non-respect d\'un stop', 200, 0),
	(12, 'Non-respect d\'un feu rouge', 400, 0),
	(13, 'Dépassement dangereux', 500, 0),
	(14, 'Véhicule non en état', 600, 0),
	(15, 'Conduite sans permis', 2000, 0),
	(16, 'Délit de fuite', 19680, 0),
	(17, 'Excès de vitesse < 5 kmh', 2450, 0),
	(18, 'Excès de vitesse 5-15 kmh', 4800, 0),
	(19, 'Excès de vitesse 15-30 kmh', 8450, 0),
	(20, 'Excès de vitesse > 30 kmh', 9980, 0),
	(21, 'Entrave de la circulation', 2130, 1),
	(22, 'Dégradation de la voie publique', 1300, 1),
	(23, 'Trouble à l\'ordre publique', 1970, 1),
	(24, 'Entrave opération de police', 15630, 1),
	(25, 'Insulte envers / entre civils', 14300, 1),
	(26, 'Outrage à agent de police', 19600, 1),
	(27, 'Menace verbale ou intimidation evers civils', 9630, 1),
	(28, 'Menace verbale ou intimidation envers policier', 8600, 1),
	(29, 'Manifestation illégale', 4960, 1),
	(30, 'Tentative de corruption', 17800, 1),
	(31, 'Arme blanche sortie en ville', 21500, 2),
	(32, 'Arme léthale sortie en ville', 27830, 2),
	(33, 'Port d\'arme non autorisé (défaut de license)', 24600, 2),
	(34, 'Port d\'arme illégal', 28900, 2),
	(35, 'Pris en flag lockpick', 14600, 2),
	(36, 'Vol de voiture', 13300, 2),
	(37, 'Vente de drogue', 45600, 2),
	(38, 'Fabriquation de drogue', 34650, 2),
	(39, 'Possession de drogue', 39650, 2),
	(40, 'Prise d\'ôtage civil', 75000, 2),
	(41, 'Prise d\'ôtage agent de l\'état', 125000, 2),
	(42, 'Braquage particulier', 86000, 2),
	(43, 'Braquage magasin', 52000, 2),
	(44, 'Braquage de banque', 136000, 2),
	(45, 'Tir sur civil', 56300, 3),
	(46, 'Tir sur agent de l\'état', 65300, 3),
	(47, 'Tentative de meurtre sur civil', 65300, 3),
	(48, 'Tentative de meurtre sur agent de l\'état', 72300, 3),
	(49, 'Meurtre sur civil', 82300, 3),
	(50, 'Meurte sur agent de l\'état', 102300, 3),
	(51, 'Meurtre involontaire', 36000, 3),
	(52, 'Escroquerie à l\'entreprise', 82360, 2),
	(53, 'Vol de Vehicule Aeriens', 62220, 1),
	(54, 'Default de permis Aeriens', 28920, 1),
	(55, 'Default de permis de BATEAU', 22630, 1),
	(56, 'Vol de Vehicule Aquatique', 42560, 1),
	(57, 'Refus d\'obtempérer', 21300, 2),
	(58, 'Usurpation d\'identité', 22300, 2),
	(59, 'Complice du meurtre ', 35600, 2),
	(60, 'Tentative de kidnapping', 36500, 2);

-- Listage de la structure de la table exelity. gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `data` longtext DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.gangs : ~0 rows (environ)

-- Listage de la structure de la table exelity. items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.items : ~169 rows (environ)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('bandage', 'Bandage', 0.2, 0, 1),
	('basic_cuff', 'Menottes Basique', 0.3, 0, 1),
	('basic_key', 'Clefs de Menottes Basique', 0.1, 0, 1),
	('beer', 'Bière', 0.1, 0, 1),
	('bitcoin', 'Bitcoin', 1.5, 0, 1),
	('black_phone', 'Black Phone', 10, 0, 1),
	('blowpipe', 'Chalumeaux', 1.5, 0, 1),
	('blue_phone', 'Blue Phone', 10, 0, 1),
	('bread', 'Pain', 0.1, 0, 1),
	('brochet', 'Brochet', 1, 0, 1),
	('burger', 'Burger', 0.3, 0, 1),
	('burgerclassique', 'Burger Classique', 0.3, 0, 1),
	('bœuf_stroganov', 'Bœuf Stroganov', 0.2, 0, 1),
	('cabillaud', 'Cabillaud', 1, 0, 1),
	('cacahuete', 'cacahuète', 0.1, 0, 1),
	('capote', 'Capote', 1.5, 0, 1),
	('carokit', 'Kit carosserie', 3, 0, 1),
	('carotool', 'Outils carosserie', 4, 0, 1),
	('carpaccio_de_flétan', 'Carpaccio de flétan', 0.2, 0, 1),
	('carton__ingredient_burgershot', 'Carton de ingrédient BurgerShot', 1, 0, 1),
	('carton_aliment_burgershot', 'Carton alimentaire BurgerShot', 1, 0, 1),
	('cb', 'Carte Bancaire', 1, 0, 1),
	('cbd', 'CBD', 1, 0, 1),
	('cbd_pooch', 'Pochon de CBD', 0.25, 0, 1),
	('chaklik', 'Chaklik', 0.2, 0, 1),
	('chip', 'Jeton', 0, 0, 1),
	('chips', 'chips', 0.1, 0, 1),
	('cigarette', 'Cigarette', 0.1, 0, 1),
	('classic_phone', 'Classic Phone', 10, 0, 1),
	('clip', 'Chargeur', 0.3, 0, 1),
	('coca', 'Coca', 0.1, 0, 1),
	('cofee', 'Café', 1, 0, 1),
	('coke', 'Coke', 1, 0, 1),
	('coke_pooch', 'Pochon de coke', 0.25, 0, 1),
	('cola', 'Cola', 0.2, 0, 1),
	('commandetacos', 'Commande Tacos', 1, 0, 1),
	('composant', 'Composant', 1, 0, 1),
	('composant_rtx', 'Composant RTX', 1, 0, 1),
	('cornichons', 'Cornichons', 0.1, 0, 1),
	('crêpes', 'Crêpes', 0.2, 0, 1),
	('defibrillateur', 'Défibrillateur', 2, 0, 1),
	('donuts', 'Donuts', 1, 0, 1),
	('drop_flareV2', 'Flare', 1, 0, 1),
	('entrecôte', 'Entrecôte', 0.2, 0, 1),
	('fanta', 'fanta', 0.1, 0, 1),
	('feuille_coca', 'Feuille de coca', 1, 0, 1),
	('firstaidkit', 'Trousse premier secours', 1, 0, 1),
	('fish', 'Poisson', -1, 0, 1),
	('fishingrod', 'Canne à pêche', 0.5, 0, 1),
	('fixkit', 'Kit réparation', 1.5, 0, 1),
	('fixtool', 'Outils réparation', 2, 0, 1),
	('frites', 'Frites', 0.1, 0, 1),
	('garnitures', 'Garnitures', 0.1, 0, 1),
	('gazbottle', 'Bouteille de gaz', 2, 0, 1),
	('gitanes', 'Gitanes', 0.1, 0, 1),
	('gold_phone', 'Gold Phone', 10, 0, 1),
	('gphone', 'gPhone', 1, 0, 1),
	('grand_cru', 'Grand cru', 0.2, 0, 1),
	('grapperaisin', 'Grappe de raisin', 0.3, 0, 1),
	('green_phone', 'Green Phone', 10, 0, 1),
	('greenlight_phone', 'Green Light Phone', 10, 0, 1),
	('handcuff', 'Serre câble ', 0.3, 0, 1),
	('homard_grillé ', 'Homard grillé ', 0.2, 0, 1),
	('ice', 'Glaçon', 0.1, 0, 1),
	('icetea', 'icetea', 0.1, 0, 1),
	('id_card_f', 'Carte de sécurité', 0.3, 0, 1),
	('itemtest', 'Item Test', 1, 0, 1),
	('jager', 'Jägermeister', 0.5, 0, 1),
	('jagerbomb', 'Jägermeister', 0.5, 0, 1),
	('jagercerbere', 'Jäger Cerbère', 0.5, 0, 1),
	('jewels', 'Bijoux', 1, 0, 1),
	('jumelles', 'Jumelles', 0.25, 0, 1),
	('jus_coca', 'Jus de coca', 0.5, 0, 1),
	('jus_raisin', 'Jus de raisin', 0.5, 0, 1),
	('jusfruit', 'Jus de fruits', 0.5, 0, 1),
	('kevlar', 'Kevlar Lourd', 2.5, 0, 1),
	('kevlarlow', 'Kevlar Léger', 0.5, 0, 1),
	('kevlarmid', 'Kevlar Medium', 1.5, 0, 1),
	('latex', 'Latex', 1.5, 0, 1),
	('limonade', 'Limonade', 0.5, 0, 1),
	('lingotor', 'Lingot d\'or', 1, 0, 1),
	('lockpick', 'Pied de Biche', 1, 0, 1),
	('lsd', 'LSD', 1, 0, 1),
	('lsd_pooch', 'Pochon de LSD', 0.25, 0, 1),
	('malbora', 'Malboro', 0.1, 0, 1),
	('martini', 'Martini blanc', 1, 0, 1),
	('meat', 'Viande', 0.3, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('medovik', 'Medovik', 0.2, 0, 1),
	('menthe', 'Feuille de menthe', 1, 0, 1),
	('meth', 'Meth', 1, 0, 1),
	('meth_pooch', 'Pochon de meth', 0.25, 0, 1),
	('metreshooter', 'Mètre de shooter', 0.1, 0, 1),
	('mixapero', 'Mix Apéritif', 0.1, 0, 1),
	('mojito', 'Mojito', 0.1, 0, 1),
	('olive', 'Olive', 0.1, 0, 1),
	('opium', 'Opium', 1, 0, 1),
	('opium_pooch', 'Pochon d\'opium', 0.25, 0, 1),
	('orange', 'Orange', 0.1, 0, 1),
	('orange_juice', 'Jus d\'orange', 0.3, 0, 1),
	('orangina', 'Orangina', 0.1, 0, 1),
	('oxygen_mask', 'Masque à Oxygène', 0.6, 0, 1),
	('painburger', 'Pain Burger', 0.2, 0, 1),
	('paper', 'Papier', 0.1, 0, 1),
	('pate_au_truffe', 'Pate au Truffe', 0.2, 0, 1),
	('pepitor', 'Pépite d\'or', 1, 0, 1),
	('pepperspray', 'Gazeuse', 1, 0, -1),
	('phone', 'Téléphone', 0.1, 0, 1),
	('phone_hack', 'Phone Hack', 10, 0, 1),
	('phone_module', 'Phone Module', 10, 0, 1),
	('piluleoubli', 'GHB', 1, 0, 1),
	('pink_phone', 'Pink Phone', 10, 0, 1),
	('plante', 'Plante du Jardinier', 2, 0, 1),
	('police_cuff', 'Menottes LSPD', 0.3, 0, 1),
	('police_key', 'Clefs de Menottes LSPD', 0.1, 0, 1),
	('pomme', 'Pomme', 0.1, 0, 1),
	('powerbank', 'Power Bank', 10, 0, 1),
	('radio', 'Radio', 0.5, 0, 1),
	('raisin', 'Raisin', 0.3, 0, 1),
	('red_phone', 'Red Phone', 10, 0, 1),
	('redbull', 'Redbull', 0.3, 0, 1),
	('redmonney', 'Faux Billet', 0.1, 0, 1),
	('repairkit', 'Repairkit', 2, 0, 1),
	('rhum', 'Rhum', 0.4, 0, 1),
	('rhumcoca', 'Rhum-Coca', 0.5, 0, 1),
	('rhumfruit', 'Rhum-Jus de fruits', 0.5, 0, 1),
	('riz', 'Riz', 0.2, 0, 1),
	('rtx_4090', 'RTX 4090', 1, 0, 1),
	('salade', 'Salade', 0.1, 0, 1),
	('salade_césar', 'Salade césar', 0.2, 0, 1),
	('sardine', 'Sardine', 1, 0, 1),
	('saumon', 'Saumon', 1, 0, 1),
	('steak', 'Steak Haché', 0.5, 0, 1),
	('tabac', 'Tabac', 1.5, 0, 1),
	('tabacblond', 'Tabac Blond', 0.5, 0, 1),
	('tabacblondsec', 'Tabac Blond Séché', 0.5, 0, 1),
	('tabacbrun', 'Tabac Brun', 0.5, 0, 1),
	('tabacbrunsec', 'Tabac Brun Séché', 0.5, 0, 1),
	('tarte_pomme', 'Tarte aux Pommes', 0.3, 0, 1),
	('teqpaf', 'Teq\'paf', 0.5, 0, 1),
	('tequila', 'Tequila', 0.5, 0, 1),
	('thon', 'Thon', 1, 0, 1),
	('tomates', 'Tomates', 0.1, 0, 1),
	('truite', 'Truite', 1, 0, 1),
	('viande_1', 'Viande Blanche', 1.5, 0, 1),
	('viande_2', 'Viande Rouge', 2.5, 0, 1),
	('vine', 'Bouteille de Vin', 0.5, 0, 1),
	('vittvin', 'Vin Blanc', 0.5, 0, 1),
	('vodka', 'Vodka', 0.3, 0, 1),
	('vodkaenergy', 'Vodka-Energy', 0.4, 0, 1),
	('vodkafruit', 'Vodka-Jus de fruits', 0.3, 0, 1),
	('vodkaredbull', 'Vodka-Redbull', 0.3, 0, 1),
	('water', 'Bouteille d\'eau', 0.1, 0, 1),
	('weed', 'Weed', 1, 0, 1),
	('weed_pooch', 'Pochon de weed', 0.25, 0, 1),
	('wet_black_phone', 'Wet Black Phone', 10, 0, 1),
	('wet_blue_phone', 'Wet Blue Phone', 10, 0, 1),
	('wet_classic_phone', 'Wet Classic Phone', 10, 0, 1),
	('wet_gold_phone', 'Wet Gold Phone', 10, 0, 1),
	('wet_green_phone', 'Wet Green Phone', 10, 0, 1),
	('wet_greenlight_phone', 'Wet Green Light Phone', 10, 0, 1),
	('wet_pink_phone', 'Wet Pink Phone', 10, 0, 1),
	('wet_red_phone', 'Wet Red Phone', 10, 0, 1),
	('wet_white_phone', 'Wet White Phone', 10, 0, 1),
	('whisky', 'Whisky', 0.4, 0, 1),
	('whiskycoca', 'Whisky-coca', 0.5, 0, 1),
	('white_phone', 'White Phone', 10, 0, 1),
	('wiskycoca', 'wiskycoca', 0.1, 0, 1),
	('zetony', 'Jetons', -1, 0, 1);

-- Listage de la structure de la table exelity. jail
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `remainingTasks` int(100) NOT NULL,
  `motif` varchar(255) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.jail : ~0 rows (environ)

-- Listage de la structure de la table exelity. jobbuilder
CREATE TABLE IF NOT EXISTS `jobbuilder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL,
  `posboss` varchar(255) NOT NULL,
  `posveh` varchar(255) NOT NULL,
  `poscoffre` varchar(255) NOT NULL,
  `posspawncar` varchar(255) NOT NULL,
  `nameitemrecolte` varchar(50) NOT NULL,
  `labelitemrecolte` varchar(50) NOT NULL,
  `posrecolte` varchar(255) NOT NULL,
  `nameitemtraitement` varchar(50) NOT NULL,
  `labelitemtraitement` varchar(50) NOT NULL,
  `postraitement` varchar(255) NOT NULL,
  `vehingarage` varchar(255) NOT NULL,
  `posvente` varchar(255) NOT NULL,
  `prixvente` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.jobbuilder : ~5 rows (environ)
INSERT INTO `jobbuilder` (`id`, `name`, `label`, `society`, `posboss`, `posveh`, `poscoffre`, `posspawncar`, `nameitemrecolte`, `labelitemrecolte`, `posrecolte`, `nameitemtraitement`, `labelitemtraitement`, `postraitement`, `vehingarage`, `posvente`, `prixvente`) VALUES
	(4, 'durex', 'Durex', 'society_durex', '{"x":868.6473388671875,"y":-3130.9033203125,"z":5.90083694458007}', '{"x":868.2390747070313,"y":-3134.654052734375,"z":5.9005103111267}', '{"x":873.5718994140625,"y":-3128.6552734375,"z":5.90074872970581}', '{"x":869.4125366210938,"y":-3133.083740234375,"z":5.90545606613159}', 'latex', 'Latex', '{"x":721.136474609375,"y":253.462890625,"z":93.25244140625}', 'capote', 'Capote', '{"x":686.1593627929688,"y":275.53851318359377,"z":93.33778381347656}', '[{"label":"Sultan","model":"sultan"}]', '{"x":660.4414672851563,"y":231.121826171875,"z":94.26876831054688}', 75),
	(5, 'vigneron', 'Vigneron', 'society_vigneron', '{"x":-2913.926,"y":1325.729,"z":1145.781}', '{"x":-1897.77783203125,"y":2055.14599609375,"z":140.94029235839845}', '{"x":-1909.27587890625,"y":2071.70947265625,"z":140.3879852294922}', '{"x":-1911.007080078125,"y":2040.77734375,"z":140.73806762695313}', 'raisin', 'Raisin', '{"x":-1902.3668212890626,"y":2140.0869140625,"z":120.67676544189453}', 'vine', 'Bouteille de Vin', '{"x":-1930.809,"y":2054.538,"z":140.8135}', '[{"label":"4x4","model":"sadler"}]', '{"x":-158.90818786621095,"y":-53.82570648193359,"z":54.39616012573242}', 150),
	(7, 'gophone', 'GoPhone', 'society_gophone', '{"x":-556.5568237304688,"y":277.4522399902344,"z":94.04592895507813}', '{"x":-495.9717712402344,"y":276.9225769042969,"z":83.3038101196289}', '{"x":-506.74041748046877,"y":277.646484375,"z":83.29086303710938}', '{"x":-495.206298828125,"y":271.78668212890627,"z":83.19283294677735}', 'composant', 'Composant', '{"x":2706.5595703125,"y":2777.845458984375,"z":37.87804412841797}', 'gphone', 'gPhone', '{"x":1920.145751953125,"y":3739.538330078125,"z":32.62306213378906}', '[{"model":"sadler","label":"Sadler"}]', '{"x":152.04342651367188,"y":236.49830627441407,"z":106.81494903564453}', 87),
	(8, 'mine_dlcx', 'Mine DLCX', 'society_mine_dlcx', '{"x":2914.53125,"y":3037.606201171875,"z":223.20497131347657}', '{"x":2834.085693359375,"y":2787.976318359375,"z":57.73178482055664}', '{"x":2832.25537109375,"y":2795.07470703125,"z":57.52099609375}', '{"x":2820.281982421875,"y":2782.302978515625,"z":57.25564956665039}', 'pepitor', 'Pépite d\'or', '{"x":2944.48974609375,"y":2799.41162109375,"z":40.97936630249023}', 'lingotor', 'Lingot d\'or', '{"x":1088.6151123046876,"y":-2001.1939697265626,"z":30.87826156616211}', '[{"label":"Rubble","model":"rubble"}, {"label":"Bison","model":"bison"}]', '{"x":824.0140380859375,"y":-2996.754638671875,"z":6.02093601226806}', 87),
	(9, 'nvidia', 'Nvidia', 'society_nvidia', '{"x":-2021.2421875,"y":879.6565551757813,"z":232.83798217773438}', '{"x":-1992.66650390625,"y":601.3239135742188,"z":117.90328979492188}', '{"x":-1995.3228759765626,"y":590.7967529296875,"z":117.90339660644531}', '{"x":-1980.9700927734376,"y":600.20849609375,"z":118.3871841430664}', 'composant_rtx', 'Composant RTX', '{"x":587.4518,"y":3024.271,"z":41.68252}', 'rtx_4090', 'RTX 4090', '{"x":2717.356689453125,"y":1462.0445556640626,"z":24.5014591217041}', '[{"label":"Bison","model":"bison"}]', '{"x":307.6856384277344,"y":361.3896484375,"z":105.3493881225586}', 87);

-- Listage de la structure de la table exelity. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `societyType` int(11) NOT NULL DEFAULT 1,
  `canWashMoney` tinyint(1) NOT NULL DEFAULT 0,
  `canUseOffshore` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.jobs : ~82 rows (environ)
INSERT INTO `jobs` (`name`, `label`, `societyType`, `canWashMoney`, `canUseOffshore`) VALUES
	('83', '83', 2, 0, 1),
	('Douanier', 'douanier', 1, 0, 0),
	('ambulance', 'Ambulance', 1, 0, 0),
	('avocat', 'Avocat', 1, 0, 0),
	('aztecas', 'Aztecas', 2, 0, 1),
	('bahamas', 'Bahamas', 1, 0, 0),
	('ballas', 'Ballas', 2, 0, 1),
	('bcso', 'B.C.S.O', 1, 0, 0),
	('black_crew', 'Black Crew', 2, 0, 1),
	('bloods', 'Bloods', 2, 0, 1),
	('bmf', 'BMF', 2, 0, 1),
	('boatseller', 'Concessionnaire Bénéteau', 1, 1, 0),
	('boatshop', 'Concessionnaire Bateaux', 1, 1, 0),
	('boxe', 'Boxe', 1, 1, 0),
	('bratva', 'Bratva', 2, 0, 1),
	('british', 'British', 2, 0, 1),
	('burgershot', 'BurgerShot', 1, 1, 0),
	('cardealer', 'Concessionnaire', 1, 1, 0),
	('carshop', 'Concessionnaire Voitures', 1, 1, 0),
	('cartel_de_cali', 'Cartel de Cali', 2, 0, 1),
	('cartel_de_jalisco', 'Cartel de Jalisco', 2, 0, 1),
	('cartel_de_medellin', 'Cartel de Medellin', 2, 0, 1),
	('cartel_de_tijuana', 'Cartel de Tijuana', 2, 0, 1),
	('changretta', 'Changretta', 2, 0, 1),
	('chantier', 'Chantier', 1, 0, 0),
	('cosa_nostra', 'Cosa Nostra', 2, 0, 1),
	('delivery', 'Delivery', 1, 0, 0),
	('durex', 'Durex', 1, 0, 0),
	('el_eme', 'El eMe', 2, 0, 1),
	('families', 'Families', 2, 0, 1),
	('fib', 'FIB', 1, 0, 0),
	('fisherman', 'Pêcheur', 1, 0, 0),
	('fueler', 'Raffineur', 1, 0, 0),
	('gamer_planet', 'Gamer Planet', 2, 0, 1),
	('gfa', 'GFA', 2, 0, 1),
	('gophone', 'GoPhone', 1, 0, 0),
	('gouv', 'Gouvernement', 1, 0, 0),
	('gs9', 'GS9', 2, 0, 1),
	('h-block', 'H-Block', 2, 0, 1),
	('jardinier', 'Jardinier', 1, 0, 0),
	('journalist', 'Journaliste', 1, 1, 0),
	('justgod', 'JustGod', 2, 0, 1),
	('karting', 'Karting', 1, 0, 0),
	('la_camorra', 'La CaMoRRa', 2, 0, 1),
	('la_famille_brabus', 'La Famille Brabus', 2, 0, 1),
	('la_grinta', 'La Grinta', 2, 0, 1),
	('la_passione', 'La Passione', 2, 0, 0),
	('les_fast', 'Les Fast', 2, 0, 1),
	('lmf', 'LMF', 1, 0, 0),
	('los_zetas', 'Los Zetas', 2, 0, 1),
	('lumberjack', 'Bûcheron', 1, 0, 0),
	('madrazo', 'Madrazo', 2, 0, 1),
	('marabunta', 'Marabunta', 2, 0, 1),
	('mecano', 'Benny\'s', 1, 1, 0),
	('mecano2', 'Ls Custom', 1, 1, 0),
	('medicalcenter', 'MedicalCenter', 1, 0, 0),
	('mine_dlcx', 'Mine DLCX', 1, 0, 0),
	('miner', 'Mineur', 1, 0, 0),
	('ms13', 'MS13', 2, 0, 1),
	('nvidia', 'Nvidia', 1, 0, 0),
	('off-white', 'Off-White', 2, 0, 1),
	('planeseller', 'Concessionnaire aéronotique', 1, 1, 0),
	('planeshop', 'Concessionnaire Avions', 1, 1, 0),
	('police', 'Police', 1, 0, 0),
	('realestateagent', 'Agent immobilier', 1, 0, 0),
	('roxsherif', 'R.S.D', 1, 0, 0),
	('salva_nation', 'Salva Nation', 2, 0, 1),
	('scampia_familia', 'Scampia Familia', 2, 0, 1),
	('sinaloa', 'Sinaloa', 2, 0, 1),
	('slaughterer', 'Abateur', 1, 0, 0),
	('tacos', 'Tacos', 1, 0, 0),
	('tailor', 'Couturier', 1, 0, 0),
	('taxi', 'Taxi', 1, 1, 0),
	('the_lost_mc', 'The Lost Mc', 2, 0, 1),
	('the_white', 'The White', 2, 0, 1),
	('unemployed', 'Citoyen', 1, 0, 0),
	('unemployed2', 'Aucune', 2, 0, 0),
	('unicorn', 'Unicorn', 1, 1, 0),
	('vagos', 'Vagos', 2, 0, 1),
	('vigne', 'Vigneron', 1, 1, 0),
	('vigneron', 'Vigneron', 1, 1, 0),
	('white', 'White', 2, 0, 1);

-- Listage de la structure de la table exelity. job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1555 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.job_grades : ~389 rows (environ)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'ambulance', 0, 'ambulance', 'Ambulancier', 100, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":33,"pants_1":19,"blush_3":0,"torso_2":1,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":21,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":11,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":91,"chain_1":0,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":23,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":1,"sun_2":0,"blush_1":0,"shoes_1":4,"decals_1":65,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":105,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":0,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":257,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(2, 'ambulance', 1, 'doctor', 'Medecin', 100, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":33,"pants_1":19,"blush_3":0,"torso_2":1,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":21,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":11,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":91,"chain_1":0,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":51,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":7,"sun_2":0,"blush_1":0,"shoes_1":1,"decals_1":66,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":106,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":2,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":9,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(3, 'ambulance', 2, 'chief_doctor', 'Médecin-Chef', 100, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":33,"pants_1":19,"blush_3":0,"torso_2":1,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":21,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":11,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":91,"chain_1":0,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":50,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":2,"sun_2":0,"blush_1":0,"shoes_1":4,"decals_1":66,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":96,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":0,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":258,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(4, 'ambulance', 3, 'boss', 'Directeur', 100, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":33,"pants_1":19,"blush_3":0,"torso_2":1,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":21,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":11,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":91,"chain_1":0,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":51,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":2,"sun_2":0,"blush_1":0,"shoes_1":81,"decals_1":66,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":96,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":2,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":14,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(7, 'avocat', 0, 'recruit', 'Recrue', 350, '{"tshirt_1":57,"torso_1":55,"arms":0,"pants_1":35,"glasses":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":5,"face":19,"glasses_2":1,"torso_2":0,"shoes":24,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":8}', '{"tshirt_1":34,"torso_1":48,"shoes":24,"pants_1":34,"torso_2":0,"decals_2":0,"hair_color_2":0,"glasses":0,"helmet_2":0,"hair_2":3,"face":21,"decals_1":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"arms":14,"hair_color_1":10,"tshirt_2":0,"helmet_1":57}'),
	(8, 'avocat', 1, 'boss', 'Patron', 400, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":41,"torso_2":0,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"decals_1":8,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":21,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"hair_color_1":10,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"shoes":24,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(43, 'mecano', 0, 'recrue', 'Recrue', 300, '{}', '{}'),
	(44, 'mecano', 1, 'novice', 'Novice', 400, '{}', '{}'),
	(45, 'mecano', 2, 'experimente', 'Experimente', 550, '{}', '{}'),
	(46, 'mecano', 3, 'chief', 'Chef d\'equipe', 650, '{}', '{}'),
	(47, 'mecano', 4, 'boss', 'Patron', 700, '{}', '{}'),
	(50, 'police', 0, 'recruit', 'Cadet', 250, '{}', '{}'),
	(51, 'police', 1, 'officer', 'Officier', 500, '{}', '{}'),
	(52, 'police', 2, 'sergeant', 'Sergent', 750, '{}', '{}'),
	(53, 'police', 3, 'lieutenant', 'Lieutenant', 1000, '{}', '{}'),
	(54, 'police', 4, 'capitaine', 'Capitaine', 1250, '{}', '{}'),
	(55, 'police', 5, 'commander', 'Commander ', 1500, '{}', '{}'),
	(56, 'police', 6, 'deputy', 'Deputy chief', 1750, '{}', '{}'),
	(57, 'police', 7, 'assistantboss', 'Assistant Chief', 2000, '{}', '{}'),
	(58, 'police', 8, 'boss', 'Chief', 2250, '{}', '{}'),
	(66, 'taxi', 0, 'recrue', 'Recrue', 100, '{}', '{}'),
	(67, 'taxi', 1, 'novice', 'Novice', 100, '{}', '{}'),
	(68, 'taxi', 2, 'experimente', 'Experimente', 100, '{}', '{}'),
	(69, 'taxi', 3, 'uber', 'Uber', 100, '{}', '{}'),
	(70, 'taxi', 4, 'boss', 'Patron', 1, '{}', '{}'),
	(74, 'unemployed', 0, 'unemployed', 'RSA', 100, '{}', '{}'),
	(75, 'unicorn', 0, 'barman', 'Barman', 110, '{}', '{}'),
	(76, 'unicorn', 1, 'dancer', 'Videur', 110, '{}', '{}'),
	(77, 'unicorn', 2, 'viceboss', 'Co-gérant', 1, '{}', '{}'),
	(78, 'unicorn', 3, 'boss', 'Gérant', 1, '{}', '{}'),
	(79, 'vigne', 0, 'recrue', 'Recrue', 100, '{"tshirt_1":59,"tshirt_2":0,"torso_1":12,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(80, 'vigne', 1, 'novice', 'Novice', 100, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(81, 'vigne', 2, 'cdisenior', 'Chef de Chai', 100, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(82, 'vigne', 3, 'boss', 'Patron', 100, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(90, 'burgershot', 0, 'recrue', 'Recrue', 1, '{}', '{}'),
	(91, 'burgershot', 1, 'novice', 'Novice', 1, '{}', '{}'),
	(92, 'burgershot', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
	(93, 'burgershot', 3, 'chief', 'Chef d\'équipe', 1, '{}', '{}'),
	(94, 'burgershot', 4, 'boss', 'Patron', 5000, '{}', '{}'),
	(148, 'realestateagent', 0, 'location', 'Location', 250, '{}', '{}'),
	(149, 'realestateagent', 1, 'vendeur', 'Vendeur', 350, '{}', '{}'),
	(150, 'realestateagent', 2, 'gestion', 'Gestion', 450, '{}', '{}'),
	(151, 'realestateagent', 3, 'boss', 'Patron', 100, '{}', '{}'),
	(157, 'unemployed2', 0, 'unemployed2', 'Citoyen', 0, '{}', '{}'),
	(182, 'journalist', 0, 'stagiaire', 'Stagiaire', 250, '{}', '{}'),
	(183, 'journalist', 1, 'reporter', 'Reporter', 200, '{}', '{}'),
	(184, 'journalist', 2, 'investigator', 'Investigateur', 200, '{}', '{}'),
	(185, 'journalist', 3, 'boss', 'Directeur', 200, '{}', '{}'),
	(462, 'carshop', 0, 'novice', 'Novice', 750, '{}', '{}'),
	(463, 'carshop', 1, 'sergeant', 'Intermediaire', 100, '{}', '{}'),
	(464, 'carshop', 2, 'experienced', 'Experimente', 100, '{}', '{}'),
	(465, 'carshop', 3, 'boss', 'Patron', 1, '{}', '{}'),
	(466, 'planeshop', 3, 'boss', 'Patron', 200, '{}', '{}'),
	(467, 'planeshop', 2, 'experienced', 'Experimente', 200, '{}', '{}'),
	(468, 'planeshop', 1, 'sergeant', 'Intermediaire', 200, '{}', '{}'),
	(469, 'planeshop', 0, 'novice', 'Novice', 200, '{}', '{}'),
	(470, 'boatshop', 3, 'boss', 'Patron', 200, '{}', '{}'),
	(471, 'boatshop', 2, 'experienced', 'Experimente', 200, '{}', '{}'),
	(472, 'boatshop', 1, 'sergeant', 'Intermediaire', 100, '{}', '{}'),
	(473, 'boatshop', 0, 'novice', 'Novice', 100, '{}', '{}'),
	(535, 'Douanier', 0, 'rookie', 'Associé', 0, '{}', '{}'),
	(536, 'Douanier', 1, 'member', 'Soldat', 0, '{}', '{}'),
	(537, 'Douanier', 2, 'elite', 'Elite', 0, '{}', '{}'),
	(538, 'Douanier', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
	(539, 'Douanier', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
	(540, 'Douanier', 5, 'boss', 'Patron', 0, '{}', '{}'),
	(551, 'cardealer', 0, 'recruit', 'Recrue', 400, '{}', '{}'),
	(552, 'cardealer', 1, 'novice', 'Novice', 500, '{}', '{}'),
	(553, 'cardealer', 2, 'experienced', 'Experimente', 800, '{}', '{}'),
	(554, 'cardealer', 3, 'boss', 'Patron', 1000, '{}', '{}'),
	(568, 'karting', 0, 'recrue', 'Employé', 12, '{}', '{}'),
	(569, 'karting', 1, 'boss', 'Patron', 24, '{}', '{}'),
	(612, 'delivery', 0, 'delivery', 'Delivery', 500, '{}', '{}'),
	(617, 'boatseller', 0, 'recruit', 'Recrue', 100, '{}', '{}'),
	(618, 'boatseller', 1, 'novice', 'Novice', 100, '{}', '{}'),
	(619, 'boatseller', 2, 'experienced', 'Experimente', 100, '{}', '{}'),
	(620, 'boatseller', 3, 'boss', 'Patron', 100, '{}', '{}'),
	(621, 'planeseller', 0, 'recruit', 'Recrue', 250, '{}', '{}'),
	(622, 'planeseller', 1, 'novice', 'Novice', 350, '{}', '{}'),
	(623, 'planeseller', 2, 'experienced', 'Experimente', 500, '{}', '{}'),
	(624, 'planeseller', 3, 'boss', 'Patron', 1000, '{}', '{}'),
	(625, 'slaughterer', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(626, 'lumberjack', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(627, 'tailor', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(628, 'miner', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(629, 'fisherman', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(630, 'fueler', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(699, 'la_passione', 1, 'soldat', 'Soldat', 0, '{}', '{}'),
	(700, 'la_passione', 4, 'conseiller', 'Conseiller', 0, '{}', '{}'),
	(701, 'la_passione', 3, 'capo', 'Capo', 0, '{}', '{}'),
	(702, 'la_passione', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(703, 'la_passione', 5, 'boss', 'Boss', 0, '{}', '{}'),
	(704, 'la_passione', 2, 'sous_capo', 'Sous Capo', 0, '{}', '{}'),
	(705, 'lmf', 4, 'bras_droit', 'Bras Droit', 0, '{}', '{}'),
	(706, 'lmf', 2, 'elite', 'Elite', 0, '{}', '{}'),
	(707, 'lmf', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
	(708, 'lmf', 5, 'boss', 'Patron', 0, '{}', '{}'),
	(709, 'lmf', 0, 'petit', 'Petit', 0, '{}', '{}'),
	(710, 'lmf', 1, 'soldat', 'Soldat', 0, '{}', '{}'),
	(801, 'tacos', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
	(802, 'jardinier', 0, 'recrue', 'Recrue', 12, '{}', '{}'),
	(825, 'durex', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(826, 'durex', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(827, 'durex', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
	(828, 'durex', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(865, 'vigneron', 0, 'recrue', 'Recrue', 1, '{}', '{}'),
	(866, 'vigneron', 1, 'novice', 'Novice', 1, '{}', '{}'),
	(867, 'vigneron', 2, 'experimente', 'Experimente', 1, '{}', '{}'),
	(868, 'vigneron', 3, 'boss', 'Patron', 1, '{}', '{}'),
	(869, 'medicalcenter', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(870, 'medicalcenter', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(871, 'medicalcenter', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
	(872, 'medicalcenter', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(873, 'gouv', 0, 'chauffeur_prive', 'Chauffeur privé', 100, '{}', '{}'),
	(874, 'gouv', 1, 'avocat', 'Avocat', 100, '{}', '{}'),
	(875, 'gouv', 2, 'juge', 'Juge', 100, '{}', '{}'),
	(876, 'gouv', 3, 'garde_du_corps', 'Garde du corps', 100, '{}', '{}'),
	(877, 'gouv', 4, 'garde_corps_rap', 'Garde du corps rapprocher', 100, '{}', '{}'),
	(878, 'gouv', 5, 'chef_section', 'Chef de section', 100, '{}', '{}'),
	(879, 'gouv', 6, 'secrétaire', 'Secrétaire', 100, '{}', '{}'),
	(880, 'gouv', 7, 'vice_gouverneur', 'Vice gouverneur', 100, '{}', '{}'),
	(881, 'gouv', 8, 'boss', 'Gouverneur', 100, '{}', '{}'),
	(900, 'mecano2', 0, 'recrue', 'Recrue', 100, '{}', '{}'),
	(901, 'mecano2', 1, 'novice', 'Novice', 100, '{}', '{}'),
	(902, 'mecano2', 2, 'experimente', 'Experimente', 100, '{}', '{}'),
	(903, 'mecano2', 3, 'chief', 'Chef d\'equipe', 100, '{}', '{}'),
	(904, 'mecano2', 4, 'boss', 'Patron', 1000, '{}', '{}'),
	(924, 'bcso', 0, 'recruit', 'Cadet', 400, '{}', '{}'),
	(925, 'bcso', 1, 'deputytwo', 'Deputy 2', 1000, '{}', '{}'),
	(926, 'bcso', 2, 'deputyone', 'Deputy 1', 600, '{}', '{}'),
	(927, 'bcso', 3, 'senior', 'Senior Deputy', 1200, '{}', '{}'),
	(928, 'bcso', 4, 'sergent', 'Sergent', 1600, '{}', '{}'),
	(929, 'bcso', 5, 'lieutenant', 'Lieutenant', 1800, '{}', '{}'),
	(930, 'bcso', 6, 'major', 'Major', 2000, '{}', '{}'),
	(931, 'bcso', 7, 'adjoint', 'Sheriff Adjoint', 2400, '{}', '{}'),
	(932, 'bcso', 8, 'boss', 'Sheriff', 4000, '{}', '{}'),
	(1039, 'justgod', 3, 'presque_parfait', 'Presque Parfait', 1, '[]', '[]'),
	(1040, 'justgod', 2, 'pas_ouf', 'Pas ouf', 1, '[]', '[]'),
	(1041, 'justgod', 1, 'bas_de_gamme', 'Bas de gamme', 1, '[]', '[]'),
	(1042, 'justgod', 4, 'boss', 'Patron', 0, '[]', '[]'),
	(1043, 'la_grinta', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1044, 'la_grinta', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1045, 'la_grinta', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1046, 'la_grinta', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1047, 'la_grinta', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1048, 'la_grinta', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1091, 'gophone', 0, 'recrue', 'Recrue', 100, '{}', '{}'),
	(1092, 'gophone', 1, 'novice', 'Novice', 100, '{}', '{}'),
	(1093, 'gophone', 2, 'experimente', 'Experimente', 100, '{}', '{}'),
	(1094, 'gophone', 3, 'boss', 'Patron', 100, '{}', '{}'),
	(1095, 'les_fast', 4, 'elite', 'Elite', 1, '[]', '[]'),
	(1096, 'les_fast', 5, 'le_second', 'Le second', 1, '[]', '[]'),
	(1097, 'les_fast', 3, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1098, 'les_fast', 6, 'boss', 'Patron', 100, '[]', '[]'),
	(1099, 'les_fast', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1100, 'les_fast', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1101, 'gamer_planet', 4, 'boss', 'Patron', 0, '[]', '[]'),
	(1102, 'gamer_planet', 2, 'planet', 'Planet', 1, '[]', '[]'),
	(1103, 'gamer_planet', 3, 'le_bg', 'Le BG', 1, '[]', '[]'),
	(1104, 'gamer_planet', 1, 'gamer', 'Gamer', 1, '[]', '[]'),
	(1105, 'la_famille_brabus', 3, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1106, 'la_famille_brabus', 4, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1107, 'la_famille_brabus', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1108, 'la_famille_brabus', 5, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1109, 'la_famille_brabus', 2, 'petite_frappe', 'Petite Frappe', 1, '[]', '[]'),
	(1110, 'la_famille_brabus', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1111, 'mine_dlcx', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1112, 'mine_dlcx', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(1113, 'mine_dlcx', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
	(1114, 'mine_dlcx', 3, 'boss', 'Patron', 500, '{}', '{}'),
	(1133, 'british', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1134, 'british', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1135, 'british', 3, 'référent_soldat', 'Référent Soldat', 1, '[]', '[]'),
	(1136, 'british', 4, 'référent', 'Référent', 1, '[]', '[]'),
	(1137, 'british', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1138, 'british', 5, 'sous_lead', 'Sous Lead', 1, '[]', '[]'),
	(1139, 'gs9', 2, 'gangsta', 'Gangsta', 1, '[]', '[]'),
	(1140, 'gs9', 1, 'young', 'Young', 1, '[]', '[]'),
	(1141, 'gs9', 4, 'outlaw', 'Outlaw', 1, '[]', '[]'),
	(1142, 'gs9', 5, 'leader', 'Leader', 1, '[]', '[]'),
	(1143, 'gs9', 3, 'meneur', 'Meneur', 1, '[]', '[]'),
	(1144, 'gs9', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1151, 'fib', 0, 'recruit', 'Consultant Fédéral', 200, '{}', '{}'),
	(1152, 'fib', 1, 'officer', 'Agent Aspirant', 300, '{}', '{}'),
	(1153, 'fib', 2, 'sergeant', 'Agent Fédéral', 400, '{}', '{}'),
	(1154, 'fib', 3, 'sergeant_chief', 'Agent Spécial', 500, '{}', '{}'),
	(1155, 'fib', 4, 'intendent', 'Agent Spécial Superviseur', 600, '{}', '{}'),
	(1156, 'fib', 5, 'lieutenant', 'Agent Spécial en Charge', 700, '{}', '{}'),
	(1157, 'fib', 6, 'chef', 'Agent Spécial de Coordination', 800, '{}', '{}'),
	(1158, 'fib', 7, 'boss', 'Directeur d\'Agence', 999, '{}', '{}'),
	(1159, 'off-white', 3, 'capo', 'Capo', 1, '[]', '[]'),
	(1160, 'off-white', 4, 'conseiller', 'Conseiller', 1, '[]', '[]'),
	(1161, 'off-white', 5, 'sous-chef', 'Sous-Chef', 1, '[]', '[]'),
	(1162, 'off-white', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1163, 'off-white', 1, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1164, 'off-white', 2, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1177, 'nvidia', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1178, 'nvidia', 1, 'novice', 'Novice', 0, '{}', '{}'),
	(1179, 'nvidia', 2, 'experimente', 'Experimente', 0, '{}', '{}'),
	(1180, 'nvidia', 3, 'boss', 'Patron', 1, '{}', '{}'),
	(1200, 'changretta', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1201, 'changretta', 4, 'capitado', 'Capitado', 1, '[]', '[]'),
	(1202, 'changretta', 1, 'servitado', 'Servitado', 1, '[]', '[]'),
	(1203, 'changretta', 6, 'boss', 'Patron', 11, '[]', '[]'),
	(1204, 'changretta', 3, 'famillia', 'Famillia', 1, '[]', '[]'),
	(1205, 'changretta', 5, 'secondo', 'Secondo', 1, '[]', '[]'),
	(1206, 'the_white', 4, 'hustler', 'Hustler', 1, '[]', '[]'),
	(1207, 'the_white', 5, 'acolyte', 'Acolyte', 1, '[]', '[]'),
	(1208, 'the_white', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1209, 'the_white', 2, 'associé', 'Associé', 1, '[]', '[]'),
	(1210, 'the_white', 3, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1211, 'the_white', 1, 'habitant', 'Habitant', 1, '[]', '[]'),
	(1223, 'bmf', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1224, 'bmf', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1225, 'bmf', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1226, 'bmf', 1, 'associé', 'Associé', 2, '[]', '[]'),
	(1227, 'bmf', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1228, 'bmf', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1235, 'families', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1236, 'families', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1237, 'families', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1238, 'families', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1239, 'families', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1240, 'families', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1241, 'marabunta', 6, 'boss', 'Patron', 9999, '[]', '[]'),
	(1242, 'marabunta', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1243, 'marabunta', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1244, 'marabunta', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1245, 'marabunta', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1246, 'marabunta', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1247, 'bloods', 5, 'bras_droit', 'Bras Droit', 5000, '[]', '[]'),
	(1248, 'bloods', 6, 'boss', 'Patron', 9999, '[]', '[]'),
	(1249, 'bloods', 1, 'associé', 'Associé', 100, '[]', '[]'),
	(1250, 'bloods', 3, 'elite', 'Elite', 300, '[]', '[]'),
	(1251, 'bloods', 4, 'lieutenant', 'Lieutenant', 5000, '[]', '[]'),
	(1252, 'bloods', 2, 'soldat', 'Soldat', 200, '[]', '[]'),
	(1253, 'cosa_nostra', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1254, 'cosa_nostra', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1255, 'cosa_nostra', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1256, 'cosa_nostra', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1257, 'cosa_nostra', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1258, 'cosa_nostra', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1259, 'madrazo', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1260, 'madrazo', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1261, 'madrazo', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1262, 'madrazo', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1263, 'madrazo', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1264, 'madrazo', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1265, 'cartel_de_medellin', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1266, 'cartel_de_medellin', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1267, 'cartel_de_medellin', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1268, 'cartel_de_medellin', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1269, 'cartel_de_medellin', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1270, 'cartel_de_medellin', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1277, 'vagos', 4, 'lieutenant', 'Lieutenant', 1000, '[]', '[]'),
	(1278, 'vagos', 6, 'boss', 'Patron', 9000, '[]', '[]'),
	(1279, 'vagos', 5, 'bras_droit', 'Bras Droit', 1000, '[]', '[]'),
	(1280, 'vagos', 3, 'elite', 'Elite', 1000, '[]', '[]'),
	(1281, 'vagos', 2, 'soldat', 'Soldat', 1000, '[]', '[]'),
	(1282, 'vagos', 1, 'associé', 'Associé', 1000, '[]', '[]'),
	(1289, 'the_lost_mc', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1290, 'the_lost_mc', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1291, 'the_lost_mc', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1292, 'the_lost_mc', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1293, 'the_lost_mc', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1294, 'the_lost_mc', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1313, 'ms13', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1314, 'ms13', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1315, 'ms13', 4, 'capitaine', 'Capitaine', 1, '[]', '[]'),
	(1316, 'ms13', 3, 'adjudant', 'Adjudant', 1, '[]', '[]'),
	(1317, 'ms13', 2, 'caporal', 'Caporal', 1, '[]', '[]'),
	(1318, 'ms13', 5, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1331, 'el_eme', 3, 'capitan', 'Capitan', 1, '[]', '[]'),
	(1332, 'el_eme', 1, 'soldado', 'Soldado', 1, '[]', '[]'),
	(1333, 'el_eme', 2, 'teniente', 'Teniente', 1, '[]', '[]'),
	(1334, 'el_eme', 5, 'brazo_derecho', 'Brazo derecho', 1, '[]', '[]'),
	(1335, 'el_eme', 4, 'asesino', 'Asesino', 1, '[]', '[]'),
	(1336, 'el_eme', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1337, 'scampia_familia', 5, 'second', 'Second', 800, '[]', '[]'),
	(1338, 'scampia_familia', 4, 'bras_droit', 'Bras Droit', 700, '[]', '[]'),
	(1339, 'scampia_familia', 2, 'validé', 'Validé', 250, '[]', '[]'),
	(1340, 'scampia_familia', 1, 'minots', 'Minots', 100, '[]', '[]'),
	(1341, 'scampia_familia', 6, 'boss', 'Patron', 9999, '[]', '[]'),
	(1342, 'scampia_familia', 3, 'gros_bras', 'Gros Bras', 500, '[]', '[]'),
	(1349, 'ballas', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1350, 'ballas', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1351, 'ballas', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1352, 'ballas', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1353, 'ballas', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1354, 'ballas', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1373, 'aztecas', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1374, 'aztecas', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1375, 'aztecas', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1376, 'aztecas', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1377, 'aztecas', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1378, 'aztecas', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1391, 'h-block', 6, 'boss', 'Patron', 5000, '[]', '[]'),
	(1392, 'h-block', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1393, 'h-block', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1394, 'h-block', 3, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1395, 'h-block', 4, 'elite', 'Elite', 1, '[]', '[]'),
	(1396, 'h-block', 2, 'patriote', 'Patriote', 1, '[]', '[]'),
	(1427, 'la_camorra', 2, '2ème_classe', '2ème classe', 1, '[]', '[]'),
	(1428, 'la_camorra', 3, 'capitaine', 'Capitaine', 1, '[]', '[]'),
	(1429, 'la_camorra', 4, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1430, 'la_camorra', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1431, 'la_camorra', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1432, 'la_camorra', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1445, 'los_zetas', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1446, 'los_zetas', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1447, 'los_zetas', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1448, 'los_zetas', 1, 'associé', 'Associé', 1, '[]', '[]'),
	(1449, 'los_zetas', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1450, 'los_zetas', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1456, 'gfa', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1457, 'gfa', 3, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1458, 'gfa', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1459, 'gfa', 1, 'servant', 'Servant', 1, '[]', '[]'),
	(1460, 'gfa', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1461, 'gfa', 4, 'militant', 'Militant', 1, '[]', '[]'),
	(1468, 'sinaloa', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1469, 'sinaloa', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1470, 'sinaloa', 4, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1471, 'sinaloa', 3, 'gerant', 'Gerant', 1, '[]', '[]'),
	(1472, 'sinaloa', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1473, 'sinaloa', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1474, 'salva_nation', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1475, 'salva_nation', 5, 'secondo', 'Secondo', 1, '[]', '[]'),
	(1476, 'salva_nation', 4, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1477, 'salva_nation', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1478, 'salva_nation', 3, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1479, 'salva_nation', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1480, 'cartel_de_cali', 4, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1481, 'cartel_de_cali', 3, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1482, 'cartel_de_cali', 2, 'elite', 'Elite', 1, '[]', '[]'),
	(1483, 'cartel_de_cali', 1, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1484, 'cartel_de_cali', 5, 'second', 'Second', 1, '[]', '[]'),
	(1485, 'cartel_de_cali', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1492, 'cartel_de_jalisco', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1493, 'cartel_de_jalisco', 4, 'gérant', 'Gérant', 1, '[]', '[]'),
	(1494, 'cartel_de_jalisco', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1495, 'cartel_de_jalisco', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1496, 'cartel_de_jalisco', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1497, 'cartel_de_jalisco', 2, 'sierra', 'Sierra', 1, '[]', '[]'),
	(1504, 'bratva', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1505, 'bratva', 4, 'capo', 'Capo', 1, '[]', '[]'),
	(1506, 'bratva', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1507, 'bratva', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1508, 'bratva', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1509, 'bratva', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1516, 'black_crew', 6, 'boss', 'Patron', 150, '[]', '[]'),
	(1517, 'black_crew', 3, 'chef_unité', 'Chef Unité', 1, '[]', '[]'),
	(1518, 'black_crew', 2, 'haut_gradé', 'Haut Gradé', 1, '[]', '[]'),
	(1519, 'black_crew', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1520, 'black_crew', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1521, 'black_crew', 4, 'conseiller_chef', 'Conseiller Chef', 1, '[]', '[]'),
	(1522, 'white', 1, 'petite_frappe', 'Petite Frappe', 1, '[]', '[]'),
	(1523, 'white', 4, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1524, 'white', 3, 'elite', 'Elite', 1, '[]', '[]'),
	(1525, 'white', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1526, 'white', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1527, 'white', 5, 'second', 'Second', 1, '[]', '[]'),
	(1528, 'cartel_de_tijuana', 2, 'soldat', 'Soldat', 1, '[]', '[]'),
	(1529, 'cartel_de_tijuana', 6, 'boss', 'Patron', 1, '[]', '[]'),
	(1530, 'cartel_de_tijuana', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1531, 'cartel_de_tijuana', 3, 'lieutenant', 'Lieutenant', 1, '[]', '[]'),
	(1532, 'cartel_de_tijuana', 4, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1533, 'cartel_de_tijuana', 1, 'recrue', 'Recrue', 1, '[]', '[]'),
	(1534, 'boxe', 0, 'organisateur_combat', 'Organisateur Combat', 1, '[]', '[]'),
	(1535, '83', 3, 'dealer', 'Dealer', 1, '[]', '[]'),
	(1536, '83', 2, 'homme_de_main', 'Homme de main', 1, '[]', '[]'),
	(1537, '83', 5, 'bras_droit', 'Bras Droit', 1, '[]', '[]'),
	(1538, '83', 1, 'petits', 'Petits', 1, '[]', '[]'),
	(1539, '83', 6, 'boss', 'Patron', 0, '[]', '[]'),
	(1540, '83', 4, 'commandant', 'Commandant', 1, '[]', '[]'),
	(1541, 'chantier', 0, 'recrue', 'Ouvrier', 12, '{}', '{}'),
	(1542, 'roxsherif', 0, 'recruit', 'Cadet', 800, '{}', '{}'),
	(1543, 'roxsherif', 1, 'deputytwo', 'Deputy 2', 1150, '{}', '{}'),
	(1544, 'roxsherif', 2, 'deputyone', 'Deputy 1', 1000, '{}', '{}'),
	(1545, 'roxsherif', 3, 'senior', 'Senior Deputy', 1300, '{}', '{}'),
	(1546, 'roxsherif', 4, 'sergent', 'Sergent', 1500, '{}', '{}'),
	(1547, 'roxsherif', 5, 'lieutenant', 'Lieutenant', 1700, '{}', '{}'),
	(1548, 'roxsherif', 6, 'major', 'Major', 2000, '{}', '{}'),
	(1549, 'roxsherif', 7, 'adjoint', 'Sheriff Adjoint', 2400, '{}', '{}'),
	(1550, 'roxsherif', 8, 'boss', 'Sheriff', 3500, '{}', '{}'),
	(1551, 'bahamas', 0, 'barman', 'Barman', 100, '{}', '{}'),
	(1552, 'bahamas', 1, 'videur', 'Videur', 100, '{}', '{}'),
	(1553, 'bahamas', 2, 'dj', 'DJ', 100, '{}', '{}'),
	(1554, 'bahamas', 3, 'boss', 'Gérant', 100, '{}', '{}');

-- Listage de la structure de la table exelity. licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.licenses : ~8 rows (environ)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('avion', 'Avion License'),
	('boat', 'Boat License'),
	('dmv', 'Code de la route'),
	('drive', 'Permis de conduire'),
	('drive_bike', 'Permis moto'),
	('drive_truck', 'Permis Camion'),
	('helico', 'Helicoptere License'),
	('weapon', 'Permis port d\'armes');

-- Listage de la structure de la table exelity. open_car
CREATE TABLE IF NOT EXISTS `open_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `plate` varchar(11) DEFAULT NULL,
  `NB` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_open_car_owner` (`owner`) USING BTREE,
  KEY `index_open_car_owner_plate` (`owner`,`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.open_car : ~0 rows (environ)

-- Listage de la structure de la table exelity. owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.owned_properties : ~0 rows (environ)

-- Listage de la structure de la table exelity. owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(50) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `boutique` tinyint(1) DEFAULT 0,
  `selling` tinyint(1) DEFAULT 0,
  `carseller` int(11) DEFAULT 0,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.owned_vehicles : ~0 rows (environ)

-- Listage de la structure de la table exelity. pdrugs
CREATE TABLE IF NOT EXISTS `pdrugs` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `palier` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.pdrugs : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_backups
CREATE TABLE IF NOT EXISTS `phone_backups` (
  `identifier` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_backups : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_clock_alarms
CREATE TABLE IF NOT EXISTS `phone_clock_alarms` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_clock_alarms : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_crypto
CREATE TABLE IF NOT EXISTS `phone_crypto` (
  `identifier` varchar(100) NOT NULL,
  `coin` varchar(15) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invested` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`,`coin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_crypto : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_darkchat_accounts
CREATE TABLE IF NOT EXISTS `phone_darkchat_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_darkchat_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_darkchat_channels
CREATE TABLE IF NOT EXISTS `phone_darkchat_channels` (
  `name` varchar(50) NOT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_darkchat_channels : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_darkchat_members
CREATE TABLE IF NOT EXISTS `phone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`channel_name`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_darkchat_members : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_darkchat_messages
CREATE TABLE IF NOT EXISTS `phone_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_darkchat_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_accounts
CREATE TABLE IF NOT EXISTS `phone_instagram_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_comments
CREATE TABLE IF NOT EXISTS `phone_instagram_comments` (
  `id` varchar(50) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_comments : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_follows
CREATE TABLE IF NOT EXISTS `phone_instagram_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_follows : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_likes
CREATE TABLE IF NOT EXISTS `phone_instagram_likes` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_likes : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_loggedin
CREATE TABLE IF NOT EXISTS `phone_instagram_loggedin` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_loggedin : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_messages
CREATE TABLE IF NOT EXISTS `phone_instagram_messages` (
  `id` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_notifications
CREATE TABLE IF NOT EXISTS `phone_instagram_notifications` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_notifications : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_posts
CREATE TABLE IF NOT EXISTS `phone_instagram_posts` (
  `id` varchar(50) NOT NULL,
  `media` text DEFAULT NULL,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_posts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_stories
CREATE TABLE IF NOT EXISTS `phone_instagram_stories` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `phone_instagram_stories_ibfk_1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_stories : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_instagram_stories_views
CREATE TABLE IF NOT EXISTS `phone_instagram_stories_views` (
  `story_id` varchar(50) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`story_id`,`viewer`),
  CONSTRAINT `phone_instagram_stories_views_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `phone_instagram_stories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_instagram_stories_views : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_last_phone
CREATE TABLE IF NOT EXISTS `phone_last_phone` (
  `identifier` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_last_phone : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_mail_accounts
CREATE TABLE IF NOT EXISTS `phone_mail_accounts` (
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_mail_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_mail_loggedin
CREATE TABLE IF NOT EXISTS `phone_mail_loggedin` (
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`address`,`phone_number`),
  CONSTRAINT `phone_mail_loggedin_ibfk_1` FOREIGN KEY (`address`) REFERENCES `phone_mail_accounts` (`address`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_mail_loggedin : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_mail_messages
CREATE TABLE IF NOT EXISTS `phone_mail_messages` (
  `id` varchar(50) NOT NULL,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_mail_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_maps_locations
CREATE TABLE IF NOT EXISTS `phone_maps_locations` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_maps_locations : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_marketplace_posts
CREATE TABLE IF NOT EXISTS `phone_marketplace_posts` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_marketplace_posts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_message_channels
CREATE TABLE IF NOT EXISTS `phone_message_channels` (
  `channel_id` varchar(50) NOT NULL,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `last_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_message_channels : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_message_members
CREATE TABLE IF NOT EXISTS `phone_message_members` (
  `channel_id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_message_members : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_message_messages
CREATE TABLE IF NOT EXISTS `phone_message_messages` (
  `id` varchar(50) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_message_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_message_unread
CREATE TABLE IF NOT EXISTS `phone_message_unread` (
  `channel_id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `unread` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_message_unread : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_music_playlists
CREATE TABLE IF NOT EXISTS `phone_music_playlists` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cover` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_music_playlists : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_music_saved_playlists
CREATE TABLE IF NOT EXISTS `phone_music_saved_playlists` (
  `playlist_id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`playlist_id`,`phone_number`),
  CONSTRAINT `phone_music_saved_playlists_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_music_saved_playlists : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_music_songs
CREATE TABLE IF NOT EXISTS `phone_music_songs` (
  `song_id` varchar(100) NOT NULL,
  `playlist_id` varchar(50) NOT NULL,
  PRIMARY KEY (`song_id`,`playlist_id`),
  KEY `playlist_id` (`playlist_id`),
  CONSTRAINT `phone_music_songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_music_songs : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_notes
CREATE TABLE IF NOT EXISTS `phone_notes` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_notes : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_notifications
CREATE TABLE IF NOT EXISTS `phone_notifications` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `show_avatar` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_notifications : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_phones
CREATE TABLE IF NOT EXISTS `phone_phones` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_phones : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_phone_blocked_numbers
CREATE TABLE IF NOT EXISTS `phone_phone_blocked_numbers` (
  `phone_number` varchar(15) NOT NULL,
  `blocked_number` varchar(15) NOT NULL,
  PRIMARY KEY (`phone_number`,`blocked_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_phone_blocked_numbers : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_phone_calls
CREATE TABLE IF NOT EXISTS `phone_phone_calls` (
  `id` varchar(50) NOT NULL,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `answered` tinyint(1) DEFAULT 0,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_phone_calls : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_phone_contacts
CREATE TABLE IF NOT EXISTS `phone_phone_contacts` (
  `contact_phone_number` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `profile_image` varchar(200) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`contact_phone_number`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_phone_contacts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_photos
CREATE TABLE IF NOT EXISTS `phone_photos` (
  `phone_number` varchar(15) NOT NULL,
  `link` varchar(200) NOT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`phone_number`,`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_photos : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_services_channels
CREATE TABLE IF NOT EXISTS `phone_services_channels` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `company` varchar(50) NOT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_services_channels : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_services_messages
CREATE TABLE IF NOT EXISTS `phone_services_messages` (
  `id` varchar(50) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `phone_services_messages_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `phone_services_channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_services_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_tinder_accounts
CREATE TABLE IF NOT EXISTS `phone_tinder_accounts` (
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `photos` text DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `interested_men` tinyint(1) NOT NULL,
  `interested_women` tinyint(1) NOT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_tinder_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_tinder_matches
CREATE TABLE IF NOT EXISTS `phone_tinder_matches` (
  `phone_number_1` varchar(15) NOT NULL,
  `phone_number_2` varchar(15) NOT NULL,
  `latest_message` varchar(1000) DEFAULT NULL,
  `latest_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phone_number_1`,`phone_number_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_tinder_matches : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_tinder_messages
CREATE TABLE IF NOT EXISTS `phone_tinder_messages` (
  `id` varchar(50) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `recipient` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_tinder_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_tinder_swipes
CREATE TABLE IF NOT EXISTS `phone_tinder_swipes` (
  `swiper` varchar(15) NOT NULL,
  `swipee` varchar(15) NOT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`swiper`,`swipee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_tinder_swipes : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_accounts
CREATE TABLE IF NOT EXISTS `phone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  `profile_header` varchar(200) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_follows
CREATE TABLE IF NOT EXISTS `phone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`followed`,`follower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_follows : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_hashtags
CREATE TABLE IF NOT EXISTS `phone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_hashtags : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_likes
CREATE TABLE IF NOT EXISTS `phone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_likes : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_loggedin
CREATE TABLE IF NOT EXISTS `phone_twitter_loggedin` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_loggedin : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_messages
CREATE TABLE IF NOT EXISTS `phone_twitter_messages` (
  `id` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_notifications
CREATE TABLE IF NOT EXISTS `phone_twitter_notifications` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `tweet_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_notifications : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_promoted
CREATE TABLE IF NOT EXISTS `phone_twitter_promoted` (
  `tweet_id` varchar(50) NOT NULL,
  `promotions` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tweet_id`),
  CONSTRAINT `phone_twitter_promoted_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `phone_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_promoted : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_retweets
CREATE TABLE IF NOT EXISTS `phone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_retweets : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_twitter_tweets
CREATE TABLE IF NOT EXISTS `phone_twitter_tweets` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_twitter_tweets : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_wallet_transactions
CREATE TABLE IF NOT EXISTS `phone_wallet_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_wallet_transactions : ~0 rows (environ)

-- Listage de la structure de la table exelity. phone_yellow_pages_posts
CREATE TABLE IF NOT EXISTS `phone_yellow_pages_posts` (
  `id` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.phone_yellow_pages_posts : ~0 rows (environ)

-- Listage de la structure de la table exelity. plaintes
CREATE TABLE IF NOT EXISTS `plaintes` (
  `identifier` varchar(50) NOT NULL DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Num` varchar(50) DEFAULT '',
  `Prenom1` varchar(50) DEFAULT '',
  `Nom1` varchar(50) DEFAULT '',
  `Num1` varchar(50) DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.plaintes : ~0 rows (environ)

-- Listage de la structure de la table exelity. plaintes2
CREATE TABLE IF NOT EXISTS `plaintes2` (
  `identifier` varchar(50) NOT NULL DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Num` varchar(50) DEFAULT '',
  `Prenom1` varchar(50) DEFAULT '',
  `Nom1` varchar(50) DEFAULT '',
  `Num1` varchar(50) DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.plaintes2 : ~0 rows (environ)

-- Listage de la structure de la table exelity. plaintes3
CREATE TABLE IF NOT EXISTS `plaintes3` (
  `identifier` varchar(50) NOT NULL DEFAULT '''''',
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Num` varchar(50) DEFAULT '',
  `Prenom1` varchar(50) DEFAULT '',
  `Nom1` varchar(50) DEFAULT '',
  `Num1` varchar(50) DEFAULT '',
  `raison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `auteur` varchar(50) DEFAULT '',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.plaintes3 : ~0 rows (environ)

-- Listage de la structure de la table exelity. playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `identifier` varchar(50) NOT NULL,
  `tattoos` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.playerstattoos : ~0 rows (environ)

-- Listage de la structure de la table exelity. player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  `isBlocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.player_contacts : ~0 rows (environ)

-- Listage de la structure de la table exelity. player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.player_gallery : ~0 rows (environ)

-- Listage de la structure de la table exelity. player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.player_mails : ~0 rows (environ)

-- Listage de la structure de la table exelity. player_notes
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.player_notes : ~0 rows (environ)

-- Listage de la structure de la table exelity. playlists
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.playlists : ~0 rows (environ)

-- Listage de la structure de la table exelity. playlist_songs
CREATE TABLE IF NOT EXISTS `playlist_songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist` int(11) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.playlist_songs : ~0 rows (environ)

-- Listage de la structure de la table exelity. properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.properties : ~42 rows (environ)
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 375000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 375000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 420000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 375000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 375000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 375000),
	(7, 'LowEndApartment', 'Appartement de base', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 140500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 375000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 375000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 375000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 420000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 310000),
	(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 310000),
	(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 310000),
	(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 310000),
	(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 310000),
	(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 310000),
	(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 310000),
	(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 310000),
	(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 310000),
	(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 310000),
	(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 310000),
	(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 310000),
	(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 310000),
	(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 310000),
	(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 310000),
	(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 310000),
	(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 310000),
	(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 310000),
	(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 310000),
	(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 310000),
	(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 310000),
	(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 310000),
	(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 310000),
	(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 310000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 420000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 420000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 420000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 420000);

-- Listage de la structure de la table exelity. properties_list
CREATE TABLE IF NOT EXISTS `properties_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `isBuy` varchar(255) DEFAULT '0',
  `owner` text DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '''\\''\\\\\\''{"item":[], "accounts":{"dirtycash":0,"cash":0}}\\\\\\''\\''''',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.properties_list : ~0 rows (environ)

-- Listage de la structure de la table exelity. pvp_leaderboard
CREATE TABLE IF NOT EXISTS `pvp_leaderboard` (
  `identifier` varchar(255) NOT NULL DEFAULT 'NO IDENTIFIER',
  `kills` int(11) NOT NULL DEFAULT 0,
  `death` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.pvp_leaderboard : ~0 rows (environ)

-- Listage de la structure de la table exelity. rapports
CREATE TABLE IF NOT EXISTS `rapports` (
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `Montant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.rapports : ~52 rows (environ)
INSERT INTO `rapports` (`Prenom`, `Nom`, `Type`, `Montant`) VALUES
	('Pascal', 'Sorant', 'Petits soins', '100'),
	('Thomas', 'Jirien', 'Grands soins', '2500'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Grands soins', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Grands soins', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Réanimation', '600'),
	('Anzo', 'Kenma', 'Petits soins', '200'),
	('Anzo', 'Kenma', 'Petits soins', '200'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Petits soins', '0'),
	('Anzo', 'Kenma', 'Petits soins', '0'),
	('Anzo', 'Kenma', 'Petits soins', '0'),
	('Anzo', 'Kenma', 'Petits soins', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('Anzo', 'Kenma', 'Réanimation', '0'),
	('blaki', 'brook', 'Grands soins', '1000'),
	('blaki', 'brook', 'Grands soins', '1000'),
	('blaki', 'brook', 'Grands soins', '1000'),
	('mathieux', 'messi', 'Réanimation', '0'),
	('mathieux', 'messi', 'Réanimation', '0'),
	('François ', 'Dufourt', 'Réanimation', '1200'),
	('François ', 'Dufourt', 'Réanimation', '1200'),
	('François ', 'Dufourt', 'Grands soins', '1400'),
	('François ', 'Dufourt', 'Grands soins', '600'),
	('François ', 'Dufourt', 'Grands soins', '600'),
	('François ', 'Dufourt', 'Grands soins', '600'),
	('François ', 'Dufourt', 'Grands soins', '3000'),
	('François ', 'Dufourt', 'Grands soins', '3000'),
	('François ', 'Dufourt', 'Grands soins', '3000'),
	('François ', 'Dufourt', 'Grands soins', '3000'),
	('François ', 'Dufourt', 'Grands soins', '200'),
	('François', 'Dufourt', 'Réanimation', '600'),
	('François', 'Dufourt', 'Grands soins', '1600'),
	('Alejandro', 'Bartez', 'Réanimation', '1500'),
	('Alejandro', 'Bartez', 'Réanimation', '3500'),
	('Alejandro', 'Bartez', 'Réanimation', '500'),
	('Alejandro', 'Bartez', 'Réanimation', '500'),
	('Jean-Baptiste', 'Duc', 'Grands soins', '1200'),
	('noha', 'tores', 'Réanimation', '5000'),
	('Carlos', 'Elbigos', 'Grands soins', '5000');

-- Listage de la structure de la table exelity. ratelimit_ban
CREATE TABLE IF NOT EXISTS `ratelimit_ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licenseid` text NOT NULL,
  `targetName` text NOT NULL,
  `permanent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.ratelimit_ban : ~0 rows (environ)

-- Listage de la structure de la table exelity. rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.rented_vehicles : ~0 rows (environ)

-- Listage de la structure de la table exelity. seashield_banlist
CREATE TABLE IF NOT EXISTS `seashield_banlist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Discord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Xbox` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Live` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Tokens` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `Reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isBanned` int(11) NOT NULL DEFAULT 0,
  `Expire` int(11) NOT NULL DEFAULT 0,
  `timeat` int(55) DEFAULT 0,
  `permanent` int(1) DEFAULT 0,
  `moderatorName` varchar(255) DEFAULT 'SeaShield',
  `banimg` longtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.seashield_banlist : ~0 rows (environ)

-- Listage de la structure de la table exelity. shops
CREATE TABLE IF NOT EXISTS `shops` (
  `item` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`item`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.shops : ~0 rows (environ)

-- Listage de la structure de la table exelity. societies_storage
CREATE TABLE IF NOT EXISTS `societies_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `vehicles` longtext DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  `weapons` longtext DEFAULT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  `dirty_money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.societies_storage : ~102 rows (environ)
INSERT INTO `societies_storage` (`id`, `name`, `label`, `vehicles`, `items`, `weapons`, `money`, `dirty_money`) VALUES
	(99, 'unemployed', 'Citoyen', NULL, NULL, NULL, 0, 0),
	(101, 'taxi', 'Taxi', '[]', '[]', '[]', 512877, 0),
	(103, 'ambulance', 'Ambulance', '[]', '[]', '[]', 107010, 0),
	(104, 'cardealer', 'Concessionnaire', '[]', '[]', '[]', 1673039, 0),
	(105, 'la_passione', 'La Passione', NULL, NULL, NULL, 0, 0),
	(106, 'planeshop', 'Concessionnaire Avions', NULL, NULL, NULL, 0, 0),
	(108, 'gouv', 'Gouvernement', NULL, NULL, NULL, 9993400, 0),
	(110, 'unemployed2', 'Aucune', NULL, NULL, NULL, 0, 0),
	(111, 'boatshop', 'Concessionnaire Bateaux', NULL, NULL, NULL, 0, 0),
	(113, 'carshop', 'Concessionnaire Voitures', NULL, NULL, NULL, 0, 0),
	(114, 'unicorn', 'Unicorn', '[]', '[]', '[]', 458408, 0),
	(115, 'planeseller', 'Concessionnaire aéronotique', '[]', '[]', '[]', 687400, 0),
	(117, 'lmf', 'LMF', NULL, NULL, NULL, 0, 0),
	(119, 'lumberjack', 'Bûcheron', NULL, NULL, NULL, 0, 0),
	(121, 'slaughterer', 'Abateur', NULL, NULL, NULL, 0, 0),
	(122, 'medicalcenter', 'MedicalCenter', NULL, NULL, NULL, 0, 0),
	(123, 'realestateagent', 'Agent immobilier', NULL, NULL, NULL, 0, 0),
	(124, 'boatseller', 'Concessionnaire Bénéteau', NULL, NULL, NULL, 1502745, 0),
	(125, 'jardinier', 'Jardinier', NULL, NULL, NULL, 0, 0),
	(126, 'Douanier', 'douanier', NULL, NULL, NULL, 0, 0),
	(129, 'fisherman', 'Pêcheur', NULL, NULL, NULL, 0, 0),
	(130, 'karting', 'Karting', NULL, NULL, NULL, 0, 0),
	(131, 'avocat', 'Avocat', NULL, NULL, NULL, 0, 0),
	(132, 'vigneron', 'Vigneron', '[]', '[]', '[]', 867214, 0),
	(134, 'vigne', 'Vigneron', NULL, NULL, NULL, 0, 0),
	(136, 'journalist', 'Journaliste', NULL, NULL, NULL, 0, 0),
	(137, 'tacos', 'Tacos', NULL, NULL, NULL, 0, 0),
	(138, 'tailor', 'Couturier', NULL, NULL, NULL, 0, 0),
	(139, 'mecano2', 'Ls Custom', '[]', '[]', '[]', 14268575, 0),
	(140, 'mecano', 'Benny\'s', '[]', '[]', '[]', 14069216, 0),
	(141, 'miner', 'Mineur', NULL, NULL, NULL, 0, 0),
	(143, 'delivery', 'Delivery', NULL, NULL, NULL, 0, 0),
	(144, 'durex', 'Durex', NULL, NULL, NULL, 0, 0),
	(145, 'fueler', 'Raffineur', NULL, NULL, NULL, 0, 0),
	(146, 'police', 'Police', '[]', '[]', '[]', 4516425, 0),
	(147, 'bcso', 'B.C.S.O', '[]', '[]', '[]', 6229492, 0),
	(148, 'casalesi', 'casalesi', '{}', NULL, NULL, 0, 164874),
	(149, 'vagos', 'vagos', '{"WFKQ8437":{"owner":"license:ff3b68379d18bee128ed7778875a7c02b4939c23","data":{"modHydrolic":-1,"modFrame":-1,"modSmokeEnabled":false,"modFender":-1,"modSpoilers":-1,"dirtLevel":3.2,"modRoof":-1,"xenonColor":255,"windowTint":-1,"modStruts":-1,"modSpeakers":-1,"modTransmission":-1,"model":-1177863319,"modTrimB":-1,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTurbo":false,"wheels":0,"pearlescentColor":28,"modGrille":-1,"plateIndex":0,"bodyHealth":973.3,"modBackWheels":-1,"modDashboard":-1,"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"fuelLevel":26.6,"modHood":-1,"modVanityPlate":-1,"color2":0,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modBrakes":-1,"modRightFender":-1,"modTank":-1,"color1":34,"modLightbar":-1,"modDoorSpeaker":-1,"modEngine":-1,"modFrontBumper":-1,"modSideSkirt":-1,"tyreSmokeColor":[255,255,255],"modFrontWheels":-1,"engineHealth":972.9,"windowsBroken":{"0":true,"1":true,"6":false,"7":false,"4":true,"5":true,"2":true,"3":true},"plate":"WFKQ8437","modOrnaments":-1,"modRearBumper":-1,"modAerials":-1,"wheelColor":156,"neonColor":[255,0,255],"doorsBroken":{"0":false,"1":false,"4":false,"2":false,"3":false},"modSuspension":-1,"modSeats":-1,"extras":{"11":false},"modExhaust":-1,"tankHealth":994.5,"modXenon":false,"modEngineBlock":-1,"modSteeringWheel":-1,"tyreBurst":{"0":false,"5":false,"4":false,"1":false}},"stored":0},"OGHC7479":{"owner":"license:ff3b68379d18bee128ed7778875a7c02b4939c23","data":{"modHydrolic":-1,"modFrame":-1,"modSmokeEnabled":false,"modFender":-1,"modSpoilers":-1,"dirtLevel":5.2,"windowsBroken":{"0":true,"1":false,"6":false,"7":false,"4":true,"5":true,"2":false,"3":false},"xenonColor":255,"windowTint":-1,"modStruts":-1,"modSpeakers":-1,"modTransmission":-1,"model":-1244461404,"modXenon":false,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modEngine":-1,"modTurbo":false,"wheels":7,"pearlescentColor":4,"modGrille":-1,"tankHealth":999.1,"bodyHealth":991.8,"modSteeringWheel":-1,"modDashboard":-1,"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"fuelLevel":24.9,"modEngineBlock":-1,"modVanityPlate":-1,"color2":2,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modBrakes":-1,"modRightFender":-1,"modTank":-1,"doorsBroken":{"0":true,"1":false,"6":false,"4":false,"5":false,"2":false,"3":false},"modExhaust":-1,"modFrontBumper":-1,"modRoof":-1,"modSeats":-1,"modDoorSpeaker":-1,"modTrimB":-1,"modFrontWheels":-1,"engineHealth":989.5,"modBackWheels":-1,"plate":"OGHC7479","tyreSmokeColor":[255,255,255],"modRearBumper":-1,"modSideSkirt":-1,"wheelColor":156,"modAPlate":-1,"modAerials":-1,"modSuspension":-1,"neonColor":[255,0,255],"extras":{"2":1,"1":false},"color1":111,"modOrnaments":-1,"modLightbar":-1,"plateIndex":0,"modHood":-1,"tyreBurst":{"4":false,"1":false,"5":false,"0":false}},"stored":0}}', '[]', '{}', 0, 0),
	(150, 'ballas', 'ballas', '{"AUIR4346":{"data":{"modSuspension":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":false,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":989.7,"modDoorR":-1,"neonColor":[255,0,255],"wheels":3,"color1":145,"modBrakes":-1,"modTransmission":-1,"engineHealth":992.3,"modSideSkirt":2,"modLightbar":-1,"modHood":-1,"modBackWheels":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"4":false},"modLivery":1,"color2":145,"modXenon":false,"modSpoilers":2,"modExhaust":5,"modHydrolic":-1,"dirtLevel":6.2,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":18,"modTurbo":false,"modTank":-1,"wheelColor":1,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modHorns":-1,"bodyHealth":961.3,"modArmor":-1,"modRoof":2,"modOrnaments":-1,"modEngineBlock":-1,"extras":[],"tyreSmokeColor":[255,255,255],"modRearBumper":9,"modPlateHolder":-1,"plate":"AUIR4346","modDashboard":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modVanityPlate":-1,"xenonColor":255,"modFrontBumper":15,"modSeats":-1,"model":-362150785,"modTrimA":-1,"modSteeringWheel":-1,"modArchCover":-1,"fuelLevel":47.9,"modFender":-1,"windowTint":1,"plateIndex":0},"owner":"license:4763e2d933b7460b7f053341a76a921e59b859a3","stored":1},"TUNR9316":{"data":{"modSuspension":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":true,"3":true,"2":true,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":1000.0,"modRoof":-1,"neonColor":[255,0,255],"wheels":5,"color1":145,"modBrakes":-1,"modTransmission":-1,"engineHealth":1000.0,"modSideSkirt":-1,"modLightbar":-1,"modFrontBumper":-1,"modBackWheels":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"doorsBroken":{"1":false,"0":true,"3":false,"2":false,"4":false},"modLivery":-1,"color2":1,"modXenon":false,"plate":"TUNR9316","modEngineBlock":-1,"modHydrolic":-1,"tyreBurst":{"0":false,"5":false,"1":false,"4":false},"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":18,"modTurbo":false,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":979.0,"plateIndex":0,"modDoorR":-1,"modOrnaments":-1,"modPlateHolder":-1,"extras":{"1":1},"modHood":-1,"modRearBumper":-1,"modTank":-1,"modSpoilers":-1,"modDashboard":-1,"modTrimA":-1,"modGrille":-1,"xenonColor":255,"modSeats":-1,"modFender":-1,"model":-2098954619,"dirtLevel":4.0,"modExhaust":-1,"modHorns":-1,"fuelLevel":58.3,"modSteeringWheel":-1,"windowTint":-1,"modArmor":-1},"owner":"license:c500d03b7effe52c7086c89610f0415799e0c38d","stored":0},"XTHH1287":{"data":{"modSuspension":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":false,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":997.0,"modRoof":7,"neonColor":[255,0,255],"wheels":1,"color1":145,"modBrakes":-1,"modTransmission":-1,"engineHealth":997.0,"modSideSkirt":-1,"modLightbar":-1,"modFrontBumper":5,"modBackWheels":-1,"modFrame":3,"neonEnabled":[false,false,false,false],"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"4":false},"modLivery":5,"color2":1,"modXenon":false,"plate":"XTHH1287","modEngineBlock":-1,"modHydrolic":-1,"tyreBurst":{"0":false,"5":false,"1":false,"4":false},"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":134,"modTurbo":false,"tyreSmokeColor":[255,255,255],"wheelColor":0,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":987.0,"plateIndex":1,"modDoorR":-1,"modOrnaments":-1,"modPlateHolder":-1,"extras":[],"modHood":10,"modRearBumper":-1,"modTank":-1,"modSpoilers":3,"modDashboard":-1,"modTrimA":-1,"modGrille":-1,"xenonColor":255,"modSeats":-1,"modFender":-1,"model":1104234922,"dirtLevel":0.0,"modExhaust":-1,"modHorns":-1,"fuelLevel":91.4,"modSteeringWheel":-1,"windowTint":1,"modArmor":-1},"owner":"license:9aac80c2a0d3d5be30a183f09f4b85fd125baa70","stored":1},"TRMZ5665":{"data":{"modFender":1,"modRightFender":8,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":true,"2":true,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":990.9,"modRoof":0,"neonColor":[0,0,0],"wheels":4,"color1":145,"modBrakes":-1,"modTransmission":-1,"modSteeringWheel":-1,"modSideSkirt":2,"modLightbar":-1,"modFrontBumper":13,"modBackWheels":-1,"modTrimA":-1,"neonEnabled":[false,false,false,false],"xenonColor":255,"modLivery":10,"color2":1,"modDashboard":-1,"plate":"TRMZ5665","modExhaust":-1,"modHydrolic":-1,"dirtLevel":2.3,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":134,"modTurbo":false,"tyreSmokeColor":[255,255,255],"wheelColor":0,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":883.7,"plateIndex":1,"modArmor":-1,"modSeats":-1,"modTank":-1,"extras":{"3":1,"2":1,"1":1},"tyreBurst":{"0":false,"5":true,"1":false,"4":false},"modRearBumper":4,"modPlateHolder":-1,"modSpoilers":-1,"modXenon":false,"modSuspension":-1,"modGrille":7,"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"4":false},"modHood":3,"modOrnaments":-1,"model":67753863,"modFrame":-1,"modEngineBlock":-1,"modHorns":-1,"fuelLevel":53.2,"engineHealth":914.7,"windowTint":1,"modDoorR":-1},"owner":"license:4763e2d933b7460b7f053341a76a921e59b859a3","stored":1},"RVMH7611":{"data":{"modFender":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":false,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":1000.0,"modDoorR":-1,"neonColor":[0,0,0],"wheels":2,"color1":3,"modBrakes":-1,"modTransmission":-1,"engineHealth":1000.0,"modSideSkirt":-1,"modLightbar":-1,"modFrontBumper":-1,"modBackWheels":-1,"modTrimA":-1,"neonEnabled":[false,false,false,false],"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modLivery":-1,"color2":2,"modDashboard":-1,"modSpoilers":-1,"modRearBumper":-1,"modHydrolic":-1,"dirtLevel":6.2,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":0,"modTurbo":false,"modTank":-1,"wheelColor":156,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":999.7,"modExhaust":-1,"modArmor":-1,"modSeats":-1,"tyreSmokeColor":[255,255,255],"extras":[],"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modEngineBlock":-1,"modPlateHolder":-1,"plate":"RVMH7611","modXenon":false,"modFrame":-1,"modVanityPlate":-1,"xenonColor":255,"modHood":-1,"modOrnaments":-1,"model":75131841,"modSteeringWheel":-1,"modHorns":-1,"modRoof":-1,"fuelLevel":53.8,"plateIndex":2,"windowTint":-1,"modSuspension":-1},"owner":"license:4763e2d933b7460b7f053341a76a921e59b859a3","stored":1},"SAIB1407":{"data":{"modSuspension":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modFrontWheels":-1,"tankHealth":999.9,"modRoof":0,"neonColor":[255,0,255],"wheels":0,"color1":145,"modBrakes":-1,"modTransmission":-1,"engineHealth":998.9,"modSideSkirt":-1,"modLightbar":-1,"modFrontBumper":2,"modBackWheels":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modLivery":-1,"color2":1,"modXenon":false,"plate":"SAIB1407","modEngineBlock":-1,"modHydrolic":-1,"tyreBurst":{"0":false,"5":false,"1":false,"4":false},"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":2,"modTurbo":false,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":999.3,"plateIndex":1,"modDoorR":-1,"modOrnaments":-1,"modPlateHolder":-1,"extras":{"11":1,"12":false},"modHood":1,"modRearBumper":-1,"modTank":-1,"modSpoilers":4,"modDashboard":-1,"modTrimA":-1,"modGrille":-1,"xenonColor":255,"modSeats":-1,"modFender":-1,"model":736902334,"dirtLevel":1.7,"modExhaust":-1,"modHorns":-1,"fuelLevel":90.4,"modSteeringWheel":-1,"windowTint":1,"modArmor":-1},"owner":"license:4763e2d933b7460b7f053341a76a921e59b859a3","stored":1},"QDYT4384":{"data":{"modSuspension":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":true,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":996.6,"modDoorR":-1,"neonColor":[255,0,255],"wheels":3,"color1":1,"modBrakes":-1,"modTransmission":-1,"engineHealth":1000.0,"modSideSkirt":-1,"modLightbar":-1,"modHood":-1,"modBackWheels":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modLivery":-1,"color2":0,"modXenon":false,"modSpoilers":-1,"modExhaust":-1,"modHydrolic":-1,"dirtLevel":6.7,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":4,"modTurbo":false,"modTank":-1,"wheelColor":156,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modHorns":-1,"bodyHealth":993.2,"modArmor":-1,"modRoof":-1,"modOrnaments":-1,"modEngineBlock":-1,"extras":{"11":false,"10":false},"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"modPlateHolder":-1,"plate":"QDYT4384","modDashboard":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modVanityPlate":-1,"xenonColor":255,"modFrontBumper":-1,"modSeats":-1,"model":-16948145,"modTrimA":-1,"modSteeringWheel":-1,"modArchCover":-1,"fuelLevel":63.4,"modFender":-1,"windowTint":-1,"plateIndex":0},"owner":"license:9aac80c2a0d3d5be30a183f09f4b85fd125baa70","stored":1},"BBFA9732":{"data":{"modSuspension":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":true,"6":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modFrontWheels":-1,"tankHealth":973.8,"modDoorR":-1,"neonColor":[255,0,255],"wheels":6,"color1":0,"modBrakes":-1,"modTransmission":-1,"engineHealth":983.4,"modSideSkirt":-1,"modLightbar":-1,"modHood":-1,"modBackWheels":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"xenonColor":255,"modLivery":-1,"color2":5,"modXenon":false,"plate":"BBFA9732","modEngineBlock":-1,"modHydrolic":-1,"tyreBurst":{"4":false,"0":false},"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":5,"modTurbo":false,"tyreSmokeColor":[255,255,255],"wheelColor":112,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modHorns":-1,"bodyHealth":942.8,"modFender":-1,"modArmor":-1,"modOrnaments":-1,"modFrontBumper":-1,"extras":[],"modSteeringWheel":-1,"modRearBumper":-1,"modPlateHolder":-1,"modSpoilers":-1,"modDashboard":-1,"modTrimA":-1,"modVanityPlate":-1,"doorsBroken":{"1":false,"0":false},"modExhaust":-1,"modSeats":-1,"model":390201602,"modTank":-1,"modRoof":-1,"modArchCover":-1,"fuelLevel":47.5,"plateIndex":0,"windowTint":-1,"dirtLevel":10.5},"owner":"license:4763e2d933b7460b7f053341a76a921e59b859a3","stored":1},"WRXH2278":{"data":{"modFender":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modFrontWheels":-1,"tankHealth":996.2,"modArmor":-1,"neonColor":[255,0,255],"wheels":0,"color1":0,"modBrakes":-1,"modTransmission":-1,"modSteeringWheel":-1,"modSideSkirt":-1,"modLightbar":-1,"modFrontBumper":-1,"modBackWheels":-1,"modTrimA":-1,"neonEnabled":[false,false,false,false],"xenonColor":255,"modLivery":-1,"color2":0,"modXenon":false,"modSpoilers":-1,"modEngineBlock":-1,"modHydrolic":-1,"dirtLevel":3.7,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":2,"modTurbo":false,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":966.9,"modExhaust":-1,"modHood":-1,"modOrnaments":-1,"modFrame":-1,"extras":{"11":1,"1":1,"4":1,"3":1,"2":1,"5":1,"10":false},"plateIndex":0,"modSuspension":-1,"modVanityPlate":-1,"plate":"WRXH2278","modDashboard":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modRoof":-1,"modSeats":-1,"modHorns":-1,"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":true},"model":-304802106,"engineHealth":954.9,"modRearBumper":-1,"modTank":-1,"fuelLevel":59.6,"modDoorR":-1,"windowTint":-1,"modPlateHolder":-1},"owner":"license:9aac80c2a0d3d5be30a183f09f4b85fd125baa70","stored":0}}', '{"weed_pooch":{"count":14,"label":"Pochon de weed","name":"weed_pooch"},"coke_pooch":{"count":5,"label":"Pochon de coke","name":"coke_pooch"},"meth_pooch":{"count":15,"label":"Pochon de meth","name":"meth_pooch"},"weed":{"count":6,"label":"Weed","name":"weed"},"coke":{"count":3,"label":"Coke","name":"coke"}}', '{"WEAPON_KNIFE":[{"ammo":300,"label":"Couteau","components":[],"name":"WEAPON_KNIFE"}],"WEAPON_PISTOL":[{"components":[],"label":"Pistolet","ammo":200,"name":"WEAPON_PISTOL"}],"WEAPON_MACHETE":[{"ammo":300,"label":"Machette","components":[],"name":"WEAPON_MACHETE"}]}', 0, 20828),
	(151, 'families', 'families', '{"RQQJ9729":{"data":{"modArmor":-1,"pearlescentColor":132,"windowsBroken":{"5":true,"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true},"modRoof":-1,"modHood":-1,"modTrimA":-1,"modSmokeEnabled":false,"neonEnabled":[false,false,false,false],"modDoorR":-1,"modLightbar":-1,"modHydrolic":-1,"wheels":3,"modAirFilter":-1,"modTrimB":-1,"modTransmission":2,"color2":57,"modBrakes":2,"modDial":-1,"modDashboard":-1,"modHorns":-1,"bodyHealth":999.6,"modEngineBlock":-1,"tankHealth":999.8,"engineHealth":1000.0,"modSpoilers":-1,"doorsBroken":{"5":false,"6":false,"0":false,"1":false,"2":false,"3":false,"4":false},"modAerials":-1,"modSteeringWheel":-1,"modLivery":-1,"modTrunk":-1,"modPlateHolder":-1,"fuelLevel":59.6,"modAPlate":-1,"extras":{"11":false,"10":false},"modTurbo":1,"modExhaust":-1,"modFrontBumper":-1,"modStruts":-1,"modTank":-1,"modSuspension":3,"windowTint":1,"modSeats":-1,"model":-16948145,"modRightFender":-1,"plate":"RQQJ9729","modDoorSpeaker":-1,"wheelColor":156,"modFender":-1,"neonColor":[255,0,255],"modShifterLeavers":-1,"modFrame":-1,"modEngine":3,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"tyreBurst":{"5":false,"1":false,"0":false,"4":false},"modVanityPlate":-1,"modRearBumper":-1,"plateIndex":0,"modSpeakers":-1,"modSideSkirt":-1,"color1":57,"xenonColor":255,"dirtLevel":0.1,"modFrontWheels":-1,"modXenon":false},"stored":0,"owner":"license:b7fb0e19e9206c0af45f60fbb437cb16ee69d835"}}', '{"meth":{"count":49,"label":"Meth","name":"meth"},"weed_pooch":{"count":9,"label":"Pochon de weed","name":"weed_pooch"},"lsd":{"count":1,"label":"LSD","name":"lsd"},"meth_pooch":{"count":6,"label":"Pochon de meth","name":"meth_pooch"},"opium":{"count":28,"label":"Opium","name":"opium"}}', '{}', 0, 476267),
	(152, 'marabunta', 'marabunta', '{"RHYB9693":{"data":{"modSideSkirt":-1,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":true,"2":true,"7":true,"0":true,"5":true,"6":true,"3":true,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":350.0,"modAerials":-1,"color1":0,"modExhaust":-1,"modSteeringWheel":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"modEngine":-1,"neonColor":[255,0,255],"modTransmission":-1,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":27.6,"modPlateHolder":-1,"extras":[],"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":5,"modBrakes":-1,"modAPlate":-1,"tankHealth":700.0,"modSpeakers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"dirtLevel":13.0,"modDial":-1,"modRoof":-1,"modRightFender":-1,"modShifterLeavers":-1,"model":86520421,"bodyHealth":0.0,"plate":"RHYB9693","modSuspension":-1,"modArmor":-1,"color2":4,"doorsBroken":{"1":false,"0":false},"modXenon":false,"tyreBurst":{"0":false,"4":false},"xenonColor":255,"modRearBumper":-1,"wheelColor":112,"modTurbo":false,"wheels":6,"modArchCover":-1,"modGrille":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:5537a44eaa12d9e6ba90fdb9cd1c77e2195d9eee"},"LSTO5775":{"data":{"modSideSkirt":0,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":false,"2":false,"7":false,"0":true,"5":false,"6":true,"3":false,"4":false},"modSpoilers":0,"modEngineBlock":-1,"modHorns":-1,"engineHealth":992.8,"modAerials":-1,"color1":64,"modAirFilter":-1,"wheels":4,"modHood":-1,"neonEnabled":[false,false,false,false],"bodyHealth":992.2,"model":-304802106,"neonColor":[255,0,255],"dirtLevel":14.8,"modTrimA":-1,"windowTint":1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":40.0,"modPlateHolder":-1,"extras":{"1":false,"2":false,"11":false,"5":false,"10":1,"3":false,"4":false},"modDoorR":-1,"modFrontBumper":0,"modFrame":-1,"modLivery":-1,"pearlescentColor":4,"modBrakes":2,"modAPlate":-1,"tankHealth":998.9,"modShifterLeavers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":22,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"modSuspension":3,"modDial":-1,"modRoof":-1,"modRightFender":-1,"modEngine":3,"modSpeakers":-1,"modSmokeEnabled":false,"plate":"LSTO5775","modTransmission":2,"modArmor":-1,"modRearBumper":0,"doorsBroken":{"1":false,"2":false,"0":false,"5":false,"6":false,"3":false,"4":false},"modXenon":1,"modExhaust":0,"xenonColor":1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"wheelColor":0,"modTurbo":1,"color2":1,"modGrille":-1,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:f3942448910102fe64b49d8b827d6ad6fb56748b"},"GKLI2756":{"data":{"modSideSkirt":-1,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":true,"2":false,"7":false,"0":false,"5":true,"6":true,"3":false,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":1000.0,"modAerials":-1,"color1":8,"modExhaust":-1,"modSteeringWheel":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"model":-391594584,"neonColor":[0,0,0],"dirtLevel":15.0,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":8.0,"modPlateHolder":-1,"extras":{"11":1},"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":4,"modBrakes":-1,"modAPlate":-1,"tankHealth":999.6,"modShifterLeavers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"wheels":7,"modDial":-1,"modRoof":-1,"modRightFender":-1,"modEngine":-1,"bodyHealth":995.6,"modAirFilter":-1,"plate":"GKLI2756","modSuspension":-1,"modTransmission":-1,"modArmor":-1,"doorsBroken":{"1":false,"2":false,"0":false,"5":false,"6":false,"3":false,"4":false},"modRearBumper":-1,"modXenon":false,"xenonColor":255,"tyreBurst":{"1":false,"0":false,"5":false,"4":false},"wheelColor":156,"modTurbo":false,"color2":0,"modGrille":-1,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"modSpeakers":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:73e4f9605bee9c0d59c5298da89cbc3aa4a0b6d7"},"YMFR7076":{"data":{"modSideSkirt":-1,"plateIndex":3,"modDashboard":-1,"windowsBroken":{"1":true,"2":true,"7":true,"0":true,"5":true,"6":true,"3":true,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":753.4,"modAerials":-1,"color1":0,"modExhaust":-1,"modSteeringWheel":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"model":788045382,"neonColor":[255,0,255],"dirtLevel":15.0,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":19.9,"modPlateHolder":-1,"extras":[],"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":0,"modBrakes":-1,"modAPlate":-1,"tankHealth":748.7,"modSpeakers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"doorsBroken":{"1":false,"0":false},"modDial":-1,"modRoof":-1,"modRightFender":-1,"modEngine":-1,"modShifterLeavers":-1,"bodyHealth":183.6,"plate":"YMFR7076","modSuspension":-1,"modTransmission":-1,"modArmor":-1,"modRearBumper":-1,"color2":0,"modXenon":false,"xenonColor":255,"tyreBurst":{"4":false,"0":false},"wheelColor":156,"modTurbo":false,"wheels":6,"modArchCover":-1,"modGrille":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:c2f4b74a33676d9ed49e33ba3022d3ea4a462fff"},"AUER4675":{"data":{"modSideSkirt":-1,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":true,"2":true,"7":true,"0":true,"5":true,"6":true,"3":true,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":985.6,"modAerials":-1,"color1":0,"modAirFilter":-1,"wheels":5,"modHood":-1,"neonEnabled":[false,false,false,false],"modSuspension":-1,"model":409049982,"neonColor":[255,0,255],"dirtLevel":15.0,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":49.0,"modPlateHolder":-1,"extras":{"1":1},"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":10,"modBrakes":-1,"modAPlate":-1,"tankHealth":999.0,"modShifterLeavers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"modEngine":-1,"modDial":-1,"modRoof":-1,"modRightFender":-1,"modSmokeEnabled":false,"modSteeringWheel":-1,"bodyHealth":990.4,"plate":"AUER4675","modTransmission":-1,"modArmor":-1,"modRearBumper":-1,"doorsBroken":{"1":true,"2":false,"0":true,"3":false,"4":false},"modXenon":false,"modExhaust":-1,"xenonColor":255,"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"wheelColor":156,"modTurbo":false,"color2":0,"modArchCover":-1,"modGrille":-1,"tyreSmokeColor":[255,255,255],"modSpeakers":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:5537a44eaa12d9e6ba90fdb9cd1c77e2195d9eee"},"XKSI7449":{"data":{"modSideSkirt":0,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":false,"2":false,"7":false,"0":false,"5":true,"6":false,"3":false,"4":true},"modSpoilers":1,"modEngineBlock":-1,"modHorns":42,"engineHealth":1000.0,"modAerials":-1,"color1":64,"modExhaust":2,"wheels":4,"modHood":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"model":-1150599089,"neonColor":[255,0,255],"dirtLevel":0.0,"modTrimA":-1,"windowTint":1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":59.2,"modPlateHolder":-1,"extras":{"11":false,"12":1},"modDoorR":-1,"modFrontBumper":0,"modFrame":-1,"modLivery":-1,"pearlescentColor":4,"modBrakes":2,"modAPlate":-1,"tankHealth":1000.0,"modShifterLeavers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":26,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"modEngine":3,"modDial":-1,"modRoof":-1,"modRightFender":-1,"modSpeakers":-1,"modSteeringWheel":-1,"modSuspension":3,"plate":"XKSI7449","modTransmission":2,"modArmor":-1,"color2":64,"doorsBroken":{"1":false,"2":false,"0":false,"5":false,"6":false,"3":false,"4":false},"modXenon":1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"xenonColor":1,"modRearBumper":0,"wheelColor":0,"modTurbo":1,"modGrille":2,"modArchCover":-1,"bodyHealth":1000.0,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:73e4f9605bee9c0d59c5298da89cbc3aa4a0b6d7"},"XOJT4508":{"data":{"modSideSkirt":-1,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":true,"2":true,"7":true,"0":true,"5":true,"6":true,"3":false,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":953.7,"modAerials":-1,"color1":64,"modExhaust":-1,"modSteeringWheel":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"model":-2040426790,"neonColor":[255,0,255],"dirtLevel":15.0,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":15.6,"modPlateHolder":-1,"extras":[],"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":3,"modBrakes":-1,"modAPlate":-1,"tankHealth":986.8,"modSpeakers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"doorsBroken":{"1":false,"2":false,"0":false,"5":false,"6":false,"3":false,"4":false},"modDial":-1,"modRoof":-1,"modRightFender":-1,"modEngine":-1,"modShifterLeavers":-1,"bodyHealth":941.8,"plate":"XOJT4508","modSuspension":-1,"modTransmission":-1,"modArmor":-1,"modRearBumper":-1,"color2":5,"modXenon":false,"xenonColor":255,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"wheelColor":156,"modTurbo":false,"wheels":0,"modArchCover":-1,"modGrille":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:a93fc49da2932ef0029ecb1e8631912448e25829"},"VPHC3179":{"data":{"modSideSkirt":-1,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":true,"2":true,"7":true,"0":true,"5":true,"6":true,"3":true,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":858.2,"modAerials":-1,"color1":0,"modExhaust":-1,"wheels":6,"modHood":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"model":788045382,"neonColor":[255,0,255],"dirtLevel":15.0,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":77.6,"modPlateHolder":-1,"extras":[],"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":0,"modBrakes":-1,"modAPlate":-1,"tankHealth":946.4,"modSpeakers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"doorsBroken":{"1":false,"0":false},"modDial":-1,"modRoof":-1,"modRightFender":-1,"modEngine":-1,"modShifterLeavers":-1,"modSteeringWheel":-1,"plate":"VPHC3179","bodyHealth":871.6,"modSuspension":-1,"modArmor":-1,"modRearBumper":-1,"color2":0,"modXenon":false,"xenonColor":255,"tyreBurst":{"0":false,"4":false},"wheelColor":156,"modTurbo":false,"modGrille":-1,"modArchCover":-1,"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:73e4f9605bee9c0d59c5298da89cbc3aa4a0b6d7"},"OLUW7536":{"data":{"modSideSkirt":0,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":false,"2":true,"7":true,"0":false,"5":true,"6":false,"3":true,"4":true},"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"engineHealth":996.9,"modAerials":-1,"color1":147,"modAirFilter":-1,"wheels":4,"modHood":6,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"modEngine":-1,"neonColor":[255,0,255],"dirtLevel":8.8,"modTrimA":-1,"windowTint":1,"modLightbar":-1,"modSeats":-1,"modDoorSpeaker":-1,"fuelLevel":33.1,"modPlateHolder":-1,"extras":{"1":1,"2":1,"3":false},"modDoorR":-1,"modFrontBumper":0,"modFrame":-1,"modLivery":-1,"pearlescentColor":1,"modBrakes":-1,"modAPlate":-1,"tankHealth":984.8,"modShifterLeavers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"bodyHealth":896.2,"modDial":-1,"modRoof":2,"modRightFender":-1,"modSpeakers":-1,"modGrille":-1,"modSuspension":-1,"plate":"OLUW7536","modTransmission":-1,"modArmor":-1,"color2":1,"doorsBroken":{"1":false,"2":false,"0":false,"3":false,"4":false},"modXenon":false,"modRearBumper":0,"xenonColor":255,"modExhaust":-1,"wheelColor":0,"modTurbo":false,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modArchCover":-1,"model":67753863,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modHydrolic":-1,"modFender":-1},"stored":0,"owner":"license:54225128b7241a1a8e707edf9398184cf7b5f29e"}}', '{"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":8},"weed":{"name":"weed","label":"Weed","count":5},"meth":{"name":"meth","label":"Meth","count":5},"cofee":{"name":"cofee","label":"Café","count":1},"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":8},"coke":{"name":"coke","label":"Coke","count":7},"lsd_pooch":{"name":"lsd_pooch","label":"Pochon de LSD","count":1}}', '{"WEAPON_PISTOL":[{"components":[],"label":"Pistolet","name":"WEAPON_PISTOL","ammo":240}]}', 181, 39274),
	(153, 'bloods', 'bloods', '[]', '{"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":2},"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":3},"lsd":{"name":"lsd","label":"LSD","count":50},"tabac":{"name":"tabac","label":"Tabac","count":11}}', '{}', 0, 0),
	(156, 'madrazo', 'madrazo', '{"LGFI3348":{"data":{"modFender":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modFrontWheels":31,"tankHealth":915.9,"modArmor":-1,"neonColor":[0,0,0],"wheels":7,"color1":12,"modBrakes":-1,"modTransmission":-1,"engineHealth":890.1,"modSideSkirt":-1,"modLightbar":-1,"modHood":-1,"modBackWheels":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modLivery":-1,"color2":23,"modXenon":false,"plate":"LGFI3348","modExhaust":-1,"modHydrolic":-1,"dirtLevel":15.0,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":45,"modTurbo":false,"modPlateHolder":-1,"wheelColor":0,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":-1,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":439.7,"modDashboard":-1,"modRearBumper":-1,"modOrnaments":-1,"modRoof":-1,"extras":[],"modVanityPlate":-1,"modSpoilers":-1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modTrimA":-1,"xenonColor":255,"modSeats":-1,"tyreSmokeColor":[255,255,255],"modFrontBumper":-1,"modHorns":-1,"plateIndex":0,"model":-1930048799,"modTank":-1,"modDoorR":-1,"modSteeringWheel":-1,"fuelLevel":36.1,"modSuspension":-1,"windowTint":1,"modEngineBlock":-1},"owner":"license:e3c24b068ffa7e28b8be7b4976da8cefa8c96ad8","stored":0},"QUUQ0689":{"data":{"modFender":-1,"modRightFender":-1,"modAerials":-1,"windowsBroken":{"7":false,"6":false,"1":true,"0":true,"3":false,"2":true,"5":true,"4":true},"modFrontWheels":17,"tankHealth":962.9,"modRoof":-1,"neonColor":[255,0,255],"wheels":5,"color1":12,"modBrakes":-1,"modTransmission":2,"engineHealth":946.7,"modSideSkirt":2,"modLightbar":-1,"modHood":9,"modBackWheels":-1,"modFrame":2,"neonEnabled":[false,false,false,false],"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modLivery":2,"color2":12,"modXenon":false,"plate":"QUUQ0689","modExhaust":-1,"modHydrolic":-1,"dirtLevel":15.0,"modAirFilter":-1,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":1,"modTurbo":1,"tyreSmokeColor":[255,255,255],"wheelColor":0,"modAPlate":-1,"modTrimB":-1,"modDial":-1,"modShifterLeavers":-1,"modEngine":3,"modStruts":-1,"modSmokeEnabled":false,"modGrille":-1,"modDoorSpeaker":-1,"modArchCover":-1,"bodyHealth":837.1,"modDashboard":-1,"modRearBumper":2,"modOrnaments":-1,"modSeats":-1,"extras":[],"modSteeringWheel":-1,"modSpoilers":-1,"modTrimA":-1,"plateIndex":1,"modArmor":-1,"xenonColor":255,"modEngineBlock":-1,"modFrontBumper":2,"modHorns":-1,"modVanityPlate":-1,"model":872704284,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modTank":-1,"modDoorR":-1,"fuelLevel":23.7,"modSuspension":-1,"windowTint":1,"modPlateHolder":-1},"owner":"license:e3c24b068ffa7e28b8be7b4976da8cefa8c96ad8","stored":0}}', '{}', '{}', 0, 224000),
	(157, 'yakuza', 'yakuza', '{"BVES4223":{"owner":"license:494fdfe556944c151b5736b7dcfe691427e510c7","stored":0,"data":{"modHydrolic":-1,"windowTint":-1,"wheels":4,"modStruts":-1,"modLightbar":-1,"modAerials":-1,"modFrontBumper":-1,"modAirFilter":-1,"modLivery":-1,"modTank":-1,"modTransmission":-1,"modDashboard":-1,"modFrontWheels":-1,"modPlateHolder":-1,"bodyHealth":980.8,"tyreSmokeColor":[255,255,255],"modOrnaments":-1,"modHorns":-1,"modSuspension":-1,"pearlescentColor":134,"modSeats":-1,"plate":"BVES4223","neonEnabled":[false,false,false,false],"modVanityPlate":-1,"modBackWheels":-1,"modTurbo":false,"modXenon":false,"modGrille":-1,"color1":34,"modHood":-1,"modDoorSpeaker":-1,"modArchCover":-1,"modSideSkirt":-1,"modRoof":-1,"modExhaust":-1,"modRightFender":-1,"modTrimA":-1,"modAPlate":-1,"dirtLevel":12.7,"neonColor":[255,0,255],"doorsBroken":{"0":false,"2":false,"1":false,"4":false,"3":false},"tyreBurst":{"0":false,"1":false,"4":false,"5":false},"modEngine":-1,"modSteeringWheel":-1,"xenonColor":255,"modFrame":-1,"modSpeakers":-1,"modTrunk":-1,"modTrimB":-1,"wheelColor":0,"modArmor":-1,"modBrakes":-1,"modShifterLeavers":-1,"engineHealth":983.7,"tankHealth":995.3,"fuelLevel":65.0,"modEngineBlock":-1,"plateIndex":0,"modDial":-1,"modRearBumper":-1,"modSmokeEnabled":false,"modDoorR":-1,"model":67753863,"windowsBroken":{"0":false,"7":false,"2":true,"1":true,"4":true,"3":true,"6":false,"5":true},"modFender":-1,"color2":1,"extras":{"3":1,"2":1,"1":1},"modSpoilers":-1}}}', '{}', '{}', 0, 0),
	(159, 'peaky_blinders', 'Peaky Blinders', NULL, NULL, NULL, 0, 0),
	(160, 'zx_gang', 'ZX Gang', NULL, NULL, NULL, 0, 0),
	(161, 'hblock', 'HBlock', '[]', '[]', '[]', 0, 0),
	(162, '410th', '410Th', '{}', NULL, NULL, 0, 0),
	(163, 'cartel_de_medellin', 'Cartel de medellin', '[]', '[]', '[]', 0, 0),
	(164, 'burgershot', 'BurgerShot', '[]', '[]', '[]', 99849, 0),
	(165, 'les_fast', 'Les Fast', '{}', '{}', '{}', 0, 0),
	(166, 'justgod', 'JustGod', '[]', '[]', '[]', 0, 0),
	(168, 'brésilien', 'Brésilien', '{"QHNN3280":{"stored":0,"owner":"license:b6968adae92180e37b4b2df25e379a1bb64d0ffe","data":{"modSteeringWheel":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tyreSmokeColor":[255,255,255],"modFender":-1,"modTank":-1,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"windowTint":1,"plateIndex":1,"modRightFender":-1,"modLivery":-1,"modEngine":3,"color1":1,"modAerials":-1,"pearlescentColor":53,"neonColor":[0,0,0],"modPlateHolder":-1,"extras":[],"modRearBumper":-1,"modFrame":-1,"modSeats":-1,"modSideSkirt":-1,"modBrakes":-1,"modTrimB":-1,"modExhaust":-1,"bodyHealth":978.2,"modGrille":-1,"engineHealth":983.6,"modRoof":-1,"xenonColor":255,"fuelLevel":64.8,"modTrimA":-1,"modArmor":-1,"model":-291021213,"modHood":-1,"wheelColor":156,"modTurbo":1,"modAPlate":-1,"modSpoilers":-1,"modEngineBlock":-1,"tankHealth":997.8,"modDashboard":-1,"modSmokeEnabled":false,"modArchCover":-1,"modTransmission":2,"modXenon":false,"modSuspension":-1,"modShifterLeavers":-1,"modLightbar":-1,"modTrunk":-1,"modOrnaments":-1,"modStruts":-1,"dirtLevel":0.0,"modHorns":-1,"modFrontBumper":-1,"modDial":-1,"wheels":7,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modFrontWheels":0,"neonEnabled":[false,false,false,false],"color2":57,"modDoorSpeaker":-1,"plate":"QHNN3280","modHydrolic":-1,"modDoorR":-1,"modAirFilter":-1,"modSpeakers":-1}},"SGAE2324":{"stored":0,"owner":"license:db36c515374918125a95333152228a96b7b5f63c","data":{"modArchCover":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"modLightbar":-1,"modFender":-1,"modTank":-1,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":true,"7":true,"0":true,"1":true,"2":true,"3":false,"4":true,"5":true},"windowTint":1,"plateIndex":1,"modRightFender":6,"modLivery":1,"modEngine":3,"color1":15,"modAerials":-1,"pearlescentColor":125,"neonColor":[0,0,0],"modPlateHolder":-1,"extras":[],"modRearBumper":3,"modFrame":1,"modSeats":-1,"plate":"SGAE2324","modBrakes":2,"modTrimB":-1,"modExhaust":8,"bodyHealth":902.2,"modGrille":3,"engineHealth":955.4,"modRoof":1,"xenonColor":255,"fuelLevel":58.7,"modTrimA":-1,"modArmor":-1,"model":872704284,"modHood":10,"wheelColor":12,"modTurbo":1,"modAPlate":-1,"modSpoilers":9,"modEngineBlock":-1,"tankHealth":981.7,"modDashboard":-1,"modSmokeEnabled":false,"modAirFilter":-1,"modHorns":-1,"modHydrolic":-1,"modSuspension":3,"modShifterLeavers":-1,"dirtLevel":2.8,"modTrunk":-1,"modOrnaments":-1,"modXenon":false,"wheels":5,"modDoorSpeaker":-1,"modSideSkirt":3,"modDial":-1,"modTransmission":2,"doorsBroken":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":false},"modFrontWheels":0,"neonEnabled":[false,false,false,false],"color2":15,"tyreSmokeColor":[255,255,255],"modFrontBumper":4,"modStruts":-1,"modSteeringWheel":-1,"modDoorR":-1,"modSpeakers":-1}},"BDPJ0445":{"stored":0,"owner":"license:db36c515374918125a95333152228a96b7b5f63c","data":{"modSteeringWheel":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tyreSmokeColor":[255,255,255],"modFender":-1,"modTank":-1,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"windowTint":1,"plateIndex":0,"modRightFender":-1,"modLivery":-1,"modEngine":-1,"color1":12,"modAerials":-1,"pearlescentColor":57,"neonColor":[255,0,255],"modPlateHolder":-1,"extras":[],"modRearBumper":-1,"modFrame":-1,"modSeats":-1,"modSideSkirt":-1,"modBrakes":-1,"modTrimB":-1,"modExhaust":-1,"bodyHealth":963.0,"modGrille":-1,"engineHealth":983.0,"modRoof":-1,"xenonColor":255,"fuelLevel":65.0,"modTrimA":-1,"modArmor":-1,"model":872704284,"modHood":-1,"wheelColor":156,"modTurbo":false,"modAPlate":-1,"modSpoilers":-1,"modEngineBlock":-1,"tankHealth":996.0,"modDashboard":-1,"modSmokeEnabled":false,"modArchCover":-1,"modTransmission":-1,"modXenon":false,"modSuspension":-1,"modShifterLeavers":-1,"modLightbar":-1,"modTrunk":-1,"modOrnaments":-1,"modStruts":-1,"dirtLevel":0.0,"modHorns":-1,"modFrontBumper":-1,"modDial":-1,"wheels":5,"doorsBroken":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"modFrontWheels":-1,"neonEnabled":[false,false,false,false],"color2":50,"modDoorSpeaker":-1,"plate":"BDPJ0445","modHydrolic":-1,"modDoorR":-1,"modAirFilter":-1,"modSpeakers":-1}},"00KOF568":{"stored":0,"owner":"license:b6968adae92180e37b4b2df25e379a1bb64d0ffe","data":{"modSteeringWheel":-1,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"modFender":-1,"modTank":-1,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"windowTint":-1,"modTransmission":-1,"modRightFender":-1,"modLivery":-1,"modEngine":-1,"color1":0,"modAerials":-1,"pearlescentColor":2,"neonColor":[255,0,255],"modPlateHolder":-1,"extras":{"10":1,"11":false,"1":1,"2":1,"3":1,"4":1,"5":1},"modRearBumper":-1,"modFrame":-1,"modSeats":-1,"modSideSkirt":-1,"modBrakes":-1,"modTrimB":-1,"modExhaust":-1,"dirtLevel":3.0,"modGrille":-1,"modAirFilter":-1,"modRoof":-1,"xenonColor":255,"fuelLevel":64.8,"modTrimA":-1,"modArmor":-1,"model":-304802106,"modHood":-1,"wheelColor":156,"modTurbo":false,"modSmokeEnabled":false,"modSpoilers":-1,"modEngineBlock":-1,"tankHealth":1000.0,"modDashboard":-1,"modAPlate":-1,"modLightbar":-1,"modXenon":false,"modStruts":-1,"modSuspension":-1,"modShifterLeavers":-1,"modFrontBumper":-1,"modTrunk":-1,"bodyHealth":1000.0,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"modDoorSpeaker":-1,"wheels":0,"modArchCover":-1,"modDial":-1,"engineHealth":1000.0,"doorsBroken":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"modFrontWheels":-1,"modHorns":-1,"color2":0,"plateIndex":0,"neonEnabled":[false,false,false,false],"modHydrolic":-1,"plate":"00KOF568","modDoorR":-1,"modSpeakers":-1}},"KGSA8752":{"stored":0,"owner":"license:b6968adae92180e37b4b2df25e379a1bb64d0ffe","data":{"modSteeringWheel":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tyreSmokeColor":[255,255,255],"modFender":-1,"modTank":-1,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":false,"7":true,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"windowTint":1,"plateIndex":0,"modRightFender":-1,"modLivery":-1,"modEngine":-1,"color1":12,"modAerials":-1,"pearlescentColor":53,"neonColor":[255,0,255],"modPlateHolder":-1,"extras":{"2":1,"1":false},"modRearBumper":-1,"modFrame":-1,"modSeats":-1,"modSideSkirt":-1,"modBrakes":-1,"modTrimB":-1,"modExhaust":-1,"bodyHealth":1000.0,"modGrille":-1,"engineHealth":1000.0,"modRoof":-1,"xenonColor":255,"fuelLevel":63.5,"modTrimA":-1,"modArmor":-1,"model":-1244461404,"modHood":-1,"wheelColor":156,"modTurbo":false,"modAPlate":-1,"modSpoilers":-1,"modEngineBlock":-1,"tankHealth":1000.0,"modDashboard":-1,"modSmokeEnabled":false,"modArchCover":-1,"modTransmission":-1,"modXenon":false,"modSuspension":-1,"modShifterLeavers":-1,"modLightbar":-1,"modTrunk":-1,"modOrnaments":-1,"modStruts":-1,"dirtLevel":0.0,"modHorns":-1,"modFrontBumper":-1,"modDial":-1,"wheels":7,"doorsBroken":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"modFrontWheels":0,"neonEnabled":[false,false,false,false],"color2":12,"modDoorSpeaker":-1,"plate":"KGSA8752","modHydrolic":-1,"modDoorR":-1,"modAirFilter":-1,"modSpeakers":-1}},"TNAW8338":{"stored":0,"owner":"license:db36c515374918125a95333152228a96b7b5f63c","data":{"modSteeringWheel":15,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"tyreSmokeColor":[255,255,255],"modFender":0,"modTank":0,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"windowTint":1,"plateIndex":0,"modRightFender":-1,"modLivery":-1,"modEngine":3,"color1":12,"modAerials":5,"pearlescentColor":57,"neonColor":[255,0,255],"modPlateHolder":-1,"extras":[],"modRearBumper":12,"modFrame":4,"modSeats":13,"modSideSkirt":17,"modBrakes":2,"modTrimB":-1,"modExhaust":7,"bodyHealth":985.0,"modGrille":2,"engineHealth":989.0,"modRoof":-1,"xenonColor":255,"fuelLevel":64.6,"modTrimA":-1,"modArmor":-1,"model":426742808,"modHood":14,"wheelColor":0,"modTurbo":1,"modAPlate":-1,"modSpoilers":21,"modEngineBlock":3,"tankHealth":995.0,"modDashboard":3,"modSmokeEnabled":false,"modArchCover":3,"modTransmission":2,"modXenon":false,"modSuspension":-1,"modShifterLeavers":-1,"modLightbar":-1,"modTrunk":-1,"modOrnaments":-1,"modStruts":15,"dirtLevel":0.1,"modHorns":-1,"modFrontBumper":3,"modDial":5,"wheels":5,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modFrontWheels":3,"neonEnabled":[false,false,false,false],"color2":12,"modDoorSpeaker":5,"plate":"TNAW8338","modHydrolic":-1,"modDoorR":-1,"modAirFilter":24,"modSpeakers":-1}},"EBKM5093":{"stored":0,"owner":"license:db36c515374918125a95333152228a96b7b5f63c","data":{"modArchCover":-1,"modOrnaments":6,"modLightbar":-1,"modFender":0,"modTank":-1,"modVanityPlate":-1,"modBackWheels":-1,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"windowTint":1,"plateIndex":1,"modRightFender":-1,"modLivery":-1,"modEngine":3,"color1":12,"modAerials":0,"pearlescentColor":53,"neonColor":[255,5,190],"modPlateHolder":-1,"extras":[],"modRearBumper":7,"modFrame":4,"modSeats":13,"plate":"EBKM5093","modBrakes":2,"modTrimB":-1,"modExhaust":-1,"bodyHealth":935.7,"modGrille":-1,"engineHealth":998.0,"modRoof":1,"xenonColor":6,"fuelLevel":27.8,"modTrimA":-1,"modArmor":-1,"model":-295689028,"modHood":8,"wheelColor":12,"modTurbo":1,"modAPlate":-1,"modSpoilers":9,"modEngineBlock":3,"tankHealth":999.9,"modDashboard":4,"modSmokeEnabled":false,"modHydrolic":-1,"modAirFilter":-1,"modHorns":-1,"modSuspension":3,"modShifterLeavers":-1,"modFrontBumper":14,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":6,"wheels":0,"dirtLevel":0.8,"modSideSkirt":3,"modDial":4,"modTransmission":2,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modFrontWheels":10,"neonEnabled":[1,1,1,1],"color2":12,"modXenon":1,"tyreBurst":{"5":false,"0":false,"4":false,"1":false},"modStruts":-1,"modSteeringWheel":5,"modDoorR":-1,"modSpeakers":-1}}}', '{"clip":{"name":"clip","label":"Chargeur","count":8}}', '{"WEAPON_PISTOL50":[{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":550,"components":[]}]}', 0, 259682),
	(169, 'the_lost_mc', 'The Lost MC', '{"CFZD8602":{"data":{"plate":"CFZD8602","pearlescentColor":28,"windowsBroken":{"5":true,"6":true,"7":true,"0":true,"1":true,"2":false,"3":true,"4":true},"modRoof":-1,"modHood":-1,"plateIndex":5,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modDoorR":-1,"modLightbar":-1,"modHydrolic":-1,"wheels":4,"modAirFilter":-1,"modTrimB":-1,"modTransmission":-1,"color2":12,"modBrakes":-1,"modDial":-1,"modDashboard":-1,"modHorns":-1,"bodyHealth":827.0,"windowTint":1,"tankHealth":982.0,"engineHealth":871.0,"modFrontWheels":5,"doorsBroken":{"5":false,"0":false,"1":false,"2":false,"3":false,"4":false},"modAerials":-1,"modSteeringWheel":-1,"modLivery":-1,"modTrunk":-1,"modPlateHolder":-1,"fuelLevel":85.7,"modAPlate":-1,"extras":{"12":false,"11":false,"10":false},"modStruts":-1,"modExhaust":-1,"modFrontBumper":-1,"modTrimA":-1,"modTank":-1,"modSuspension":-1,"modSmokeEnabled":false,"modSeats":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modRightFender":-1,"modVanityPlate":-1,"modDoorSpeaker":-1,"wheelColor":0,"modEngineBlock":-1,"neonColor":[255,0,255],"modXenon":false,"modFrame":-1,"modEngine":-1,"modSideSkirt":-1,"modTurbo":false,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"modSpeakers":-1,"modFender":-1,"modRearBumper":-1,"modArchCover":-1,"tyreSmokeColor":[255,255,255],"model":-1745203402,"color1":12,"xenonColor":255,"dirtLevel":1.0,"modSpoilers":-1,"modArmor":-1},"stored":1,"owner":"license:35b9ba091799db56ce9723307e13184587256ad5"}}', '{"weed_pooch":{"name":"weed_pooch","count":3,"label":"Pochon de weed"},"meth_pooch":{"name":"meth_pooch","count":2,"label":"Pochon de meth"},"meth":{"name":"meth","count":2,"label":"Meth"},"coke":{"name":"coke","count":7,"label":"Coke"},"opium_pooch":{"name":"opium_pooch","count":2,"label":"Pochon d\'opium"},"weed":{"name":"weed","count":7,"label":"Weed"}}', '{"WEAPON_SNSPISTOL":[{"components":[],"ammo":1,"name":"WEAPON_SNSPISTOL","label":"Pistolet sns"}],"WEAPON_KNIFE":[{"components":[],"name":"WEAPON_KNIFE","label":"Couteau","ammo":1}],"WEAPON_MACHETE":[{"components":[],"name":"WEAPON_MACHETE","label":"Machette","ammo":1},{"components":[],"name":"WEAPON_MACHETE","label":"Machette","ammo":1}]}', 0, 52451),
	(171, 'gophone', 'GoPhone', '{}', '{}', '{}', 82, 0),
	(172, 'gamer_planet', 'Gamer Planet', '{"ANJJ0444":{"owner":"license:ea362f1ed94048be514dd69d8164ecf5f6b211ef","data":{"pearlescentColor":55,"wheelColor":12,"modDial":-1,"modEngine":3,"modTank":-1,"modRightFender":-1,"modArmor":-1,"modDashboard":-1,"modOrnaments":-1,"modBackWheels":-1,"engineHealth":996.0,"plateIndex":4,"modLivery":-1,"tyreSmokeColor":[255,255,255],"modExhaust":0,"modFrontWheels":0,"extras":[],"modBrakes":2,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modTrimA":-1,"modAirFilter":-1,"modSpoilers":-1,"modArchCover":-1,"modFender":-1,"modFrame":-1,"wheels":7,"modXenon":1,"modSteeringWheel":-1,"modTransmission":2,"windowsBroken":{"7":false,"0":false,"5":true,"6":true,"3":true,"4":true,"1":false,"2":true},"modFrontBumper":5,"windowTint":1,"modGrille":-1,"modSeats":-1,"plate":"ANJJ0444","modTrimB":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"modHood":1,"modLightbar":-1,"color1":120,"modAPlate":-1,"modSideSkirt":-1,"modPlateHolder":-1,"neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"modHydrolic":-1,"doorsBroken":{"0":false,"3":false,"4":false,"1":false,"2":false},"modRearBumper":1,"xenonColor":5,"dirtLevel":1.7,"model":-2120700196,"bodyHealth":814.0,"color2":89,"modSuspension":3,"modEngineBlock":-1,"modStruts":-1,"fuelLevel":61.7,"modRoof":-1,"modDoorSpeaker":-1,"modShifterLeavers":-1,"modHorns":-1,"modAerials":-1,"tankHealth":981.0,"modTrunk":-1,"modSpeakers":-1,"modTurbo":1,"modDoorR":-1},"stored":0},"43EEO079":{"owner":"license:b754f5f908d5750f838dc62c60ed7904a6b609a3","data":{"pearlescentColor":29,"wheelColor":0,"modDial":-1,"modEngine":3,"modTank":-1,"modRightFender":-1,"neonEnabled":[false,false,false,false],"modDashboard":-1,"modOrnaments":-1,"modBackWheels":-1,"engineHealth":984.2,"plateIndex":0,"modLivery":-1,"tyreSmokeColor":[255,255,255],"modExhaust":1,"modStruts":-1,"extras":[],"modRoof":-1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modTrimA":-1,"modAirFilter":-1,"modSpoilers":-1,"modArchCover":-1,"modFender":-1,"modFrame":-1,"wheels":0,"modXenon":1,"dirtLevel":1.9,"modTransmission":2,"windowsBroken":{"7":false,"0":false,"5":true,"6":false,"3":true,"4":true,"1":false,"2":true},"modFrontBumper":0,"windowTint":1,"modGrille":-1,"modSeats":-1,"plate":"43EEO079","modTrimB":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"tankHealth":994.4,"modLightbar":-1,"color1":15,"modDoorSpeaker":-1,"modSideSkirt":-1,"modShifterLeavers":-1,"modTurbo":1,"color2":15,"modPlateHolder":-1,"doorsBroken":{"3":false,"0":false,"1":false,"2":false},"modEngineBlock":-1,"modRearBumper":0,"modAPlate":-1,"model":1663218586,"modHood":0,"bodyHealth":928.2,"modSpeakers":-1,"modSuspension":-1,"modArmor":-1,"neonColor":[255,0,255],"modBrakes":2,"modFrontWheels":8,"xenonColor":8,"modHorns":57,"modAerials":-1,"modSteeringWheel":-1,"modTrunk":-1,"fuelLevel":54.5,"modHydrolic":-1,"modDoorR":-1},"stored":1}}', NULL, NULL, 0, 0),
	(173, 'la_famille_brabus', 'La Famille Brabus', '{"NTPN9586":{"data":{"modSeats":-1,"engineHealth":1000.0,"modLivery":-1,"modDoorR":-1,"neonEnabled":[false,false,false,false],"modHydrolic":-1,"modEngineBlock":-1,"wheelColor":156,"modSuspension":-1,"windowsBroken":{"7":false,"0":false,"5":false,"6":false,"3":false,"4":false,"1":false,"2":false},"plate":"NTPN9586","pearlescentColor":1,"modPlateHolder":-1,"modFender":-1,"modExhaust":-1,"wheels":0,"modRearBumper":-1,"modTank":-1,"modHorns":-1,"modOrnaments":-1,"modSmokeEnabled":false,"extras":[],"modRightFender":-1,"modEngine":-1,"modShifterLeavers":-1,"bodyHealth":995.7,"modTurbo":false,"modAPlate":-1,"modStruts":-1,"xenonColor":255,"modSideSkirt":-1,"modArchCover":-1,"modDashboard":-1,"modAerials":-1,"model":1203490606,"modSpoilers":-1,"neonColor":[255,0,255],"modFrontWheels":52,"modSteeringWheel":-1,"color2":1,"modVanityPlate":-1,"modTrimA":-1,"modHood":-1,"modBrakes":-1,"modArmor":-1,"modAirFilter":-1,"modSpeakers":-1,"modLightbar":-1,"plateIndex":0,"modTrunk":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"doorsBroken":{"0":false,"5":false,"6":false,"3":false,"4":false,"1":false,"2":false},"dirtLevel":9.1,"modDial":-1,"modFrontBumper":-1,"tankHealth":997.9,"modGrille":-1,"modRoof":-1,"fuelLevel":81.0,"modDoorSpeaker":-1,"modTrimB":-1,"modXenon":false,"color1":23,"tyreBurst":{"1":false,"0":false,"5":false,"4":false},"windowTint":1,"modTransmission":-1,"modFrame":-1},"stored":0,"owner":"license:1279e1b5d11060b8552e89da7339a7c02493b0ca"},"JFWG4023":{"data":{"modFrame":-1,"engineHealth":1000.0,"modLivery":-1,"modDoorR":-1,"neonEnabled":[false,false,false,false],"modHydrolic":-1,"modEngineBlock":-1,"wheelColor":156,"modSuspension":-1,"windowsBroken":{"7":false,"0":false,"5":false,"6":false,"3":true,"4":false,"1":true,"2":true},"plate":"JFWG4023","pearlescentColor":1,"modPlateHolder":-1,"modXenon":false,"modExhaust":-1,"wheels":0,"modRearBumper":-1,"modTank":-1,"modFrontBumper":-1,"modOrnaments":-1,"modSmokeEnabled":false,"extras":{"10":1},"modRightFender":-1,"modEngine":-1,"modShifterLeavers":-1,"bodyHealth":1000.0,"modTurbo":false,"modAPlate":-1,"modStruts":-1,"xenonColor":255,"modSideSkirt":-1,"modArchCover":-1,"modDashboard":-1,"modAerials":-1,"model":1269098716,"color2":22,"neonColor":[255,0,255],"modFrontWheels":52,"modSteeringWheel":-1,"modTrunk":-1,"modGrille":-1,"modTrimA":-1,"modHood":-1,"modBrakes":-1,"modArmor":-1,"modAirFilter":-1,"modSpeakers":-1,"modLightbar":-1,"plateIndex":0,"color1":22,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"doorsBroken":{"0":false,"5":false,"6":false,"3":false,"4":false,"1":false,"2":false},"dirtLevel":1.4,"modSpoilers":-1,"modHorns":-1,"tankHealth":1000.0,"modRoof":0,"modVanityPlate":-1,"fuelLevel":50.1,"windowTint":1,"modTrimB":-1,"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"modDoorSpeaker":-1,"modFender":-1,"modDial":-1,"modTransmission":-1,"modSeats":-1},"stored":0,"owner":"license:1b84f4a614c7a8be0627843364c8c6db108bdfbb"}}', '{}', '{}', 0, 0),
	(174, 'mine_dlcx', 'Mine DLCX', '{}', '{}', '{}', 370, 0),
	(175, 'bmf', 'BMF', '{"JVYT4062":{"stored":0,"data":{"modAirFilter":-1,"doorsBroken":{"3":false,"4":false,"1":false,"2":false,"0":false},"modSideSkirt":-1,"modFender":-1,"modHood":1,"modLightbar":-1,"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"modArmor":-1,"modFrontWheels":-1,"modGrille":-1,"modBrakes":-1,"modDial":-1,"modSpoilers":-1,"modSpeakers":-1,"windowsBroken":{"3":true,"4":false,"1":true,"2":true,"7":true,"0":true,"5":false,"6":false},"modRoof":-1,"modArchCover":-1,"modTrimA":-1,"modTrunk":-1,"color2":21,"modSuspension":-1,"modEngineBlock":-1,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"modFrame":-1,"fuelLevel":60.7,"modSteeringWheel":0,"modAerials":-1,"modDoorSpeaker":-1,"modVanityPlate":1,"modSmokeEnabled":false,"plateIndex":0,"modFrontBumper":0,"tankHealth":1000.0,"xenonColor":255,"engineHealth":999.0,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"wheels":1,"plate":"JVYT4062","modDashboard":-1,"modStruts":-1,"modBackWheels":-1,"modDoorR":-1,"modXenon":false,"extras":{"3":false,"1":1,"2":false},"color1":21,"windowTint":-1,"modTank":-1,"modPlateHolder":2,"modEngine":-1,"model":-1361687965,"modTurbo":false,"modRightFender":-1,"modSeats":-1,"modAPlate":-1,"wheelColor":88,"modRearBumper":0,"bodyHealth":989.0,"modShifterLeavers":5,"neonColor":[255,0,255],"modExhaust":0,"modTransmission":-1,"modLivery":0,"dirtLevel":4.0,"modOrnaments":0,"pearlescentColor":21},"owner":"license:528bbb64b2dc6035db0031d19605639baae0f235"},"ZQPN8005":{"stored":0,"data":{"modAirFilter":-1,"doorsBroken":{"3":false,"4":false,"1":false,"2":false,"0":false,"5":false,"6":false},"modSideSkirt":-1,"modFender":-1,"modHood":-1,"modLightbar":-1,"tyreBurst":{"1":false,"0":false,"5":false,"4":false},"modArmor":-1,"modFrontWheels":-1,"modGrille":-1,"modBrakes":2,"modDial":-1,"modTransmission":2,"modSpeakers":-1,"windowsBroken":{"3":false,"4":true,"1":false,"2":false,"7":false,"0":false,"5":true,"6":false},"modRoof":-1,"modArchCover":-1,"modTrimA":-1,"modTrunk":-1,"color2":12,"modSuspension":3,"modEngineBlock":-1,"modHydrolic":-1,"color1":12,"modBackWheels":-1,"modFrame":-1,"fuelLevel":25.0,"modSteeringWheel":-1,"modAerials":-1,"modDoorSpeaker":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"plateIndex":1,"modFrontBumper":-1,"tankHealth":990.7,"xenonColor":255,"engineHealth":981.3,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"wheels":3,"plate":"ZQPN8005","modDashboard":-1,"neonEnabled":[false,false,false,false],"modStruts":-1,"modDoorR":-1,"modXenon":1,"extras":{"11":1,"12":false},"dirtLevel":15.0,"neonColor":[255,0,255],"modTank":-1,"modPlateHolder":-1,"modEngine":3,"model":-394074634,"modSpoilers":-1,"modRightFender":-1,"windowTint":1,"modAPlate":-1,"wheelColor":156,"modTurbo":1,"modRearBumper":-1,"bodyHealth":971.5,"modSeats":-1,"modShifterLeavers":-1,"modExhaust":1,"modLivery":-1,"modHorns":-1,"modOrnaments":-1,"pearlescentColor":0},"owner":"license:2fea8263fd88c4c327c3756017b8aca311d92a7b"},"RMYO1274":{"stored":0,"data":{"modAirFilter":0,"doorsBroken":{"3":false,"4":false,"1":false,"2":false,"0":false},"modSideSkirt":2,"modFender":0,"modHood":5,"modLightbar":-1,"tyreBurst":{"1":true,"4":false,"5":false,"0":false},"modArmor":-1,"modFrontWheels":-1,"modGrille":6,"modBrakes":2,"modDial":4,"modSpoilers":3,"modSpeakers":-1,"windowsBroken":{"3":true,"4":true,"1":false,"2":true,"7":true,"0":true,"5":true,"6":true},"modRoof":-1,"modArchCover":0,"modTrimA":-1,"modTrunk":0,"color2":15,"modSuspension":3,"modEngineBlock":3,"modHydrolic":-1,"color1":15,"modBackWheels":-1,"modFrame":2,"fuelLevel":64.9,"modSteeringWheel":4,"modAerials":2,"modDoorSpeaker":0,"modVanityPlate":-1,"modSmokeEnabled":false,"plateIndex":0,"modFrontBumper":13,"tankHealth":1000.0,"xenonColor":255,"engineHealth":1000.0,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"wheels":4,"plate":"RMYO1274","modDashboard":-1,"neonEnabled":[false,false,false,false],"modStruts":-1,"modDoorR":-1,"modXenon":false,"extras":{"3":1,"1":1,"2":1},"dirtLevel":1.1,"windowTint":1,"modHorns":-1,"modPlateHolder":-1,"modTank":9,"model":67753863,"modTurbo":1,"modRightFender":13,"modEngine":3,"modAPlate":-1,"wheelColor":0,"modRearBumper":0,"bodyHealth":1000.0,"modSeats":0,"modShifterLeavers":9,"neonColor":[255,0,255],"modTransmission":2,"modLivery":9,"modExhaust":3,"modOrnaments":-1,"pearlescentColor":21},"owner":"license:2fea8263fd88c4c327c3756017b8aca311d92a7b"}}', '{"coke":{"count":25,"name":"coke","label":"Coke"},"opium":{"count":116,"name":"opium","label":"Opium"},"meth_pooch":{"count":54,"name":"meth_pooch","label":"Pochon de meth"},"weed":{"count":2,"name":"weed","label":"Weed"},"meth":{"count":18,"name":"meth","label":"Meth"}}', '{}', 0, 0),
	(177, 'gs9', 'GS9', '{"XZEN4110":{"stored":0,"data":{"modHorns":-1,"modRightFender":-1,"modDoorR":-1,"modFrame":-1,"fuelLevel":79.8,"modDial":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modSteeringWheel":-1,"color2":12,"plateIndex":1,"modRoof":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"extras":[],"modTurbo":1,"modEngine":3,"bodyHealth":975.0,"wheelColor":11,"modFrontWheels":4,"modSpoilers":-1,"modTrunk":-1,"modSmokeEnabled":false,"tankHealth":995.0,"modAPlate":-1,"color1":12,"modFender":4,"modVanityPlate":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"modRearBumper":-1,"modSideSkirt":6,"modTransmission":2,"windowsBroken":{"6":false,"7":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"wheels":7,"modExhaust":1,"modBackWheels":-1,"windowTint":1,"modArchCover":-1,"modStruts":-1,"modTrimA":-1,"modArmor":-1,"modShifterLeavers":-1,"modSuspension":-1,"modLivery":9,"modOrnaments":-1,"dirtLevel":0.0,"modDoorSpeaker":-1,"modBrakes":2,"modHydrolic":-1,"modFrontBumper":4,"modEngineBlock":-1,"modTrimB":-1,"modDashboard":-1,"pearlescentColor":5,"modLightbar":-1,"modAirFilter":-1,"modHood":-1,"plate":"XZEN4110","xenonColor":255,"modXenon":false,"engineHealth":995.0,"neonColor":[0,0,0],"doorsBroken":{"6":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"model":83136452,"modSeats":-1,"modTank":-1},"owner":"license:38003148281b2410c8c3998efec6db9422876a98"},"VDIC5827":{"stored":0,"data":{"modHorns":-1,"modRightFender":-1,"modDoorR":-1,"modFrame":-1,"fuelLevel":44.2,"modDial":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modSteeringWheel":-1,"color2":0,"plateIndex":3,"modRoof":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"extras":{"11":1,"12":false},"modAirFilter":-1,"modEngine":-1,"bodyHealth":0.0,"modTrimB":-1,"modLivery":-1,"modSpoilers":-1,"modTrunk":-1,"modSmokeEnabled":false,"tankHealth":990.8,"modAPlate":-1,"color1":8,"modFender":-1,"modVanityPlate":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"modRearBumper":-1,"modSideSkirt":-1,"modTransmission":-1,"windowsBroken":{"6":true,"7":true,"4":true,"5":true,"2":true,"3":true,"0":true,"1":true},"wheels":0,"modExhaust":-1,"modBackWheels":-1,"windowTint":1,"modArchCover":-1,"modStruts":-1,"modTrimA":-1,"modArmor":-1,"modShifterLeavers":-1,"modSuspension":-1,"modHood":-1,"modSeats":-1,"modDoorSpeaker":-1,"dirtLevel":10.4,"modBrakes":-1,"modHydrolic":-1,"modFrontWheels":-1,"modEngineBlock":-1,"modXenon":false,"modDashboard":-1,"pearlescentColor":131,"modLightbar":-1,"doorsBroken":{"6":false,"4":false,"5":false,"2":true,"3":false,"0":false,"1":false},"modFrontBumper":-1,"plate":"VDIC5827","xenonColor":255,"neonColor":[255,0,255],"engineHealth":533.0,"modTurbo":false,"model":1348744438,"modOrnaments":-1,"wheelColor":156,"modTank":-1},"owner":"license:d965fe47b4cc48b189d7ca62e3989687d304eb00"},"49OEU595":{"stored":0,"data":{"modHorns":-1,"modRightFender":-1,"modDoorR":-1,"modFrame":-1,"fuelLevel":57.1,"modDial":-1,"tyreBurst":{"0":false,"1":false,"4":false,"5":false},"modSteeringWheel":-1,"color2":15,"plateIndex":1,"modRoof":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"extras":{"11":false,"10":false,"4":false,"5":false,"2":false,"3":false,"1":false},"modTurbo":1,"modEngine":-1,"bodyHealth":624.0,"wheelColor":12,"modFrontWheels":10,"modSpoilers":-1,"modTrunk":-1,"modSmokeEnabled":false,"tankHealth":1000.0,"modAPlate":-1,"color1":15,"modFender":-1,"modVanityPlate":-1,"modGrille":-1,"modSpeakers":-1,"modOrnaments":-1,"modPlateHolder":-1,"modRearBumper":0,"modSideSkirt":0,"modTransmission":-1,"windowsBroken":{"6":false,"7":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"wheels":7,"modExhaust":0,"modBackWheels":-1,"windowTint":1,"modArchCover":-1,"modStruts":-1,"modTrimA":-1,"modArmor":-1,"modShifterLeavers":-1,"modSuspension":-1,"modLivery":-1,"modSeats":-1,"dirtLevel":0.6,"modDoorSpeaker":-1,"modBrakes":-1,"modHydrolic":-1,"modFrontBumper":0,"modEngineBlock":-1,"modTrimB":-1,"modDashboard":-1,"pearlescentColor":132,"modLightbar":-1,"modAirFilter":-1,"modHood":-1,"plate":"49OEU595","xenonColor":255,"modXenon":1,"engineHealth":1000.0,"doorsBroken":{"6":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"neonColor":[255,0,255],"model":-304802106,"neonEnabled":[false,false,false,false],"modTank":-1},"owner":"license:38003148281b2410c8c3998efec6db9422876a98"},"45OQF187":{"stored":0,"data":{"modHorns":-1,"modRightFender":-1,"modDoorR":-1,"modFrame":4,"fuelLevel":52.9,"modDial":2,"tyreBurst":{"0":false,"1":false,"4":false,"5":false},"modSteeringWheel":15,"modDoorSpeaker":2,"plateIndex":1,"modRoof":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"extras":[],"modTurbo":false,"modEngine":3,"bodyHealth":771.0,"wheelColor":0,"modFrontWheels":9,"modSpoilers":-1,"modTrunk":-1,"modSmokeEnabled":false,"tankHealth":960.7,"modAPlate":-1,"color1":1,"modFender":5,"modVanityPlate":-1,"modGrille":2,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"modRearBumper":0,"modSideSkirt":-1,"modTransmission":2,"windowsBroken":{"6":false,"7":false,"4":true,"5":true,"2":false,"3":false,"0":false,"1":true},"wheels":7,"modExhaust":-1,"modBackWheels":-1,"windowTint":1,"modArchCover":-1,"modStruts":-1,"modTrimA":-1,"modArmor":-1,"modShifterLeavers":-1,"modSuspension":-1,"modTrimB":-1,"modOrnaments":0,"modLivery":-1,"modSeats":13,"modHydrolic":-1,"dirtLevel":15.0,"color2":1,"modFrontBumper":14,"modBrakes":-1,"modDashboard":4,"pearlescentColor":4,"modHood":8,"modLightbar":-1,"modEngineBlock":-1,"plate":"45OQF187","xenonColor":255,"modAirFilter":-1,"engineHealth":708.1,"doorsBroken":{"4":true,"2":false,"3":false,"0":false,"1":false},"neonColor":[255,0,255],"model":-295689028,"modXenon":1,"modTank":-1},"owner":"license:38003148281b2410c8c3998efec6db9422876a98"},"VHKG2356":{"stored":0,"data":{"modHorns":-1,"modRightFender":-1,"modDoorR":-1,"modFrame":-1,"fuelLevel":61.2,"modDial":-1,"tyreBurst":{"0":false,"5":false,"4":false,"1":false},"modSteeringWheel":-1,"modDoorSpeaker":-1,"plateIndex":3,"modRoof":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"extras":{"11":false,"10":false},"modTurbo":false,"modEngine":-1,"bodyHealth":1000.0,"modTrimB":-1,"modLivery":-1,"modSpoilers":-1,"modTrunk":-1,"modSmokeEnabled":false,"tankHealth":1000.0,"modAPlate":-1,"color1":5,"modFender":-1,"modVanityPlate":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"modRearBumper":-1,"modSideSkirt":-1,"modTransmission":-1,"windowsBroken":{"6":false,"7":false,"4":true,"5":true,"2":false,"3":false,"0":false,"1":false},"wheels":0,"modExhaust":-1,"modBackWheels":-1,"windowTint":-1,"modArchCover":-1,"modStruts":-1,"modTrimA":-1,"modArmor":-1,"modShifterLeavers":-1,"modSuspension":-1,"modHood":-1,"modOrnaments":-1,"modSeats":-1,"dirtLevel":9.3,"modBrakes":-1,"modHydrolic":-1,"modAirFilter":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modDashboard":-1,"pearlescentColor":111,"modLightbar":-1,"color2":0,"doorsBroken":{"6":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"plate":"VHKG2356","xenonColor":255,"modFrontWheels":-1,"engineHealth":1000.0,"model":886934177,"neonColor":[255,0,255],"modXenon":false,"wheelColor":156,"modTank":-1},"owner":"license:c4f08a5ac4b65f36b6c05960b2da47a3757049a7"}}', '{"opium":{"label":"Opium","name":"opium","count":115},"opium_pooch":{"label":"Pochon d\'opium","name":"opium_pooch","count":35},"meth":{"label":"Meth","name":"meth","count":17},"vine":{"label":"Bouteille de Vin","name":"vine","count":2},"coke_pooch":{"label":"Pochon de coke","name":"coke_pooch","count":3},"mojito":{"label":"Mojito","name":"mojito","count":2},"coke":{"label":"Coke","name":"coke","count":1}}', '{}', 629, 12346),
	(179, 'fib', 'FIB', '[]', '{"phone":{"count":2,"label":"Téléphone","name":"phone"},"opium":{"count":1,"label":"Opium","name":"opium"},"weed_pooch":{"count":14,"label":"Pochon de weed","name":"weed_pooch"},"meth_pooch":{"count":37,"label":"Pochon de meth","name":"meth_pooch"},"coke_pooch":{"count":27,"label":"Pochon de coke","name":"coke_pooch"},"coke":{"count":6,"label":"Coke","name":"coke"},"meth":{"count":65,"label":"Meth","name":"meth"},"weed":{"count":12,"label":"Weed","name":"weed"},"opium_pooch":{"count":255,"label":"Pochon d\'opium","name":"opium_pooch"},"lsd_pooch":{"count":42,"label":"Pochon de LSD","name":"lsd_pooch"}}', '{}', 4606744, 0),
	(180, 'off-white', 'Off-White', '{}', NULL, '{}', 0, 0),
	(181, 'blackout', 'BlackOut', '{"BTOZ5320":{"stored":0,"owner":"license:a33f809db73cda09b61cad8dc253b42744f91edf","data":{"modFrame":-1,"modSuspension":-1,"fuelLevel":62.7,"modArmor":-1,"modTransmission":-1,"modSpoilers":-1,"wheels":1,"plate":"BTOZ5320","modSideSkirt":-1,"bodyHealth":834.7,"modRearBumper":-1,"modArchCover":-1,"modHood":-1,"modAerials":-1,"tyreBurst":{"0":false,"4":false,"1":false,"5":false},"model":1871995513,"modSpeakers":-1,"neonColor":[0,0,0],"modTrimA":-1,"modGrille":-1,"modLivery":-1,"modStruts":-1,"tyreSmokeColor":[255,255,255],"xenonColor":255,"modTrunk":-1,"modBackWheels":-1,"modOrnaments":-1,"modDashboard":-1,"modHydrolic":-1,"modXenon":false,"modSeats":-1,"extras":[],"dirtLevel":9.0,"modSmokeEnabled":false,"wheelColor":0,"modFender":-1,"tankHealth":935.4,"modLightbar":-1,"modTank":-1,"pearlescentColor":134,"modPlateHolder":-1,"modAPlate":-1,"modShifterLeavers":-1,"modEngineBlock":-1,"modTurbo":false,"modVanityPlate":-1,"modHorns":-1,"modAirFilter":-1,"modRightFender":-1,"modTrimB":-1,"modBrakes":-1,"neonEnabled":[false,false,false,false],"modEngine":-1,"windowsBroken":{"0":false,"7":false,"2":true,"1":false,"4":true,"3":true,"6":false,"5":true},"modFrontBumper":-1,"color2":1,"plateIndex":0,"modDoorR":-1,"windowTint":-1,"modExhaust":-1,"color1":34,"modDoorSpeaker":-1,"modSteeringWheel":-1,"modFrontWheels":-1,"modDial":-1,"doorsBroken":{"0":false,"2":false,"1":false,"4":false,"3":false},"modRoof":-1,"engineHealth":983.0}},"INSV1923":{"stored":1,"data":{"engineHealth":483.8,"modSuspension":-1,"fuelLevel":89.6,"modArmor":-1,"modEngine":-1,"modSpoilers":-1,"wheels":7,"modRoof":-1,"modSideSkirt":-1,"bodyHealth":0.0,"modRearBumper":-1,"modTank":-1,"modHood":-1,"modAerials":-1,"modExhaust":-1,"model":-1540373595,"modSpeakers":-1,"neonColor":[255,0,255],"modTrimA":-1,"modGrille":-1,"plateIndex":0,"modStruts":-1,"tyreSmokeColor":[255,255,255],"xenonColor":255,"modTrunk":-1,"modBackWheels":-1,"modFrontWheels":-1,"modDashboard":-1,"modHydrolic":-1,"modXenon":false,"modSeats":-1,"extras":[],"dirtLevel":15.0,"modSmokeEnabled":false,"wheelColor":3,"modFender":-1,"tankHealth":961.8,"modLightbar":-1,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"modAPlate":-1,"pearlescentColor":127,"modEngineBlock":-1,"modFrame":-1,"modVanityPlate":-1,"modHorns":-1,"modShifterLeavers":-1,"modSteeringWheel":-1,"modArchCover":-1,"modTransmission":-1,"modBrakes":-1,"modAirFilter":-1,"windowsBroken":{"0":true,"7":true,"2":true,"1":false,"4":true,"3":true,"6":false,"5":true},"color2":0,"modLivery":-1,"tyreBurst":{"4":false,"1":false,"0":false,"5":false},"modDoorR":-1,"windowTint":-1,"modTrimB":-1,"color1":71,"modDoorSpeaker":-1,"modRightFender":-1,"plate":"INSV1923","modDial":-1,"doorsBroken":{"0":false,"2":false,"1":false,"4":true,"3":false},"modTurbo":false,"modFrontBumper":-1},"owner":"license:fa2fa60087460c9dbdacbf338135c32ff89a6d20"},"WSIX1028":{"stored":0,"data":{"engineHealth":958.9,"modSuspension":-1,"fuelLevel":45.2,"modArmor":-1,"modEngine":-1,"modSpoilers":0,"wheels":0,"modRoof":-1,"modSideSkirt":-1,"bodyHealth":958.5,"modRearBumper":-1,"modTank":-1,"modHood":-1,"modTrimB":-1,"modExhaust":-1,"model":970598228,"modSpeakers":-1,"neonColor":[255,0,255],"modTrimA":-1,"modGrille":-1,"plateIndex":1,"color2":12,"tyreSmokeColor":[255,255,255],"xenonColor":255,"modTrunk":-1,"modBackWheels":-1,"modFrontWheels":-1,"modAirFilter":-1,"modHydrolic":-1,"modXenon":false,"modSeats":-1,"extras":{"10":1,"12":false},"dirtLevel":15.0,"modFrontBumper":1,"wheelColor":156,"modFender":-1,"tankHealth":985.1,"modLightbar":-1,"neonEnabled":[false,false,false,false],"modTransmission":-1,"modPlateHolder":-1,"modAPlate":-1,"doorsBroken":{"0":false,"2":false,"1":false,"4":false,"3":false,"6":false,"5":false},"modEngineBlock":-1,"modSmokeEnabled":false,"modVanityPlate":-1,"modHorns":-1,"modShifterLeavers":-1,"modSteeringWheel":-1,"modDashboard":-1,"plate":"WSIX1028","modAerials":-1,"modOrnaments":-1,"windowsBroken":{"0":true,"7":true,"2":true,"1":false,"4":true,"3":false,"6":false,"5":true},"modStruts":-1,"modLivery":-1,"tyreBurst":{"0":false,"5":false,"4":false,"1":false},"modDoorR":-1,"windowTint":1,"modBrakes":-1,"color1":12,"modDoorSpeaker":-1,"modRightFender":-1,"modArchCover":-1,"modDial":-1,"pearlescentColor":27,"modTurbo":false,"modFrame":-1},"owner":"license:fd02c46ca5057a93adb82ed4541a6feb6f31d620"}}', '{"coke_pooch":{"label":"Pochon de coke","count":110,"name":"coke_pooch"},"coke":{"label":"Coke","count":23,"name":"coke"}}', '[]', 0, 0),
	(183, 'nvidia', 'Nvidia', NULL, NULL, NULL, 525, 0),
	(184, 'ak81', 'AK81', '{"DSEZ8247":{"stored":0,"data":{"tyreBurst":{"4":false,"1":false,"5":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"dirtLevel":5.3,"pearlescentColor":2,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"DSEZ8247","modTransmission":-1,"bodyHealth":973.0,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modHorns":-1,"color2":12,"xenonColor":255,"modTrimB":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":61.7,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":8,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":false,"6":false,"5":true,"4":true,"3":false,"2":false,"1":false,"0":false},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"modHydrolic":-1,"modArmor":-1,"modPlateHolder":-1,"modDashboard":-1,"doorsBroken":{"6":false,"5":false,"4":false,"3":false,"2":false,"1":false,"0":false},"plateIndex":0,"tankHealth":1000.0,"modBrakes":-1,"modSeats":-1,"modStruts":-1,"wheels":5,"modTank":-1,"engineHealth":1000.0,"modDoorR":-1,"extras":[],"modFrame":-1,"windowTint":-1,"model":872704284,"modVanityPlate":-1,"color1":12,"modOrnaments":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modLivery":-1},"owner":"license:a93fda583e5c8a46550535bdb83cd3a36a77f1cd"},"LZZG9007":{"stored":0,"data":{"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modOrnaments":-1,"modRoof":-1,"dirtLevel":15.0,"pearlescentColor":4,"modFender":-1,"modShifterLeavers":-1,"modDoorSpeaker":-1,"modDial":-1,"plate":"LZZG9007","modTransmission":-1,"bodyHealth":966.8,"modRightFender":-1,"modXenon":1,"modArmor":-1,"modHorns":-1,"engineHealth":976.2,"xenonColor":1,"modTrimB":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":56.8,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":false,"6":false,"5":true,"4":true,"3":false,"2":true,"1":true,"0":false},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modBrakes":-1,"modAirFilter":-1,"modHydrolic":-1,"color2":21,"modPlateHolder":-1,"doorsBroken":{"6":false,"5":false,"4":false,"3":false,"2":false,"1":false,"0":false},"modSuspension":-1,"plateIndex":0,"tankHealth":998.3,"model":-16948145,"modSeats":-1,"modStruts":-1,"wheels":3,"modTank":-1,"modFrame":-1,"modDoorR":-1,"extras":{"10":1,"11":false},"modSmokeEnabled":false,"windowTint":1,"modAPlate":-1,"modVanityPlate":-1,"color1":21,"modLivery":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modDashboard":-1},"owner":"license:a93fda583e5c8a46550535bdb83cd3a36a77f1cd"},"HJDD3576":{"stored":0,"data":{"tyreBurst":{"4":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modOrnaments":-1,"modRoof":-1,"dirtLevel":13.5,"pearlescentColor":0,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"HJDD3576","modTransmission":-1,"bodyHealth":874.4,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modHorns":-1,"engineHealth":989.4,"xenonColor":255,"modTrimB":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":30.6,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modBrakes":-1,"modAirFilter":-1,"modArmor":-1,"modHydrolic":-1,"color2":0,"modPlateHolder":-1,"plateIndex":0,"modDashboard":-1,"tankHealth":994.8,"modDoorSpeaker":-1,"model":788045382,"modSeats":-1,"wheels":6,"modTank":-1,"modStruts":-1,"modDoorR":-1,"extras":[],"modFrame":-1,"windowTint":-1,"modAPlate":-1,"modVanityPlate":-1,"color1":0,"doorsBroken":{"1":false,"0":false},"modFrontBumper":-1,"neonColor":[255,0,255],"modLivery":-1},"owner":"license:a7a12ab81d1538e051522a517abdb7b1b4c79ab7"},"UWPU9362":{"stored":0,"data":{"tyreBurst":{"0":false,"4":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"dirtLevel":10.0,"pearlescentColor":0,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"UWPU9362","modTransmission":-1,"bodyHealth":581.0,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modHorns":-1,"engineHealth":664.0,"xenonColor":255,"modTrimB":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":65.0,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modBrakes":-1,"modAirFilter":-1,"modArmor":-1,"modHydrolic":-1,"color2":0,"modPlateHolder":-1,"modDashboard":-1,"doorsBroken":{"1":false,"0":false},"tankHealth":856.0,"plateIndex":0,"model":788045382,"modSeats":-1,"wheels":6,"modTank":-1,"modStruts":-1,"modDoorR":-1,"extras":[],"modFrame":-1,"windowTint":-1,"modOrnaments":-1,"modVanityPlate":-1,"color1":0,"modDoorSpeaker":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modLivery":-1},"owner":"license:a93fda583e5c8a46550535bdb83cd3a36a77f1cd"}}', '{}', '{}', 0, 17712),
	(185, 'blackace', 'BLACKACE', '{"KIFX4380":{"data":{"modSpoilers":-1,"modOrnaments":-1,"modGrille":-1,"modAirFilter":-1,"modVanityPlate":-1,"modDoorR":-1,"wheels":1,"modSpeakers":-1,"modTrimB":-1,"dirtLevel":15.0,"modStruts":-1,"modFrontWheels":-1,"modRightFender":-1,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modBrakes":2,"color1":1,"modDashboard":-1,"modRoof":-1,"modSeats":-1,"plate":"KIFX4380","modHood":-1,"engineHealth":977.9,"modExhaust":-1,"modFrontBumper":-1,"modRearBumper":-1,"tankHealth":986.4,"extras":{"4":1,"5":1,"2":1,"3":1,"8":1,"9":1,"1":1},"bodyHealth":958.3,"modDoorSpeaker":-1,"modTank":-1,"modHorns":-1,"modDial":-1,"modArchCover":-1,"modAerials":-1,"modTurbo":1,"modEngineBlock":-1,"wheelColor":146,"modPlateHolder":-1,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"doorsBroken":{"4":true,"5":false,"2":true,"3":false,"0":false,"1":false,"6":false},"modSteeringWheel":-1,"modSmokeEnabled":false,"model":1475773103,"modHydrolic":-1,"neonColor":[255,0,255],"modXenon":1,"color2":1,"modLivery":-1,"modTransmission":2,"modArmor":-1,"modLightbar":-1,"xenonColor":255,"modTrimA":-1,"modBackWheels":-1,"windowsBroken":{"4":true,"5":true,"2":true,"3":false,"0":false,"1":true,"6":false,"7":false},"modEngine":3,"modSuspension":-1,"windowTint":1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"fuelLevel":64.9,"modFrame":-1,"modFender":-1,"plateIndex":0,"pearlescentColor":5,"modSideSkirt":-1},"owner":"license:c81b30503abefb0dc29524efb585a9b17076514f","stored":0},"EVKX0664":{"data":{"modSpoilers":0,"modOrnaments":-1,"modGrille":1,"modAirFilter":-1,"modVanityPlate":-1,"modDoorR":-1,"wheels":4,"modSpeakers":-1,"modTrimB":-1,"dirtLevel":15.0,"modStruts":-1,"modFrontWheels":21,"modRightFender":-1,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modBrakes":2,"color1":21,"modDashboard":-1,"modRoof":1,"modSeats":-1,"plate":"EVKX0664","modHood":-1,"engineHealth":861.0,"modExhaust":0,"modFrontBumper":1,"modRearBumper":3,"tankHealth":971.0,"extras":[],"bodyHealth":791.0,"modDoorSpeaker":-1,"modTank":-1,"modHorns":-1,"modDial":-1,"modArchCover":-1,"modAerials":-1,"modTurbo":1,"modEngineBlock":-1,"wheelColor":6,"modPlateHolder":-1,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"doorsBroken":{"4":false,"5":false,"2":false,"3":false,"0":false,"1":false,"6":false},"modSteeringWheel":-1,"modSmokeEnabled":false,"model":-1349095620,"modHydrolic":-1,"neonColor":[255,0,255],"modXenon":1,"color2":11,"modLivery":-1,"pearlescentColor":6,"modFender":2,"tyreBurst":{"4":false,"1":false,"0":false,"5":false},"modTrimA":-1,"windowsBroken":{"4":true,"5":true,"2":false,"3":false,"0":false,"1":false,"6":true,"7":false},"modBackWheels":-1,"modEngine":3,"modArmor":-1,"modSuspension":-1,"windowTint":1,"fuelLevel":77.2,"modLightbar":-1,"modFrame":-1,"modTransmission":2,"plateIndex":0,"modSideSkirt":-1,"xenonColor":0},"owner":"license:c81b30503abefb0dc29524efb585a9b17076514f","stored":0},"RYLY7383":{"data":{"modSpoilers":0,"modOrnaments":-1,"modGrille":-1,"modAirFilter":-1,"modVanityPlate":-1,"modDoorR":-1,"wheels":5,"modSpeakers":-1,"modTrimB":-1,"dirtLevel":4.5,"modTransmission":2,"modFrontWheels":4,"modRightFender":-1,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modBrakes":2,"color1":12,"modDashboard":-1,"modRoof":-1,"modSeats":-1,"plate":"RYLY7383","modHood":-1,"engineHealth":885.0,"modExhaust":0,"modFrontBumper":0,"modRearBumper":0,"tankHealth":989.9,"extras":{"4":false,"5":1,"2":1,"3":1,"1":false,"11":1,"10":false},"bodyHealth":917.3,"modDoorSpeaker":-1,"modTank":-1,"modHorns":-1,"modDial":-1,"modArchCover":-1,"modAerials":-1,"modTurbo":1,"modEngineBlock":-1,"wheelColor":5,"modPlateHolder":-1,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"doorsBroken":{"4":false,"5":false,"2":false,"3":false,"0":false,"1":false,"6":false},"modSteeringWheel":-1,"modSmokeEnabled":false,"model":-304802106,"modHydrolic":-1,"neonColor":[255,0,255],"modStruts":-1,"color2":0,"modLivery":-1,"modXenon":1,"modFender":-1,"modArmor":-1,"fuelLevel":41.5,"xenonColor":0,"modBackWheels":-1,"modEngine":3,"windowsBroken":{"4":false,"5":false,"2":false,"3":false,"0":true,"1":true,"6":true,"7":true},"modSuspension":3,"windowTint":1,"modTrimA":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modFrame":-1,"modLightbar":-1,"plateIndex":1,"pearlescentColor":5,"modSideSkirt":-1},"owner":"license:c81b30503abefb0dc29524efb585a9b17076514f","stored":0}}', '{"bandage":{"name":"bandage","count":4,"label":"Bandage"},"medikit":{"name":"medikit","count":2,"label":"Medikit"}}', '{}', 0, 0),
	(186, 'changretta', 'Changretta', '{"IZCI1935":{"data":{"modAirFilter":-1,"modSpeakers":-1,"modSideSkirt":1,"modTransmission":2,"modEngineBlock":-1,"modFrontBumper":2,"xenonColor":255,"modAPlate":-1,"modRearBumper":1,"modHood":7,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"modSteeringWheel":-1,"bodyHealth":870.9,"wheelColor":1,"fuelLevel":22.6,"modLivery":-1,"engineHealth":996.9,"modDashboard":-1,"plateIndex":0,"pearlescentColor":5,"modSpoilers":0,"modSuspension":3,"modArchCover":-1,"modDoorR":-1,"color2":24,"extras":[],"color1":120,"tankHealth":980.9,"modAerials":-1,"modBrakes":2,"modTrimA":-1,"modSeats":-1,"model":686471183,"windowsBroken":{"0":false,"1":false,"2":true,"3":false,"4":true,"5":true,"6":false,"7":false},"modShifterLeavers":-1,"modGrille":0,"modHydrolic":-1,"modTank":-1,"plate":"IZCI1935","modHorns":-1,"modSmokeEnabled":false,"modFender":-1,"wheels":5,"dirtLevel":15.0,"modRoof":-1,"modTrunk":-1,"tyreBurst":{"0":false,"5":false,"4":false,"1":false},"modXenon":false,"modExhaust":3,"modFrontWheels":12,"modVanityPlate":-1,"modPlateHolder":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"modTurbo":1,"modEngine":3,"modLightbar":-1,"windowTint":1,"modDoorSpeaker":-1,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modArmor":-1,"modStruts":-1,"modRightFender":-1,"modFrame":0,"modBackWheels":-1,"modDial":-1},"stored":1,"owner":"license:06beac579fd065cd2e0392d8ba6561a9e2c7dd78"},"RTGG1092":{"data":{"modAirFilter":-1,"modSpeakers":-1,"modSideSkirt":-1,"modTransmission":-1,"modDial":-1,"modRoof":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modAPlate":-1,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"modHood":-1,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"modTank":-1,"modSteeringWheel":-1,"bodyHealth":401.5,"modGrille":-1,"fuelLevel":53.7,"modLivery":-1,"engineHealth":834.0,"modDashboard":-1,"plateIndex":0,"pearlescentColor":2,"modSpoilers":-1,"modSuspension":-1,"modArchCover":-1,"modDoorR":-1,"color2":9,"modFrame":-1,"color1":9,"tankHealth":936.0,"modAerials":-1,"modBrakes":-1,"modTrimA":-1,"modSeats":-1,"model":872704284,"windowsBroken":{"0":true,"1":true,"2":false,"3":false,"4":true,"5":true,"6":true,"7":false},"modShifterLeavers":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modBackWheels":-1,"modTrunk":-1,"modHorns":-1,"modDoorSpeaker":-1,"modFender":-1,"wheels":5,"dirtLevel":9.4,"modSmokeEnabled":false,"modFrontWheels":-1,"xenonColor":255,"modXenon":false,"modRearBumper":-1,"modExhaust":-1,"modVanityPlate":-1,"modPlateHolder":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"modTurbo":false,"modEngine":-1,"extras":[],"windowTint":-1,"modLightbar":-1,"wheelColor":156,"modArmor":-1,"modStruts":-1,"modRightFender":-1,"modFrontBumper":-1,"plate":"RTGG1092","modEngineBlock":-1},"stored":0,"owner":"license:abec830359b8e51431bedf923515ef0f957d12cb"},"PSHW2559":{"data":{"modAirFilter":-1,"modSpeakers":-1,"modSideSkirt":-1,"modTransmission":-1,"modDial":-1,"modRoof":-1,"xenonColor":255,"modAPlate":-1,"modRearBumper":-1,"modHood":-1,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"neonColor":[255,0,255],"modSteeringWheel":-1,"bodyHealth":960.2,"modGrille":-1,"fuelLevel":53.9,"modLightbar":-1,"engineHealth":1000.0,"modDashboard":-1,"plateIndex":0,"pearlescentColor":1,"modSpoilers":-1,"modSuspension":-1,"modArchCover":-1,"modDoorR":-1,"color2":12,"extras":[],"color1":12,"tankHealth":995.2,"modAerials":-1,"modBrakes":-1,"modTrimA":-1,"modSeats":-1,"model":-1726022652,"windowsBroken":{"0":true,"1":true,"2":false,"3":false,"4":true,"5":true,"6":true,"7":false},"modStruts":-1,"modEngineBlock":-1,"modHydrolic":-1,"modTrunk":-1,"wheelColor":0,"modHorns":-1,"modSmokeEnabled":false,"modFender":-1,"wheels":0,"dirtLevel":0.9,"plate":"PSHW2559","modFrontWheels":-1,"modFrontBumper":-1,"modXenon":false,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modLivery":-1,"modVanityPlate":-1,"modPlateHolder":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"modTurbo":false,"modEngine":-1,"modShifterLeavers":-1,"windowTint":-1,"modTank":-1,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modArmor":-1,"modExhaust":-1,"modRightFender":-1,"modFrame":-1,"modBackWheels":-1,"modDoorSpeaker":-1},"stored":0,"owner":"license:b2f63706eee4a93ccfc118b512584db7873cc16c"}}', '{"meth":{"count":43,"label":"Meth","name":"meth"},"opium_pooch":{"count":2,"label":"Pochon d\'opium","name":"opium_pooch"},"opium":{"count":95,"label":"Opium","name":"opium"}}', '{}', 11, 0),
	(187, 'the_white', 'The White', '{"OMPQ8208":{"stored":0,"data":{"dirtLevel":15.0,"doorsBroken":{"3":false,"0":false,"1":true,"2":false},"modSideSkirt":-1,"modFender":-1,"modHood":-1,"modLightbar":-1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modArmor":-1,"modFrontWheels":-1,"modGrille":-1,"modBrakes":-1,"modDial":-1,"modTransmission":-1,"modSpeakers":-1,"windowsBroken":{"3":true,"4":true,"1":true,"2":true,"7":true,"0":true,"5":true,"6":true},"modRoof":-1,"bodyHealth":0.0,"modTrimA":-1,"modTrunk":-1,"color2":13,"modSuspension":-1,"modTurbo":false,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"modFrame":-1,"fuelLevel":35.8,"modSteeringWheel":-1,"modAerials":-1,"modDoorSpeaker":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"plateIndex":0,"modFrontBumper":-1,"tankHealth":830.6,"xenonColor":255,"engineHealth":718.0,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"wheels":7,"plate":"OMPQ8208","modDashboard":-1,"modArchCover":-1,"modBackWheels":-1,"modDoorR":-1,"modXenon":false,"extras":[],"modSpoilers":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modPlateHolder":-1,"modStruts":-1,"model":-1297672541,"modShifterLeavers":-1,"modRightFender":-1,"modAirFilter":-1,"modAPlate":-1,"modRearBumper":-1,"modEngine":-1,"wheelColor":156,"modSeats":-1,"windowTint":1,"modLivery":-1,"modExhaust":-1,"modOrnaments":-1,"color1":12,"modTank":-1,"pearlescentColor":4},"owner":"license:6be58ef6f3420174bac13537df81d779fe7ea123"},"MPZP7818":{"stored":0,"data":{"dirtLevel":7.4,"doorsBroken":{"3":false,"4":false,"1":false,"2":false,"0":false,"5":false,"6":false},"modSideSkirt":-1,"modFender":-1,"modHood":-1,"modLightbar":-1,"tyreBurst":{"1":false,"0":false,"5":false,"4":false},"modArmor":-1,"modFrontWheels":0,"modGrille":-1,"modBrakes":-1,"modDial":-1,"modTransmission":2,"modSpeakers":-1,"windowsBroken":{"3":false,"4":true,"1":false,"2":false,"7":false,"0":false,"5":true,"6":false},"modRoof":-1,"modArchCover":-1,"modTrimA":-1,"modTrunk":-1,"modEngine":-1,"modSuspension":3,"modTurbo":1,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"modFrame":-1,"fuelLevel":66.2,"modSteeringWheel":-1,"modAerials":-1,"modDoorSpeaker":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"plateIndex":2,"modFrontBumper":-1,"tankHealth":995.8,"xenonColor":0,"engineHealth":1000.0,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"wheels":4,"plate":"MPZP7818","modDashboard":-1,"modBackWheels":-1,"color1":131,"modDoorR":-1,"modXenon":1,"extras":[],"modEngineBlock":-1,"neonColor":[255,0,255],"modStruts":-1,"modPlateHolder":-1,"modShifterLeavers":-1,"model":-2107990196,"modAirFilter":-1,"modRightFender":-1,"color2":12,"modAPlate":-1,"wheelColor":0,"modRearBumper":-1,"bodyHealth":985.9,"modSeats":-1,"windowTint":1,"modExhaust":-1,"modSpoilers":-1,"modLivery":-1,"modTank":-1,"modOrnaments":-1,"pearlescentColor":27},"owner":"license:6be58ef6f3420174bac13537df81d779fe7ea123"}}', '{}', '{"WEAPON_MACHETE":[{"name":"WEAPON_MACHETE","components":[],"label":"Machette","ammo":1}]}', 0, 134913),
	(188, '50\'s_cents', '50\'s cents', '{"BJAC9378":{"data":{"modTrunk":-1,"modExhaust":1,"pearlescentColor":134,"neonEnabled":[false,false,false,false],"modVanityPlate":-1,"modFrontBumper":3,"color2":29,"modXenon":false,"tyreSmokeColor":[255,255,255],"modRoof":-1,"model":1104234922,"engineHealth":851.0,"modTrimA":-1,"windowTint":1,"modSuspension":-1,"modSmokeEnabled":false,"modTrimB":-1,"bodyHealth":214.4,"modShifterLeavers":-1,"modRearBumper":-1,"modDashboard":-1,"fuelLevel":24.1,"modHood":-1,"modArchCover":-1,"modAirFilter":-1,"modTransmission":-1,"modBackWheels":-1,"modFrame":-1,"modHorns":7,"neonColor":[0,0,0],"modStruts":-1,"modSteeringWheel":-1,"modFrontWheels":1,"modLightbar":-1,"extras":[],"wheels":4,"modArmor":-1,"xenonColor":255,"modPlateHolder":-1,"modAPlate":-1,"modHydrolic":-1,"plateIndex":0,"plate":"BJAC9378","modEngine":-1,"modTurbo":1,"windowsBroken":{"3":true,"2":true,"1":false,"0":true,"7":true,"6":false,"5":true,"4":true},"modAerials":-1,"modDoorSpeaker":-1,"modDial":-1,"modGrille":-1,"wheelColor":136,"modSpoilers":-1,"dirtLevel":3.8,"modRightFender":-1,"modLivery":-1,"tankHealth":765.6,"modOrnaments":-1,"modDoorR":-1,"tyreBurst":{"1":true,"4":true,"5":true,"0":true},"modSeats":-1,"modTank":-1,"doorsBroken":{"3":false,"2":false,"1":false,"0":false,"4":false},"modFender":-1,"modSpeakers":-1,"color1":136,"modBrakes":-1,"modSideSkirt":-1,"modEngineBlock":-1},"stored":0,"owner":"license:583529aa806d90f49b51c3846ca73a914a86fe5a"}}', '{}', '{}', 0, 0),
	(189, 'cartel_de_jalisco', 'Cartel de Jalisco', '{"JBZV6226":{"data":{"windowTint":1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":794.0,"plateIndex":1,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"pearlescentColor":53,"modAerials":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":12,"color1":21,"modTrunk":-1,"modExhaust":0,"modSeats":-1,"modHorns":39,"modDial":-1,"modFrontWheels":2,"modSpeakers":-1,"xenonColor":4,"modEngineBlock":-1,"modFrontBumper":5,"modAirFilter":-1,"modRearBumper":1,"model":629969764,"modTurbo":false,"modTransmission":-1,"extras":[],"modSideSkirt":2,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"modHood":7,"wheels":3,"neonEnabled":[false,false,false,false],"modSpoilers":7,"tankHealth":929.0,"modTrimB":-1,"neonColor":[0,0,0],"modFrame":13,"modRoof":-1,"modTank":-1,"dirtLevel":15.0,"color2":21,"modArmor":-1,"bodyHealth":550.0,"modShifterLeavers":-1,"fuelLevel":41.8,"modGrille":0,"modRightFender":-1,"modDoorR":-1,"modVanityPlate":-1,"modLightbar":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"modHydrolic":-1,"modBrakes":-1,"modEngine":-1,"modSteeringWheel":-1,"modXenon":1,"plate":"JBZV6226","modArchCover":-1},"owner":"license:72569175564e7680c22497cb3341a4f9e4067117","stored":0},"WWLW4094":{"data":{"windowTint":1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":3,"modAPlate":-1,"engineHealth":1000.0,"plateIndex":1,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"pearlescentColor":53,"modAerials":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":120,"color1":21,"modTrunk":-1,"modExhaust":-1,"modSeats":-1,"plate":"WWLW4094","modDial":-1,"modFrontWheels":17,"modSpeakers":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":1,"modTransmission":2,"extras":[],"modRightFender":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"wheels":5,"modSpoilers":12,"neonEnabled":[1,1,1,1],"tankHealth":1000.0,"modSideSkirt":-1,"modTrimB":-1,"neonColor":[94,255,1],"modHorns":39,"modHood":4,"modTank":-1,"dirtLevel":6.0,"color2":21,"modFrame":-1,"bodyHealth":1000.0,"modShifterLeavers":-1,"fuelLevel":7.9,"modGrille":-1,"modArmor":-1,"modRoof":-1,"modVanityPlate":-1,"modDoorR":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"modHydrolic":-1,"modBrakes":2,"modEngine":3,"modSteeringWheel":-1,"model":872704284,"modXenon":1,"xenonColor":4},"owner":"license:972534b769b38b52da5720e20cfd3c997199319e","stored":0}}', '{"opium":{"count":43,"label":"Opium","name":"opium"},"weed_pooch":{"count":5,"label":"Pochon de weed","name":"weed_pooch"},"meth_pooch":{"count":2,"label":"Pochon de meth","name":"meth_pooch"},"donuts":{"count":1,"label":"Donuts","name":"donuts"},"meth":{"count":69,"label":"Meth","name":"meth"},"opium_pooch":{"count":3,"label":"Pochon d\'opium","name":"opium_pooch"},"coke_pooch":{"count":62,"label":"Pochon de coke","name":"coke_pooch"},"pepitor":{"count":2,"label":"Pépite d\'or","name":"pepitor"},"clip":{"count":15,"label":"Chargeur","name":"clip"},"weed":{"count":5,"label":"Weed","name":"weed"},"lsd_pooch":{"count":122,"label":"Pochon de LSD","name":"lsd_pooch"},"coke":{"count":37,"label":"Coke","name":"coke"}}', '{}', 0, 481920),
	(190, 'ms13', 'MS13', '{"HWAI5629":{"stored":0,"data":{"windowTint":1,"modAPlate":-1,"wheelColor":1,"plate":"HWAI5629","modVanityPlate":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":1,"modTrimB":-1,"modFender":-1,"model":-16948145,"tyreSmokeColor":[255,255,255],"modEngine":3,"modTrunk":-1,"pearlescentColor":5,"modAirFilter":-1,"dirtLevel":15.0,"modDial":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"extras":{"11":1,"10":1},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":12,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":1,"modSpeakers":-1,"modHorns":41,"modLightbar":-1,"fuelLevel":55.9,"engineHealth":915.4,"modSmokeEnabled":false,"bodyHealth":939.4,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":8,"windowsBroken":{"1":true,"0":true,"7":false,"6":true,"5":true,"4":true,"3":true,"2":false},"modSideSkirt":-1,"modGrille":-1,"modArmor":-1,"modXenon":1,"wheels":4,"modEngineBlock":-1,"modBrakes":2,"modRightFender":-1,"modTransmission":2,"modSuspension":3,"modDoorR":-1,"tankHealth":993.9,"modHood":-1,"modOrnaments":-1,"modLivery":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"color1":12,"modFrame":-1,"modSpoilers":-1,"modExhaust":-1,"modFrontWheels":2},"owner":"license:d19672886865dcd489c32303f23c7228cbb6ffa7"},"HAGE5191":{"stored":1,"data":{"windowTint":1,"modAPlate":-1,"wheelColor":1,"plate":"HAGE5191","modGrille":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":1,"modTrimB":-1,"modFender":-1,"model":-16948145,"tyreSmokeColor":[255,255,255],"modEngine":3,"modTrunk":-1,"pearlescentColor":5,"modAirFilter":-1,"dirtLevel":15.0,"modDial":-1,"tyreBurst":{"5":false,"0":false,"4":false,"1":false},"extras":{"11":1,"10":1},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":12,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modLivery":-1,"modAerials":-1,"plateIndex":1,"modSpeakers":-1,"modHorns":41,"modLightbar":-1,"fuelLevel":74.5,"engineHealth":1000.0,"modSmokeEnabled":false,"bodyHealth":998.5,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"color1":12,"modTank":-1,"xenonColor":8,"windowsBroken":{"1":false,"0":true,"7":false,"6":true,"5":true,"4":true,"3":false,"2":false},"modSideSkirt":-1,"modSpoilers":-1,"modShifterLeavers":-1,"modBackWheels":-1,"wheels":4,"modArmor":-1,"modXenon":1,"modRightFender":-1,"modTransmission":2,"modDoorR":-1,"modEngineBlock":-1,"modBrakes":2,"modSuspension":3,"modOrnaments":-1,"tankHealth":999.8,"modHood":-1,"modFrontBumper":-1,"modVanityPlate":-1,"neonColor":[255,0,255],"modFrame":-1,"modSteeringWheel":-1,"modExhaust":-1,"modFrontWheels":2},"owner":"license:ee77be30e53ed31d6932c7b3d97f3e48c93c3225"},"FSSJ8183":{"stored":0,"data":{"windowTint":-1,"modAPlate":-1,"wheelColor":111,"plate":"FSSJ8183","modVanityPlate":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":1,"modTrimB":-1,"modFender":-1,"model":-208911803,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modTrunk":-1,"modDoorR":-1,"modAirFilter":-1,"dirtLevel":13.0,"modDial":-1,"tyreBurst":{"1":false,"0":false,"4":false,"5":false},"extras":{"1":1},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":0,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":0,"modSpeakers":-1,"modHorns":-1,"modLightbar":-1,"fuelLevel":85.4,"engineHealth":1000.0,"modSmokeEnabled":false,"bodyHealth":1000.0,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":255,"windowsBroken":{"1":false,"0":false,"7":true,"6":false,"5":true,"4":true,"3":false,"2":false},"modSideSkirt":-1,"modSpoilers":-1,"modGrille":-1,"modArmor":-1,"modEngineBlock":-1,"modXenon":1,"modBrakes":-1,"modRightFender":-1,"modTransmission":-1,"pearlescentColor":1,"modSuspension":-1,"tankHealth":1000.0,"modHood":-1,"modOrnaments":-1,"wheels":7,"modSteeringWheel":-1,"modFrontBumper":-1,"modLivery":-1,"color1":15,"modFrame":-1,"neonColor":[255,0,255],"modExhaust":-1,"modFrontWheels":-1},"owner":"license:d19672886865dcd489c32303f23c7228cbb6ffa7"},"NDUE1269":{"stored":1,"data":{"windowTint":-1,"modAPlate":-1,"wheelColor":112,"plate":"NDUE1269","modVanityPlate":-1,"doorsBroken":{"1":false,"0":false,"2":false},"modTrimA":-1,"modTurbo":false,"modTrimB":-1,"modFender":-1,"model":1093792632,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modTrunk":-1,"pearlescentColor":1,"modAirFilter":-1,"dirtLevel":15.0,"modDial":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"extras":{"1":1},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":15,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":0,"modSpeakers":-1,"modHorns":-1,"modLightbar":-1,"fuelLevel":46.7,"engineHealth":1000.0,"modSmokeEnabled":false,"bodyHealth":1000.0,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":255,"windowsBroken":{"1":false,"0":false,"7":false,"6":true,"5":true,"4":true,"3":true,"2":true},"modSideSkirt":-1,"modGrille":-1,"modArmor":-1,"modXenon":false,"wheels":7,"modEngineBlock":-1,"modBrakes":-1,"modRightFender":-1,"modTransmission":-1,"modSuspension":-1,"modDoorR":-1,"tankHealth":1000.0,"modHood":-1,"modOrnaments":-1,"modLivery":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"color1":15,"modFrame":-1,"modSpoilers":-1,"modExhaust":-1,"modFrontWheels":-1},"owner":"license:c2259f2f715c4d54dbc595890d42771724c394b9"},"MDHK3266":{"stored":1,"data":{"windowTint":1,"modAPlate":-1,"wheelColor":0,"plate":"MDHK3266","modGrille":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":1,"modTrimB":-1,"modFender":-1,"model":1203490606,"tyreSmokeColor":[255,255,255],"modEngine":3,"modTrunk":-1,"pearlescentColor":1,"modAirFilter":-1,"dirtLevel":3.1,"modDial":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"extras":[],"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":1,"customSecondaryColor":[255,246,246],"modDoorSpeaker":-1,"modArmor":4,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":0,"modSpeakers":-1,"modHorns":2,"modLightbar":-1,"fuelLevel":59.4,"engineHealth":1000.0,"modSmokeEnabled":false,"bodyHealth":1000.0,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":255,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modSideSkirt":-1,"modVanityPlate":-1,"modSpoilers":-1,"modHydrolic":-1,"wheels":0,"modXenon":false,"modDoorR":-1,"modRightFender":-1,"modTransmission":2,"modSuspension":3,"modBrakes":2,"tankHealth":1000.0,"modHood":-1,"modOrnaments":-1,"modFrontBumper":-1,"modEngineBlock":-1,"modLivery":-1,"color1":1,"neonColor":[255,0,255],"modFrame":-1,"modSteeringWheel":-1,"modExhaust":-1,"modFrontWheels":3},"owner":"license:d19672886865dcd489c32303f23c7228cbb6ffa7"},"PMJF9127":{"stored":0,"data":{"windowTint":-1,"modAPlate":-1,"wheelColor":111,"plate":"PMJF9127","modVanityPlate":-1,"doorsBroken":{"1":false,"0":true,"6":false,"5":false,"4":true,"3":false,"2":false},"modTrimA":-1,"modTurbo":false,"modTrimB":-1,"modFender":-1,"model":-208911803,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modTrunk":-1,"modDoorR":-1,"modAirFilter":-1,"dirtLevel":14.4,"modDial":-1,"tyreBurst":{"5":false,"0":false,"4":false,"1":false},"extras":{"1":1},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":0,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":0,"modSpeakers":-1,"modHorns":-1,"modLightbar":-1,"fuelLevel":72.5,"engineHealth":919.1,"modSmokeEnabled":false,"bodyHealth":869.9,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":255,"windowsBroken":{"1":false,"0":true,"7":true,"6":true,"5":true,"4":true,"3":false,"2":false},"modSideSkirt":-1,"modGrille":-1,"modLivery":-1,"modArmor":-1,"wheels":7,"modXenon":false,"pearlescentColor":55,"modRightFender":-1,"modTransmission":-1,"modBrakes":-1,"modSuspension":-1,"tankHealth":980.4,"modHood":-1,"modOrnaments":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"modSpoilers":-1,"modEngineBlock":-1,"neonColor":[255,0,255],"modFrame":-1,"color1":53,"modExhaust":-1,"modFrontWheels":-1},"owner":"license:c2259f2f715c4d54dbc595890d42771724c394b9"},"UINI4701":{"stored":1,"data":{"windowTint":1,"modAPlate":-1,"wheelColor":1,"plate":"UINI4701","modVanityPlate":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":1,"modTrimB":-1,"modFender":-1,"model":-16948145,"tyreSmokeColor":[255,255,255],"modEngine":3,"modTrunk":-1,"pearlescentColor":24,"modAirFilter":-1,"dirtLevel":15.0,"modDial":-1,"tyreBurst":{"1":false,"4":false,"0":false,"5":false},"extras":{"11":1,"10":1},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":12,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":1,"modSpeakers":-1,"modHorns":40,"modLightbar":-1,"fuelLevel":54.5,"engineHealth":1000.0,"modSmokeEnabled":false,"bodyHealth":1000.0,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":8,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":true,"4":true,"3":false,"2":false},"modSideSkirt":-1,"modGrille":-1,"modArmor":-1,"modXenon":1,"wheels":4,"modEngineBlock":-1,"modBrakes":2,"modRightFender":-1,"modTransmission":2,"modSuspension":3,"modDoorR":-1,"tankHealth":1000.0,"modHood":-1,"modOrnaments":-1,"modLivery":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"color1":12,"modFrame":-1,"modSpoilers":-1,"modExhaust":-1,"modFrontWheels":2},"owner":"license:c2259f2f715c4d54dbc595890d42771724c394b9"}}', '{"bread":{"count":6,"label":"Pain","name":"bread"},"fishingrod":{"count":2,"label":"Canne à pêche","name":"fishingrod"},"medikit":{"count":3,"label":"Medikit","name":"medikit"},"clip":{"count":2,"label":"Chargeur","name":"clip"},"weed":{"count":11,"label":"Weed","name":"weed"},"bandage":{"count":2,"label":"Bandage","name":"bandage"},"water":{"count":11,"label":"Bouteille d\'eau","name":"water"}}', '{}', 1896500, 1522240),
	(191, 'cosa_nostra', 'Cosa Nostra', '{"JYLS2709":{"stored":0,"owner":"license:3add16d2100c59385659622703f6ccd3001f8bd5","data":{"bodyHealth":896.5,"modFrontWheels":-1,"modTrunk":-1,"plate":"JYLS2709","modGrille":-1,"modSpoilers":-1,"tyreSmokeColor":[255,255,255],"modSmokeEnabled":false,"model":-391594584,"modSpeakers":-1,"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":false},"modDoorR":-1,"modStruts":-1,"modTurbo":false,"modSeats":-1,"modSideSkirt":-1,"modVanityPlate":-1,"fuelLevel":48.0,"modDial":-1,"modSuspension":-1,"modArmor":-1,"color2":0,"modTrimA":-1,"modLightbar":-1,"extras":{"11":1},"modDoorSpeaker":-1,"modOrnaments":-1,"modTransmission":-1,"neonColor":[255,0,255],"modBackWheels":-1,"modRearBumper":-1,"dirtLevel":15.0,"engineHealth":851.0,"pearlescentColor":7,"modLivery":-1,"windowTint":-1,"modHorns":-1,"modFrontBumper":-1,"modFrame":-1,"wheelColor":156,"modEngine":-1,"modSteeringWheel":-1,"xenonColor":255,"modBrakes":-1,"modXenon":false,"modArchCover":-1,"modAPlate":-1,"neonEnabled":[false,false,false,false],"modShifterLeavers":-1,"modExhaust":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"color1":2,"modAirFilter":-1,"modHydrolic":-1,"modFender":-1,"modRoof":-1,"modHood":-1,"wheels":7,"windowsBroken":{"7":true,"6":true,"1":true,"0":false,"3":true,"2":false,"5":true,"4":true},"plateIndex":0,"modEngineBlock":-1,"modAerials":-1,"modTank":-1,"modPlateHolder":-1,"modRightFender":-1,"modDashboard":-1,"tankHealth":985.9,"modTrimB":-1}},"OEME8362":{"stored":0,"owner":"license:9a3f6c4098f319b772ea75275087035263bdb2fa","data":{"bodyHealth":765.2,"modFrontWheels":-1,"modTrunk":-1,"windowsBroken":{"7":true,"6":false,"1":false,"0":false,"3":false,"2":false,"5":true,"4":true},"modGrille":-1,"modSpoilers":-1,"tyreSmokeColor":[255,255,255],"modSmokeEnabled":false,"model":-834353991,"modSpeakers":-1,"doorsBroken":{"6":false,"1":false,"0":false,"3":false,"2":false,"5":false,"4":true},"modDoorR":-1,"modStruts":-1,"modTurbo":1,"modSeats":-1,"modSideSkirt":-1,"modVanityPlate":-1,"fuelLevel":27.8,"modDial":-1,"modSuspension":3,"modArmor":-1,"color2":27,"modTrimA":-1,"modLightbar":-1,"extras":[],"modDoorSpeaker":-1,"modOrnaments":-1,"modTransmission":2,"modTank":-1,"modBackWheels":-1,"modRearBumper":-1,"dirtLevel":4.5,"engineHealth":710.9,"pearlescentColor":4,"modLivery":-1,"windowTint":-1,"modHorns":-1,"modFrontBumper":-1,"modFrame":-1,"wheelColor":0,"modEngineBlock":-1,"modSteeringWheel":-1,"xenonColor":255,"modBrakes":2,"modExhaust":-1,"modAirFilter":-1,"plate":"OEME8362","plateIndex":0,"modShifterLeavers":-1,"color1":12,"tyreBurst":{"0":false,"1":false,"5":false,"4":false},"neonEnabled":[false,false,false,false],"modXenon":false,"modHydrolic":-1,"modAPlate":-1,"modArchCover":-1,"modHood":-1,"wheels":7,"modEngine":3,"modFender":-1,"modRightFender":-1,"modAerials":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modRoof":-1,"modDashboard":-1,"tankHealth":958.3,"modTrimB":-1}}}', '{"fishingrod":{"name":"fishingrod","label":"Canne à pêche","count":1},"weed":{"name":"weed","label":"Weed","count":25},"meth":{"name":"meth","label":"Meth","count":13},"phone":{"name":"phone","label":"Téléphone","count":1},"raisin":{"name":"raisin","label":"Raisin","count":67},"coke":{"name":"coke","label":"Coke","count":88},"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":4}}', '{}', 0, 1462882),
	(192, 'british', 'British', NULL, NULL, NULL, 0, 0),
	(193, 'la_grinta', 'La Grinta', NULL, NULL, NULL, 0, 0),
	(194, 'la_famille_tulsa', 'La Famille Tulsa', NULL, NULL, NULL, 0, 0),
	(195, 'el_eme', 'El eMe', '[]', '{}', '[]', 0, 0),
	(196, 'scampia_familia', 'Scampia Familia', '{"NZYR8697":{"data":{"windowTint":-1,"doorsBroken":{"0":false,"1":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":1000.0,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"tyreBurst":{"0":false,"4":false},"modGrille":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":27,"color1":27,"modTrunk":-1,"modExhaust":-1,"modSeats":-1,"plate":"NZYR8697","modDial":-1,"modFrontWheels":-1,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":false,"modTransmission":-1,"modXenon":false,"modSideSkirt":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"modHydrolic":-1,"wheels":6,"fuelLevel":60.3,"neonEnabled":[false,false,false,false],"modHorns":-1,"modFrame":-1,"modTrimB":-1,"modArmor":-1,"modShifterLeavers":-1,"modRoof":-1,"modTank":-1,"dirtLevel":3.5,"color2":27,"tankHealth":1000.0,"bodyHealth":1000.0,"modRightFender":-1,"modHood":-1,"neonColor":[255,0,255],"modSpoilers":-1,"windowsBroken":{"2":true,"3":true,"0":true,"1":true,"6":false,"7":true,"4":true,"5":true},"modVanityPlate":-1,"modSpeakers":-1,"pearlescentColor":0,"extras":[],"modBrakes":-1,"modEngine":-1,"modSteeringWheel":-1,"model":-114291515,"xenonColor":255,"modAerials":-1},"owner":"license:cc11d0f163d3163d97621d86de4b1bdc4f5e1e60","stored":0},"TWXD6493":{"data":{"windowTint":-1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":984.7,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":true,"7":false,"4":true,"5":true},"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":156,"fuelLevel":71.5,"modShifterLeavers":-1,"modExhaust":-1,"modSeats":-1,"modHorns":-1,"modDial":-1,"modFrontWheels":-1,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":false,"neonColor":[255,0,255],"extras":[],"modRightFender":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"xenonColor":255,"modSpeakers":-1,"modAerials":-1,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"plate":"TWXD6493","modTrimB":-1,"modTransmission":-1,"modXenon":false,"modRoof":-1,"modTank":-1,"dirtLevel":3.0,"color2":64,"modTrunk":-1,"bodyHealth":973.8,"color1":64,"modSpoilers":-1,"modSideSkirt":-1,"modArmor":-1,"pearlescentColor":63,"modVanityPlate":-1,"wheels":5,"modHood":-1,"modGrille":-1,"modBrakes":-1,"modEngine":-1,"tankHealth":996.2,"modFrame":-1,"model":872704284,"modHydrolic":-1},"owner":"license:bdde126649b0ad8fb1c6f81424701dcde5aea3b8","stored":0},"JSUE5737":{"data":{"windowTint":1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"4":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":995.9,"plateIndex":1,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modGrille":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":11,"fuelLevel":47.3,"modTrunk":-1,"modExhaust":-1,"modSeats":-1,"plate":"JSUE5737","modDial":-1,"modFrontWheels":16,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":false,"modTransmission":-1,"modXenon":1,"modSideSkirt":-1,"modSmokeEnabled":false,"modLivery":5,"modDashboard":-1,"modHydrolic":-1,"modSpeakers":-1,"modSpoilers":3,"neonEnabled":[false,false,false,false],"modHorns":38,"modFrame":-1,"modTrimB":-1,"extras":[],"modSteeringWheel":-1,"wheels":0,"modTank":-1,"dirtLevel":1.1,"color2":29,"modShifterLeavers":-1,"bodyHealth":986.2,"color1":12,"modAerials":-1,"modHood":-1,"modRightFender":-1,"modRoof":-1,"modVanityPlate":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"neonColor":[255,0,255],"pearlescentColor":5,"modBrakes":-1,"modEngine":-1,"tankHealth":994.2,"modArmor":-1,"model":1104234922,"xenonColor":8},"owner":"license:51dcc4f5c607909263694eebbdbfd5960215cdc6","stored":0},"YITV0958":{"data":{"windowTint":-1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"4":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":917.5,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modGrille":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":0,"fuelLevel":30.8,"modTrunk":-1,"modExhaust":-1,"modSeats":-1,"plate":"YITV0958","modDial":-1,"modFrontWheels":-1,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":false,"modTransmission":-1,"modXenon":false,"modSideSkirt":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"modHydrolic":-1,"modShifterLeavers":-1,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"modFrame":-1,"modTrimB":-1,"extras":[],"modSteeringWheel":-1,"wheels":1,"modTank":-1,"dirtLevel":9.5,"color2":29,"modRightFender":-1,"bodyHealth":926.8,"color1":112,"modAerials":-1,"modSpeakers":-1,"modHood":-1,"modRoof":-1,"modVanityPlate":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"modArmor":-1,"pearlescentColor":134,"modBrakes":-1,"modEngine":-1,"tankHealth":988.4,"model":1104234922,"xenonColor":255,"neonColor":[255,0,255]},"owner":"license:bdde126649b0ad8fb1c6f81424701dcde5aea3b8","stored":0},"WXFN7882":{"data":{"windowTint":1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":2,"modAPlate":-1,"engineHealth":986.2,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":6,"modPlateHolder":-1,"tyreBurst":{"0":false,"5":false,"4":false,"1":false},"modGrille":8,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":0,"fuelLevel":60.0,"modShifterLeavers":-1,"modExhaust":6,"modSeats":-1,"plate":"WXFN7882","modDial":-1,"modFrontWheels":9,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":7,"modAirFilter":-1,"modRearBumper":0,"modArchCover":-1,"modTurbo":1,"modTransmission":1,"modXenon":1,"modSideSkirt":6,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"modHydrolic":-1,"modSpoilers":6,"modHorns":-1,"neonEnabled":[1,1,1,1],"modFrame":4,"extras":[],"modTrimB":-1,"modSteeringWheel":-1,"modRightFender":1,"wheels":3,"modTank":-1,"dirtLevel":2.0,"color2":12,"color1":12,"bodyHealth":988.4,"modAerials":-1,"modSpeakers":-1,"modTrunk":-1,"modHood":11,"modRoof":-1,"modVanityPlate":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":false,"5":false},"neonColor":[3,83,255],"pearlescentColor":70,"modBrakes":1,"modEngine":2,"tankHealth":998.9,"modArmor":-1,"model":83136452,"xenonColor":1},"owner":"license:c0304ccceca3dbe9f910b036224f7e782cda962a","stored":0},"VPZT0965":{"data":{"windowTint":5,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":3,"modAPlate":-1,"engineHealth":1000.0,"plateIndex":5,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"tyreBurst":{"4":false,"5":false,"0":false,"1":false},"modGrille":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":0,"fuelLevel":65.4,"modShifterLeavers":-1,"modExhaust":-1,"modSeats":-1,"plate":"VPZT0965","modDial":-1,"modFrontWheels":78,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":1,"modTransmission":2,"modXenon":1,"modSideSkirt":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"modHydrolic":-1,"modSpoilers":-1,"modHorns":56,"neonEnabled":[1,1,1,1],"modFrame":-1,"extras":{"10":1,"11":1},"modTrimB":-1,"modSteeringWheel":-1,"modRightFender":-1,"wheels":8,"modTank":-1,"dirtLevel":2.5,"color2":12,"color1":15,"bodyHealth":1000.0,"modAerials":-1,"modSpeakers":-1,"modTrunk":-1,"modHood":-1,"modRoof":-1,"modVanityPlate":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"neonColor":[94,255,1],"pearlescentColor":4,"modBrakes":2,"modEngine":3,"tankHealth":1000.0,"modArmor":-1,"model":-16948145,"xenonColor":4},"owner":"license:f83dd6f04cbab971163d8d8272add412ba113895","stored":0}}', '{}', '{}', 0, 587),
	(197, 'nine-tree', 'nine-tree', '[]', '[]', '[]', 0, 0),
	(198, 'cartel_de_sinaloa', 'Cartel de Sinaloa', '{"YRKR4269":{"stored":1,"data":{"modTrimA":-1,"modTank":-1,"bodyHealth":992.0,"dirtLevel":3.0,"plateIndex":0,"modFender":-1,"modLivery":-1,"engineHealth":991.0,"modAerials":-1,"modDoorR":-1,"modOrnaments":-1,"fuelLevel":10.0,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modXenon":false,"modFrame":-1,"modTrunk":-1,"modRightFender":-1,"modLightbar":-1,"doorsBroken":[],"modSpoilers":-1,"modRearBumper":-1,"color1":154,"plate":"YRKR4269","modAirFilter":-1,"modArchCover":-1,"pearlescentColor":4,"windowsBroken":{"7":true,"6":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modVanityPlate":-1,"modRoof":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modDashboard":-1,"modStruts":-1,"modTransmission":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modHood":-1,"xenonColor":255,"modHydrolic":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tankHealth":999.0,"color2":0,"modSeats":-1,"modExhaust":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"wheels":4,"modTurbo":false,"modBrakes":-1,"modFrontWheels":-1,"extras":[],"neonColor":[255,0,255],"modPlateHolder":-1,"modAPlate":-1,"model":298565713,"wheelColor":154,"windowTint":-1,"modDial":-1,"modEngine":-1,"modShifterLeavers":-1,"modBackWheels":-1,"modSuspension":-1,"modSideSkirt":-1},"owner":"license:f90366ddb9533d193e1204a47ca232a9b43eb6f0"},"TSCI5028":{"stored":1,"data":{"modTrimA":-1,"modTank":-1,"bodyHealth":917.2,"dirtLevel":6.6,"plateIndex":0,"modFender":-1,"modLivery":-1,"engineHealth":996.5,"modAerials":-1,"modDoorR":-1,"modOrnaments":-1,"fuelLevel":55.6,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modXenon":false,"modFrame":-1,"modTrunk":-1,"modRightFender":-1,"wheelColor":155,"doorsBroken":{"1":false,"0":false},"modSpoilers":-1,"modRearBumper":-1,"color1":155,"plate":"TSCI5028","modAirFilter":-1,"modArchCover":-1,"pearlescentColor":0,"windowsBroken":{"7":true,"6":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modVanityPlate":-1,"modRoof":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modArmor":-1,"modStruts":-1,"modTransmission":-1,"modFrontWheels":-1,"modHood":-1,"xenonColor":255,"modHydrolic":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tankHealth":958.6,"color2":0,"modSeats":-1,"modExhaust":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modTurbo":false,"wheels":4,"modShifterLeavers":-1,"modBrakes":-1,"neonColor":[255,0,255],"extras":[],"modAPlate":-1,"windowTint":-1,"modEngine":-1,"model":-210308634,"modDashboard":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modDial":-1,"modLightbar":-1,"modPlateHolder":-1,"modBackWheels":-1,"modSuspension":-1,"modSideSkirt":-1},"owner":"license:f90366ddb9533d193e1204a47ca232a9b43eb6f0"},"MPXZ7084":{"stored":0,"data":{"modTrimA":-1,"modTank":-1,"bodyHealth":1000.0,"dirtLevel":6.0,"plateIndex":0,"modFender":-1,"modLivery":-1,"engineHealth":1000.0,"modAerials":-1,"modDoorR":-1,"modOrnaments":-1,"fuelLevel":9.8,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modXenon":false,"modFrame":-1,"modTrunk":-1,"modRightFender":-1,"modLightbar":-1,"doorsBroken":[],"modSpoilers":-1,"modRearBumper":-1,"color1":154,"plate":"MPXZ7084","modAirFilter":-1,"modArchCover":-1,"pearlescentColor":4,"windowsBroken":{"7":true,"6":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modVanityPlate":-1,"modRoof":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modArmor":-1,"modStruts":-1,"modTransmission":-1,"modFrontWheels":-1,"modHood":-1,"xenonColor":255,"modHydrolic":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modDial":-1,"color2":0,"modSeats":-1,"modExhaust":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modTurbo":false,"wheels":4,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modBrakes":-1,"modPlateHolder":-1,"extras":[],"neonColor":[255,0,255],"modAPlate":-1,"windowTint":-1,"model":298565713,"wheelColor":154,"modEngine":-1,"modDashboard":-1,"tankHealth":1000.0,"modShifterLeavers":-1,"modBackWheels":-1,"modSuspension":-1,"modSideSkirt":-1},"owner":"license:f90366ddb9533d193e1204a47ca232a9b43eb6f0"},"DVJX2416":{"stored":1,"data":{"modTrimA":-1,"modTank":-1,"bodyHealth":988.0,"dirtLevel":0.0,"plateIndex":0,"modFender":-1,"modLivery":-1,"engineHealth":1000.0,"modAerials":-1,"modDoorR":-1,"modOrnaments":-1,"fuelLevel":64.5,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modXenon":false,"modFrame":-1,"modTrunk":-1,"modRightFender":-1,"modLightbar":-1,"doorsBroken":{"1":false,"0":false},"modSpoilers":-1,"modRearBumper":-1,"color1":155,"plate":"DVJX2416","modAirFilter":-1,"modArchCover":-1,"pearlescentColor":0,"windowsBroken":{"7":true,"6":false,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modVanityPlate":-1,"modRoof":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modArmor":-1,"modStruts":-1,"modTransmission":-1,"modFrontWheels":-1,"modHood":-1,"xenonColor":255,"modHydrolic":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modDial":-1,"color2":0,"modSeats":-1,"modExhaust":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modTurbo":false,"wheels":4,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modBrakes":-1,"modPlateHolder":-1,"extras":[],"neonColor":[255,0,255],"modAPlate":-1,"windowTint":-1,"model":-210308634,"wheelColor":155,"modEngine":-1,"modDashboard":-1,"tankHealth":999.0,"modShifterLeavers":-1,"modBackWheels":-1,"modSuspension":-1,"modSideSkirt":-1},"owner":"license:f90366ddb9533d193e1204a47ca232a9b43eb6f0"},"FJQL7348":{"stored":0,"data":{"modTrimA":-1,"modTank":-1,"bodyHealth":1000.0,"dirtLevel":0.0,"plateIndex":0,"modFender":-1,"modLivery":-1,"engineHealth":1000.0,"modAerials":-1,"modDoorR":-1,"modOrnaments":-1,"fuelLevel":10.0,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modXenon":false,"modFrame":-1,"modTrunk":-1,"modRightFender":-1,"modLightbar":-1,"doorsBroken":[],"modSpoilers":-1,"modRearBumper":-1,"color1":154,"plate":"FJQL7348","modAirFilter":-1,"modArchCover":-1,"pearlescentColor":4,"windowsBroken":{"7":true,"6":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modVanityPlate":-1,"modRoof":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modDashboard":-1,"modStruts":-1,"modTransmission":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modHood":-1,"xenonColor":255,"modHydrolic":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tankHealth":1000.0,"color2":0,"modSeats":-1,"modExhaust":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"wheels":4,"modTurbo":false,"modBrakes":-1,"modFrontWheels":-1,"extras":[],"neonColor":[255,0,255],"modPlateHolder":-1,"modAPlate":-1,"model":298565713,"wheelColor":154,"windowTint":-1,"modDial":-1,"modEngine":-1,"modShifterLeavers":-1,"modBackWheels":-1,"modSuspension":-1,"modSideSkirt":-1},"owner":"license:f90366ddb9533d193e1204a47ca232a9b43eb6f0"},"KBVN6443":{"stored":1,"data":{"modTrimA":-1,"modTank":-1,"bodyHealth":1000.0,"dirtLevel":0.0,"plateIndex":0,"modFender":-1,"modLivery":-1,"engineHealth":1000.0,"modAerials":-1,"modDoorR":-1,"modOrnaments":-1,"fuelLevel":64.7,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modXenon":false,"modFrame":-1,"modTrunk":-1,"modRightFender":-1,"modLightbar":-1,"doorsBroken":{"1":false,"0":false},"modSpoilers":-1,"modRearBumper":-1,"color1":152,"plate":"KBVN6443","modAirFilter":-1,"modArchCover":-1,"pearlescentColor":0,"windowsBroken":{"7":true,"6":false,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true},"modVanityPlate":-1,"modRoof":-1,"modTrimB":-1,"modDoorSpeaker":-1,"modDashboard":-1,"modStruts":-1,"modTransmission":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false},"modHood":-1,"xenonColor":255,"modHydrolic":-1,"modSmokeEnabled":false,"modFrontBumper":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tankHealth":1000.0,"color2":0,"modSeats":-1,"modExhaust":-1,"modGrille":-1,"modSpeakers":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"wheels":4,"modTurbo":false,"modBrakes":-1,"modFrontWheels":-1,"extras":[],"neonColor":[255,0,255],"modPlateHolder":-1,"modAPlate":-1,"model":-210308634,"wheelColor":152,"windowTint":-1,"modDial":-1,"modEngine":-1,"modShifterLeavers":-1,"modBackWheels":-1,"modSuspension":-1,"modSideSkirt":-1},"owner":"license:f90366ddb9533d193e1204a47ca232a9b43eb6f0"}}', '{"coke_pooch":{"name":"coke_pooch","count":4945,"label":"Pochon de coke"},"clip":{"name":"clip","count":75,"label":"Chargeur"},"coke":{"name":"coke","label":"Coke","count":225}}', NULL, 0, 70000),
	(199, 'aztecas', 'Aztecas', '{"ERQX5524":{"data":{"windowTint":1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":1000.0,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"pearlescentColor":51,"modSpoilers":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":111,"color1":157,"modTrunk":-1,"modExhaust":-1,"modSeats":-1,"plate":"ERQX5524","modDial":-1,"modFrontWheels":-1,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"model":-208911803,"modTurbo":1,"modTransmission":-1,"extras":{"1":1},"modSideSkirt":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"modShifterLeavers":-1,"modSpeakers":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"modHorns":-1,"modTrimB":-1,"modHydrolic":-1,"modXenon":1,"wheels":7,"modTank":-1,"dirtLevel":3.0,"color2":0,"fuelLevel":87.0,"bodyHealth":1000.0,"xenonColor":255,"neonColor":[255,0,255],"modRightFender":-1,"tyreBurst":{"5":false,"0":false,"4":false,"1":false},"modRoof":-1,"modVanityPlate":-1,"modAerials":-1,"modFrame":-1,"modArmor":-1,"modBrakes":-1,"modEngine":-1,"tankHealth":1000.0,"modHood":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":true,"5":true},"modGrille":-1},"owner":"license:0e7d3e3c918baebc2bd47a2f0619a5227bfa8e33","stored":0},"HKOT0946":{"data":{"windowTint":1,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"4":false,"5":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":994.0,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"modArmor":-1,"modGrille":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":157,"color1":1,"modTrunk":-1,"modExhaust":-1,"modSeats":-1,"plate":"HKOT0946","modDial":-1,"modFrontWheels":4,"modDoorR":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"modArchCover":-1,"modTurbo":1,"modTransmission":-1,"extras":[],"modSideSkirt":-1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"modXenon":1,"fuelLevel":19.7,"pearlescentColor":87,"neonEnabled":[false,false,false,false],"xenonColor":255,"modAerials":-1,"modTrimB":-1,"modSpoilers":-1,"modSteeringWheel":-1,"modHood":-1,"modTank":-1,"dirtLevel":3.0,"color2":1,"neonColor":[255,0,255],"bodyHealth":981.0,"modShifterLeavers":-1,"modRoof":-1,"modHorns":-1,"wheels":4,"tyreBurst":{"4":false,"1":false,"0":false,"5":false},"modVanityPlate":-1,"model":1203490606,"modRightFender":-1,"modHydrolic":-1,"modBrakes":-1,"modEngine":-1,"tankHealth":998.0,"modFrame":-1,"windowsBroken":{"2":false,"3":false,"0":false,"1":false,"6":false,"7":false,"4":false,"5":false},"modSpeakers":-1},"owner":"license:809babd6eb9ff7d5e613830eaa023e621d05f9c5","stored":0},"DMQC6504":{"data":{"windowTint":2,"doorsBroken":{"2":false,"3":false,"0":false,"1":false,"4":false},"modSuspension":-1,"modAPlate":-1,"engineHealth":847.1,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modFender":-1,"modPlateHolder":-1,"modArmor":-1,"modGrille":-1,"modOrnaments":-1,"modDoorSpeaker":-1,"modTrimA":-1,"modStruts":-1,"wheelColor":132,"fuelLevel":64.1,"modShifterLeavers":-1,"modExhaust":1,"modSeats":-1,"plate":"DMQC6504","modDial":-1,"modFrontWheels":7,"modSpeakers":-1,"modLightbar":-1,"modEngineBlock":-1,"modFrontBumper":-1,"modAirFilter":-1,"modRearBumper":-1,"model":1104234922,"modTurbo":1,"modFrame":4,"modXenon":1,"modSideSkirt":1,"modSmokeEnabled":false,"modLivery":-1,"modDashboard":-1,"tyreBurst":{"4":false,"1":false,"0":false,"5":false},"neonColor":[255,0,255],"xenonColor":0,"neonEnabled":[false,false,false,false],"wheels":5,"modAerials":-1,"modTrimB":-1,"modSteeringWheel":-1,"modTransmission":2,"modHood":4,"modTank":-1,"dirtLevel":3.2,"color2":132,"modRoof":-1,"bodyHealth":874.7,"modHorns":-1,"modTrunk":-1,"color1":157,"pearlescentColor":134,"extras":[],"modVanityPlate":-1,"modSpoilers":10,"modRightFender":-1,"windowsBroken":{"2":false,"3":true,"0":false,"1":false,"6":false,"7":true,"4":true,"5":true},"modBrakes":2,"modEngine":3,"tankHealth":983.8,"modArchCover":-1,"modHydrolic":-1,"modDoorR":-1},"owner":"license:c55c8fbf8d18806146f44a285b752cd0fa4b6e42","stored":0}}', '{}', '{"WEAPON_MACHETE":[{"ammo":1,"components":[],"label":"Machette","name":"WEAPON_MACHETE"},{"ammo":1,"components":[],"label":"Machette","name":"WEAPON_MACHETE"}]}', 0, 0),
	(200, 'bratva', 'Bratva', '{"LSKA4946":{"owner":"license:4776f3bca8a0c0fef5a1185f14a1c3ce4fbdbe28","data":{"modHydrolic":-1,"modFrame":2,"modSmokeEnabled":false,"modFender":2,"modSpoilers":1,"dirtLevel":11.0,"windowsBroken":{"0":false,"1":false,"6":false,"7":false,"4":true,"5":true,"2":false,"3":false},"xenonColor":0,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":2,"modOrnaments":-1,"modXenon":1,"modArmor":-1,"modLivery":3,"modDial":-1,"modTrimA":-1,"modHorns":41,"neonEnabled":[false,false,false,false],"modEngine":3,"modTurbo":1,"wheels":5,"pearlescentColor":27,"modGrille":-1,"plateIndex":1,"bodyHealth":977.4,"modBackWheels":-1,"modDashboard":6,"modArchCover":8,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modDoorSpeaker":3,"modVanityPlate":0,"color2":13,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":1,"modLightbar":-1,"modRightFender":-1,"modTank":-1,"color1":13,"modHood":-1,"modRoof":0,"doorsBroken":{"0":false,"1":false,"4":false,"2":false,"3":false},"modSeats":13,"tankHealth":997.7,"modSideSkirt":9,"modFrontWheels":-1,"engineHealth":1000.0,"modFrontBumper":7,"plate":"LSKA4946","modAPlate":-1,"modRearBumper":9,"modAerials":5,"wheelColor":0,"modSteeringWheel":15,"tyreSmokeColor":[255,255,255],"modSuspension":3,"modTrimB":-1,"extras":[],"modExhaust":4,"modBrakes":2,"model":-1726022652,"modEngineBlock":-1,"fuelLevel":89.0,"tyreBurst":{"0":false,"1":false,"5":false,"4":false}},"stored":1},"ASAL0395":{"owner":"license:bb7584b571e6f54dad74c33ed8b4cac802abfba6","data":{"modHydrolic":-1,"modFrame":-1,"modSmokeEnabled":false,"modFender":1,"modSpoilers":8,"dirtLevel":0.5,"modRoof":0,"xenonColor":8,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":2,"modOrnaments":-1,"modXenon":1,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTurbo":1,"wheels":3,"pearlescentColor":28,"modGrille":-1,"plateIndex":0,"modSideSkirt":-1,"modSteeringWheel":-1,"doorsBroken":{"0":false,"1":false,"6":false,"4":false,"5":false,"2":false,"3":false},"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modVanityPlate":-1,"color2":1,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modBrakes":2,"modRightFender":-1,"modTank":-1,"modDashboard":-1,"modDoorSpeaker":-1,"tankHealth":1000.0,"fuelLevel":50.5,"modFrontBumper":-1,"modAerials":-1,"modExhaust":-1,"modFrontWheels":-1,"engineHealth":1000.0,"bodyHealth":1000.0,"plate":"ASAL0395","modHood":-1,"modRearBumper":-1,"modSeats":-1,"wheelColor":0,"modBackWheels":-1,"modEngine":3,"modSuspension":-1,"model":-1349095620,"extras":[],"tyreSmokeColor":[255,255,255],"color1":12,"windowsBroken":{"0":false,"1":false,"6":false,"7":false,"4":true,"5":true,"2":false,"3":false},"modTrimB":-1,"modLightbar":-1,"tyreBurst":{"4":false,"1":false,"5":false,"0":false}},"stored":0},"PUFR6549":{"owner":"license:7392248c19abd49cd6a308e99dba0d2ed2e8a9cd","data":{"modHydrolic":-1,"modFrame":-1,"modSmokeEnabled":false,"modFender":-1,"modSpoilers":-1,"dirtLevel":15.0,"modRoof":-1,"xenonColor":8,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":-1,"model":-2107990196,"modXenon":1,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modEngine":-1,"modTurbo":false,"wheels":0,"pearlescentColor":27,"modGrille":-1,"plateIndex":0,"bodyHealth":991.5,"modBackWheels":-1,"doorsBroken":{"0":false,"1":false,"6":false,"4":false,"5":false,"2":false,"3":false},"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modVanityPlate":-1,"color2":12,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modBrakes":-1,"modRightFender":-1,"modTank":-1,"modDashboard":-1,"modDoorSpeaker":-1,"tankHealth":999.2,"fuelLevel":42.0,"modFrontBumper":-1,"modSteeringWheel":-1,"tyreSmokeColor":[255,255,255],"modFrontWheels":-1,"engineHealth":994.0,"modLightbar":-1,"plate":"PUFR6549","modAerials":-1,"modRearBumper":-1,"modHood":-1,"wheelColor":0,"modAPlate":-1,"modOrnaments":-1,"modSuspension":-1,"modSeats":-1,"extras":[],"modExhaust":-1,"color1":12,"windowsBroken":{"0":false,"1":true,"6":false,"7":false,"4":true,"5":true,"2":false,"3":false},"modTrimB":-1,"modSideSkirt":-1,"tyreBurst":{"0":false,"1":false,"5":false,"4":false}},"stored":0},"OMGN2444":{"owner":"license:bb7584b571e6f54dad74c33ed8b4cac802abfba6","data":{"modHydrolic":-1,"modFrame":-1,"modSmokeEnabled":false,"modFender":-1,"modSpoilers":-1,"dirtLevel":15.0,"modRoof":-1,"xenonColor":255,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":-1,"model":872704284,"modXenon":false,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTurbo":false,"wheels":5,"pearlescentColor":28,"modGrille":-1,"plateIndex":0,"bodyHealth":850.2,"modBackWheels":-1,"doorsBroken":{"0":false,"1":false,"6":false,"4":true,"5":false,"2":false,"3":false},"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modVanityPlate":-1,"color2":9,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modLightbar":-1,"modRightFender":-1,"modTank":-1,"modDashboard":-1,"modDoorSpeaker":-1,"tankHealth":956.8,"fuelLevel":65.3,"modFrontBumper":-1,"modSeats":-1,"modSteeringWheel":-1,"modFrontWheels":-1,"engineHealth":919.8,"tyreSmokeColor":[255,255,255],"plate":"OMGN2444","color1":12,"modRearBumper":-1,"modAerials":-1,"wheelColor":156,"modHood":-1,"modEngine":-1,"modSuspension":-1,"modSideSkirt":-1,"extras":[],"modExhaust":-1,"windowsBroken":{"0":true,"1":true,"6":true,"7":true,"4":true,"5":true,"2":true,"3":false},"modTrimB":-1,"modOrnaments":-1,"modBrakes":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false}},"stored":0},"PIFW5335":{"owner":"license:bb7584b571e6f54dad74c33ed8b4cac802abfba6","data":{"modHydrolic":-1,"modFrame":2,"modSmokeEnabled":false,"modFender":0,"modSpoilers":2,"dirtLevel":8.3,"modRoof":17,"xenonColor":8,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":2,"model":-986944621,"modXenon":1,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modEngine":3,"modTurbo":1,"wheels":7,"pearlescentColor":28,"modGrille":9,"plateIndex":1,"bodyHealth":853.3,"modBackWheels":-1,"doorsBroken":{"0":false,"1":false,"4":false,"2":false,"3":false},"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modVanityPlate":-1,"color2":21,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modBrakes":2,"modRightFender":-1,"modTank":-1,"modDashboard":-1,"modDoorSpeaker":-1,"tankHealth":974.9,"fuelLevel":28.6,"modFrontBumper":2,"modSteeringWheel":-1,"tyreSmokeColor":[255,255,255],"modFrontWheels":-1,"engineHealth":833.2,"modLightbar":-1,"plate":"PIFW5335","modAerials":-1,"modRearBumper":2,"modHood":12,"wheelColor":0,"modAPlate":-1,"modOrnaments":-1,"modSuspension":3,"modSeats":-1,"extras":[],"modExhaust":6,"color1":12,"windowsBroken":{"0":false,"1":false,"6":false,"7":true,"4":true,"5":true,"2":false,"3":true},"modTrimB":-1,"modSideSkirt":13,"tyreBurst":{"0":false,"1":false,"5":false,"4":false}},"stored":0},"YJZO0722":{"owner":"license:f5100e61f8b19f609f1dd943c4c3ffd5b52b7f43","data":{"modHydrolic":-1,"modFrame":0,"modSmokeEnabled":false,"modFender":0,"modSpoilers":2,"dirtLevel":15.0,"modRoof":0,"xenonColor":255,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":-1,"model":359875117,"modXenon":false,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[1,1,1,1],"modAPlate":-1,"modTurbo":false,"wheels":3,"pearlescentColor":43,"modGrille":-1,"plateIndex":0,"bodyHealth":733.0,"modBackWheels":-1,"doorsBroken":{"0":false,"1":false,"6":false,"4":true,"5":false,"2":false,"3":false},"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[94,255,1],"modEngineBlock":-1,"modVanityPlate":-1,"color2":0,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modLightbar":-1,"modRightFender":-1,"modTank":-1,"modDashboard":-1,"modDoorSpeaker":-1,"tankHealth":975.1,"fuelLevel":65.6,"modFrontBumper":-1,"modSeats":-1,"modSteeringWheel":-1,"modFrontWheels":-1,"engineHealth":928.1,"tyreSmokeColor":[255,255,255],"plate":"YJZO0722","color1":12,"modRearBumper":-1,"modAerials":-1,"wheelColor":0,"modHood":4,"modEngine":-1,"modSuspension":-1,"modSideSkirt":-1,"extras":[],"modExhaust":1,"windowsBroken":{"0":true,"1":true,"6":true,"7":true,"4":false,"5":true,"2":false,"3":true},"modTrimB":-1,"modOrnaments":-1,"modBrakes":-1,"tyreBurst":{"4":false,"5":false,"1":false,"0":false}},"stored":0},"VZEU5625":{"owner":"license:bb7584b571e6f54dad74c33ed8b4cac802abfba6","data":{"modHydrolic":-1,"modFrame":-1,"modSmokeEnabled":false,"modFender":-1,"modSpoilers":-1,"dirtLevel":3.6,"modRoof":-1,"xenonColor":8,"windowTint":1,"modStruts":-1,"modSpeakers":-1,"modTransmission":2,"modOrnaments":-1,"modXenon":1,"modArmor":-1,"modLivery":-1,"modDial":-1,"modTrimA":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTurbo":1,"wheels":4,"pearlescentColor":27,"modGrille":-1,"plateIndex":1,"modSideSkirt":0,"modBackWheels":-1,"doorsBroken":{"0":false,"1":false,"6":false,"4":false,"5":false,"2":false,"3":false},"modArchCover":-1,"modShifterLeavers":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modVanityPlate":-1,"color2":12,"modDoorR":-1,"modTrunk":-1,"modPlateHolder":-1,"modBrakes":2,"modRightFender":-1,"modTank":-1,"modDashboard":-1,"modDoorSpeaker":-1,"tankHealth":986.0,"fuelLevel":95.4,"modFrontBumper":1,"modAerials":-1,"modExhaust":0,"modFrontWheels":0,"engineHealth":836.1,"tyreSmokeColor":[255,255,255],"plate":"VZEU5625","modSteeringWheel":-1,"modRearBumper":0,"modHood":-1,"wheelColor":156,"modSeats":-1,"modEngine":3,"modSuspension":3,"bodyHealth":866.9,"extras":{"11":1,"10":1,"12":1},"color1":12,"modLightbar":-1,"windowsBroken":{"0":false,"1":true,"6":true,"7":false,"4":false,"5":false,"2":false,"3":false},"modTrimB":-1,"model":-808831384,"tyreBurst":{"0":false,"5":false,"1":false,"4":false}},"stored":0}}', '{"opium":{"name":"opium","label":"Opium","count":40},"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":275},"clip":{"name":"clip","label":"Chargeur","count":33},"weed_pooch":{"name":"weed_pooch","label":"Pochon de weed","count":5},"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":127},"coke":{"name":"coke","label":"Coke","count":25},"meth":{"name":"meth","label":"Meth","count":15},"lsd_pooch":{"name":"lsd_pooch","label":"Pochon de LSD","count":330},"weed":{"name":"weed","label":"Weed","count":9}}', '{"WEAPON_PISTOL":[{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":1,"components":[]},{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":1316,"components":[]},{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":300,"components":[]},{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":1,"components":[]},{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":1,"components":[]},{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":1,"components":[]},{"name":"WEAPON_PISTOL","label":"Pistolet","ammo":1,"components":[]}],"WEAPON_MACHETE":[{"name":"WEAPON_MACHETE","label":"Machette","ammo":1,"components":[]},{"name":"WEAPON_MACHETE","label":"Machette","ammo":1,"components":[]},{"name":"WEAPON_MACHETE","label":"Machette","ammo":1,"components":[]}],"WEAPON_KNIFE":[{"name":"WEAPON_KNIFE","label":"Couteau","ammo":1,"components":[]},{"name":"WEAPON_KNIFE","label":"Couteau","ammo":1,"components":[]},{"name":"WEAPON_KNIFE","label":"Couteau","ammo":1,"components":[]},{"name":"WEAPON_KNIFE","label":"Couteau","ammo":1,"components":[]},{"name":"WEAPON_KNIFE","label":"Couteau","ammo":1,"components":[]}],"WEAPON_PISTOL50":[{"components":[],"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0}],"WEAPON_SNSPISTOL":[{"name":"WEAPON_SNSPISTOL","label":"Pistolet sns","ammo":151,"components":[]}]}', 0, 4195175),
	(201, 'h-block', 'H-Block', '{"ZFVC8945":{"data":{"plate":"ZFVC8945","pearlescentColor":5,"windowsBroken":{"5":true,"6":true,"7":true,"0":false,"1":false,"2":true,"3":true,"4":true},"modRoof":-1,"modHood":-1,"modTrimA":-1,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modDoorR":-1,"modLightbar":-1,"modHydrolic":-1,"wheels":7,"modAirFilter":-1,"modTrimB":-1,"modTransmission":-1,"color2":36,"modBrakes":-1,"modDial":-1,"modDashboard":-1,"modHorns":-1,"modXenon":false,"windowTint":-1,"tankHealth":961.0,"engineHealth":766.5,"modSpoilers":-1,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modAerials":-1,"modSteeringWheel":-1,"modLivery":-1,"modTrunk":-1,"modPlateHolder":-1,"color1":12,"modAPlate":-1,"extras":[],"modTurbo":false,"modExhaust":-1,"modFrontBumper":-1,"modVanityPlate":-1,"modTank":-1,"modSuspension":-1,"tyreSmokeColor":[255,255,255],"modSeats":-1,"plateIndex":0,"modRightFender":-1,"modEngineBlock":-1,"modDoorSpeaker":-1,"wheelColor":11,"modSideSkirt":-1,"neonColor":[255,0,255],"modFrontWheels":-1,"modFrame":-1,"modEngine":-1,"modStruts":-1,"tyreBurst":{"5":false,"4":false,"1":false,"0":false},"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"fuelLevel":42.2,"bodyHealth":740.4,"modRearBumper":-1,"modArchCover":-1,"modSmokeEnabled":false,"modArmor":-1,"modSpeakers":-1,"xenonColor":255,"dirtLevel":15.0,"modFender":-1,"model":1755697647},"stored":0,"owner":"license:e6c8fcc9d4b8ea197432fc47cf92d174bcbe0100"},"WLCO9414":{"data":{"plate":"WLCO9414","pearlescentColor":11,"windowsBroken":{"5":true,"6":true,"7":true,"0":true,"1":true,"2":true,"3":false,"4":true},"modRoof":-1,"modHood":3,"plateIndex":0,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modDoorR":-1,"modVanityPlate":-1,"modHydrolic":-1,"wheels":4,"modAirFilter":-1,"modTrimB":-1,"modTransmission":2,"color2":134,"modBrakes":2,"modDial":-1,"modDashboard":-1,"modHorns":-1,"modXenon":false,"windowTint":1,"tankHealth":945.4,"engineHealth":960.5,"modSpoilers":-1,"doorsBroken":{"5":false,"6":false,"0":false,"1":false,"2":false,"3":false,"4":false},"modAerials":-1,"modSteeringWheel":-1,"modLivery":0,"modTrunk":-1,"modPlateHolder":-1,"color1":11,"modAPlate":-1,"extras":[],"modTurbo":1,"modExhaust":8,"modFrontBumper":1,"model":872704284,"modTank":-1,"modSuspension":3,"modTrimA":-1,"modSeats":-1,"modEngineBlock":-1,"modRightFender":-1,"tyreSmokeColor":[255,255,255],"modDoorSpeaker":-1,"wheelColor":0,"modFrontWheels":1,"neonColor":[0,0,0],"modStruts":-1,"modFrame":-1,"modEngine":3,"tyreBurst":{"5":false,"1":false,"0":true,"4":false},"modSpeakers":-1,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"fuelLevel":26.4,"modArchCover":-1,"modRearBumper":1,"modLightbar":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modFender":-1,"xenonColor":255,"dirtLevel":1.8,"bodyHealth":784.0,"modArmor":-1},"stored":0,"owner":"license:dc91172732f317aa45dc777f0227abc025a6d56a"},"OQGT6086":{"data":{"plate":"OQGT6086","pearlescentColor":2,"windowsBroken":{"5":true,"6":true,"7":true,"0":true,"1":true,"2":true,"3":true,"4":true},"modRoof":-1,"modHood":-1,"modTrimA":-1,"modSmokeEnabled":false,"model":872704284,"modDoorR":-1,"modVanityPlate":-1,"modHydrolic":-1,"wheels":5,"modAirFilter":-1,"modTrimB":-1,"modTransmission":-1,"color2":9,"modBrakes":-1,"modDial":-1,"modDashboard":-1,"modHorns":-1,"bodyHealth":274.0,"windowTint":-1,"tankHealth":842.7,"engineHealth":676.7,"modSpoilers":13,"doorsBroken":{"5":false,"6":false,"0":false,"1":false,"2":false,"3":true,"4":true},"modAerials":-1,"modSteeringWheel":-1,"modLivery":0,"modTrunk":-1,"modPlateHolder":-1,"modFender":-1,"modAPlate":-1,"extras":[],"modTurbo":false,"modExhaust":8,"modFrontBumper":3,"modLightbar":-1,"modTank":-1,"modSuspension":-1,"modArmor":-1,"modSeats":-1,"plateIndex":0,"modRightFender":-1,"modEngineBlock":-1,"modDoorSpeaker":-1,"wheelColor":156,"modXenon":false,"neonColor":[255,0,255],"modFrontWheels":-1,"modFrame":-1,"modEngine":-1,"modSideSkirt":-1,"modStruts":-1,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"tyreBurst":{"5":false,"1":false,"4":false,"0":false},"color1":12,"modRearBumper":-1,"fuelLevel":21.1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modSpeakers":-1,"xenonColor":255,"dirtLevel":11.2,"tyreSmokeColor":[255,255,255],"modShifterLeavers":-1},"stored":0,"owner":"license:df2003f2e60a8801a9f244bb69e8966f4e80e1b2"},"FHPG7701":{"data":{"plate":"FHPG7701","pearlescentColor":7,"windowsBroken":{"5":true,"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true},"modRoof":-1,"modHood":-1,"modTrimA":-1,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modDoorR":-1,"modVanityPlate":-1,"modHydrolic":-1,"wheels":1,"modAirFilter":-1,"modTrimB":-1,"modTransmission":-1,"color2":120,"modBrakes":-1,"modDial":-1,"modDashboard":-1,"modHorns":-1,"bodyHealth":979.6,"windowTint":-1,"tankHealth":995.6,"engineHealth":986.0,"modSpoilers":-1,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modAerials":-1,"modSteeringWheel":-1,"modLivery":-1,"modTrunk":-1,"modPlateHolder":-1,"modFender":-1,"modAPlate":-1,"extras":[],"modTurbo":false,"modExhaust":-1,"modFrontBumper":-1,"modLightbar":-1,"modTank":-1,"modSuspension":-1,"modArmor":-1,"modSeats":-1,"plateIndex":0,"modRightFender":-1,"modEngineBlock":-1,"modDoorSpeaker":-1,"wheelColor":0,"modXenon":false,"neonColor":[255,0,255],"modFrontWheels":-1,"modFrame":-1,"modEngine":-1,"modSideSkirt":-1,"modStruts":-1,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"tyreBurst":{"5":false,"1":false,"4":false,"0":false},"color1":0,"modRearBumper":-1,"fuelLevel":56.8,"modArchCover":-1,"modSmokeEnabled":false,"modSpeakers":-1,"xenonColor":255,"dirtLevel":0.5,"model":-49115651,"tyreSmokeColor":[255,255,255]},"stored":0,"owner":"license:2584c33faf3578d4cdc9bfe9241e6fcc6753ad15"}}', '{"meth":{"count":24,"label":"Meth","name":"meth"},"opium":{"count":43,"label":"Opium","name":"opium"},"coke":{"count":40,"label":"Coke","name":"coke"},"weed":{"count":24,"label":"Weed","name":"weed"}}', '{}', 0, 0),
	(202, 'hoovers', 'Hoovers', '{"URXL8820":{"stored":0,"data":{"modDoorSpeaker":-1,"bodyHealth":751.0,"modTransmission":-1,"extras":[],"modShifterLeavers":-1,"modXenon":false,"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"4":false},"windowsBroken":{"1":false,"0":false,"3":false,"2":false,"5":true,"4":true,"7":false,"6":false},"tyreBurst":{"5":false,"0":true,"1":false,"4":false},"modRearBumper":-1,"modDoorR":-1,"plateIndex":0,"modTank":-1,"modSeats":-1,"modLightbar":-1,"plate":"URXL8820","modFrontWheels":-1,"modSpeakers":-1,"modHood":-1,"modStruts":-1,"color1":50,"modSmokeEnabled":false,"modEngineBlock":-1,"modFrontBumper":-1,"modArchCover":-1,"wheelColor":156,"modLivery":-1,"modRoof":-1,"modHorns":-1,"modVanityPlate":-1,"modDashboard":-1,"color2":50,"modHydrolic":-1,"modAerials":-1,"windowTint":-1,"modGrille":-1,"modSteeringWheel":-1,"model":-291021213,"neonColor":[255,0,255],"modTrimA":-1,"modAirFilter":-1,"modArmor":-1,"neonEnabled":[false,false,false,false],"engineHealth":838.0,"modSuspension":-1,"modPlateHolder":-1,"modEngine":-1,"modTrunk":-1,"modAPlate":-1,"wheels":5,"tankHealth":960.0,"modTrimB":-1,"modDial":-1,"fuelLevel":64.7,"modOrnaments":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modFrame":-1,"modBrakes":-1,"modTurbo":false,"modExhaust":-1,"modSideSkirt":-1,"pearlescentColor":57,"xenonColor":255,"modRightFender":-1,"dirtLevel":3.0,"modFender":-1},"owner":"license:801077ef58c2b28d6ba892dc67e0d66e72266cf2"},"XURW1899":{"stored":0,"data":{"modDoorSpeaker":-1,"bodyHealth":964.9,"modTransmission":-1,"extras":[],"modShifterLeavers":-1,"modXenon":1,"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"5":false,"4":false,"6":false},"windowsBroken":{"1":false,"0":true,"3":false,"2":false,"5":false,"4":false,"7":true,"6":true},"tyreBurst":{"5":false,"4":false,"0":false,"1":false},"modRearBumper":0,"modDoorR":-1,"plateIndex":0,"modTank":-1,"modSeats":-1,"modLightbar":-1,"plate":"XURW1899","modFrontWheels":9,"modSpeakers":-1,"modHood":1,"modStruts":-1,"color1":15,"modSmokeEnabled":false,"modEngineBlock":-1,"modFrontBumper":-1,"modArchCover":-1,"wheelColor":12,"modLivery":-1,"modRoof":-1,"modHorns":-1,"modVanityPlate":-1,"modEngine":-1,"color2":15,"modHydrolic":-1,"modAerials":-1,"windowTint":2,"modExhaust":0,"modSteeringWheel":-1,"modDashboard":-1,"dirtLevel":3.1,"modAirFilter":-1,"xenonColor":0,"modArmor":-1,"neonEnabled":[false,false,false,false],"engineHealth":999.0,"modSuspension":3,"modPlateHolder":-1,"modGrille":8,"pearlescentColor":138,"modAPlate":-1,"model":83136452,"modRightFender":-1,"wheels":3,"modDial":-1,"fuelLevel":65.7,"modOrnaments":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modFrame":-1,"modBrakes":-1,"modTurbo":1,"modTrimA":-1,"modTrimB":-1,"modTrunk":-1,"neonColor":[255,0,255],"tankHealth":993.3,"modSideSkirt":2,"modFender":0},"owner":"license:9e4ef1d80f3edec9add78e8168678e8cc4e56f29"},"TGNE2343":{"stored":0,"data":{"modDoorSpeaker":-1,"bodyHealth":1000.0,"modTransmission":2,"extras":{"1":false,"3":1,"2":1,"5":1,"4":false,"11":1,"10":false},"modShifterLeavers":-1,"modXenon":false,"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"5":false,"4":false,"6":false},"windowsBroken":{"1":true,"0":false,"3":false,"2":false,"5":false,"4":false,"7":false,"6":false},"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"modRearBumper":0,"modDoorR":-1,"plateIndex":0,"modTank":-1,"modSeats":-1,"modLightbar":-1,"plate":"TGNE2343","modFrontWheels":2,"modSpeakers":-1,"modHood":-1,"modStruts":-1,"color1":147,"modTrimB":-1,"modEngineBlock":-1,"modFrontBumper":0,"modArchCover":-1,"modArmor":-1,"modLivery":-1,"modExhaust":-1,"modHorns":-1,"modVanityPlate":-1,"modEngine":3,"dirtLevel":4.4,"modHydrolic":-1,"modAerials":-1,"windowTint":1,"model":-304802106,"neonColor":[0,0,0],"tankHealth":1000.0,"modDashboard":-1,"modAirFilter":-1,"xenonColor":255,"wheelColor":1,"neonEnabled":[false,false,false,false],"engineHealth":1000.0,"modSuspension":3,"modPlateHolder":-1,"modOrnaments":-1,"pearlescentColor":138,"modAPlate":-1,"modTrimA":-1,"modRightFender":-1,"modSmokeEnabled":false,"modDial":-1,"fuelLevel":60.7,"modGrille":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":0,"modFrame":-1,"modBrakes":2,"modTurbo":1,"modSideSkirt":-1,"wheels":0,"modTrunk":-1,"modSteeringWheel":-1,"modRoof":-1,"color2":0,"modFender":-1},"owner":"license:9e4ef1d80f3edec9add78e8168678e8cc4e56f29"},"68NXX608":{"stored":0,"data":{"modDoorSpeaker":-1,"modGrille":-1,"modTransmission":-1,"extras":{"1":1,"3":1,"2":1,"5":1,"4":1,"11":1,"10":false},"modShifterLeavers":-1,"modXenon":1,"doorsBroken":{"1":false,"0":false,"3":false,"2":false,"5":false,"4":false,"6":false},"xenonColor":255,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modRearBumper":-1,"modDoorR":-1,"plateIndex":1,"modTank":-1,"modSeats":-1,"modLightbar":-1,"plate":"68NXX608","modFrontWheels":2,"modSpeakers":-1,"modOrnaments":-1,"modStruts":-1,"color1":15,"wheels":0,"modEngineBlock":-1,"modFrontBumper":-1,"modArchCover":-1,"wheelColor":1,"modLivery":-1,"modRoof":-1,"modHorns":-1,"modVanityPlate":-1,"modDashboard":-1,"dirtLevel":1.5,"modHydrolic":-1,"modAerials":-1,"windowTint":2,"pearlescentColor":2,"modSteeringWheel":-1,"modArmor":-1,"modTrimB":-1,"modTrimA":-1,"modEngine":-1,"color2":15,"neonEnabled":[false,false,false,false],"engineHealth":1000.0,"modSuspension":3,"modPlateHolder":-1,"modDial":-1,"neonColor":[255,0,255],"modAPlate":-1,"modRightFender":-1,"tankHealth":1000.0,"modSmokeEnabled":false,"modHood":-1,"fuelLevel":62.6,"modAirFilter":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":0,"modFrame":-1,"modBrakes":-1,"modTurbo":1,"model":-304802106,"modSideSkirt":-1,"modTrunk":-1,"windowsBroken":{"1":false,"0":true,"3":false,"2":false,"5":false,"4":false,"7":false,"6":false},"bodyHealth":1000.0,"modExhaust":-1,"modFender":-1},"owner":"license:9e4ef1d80f3edec9add78e8168678e8cc4e56f29"}}', '{"meth":{"label":"Meth","count":2,"name":"meth"},"opium_pooch":{"label":"Pochon d\'opium","count":1,"name":"opium_pooch"},"coke":{"label":"Coke","count":2,"name":"coke"},"coke_pooch":{"label":"Pochon de coke","count":7,"name":"coke_pooch"},"jewels":{"label":"Bijoux","count":1,"name":"jewels"},"capote":{"label":"Capote","count":869,"name":"capote"},"meth_pooch":{"label":"Pochon de meth","count":1,"name":"meth_pooch"}}', '{}', 0, 0),
	(203, 'pirus_gang', 'Pirus Gang', '{"02BWY529":{"data":{"dirtLevel":1.2,"modExhaust":1,"pearlescentColor":138,"neonEnabled":[1,1,1,1],"modGrille":-1,"modFrontBumper":0,"color2":136,"modXenon":1,"tyreSmokeColor":[255,255,255],"modRoof":-1,"model":-1372848492,"engineHealth":807.8,"modTrimA":-1,"windowTint":1,"modSuspension":-1,"modSmokeEnabled":false,"modTrimB":-1,"modLivery":11,"modShifterLeavers":-1,"modRearBumper":-1,"modDashboard":-1,"fuelLevel":55.5,"modSpoilers":0,"modArchCover":-1,"modAirFilter":-1,"modTransmission":2,"modBackWheels":-1,"modFrame":0,"modHorns":46,"neonColor":[255,5,190],"modStruts":-1,"modSteeringWheel":-1,"modFrontWheels":23,"modLightbar":-1,"extras":[],"wheels":0,"modArmor":-1,"xenonColor":9,"modPlateHolder":-1,"modAPlate":-1,"modHydrolic":-1,"plateIndex":3,"plate":"02BWY529","modEngine":3,"modTurbo":1,"windowsBroken":{"3":true,"2":false,"1":true,"0":false,"7":true,"6":true,"5":true,"4":true},"modEngineBlock":-1,"modDoorSpeaker":-1,"doorsBroken":{"3":false,"2":false,"1":false,"0":false,"6":false,"5":false,"4":false},"modDoorR":-1,"modSideSkirt":1,"tankHealth":977.1,"modTrunk":-1,"modRightFender":-1,"modSpeakers":-1,"bodyHealth":823.0,"modOrnaments":-1,"modHood":-1,"modFender":-1,"modSeats":-1,"modTank":-1,"tyreBurst":{"4":false,"1":false,"5":false,"0":false},"modAerials":-1,"color1":136,"wheelColor":136,"modBrakes":2,"modDial":-1,"modVanityPlate":-1},"stored":0,"owner":"license:397222df1e4e27552be1069510b6729c1f56d3a5"},"OKIZ0461":{"data":{"dirtLevel":5.6,"modExhaust":3,"pearlescentColor":0,"neonEnabled":[false,false,false,false],"modVanityPlate":-1,"modFrontBumper":3,"color2":111,"doorsBroken":{"3":false,"2":false,"1":true,"0":false,"4":false},"tyreSmokeColor":[255,255,255],"modRoof":-1,"model":1377217886,"engineHealth":889.2,"modTrimA":-1,"windowTint":1,"modSuspension":3,"modSmokeEnabled":false,"modTrimB":-1,"modLivery":1,"modShifterLeavers":-1,"modRearBumper":2,"modDashboard":-1,"fuelLevel":28.8,"modSpoilers":13,"modArchCover":-1,"modAirFilter":-1,"modTransmission":2,"modBackWheels":-1,"modFrame":-1,"modHorns":-1,"neonColor":[255,0,255],"modStruts":-1,"modSteeringWheel":-1,"modFrontWheels":11,"modLightbar":-1,"extras":[],"wheels":2,"modArmor":-1,"xenonColor":9,"modPlateHolder":-1,"modAPlate":-1,"color1":136,"plateIndex":1,"plate":"OKIZ0461","modEngine":3,"modTurbo":1,"windowsBroken":{"3":true,"2":false,"1":true,"0":true,"7":true,"6":true,"5":true,"4":true},"wheelColor":136,"modDoorSpeaker":-1,"modGrille":-1,"modEngineBlock":-1,"modDoorR":-1,"modSideSkirt":3,"tankHealth":944.3,"modRightFender":-1,"modTrunk":-1,"modSpeakers":-1,"modOrnaments":-1,"bodyHealth":697.1,"modHood":3,"modSeats":1,"modTank":-1,"tyreBurst":{"0":false,"1":false,"5":false,"4":false},"modAerials":-1,"modXenon":1,"modBrakes":2,"modFender":-1,"modDial":-1,"modHydrolic":-1},"stored":0,"owner":"license:397222df1e4e27552be1069510b6729c1f56d3a5"}}', '{"meth":{"name":"meth","label":"Meth","count":35},"weed":{"name":"weed","label":"Weed","count":20},"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":3},"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":1},"coke":{"name":"coke","label":"Coke","count":10}}', '{}', 0, 899082),
	(204, 'dirtbike', 'DirtBike', '{"49CVN830":{"stored":1,"data":{"tyreBurst":{"0":false,"4":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"modHydrolic":-1,"pearlescentColor":134,"doorsBroken":{"1":false,"0":false},"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"49CVN830","model":-1639924411,"bodyHealth":961.0,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modFrame":-1,"engineHealth":984.0,"xenonColor":255,"modTrimB":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":89.0,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"plateIndex":4,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modArmor":-1,"modAirFilter":-1,"dirtLevel":1.1,"modBrakes":-1,"modDashboard":-1,"modHorns":-1,"modOrnaments":-1,"modSeats":-1,"tankHealth":984.0,"modStruts":-1,"color2":112,"modFender":-1,"wheels":6,"modTank":-1,"modLivery":-1,"modDoorR":-1,"extras":[],"modPlateHolder":-1,"windowTint":-1,"modTransmission":-1,"modVanityPlate":-1,"color1":112,"modDoorSpeaker":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modTrunk":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"83PDC228":{"stored":0,"data":{"tyreBurst":{"0":false,"4":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"modHydrolic":-1,"pearlescentColor":134,"doorsBroken":{"1":false,"0":false},"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"83PDC228","model":1430094716,"bodyHealth":833.3,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modFrame":-1,"engineHealth":833.9,"xenonColor":255,"modTrimB":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":94.5,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"plateIndex":4,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modArmor":-1,"modAirFilter":-1,"dirtLevel":9.5,"modBrakes":-1,"modDashboard":-1,"modHorns":-1,"modOrnaments":-1,"modSeats":-1,"tankHealth":942.6,"modStruts":-1,"color2":112,"modFender":-1,"wheels":6,"modTank":-1,"modLivery":-1,"modDoorR":-1,"extras":[],"modPlateHolder":-1,"windowTint":-1,"modTransmission":-1,"modVanityPlate":-1,"color1":112,"modDoorSpeaker":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modTrunk":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"86UPY679":{"stored":1,"data":{"tyreBurst":{"4":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"modHydrolic":-1,"pearlescentColor":134,"modFender":-1,"modShifterLeavers":-1,"modDoorSpeaker":-1,"modDial":-1,"plate":"86UPY679","modTransmission":-1,"bodyHealth":679.4,"modRightFender":-1,"modXenon":false,"modArmor":-1,"modFrame":-1,"engineHealth":718.4,"xenonColor":255,"modLivery":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":82.0,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":1,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modBrakes":-1,"modAirFilter":-1,"doorsBroken":{"1":false,"0":false},"modDashboard":-1,"color2":112,"modTrimB":-1,"modOrnaments":-1,"modSeats":-1,"tankHealth":901.8,"modStruts":-1,"modHorns":-1,"modSuspension":-1,"wheels":6,"modTank":-1,"modSmokeEnabled":false,"modDoorR":-1,"extras":[],"modPlateHolder":-1,"windowTint":-1,"dirtLevel":15.0,"modVanityPlate":-1,"color1":112,"model":-1639924411,"modFrontBumper":-1,"neonColor":[255,0,255],"plateIndex":4},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"64PYL047":{"stored":1,"data":{"tyreBurst":{"0":false,"4":false},"modSteeringWheel":-1,"modFrontWheels":38,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":11,"modGrille":-1,"modArchCover":-1,"modOrnaments":-1,"modRoof":-1,"modHydrolic":-1,"pearlescentColor":134,"modDashboard":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"64PYL047","model":1430094716,"bodyHealth":321.1,"modRightFender":-1,"modXenon":false,"modArmor":-1,"modFrame":-1,"engineHealth":559.0,"xenonColor":255,"modLivery":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":43.0,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modSmokeEnabled":false,"modAirFilter":-1,"modTransmission":-1,"modTrimB":-1,"modBrakes":-1,"modAPlate":-1,"modStruts":-1,"doorsBroken":{"1":false,"0":false},"tankHealth":810.6,"modVanityPlate":-1,"modHorns":-1,"color2":148,"wheels":6,"modTank":-1,"plateIndex":4,"modDoorR":-1,"extras":[],"modFender":-1,"windowTint":-1,"dirtLevel":7.4,"modSeats":-1,"color1":148,"modDoorSpeaker":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modPlateHolder":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"40RHY765":{"stored":1,"data":{"tyreBurst":{"0":false,"4":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"dirtLevel":15.0,"pearlescentColor":134,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"40RHY765","model":1430094716,"bodyHealth":491.0,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modFrame":-1,"engineHealth":468.5,"xenonColor":255,"modLivery":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":28.0,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modOrnaments":-1,"modPlateHolder":-1,"modHydrolic":-1,"modTrimB":-1,"modBrakes":-1,"modDoorSpeaker":-1,"modHorns":-1,"modTransmission":-1,"tankHealth":815.2,"modVanityPlate":-1,"modStruts":-1,"plateIndex":4,"wheels":6,"modTank":-1,"modArmor":-1,"modDoorR":-1,"extras":[],"doorsBroken":{"1":false,"0":false},"windowTint":-1,"modAirFilter":-1,"modSeats":-1,"color1":112,"color2":112,"modFrontBumper":-1,"neonColor":[255,0,255],"modDashboard":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"87PQK000":{"stored":1,"data":{"tyreBurst":{"4":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"dirtLevel":15.0,"pearlescentColor":134,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"87PQK000","model":-1639924411,"bodyHealth":927.4,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modHorns":-1,"engineHealth":961.0,"xenonColor":255,"modLivery":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":54.4,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modOrnaments":-1,"modPlateHolder":-1,"modArmor":-1,"modTrimB":-1,"modBrakes":-1,"color2":112,"modAirFilter":-1,"modTransmission":-1,"tankHealth":966.4,"modVanityPlate":-1,"modStruts":-1,"modFrame":-1,"wheels":6,"modTank":-1,"plateIndex":4,"modDoorR":-1,"extras":[],"doorsBroken":{"1":false,"0":false},"windowTint":-1,"modDoorSpeaker":-1,"modSeats":-1,"color1":112,"modHydrolic":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modDashboard":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"82MDS065":{"stored":1,"data":{"tyreBurst":{"4":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"dirtLevel":4.5,"pearlescentColor":134,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"82MDS065","model":1430094716,"bodyHealth":955.5,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modHorns":-1,"engineHealth":958.0,"xenonColor":255,"modLivery":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":38.9,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modOrnaments":-1,"modPlateHolder":-1,"modArmor":-1,"modTrimB":-1,"modBrakes":-1,"color2":112,"modAirFilter":-1,"modTransmission":-1,"tankHealth":981.3,"modVanityPlate":-1,"modStruts":-1,"modFrame":-1,"wheels":6,"modTank":-1,"plateIndex":4,"modDoorR":-1,"extras":[],"doorsBroken":{"1":false,"0":false},"windowTint":-1,"modDoorSpeaker":-1,"modSeats":-1,"color1":112,"modHydrolic":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modDashboard":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"},"26EXT630":{"stored":1,"data":{"tyreBurst":{"4":false,"0":false},"modSteeringWheel":-1,"modFrontWheels":-1,"modBackWheels":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"modGrille":-1,"modArchCover":-1,"modAPlate":-1,"modRoof":-1,"dirtLevel":11.1,"pearlescentColor":134,"modFender":-1,"modShifterLeavers":-1,"modSuspension":-1,"modDial":-1,"plate":"26EXT630","model":-1639924411,"bodyHealth":878.0,"modRightFender":-1,"modXenon":false,"modSmokeEnabled":false,"modHorns":-1,"engineHealth":969.0,"xenonColor":255,"modLivery":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"fuelLevel":47.3,"modSpeakers":-1,"modRearBumper":-1,"modSpoilers":-1,"modTrunk":-1,"modTurbo":false,"modEngineBlock":-1,"windowsBroken":{"7":true,"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true},"modExhaust":-1,"modAerials":-1,"modEngine":-1,"modHood":-1,"modTrimA":-1,"modLightbar":-1,"modOrnaments":-1,"modPlateHolder":-1,"modArmor":-1,"modTrimB":-1,"modBrakes":-1,"color2":112,"modAirFilter":-1,"modTransmission":-1,"tankHealth":954.0,"modVanityPlate":-1,"modStruts":-1,"modFrame":-1,"wheels":6,"modTank":-1,"plateIndex":4,"modDoorR":-1,"extras":[],"doorsBroken":{"1":false,"0":false},"windowTint":-1,"modDoorSpeaker":-1,"modSeats":-1,"color1":112,"modHydrolic":-1,"modFrontBumper":-1,"neonColor":[255,0,255],"modDashboard":-1},"owner":"license:2fdce37e3e8f9d19a73a241691f7aee5ba48d358"}}', NULL, NULL, 0, 0),
	(205, 'la_camorra', 'La CaMoRRa', '{}', '{"coke":{"name":"coke","label":"Coke","count":39}}', '[]', 0, 0),
	(206, 'mercenaire', 'Mercenaire', '{}', '{"coke_pooch":{"count":69,"name":"coke_pooch","label":"Pochon de coke"},"opium":{"count":46,"name":"opium","label":"Opium"},"weed_pooch":{"count":10,"name":"weed_pooch","label":"Pochon de weed"},"coke":{"count":20,"name":"coke","label":"Coke"},"opium_pooch":{"count":401,"name":"opium_pooch","label":"Pochon d\'opium"},"meth_pooch":{"count":242,"name":"meth_pooch","label":"Pochon de meth"}}', '[]', 10107, 0),
	(207, 'milice', 'Milice', NULL, NULL, '[]', 0, 0),
	(208, 'los_zetas', 'Los Zetas', NULL, '{"weed_pooch":{"name":"weed_pooch","label":"Pochon de weed","count":15},"meth":{"name":"meth","label":"Meth","count":10},"lsd":{"name":"lsd","label":"LSD","count":6},"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":50},"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":175},"coke":{"name":"coke","label":"Coke","count":4}}', '[]', 0, 91),
	(209, 'gfa', 'GFA', NULL, '{"tabac":{"name":"tabac","count":10,"label":"Tabac"}}', '[]', 0, 0),
	(210, 'sinaloa', 'Sinaloa', '{"TRZW8544":{"data":{"modSideSkirt":-1,"plateIndex":0,"modDashboard":-1,"windowsBroken":{"1":true,"2":false,"7":true,"0":true,"5":true,"6":true,"3":true,"4":false},"modSpoilers":-1,"modFender":-1,"modHorns":-1,"engineHealth":954.0,"modAerials":-1,"color1":64,"modExhaust":-1,"wheels":3,"modHood":-1,"neonEnabled":[false,false,false,false],"bodyHealth":760.0,"modEngine":-1,"neonColor":[0,0,0],"dirtLevel":15.0,"modTrimA":-1,"modArchCover":-1,"modLightbar":-1,"color2":0,"modDoorSpeaker":-1,"fuelLevel":79.6,"modPlateHolder":-1,"extras":[],"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":73,"modBrakes":-1,"modAPlate":-1,"tankHealth":960.0,"modSpeakers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"modXenon":false,"modDial":-1,"modRoof":-1,"modRightFender":-1,"doorsBroken":{"1":false,"2":false,"0":false,"5":false,"6":false,"3":false,"4":false},"modEngineBlock":-1,"modSteeringWheel":-1,"plate":"TRZW8544","modSuspension":-1,"modAirFilter":-1,"modTransmission":-1,"modRearBumper":-1,"model":662793086,"windowTint":-1,"xenonColor":255,"modSeats":-1,"wheelColor":0,"modTurbo":false,"tyreBurst":{"5":false,"1":false,"4":false,"0":false},"modSmokeEnabled":false,"modTank":-1,"tyreSmokeColor":[255,255,255],"modArmor":-1,"modHydrolic":-1,"modShifterLeavers":-1},"stored":0,"owner":"license:a9a1c6960ea1d7e6b200e4e4f5734090c5b9a589"},"XZXP1946":{"data":{"modSideSkirt":-1,"plateIndex":3,"modDashboard":-1,"windowsBroken":{"1":false,"2":true,"7":true,"0":false,"5":true,"6":false,"3":false,"4":true},"modSpoilers":-1,"modFender":-1,"modHorns":-1,"engineHealth":1000.0,"modAerials":-1,"color1":122,"modArmor":-1,"modSteeringWheel":-1,"modHood":-1,"neonEnabled":[false,false,false,false],"bodyHealth":1000.0,"model":1876516712,"neonColor":[255,0,255],"dirtLevel":3.0,"modTrimA":-1,"windowTint":-1,"modLightbar":-1,"color2":46,"modDoorSpeaker":-1,"fuelLevel":70.0,"modPlateHolder":-1,"extras":{"1":false,"2":false,"3":1},"modDoorR":-1,"modFrontBumper":-1,"modFrame":-1,"modLivery":-1,"pearlescentColor":122,"modBrakes":-1,"modAPlate":-1,"tankHealth":1000.0,"modSpeakers":-1,"modVanityPlate":-1,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"modFrontWheels":-1,"modTrunk":-1,"modStruts":-1,"modTrimB":-1,"modEngine":-1,"modDial":-1,"modRoof":-1,"modRightFender":-1,"tyreBurst":{"1":false,"5":false,"0":false,"4":false},"modEngineBlock":-1,"modSmokeEnabled":false,"plate":"XZXP1946","modTransmission":-1,"modAirFilter":-1,"modArchCover":-1,"doorsBroken":{"1":false,"2":false,"0":false,"3":false,"4":false},"modXenon":false,"modRearBumper":-1,"xenonColor":255,"modSeats":-1,"wheelColor":156,"modTurbo":false,"modSuspension":-1,"wheels":0,"modExhaust":-1,"tyreSmokeColor":[255,255,255],"modTank":-1,"modHydrolic":-1,"modShifterLeavers":-1},"stored":0,"owner":"license:37db24d4d583f2ac8a6df91f5a7bfb73b29331af"},"CSLR3462":{"data":{"modSideSkirt":14,"plateIndex":1,"modDashboard":2,"windowsBroken":{"1":true,"2":true,"7":true,"0":true,"5":true,"6":false,"3":true,"4":true},"modSpoilers":17,"modFender":2,"modHorns":-1,"engineHealth":963.0,"modAerials":6,"color1":120,"modAirFilter":9,"modSteeringWheel":-1,"modHood":11,"neonEnabled":[false,false,false,false],"modSuspension":-1,"modEngine":3,"neonColor":[255,0,255],"modTransmission":2,"modTrimA":-1,"modArchCover":1,"modLightbar":-1,"modSeats":1,"modDoorSpeaker":6,"fuelLevel":5.4,"modPlateHolder":-1,"extras":[],"modDoorR":-1,"modFrontBumper":7,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"modLivery":1,"pearlescentColor":120,"modBrakes":2,"modAPlate":-1,"tankHealth":993.0,"modShifterLeavers":-1,"modVanityPlate":12,"modBackWheels":-1,"modOrnaments":-1,"modTank":-1,"modFrontWheels":36,"modTrunk":-1,"modStruts":18,"modTrimB":-1,"modEngineBlock":-1,"modDial":-1,"modRoof":7,"modRightFender":-1,"modXenon":1,"wheels":7,"modGrille":-1,"plate":"CSLR3462","modExhaust":4,"color2":150,"doorsBroken":{"1":false,"2":false,"0":false,"3":false,"4":false},"modRearBumper":8,"modFrame":7,"modSmokeEnabled":false,"xenonColor":5,"windowTint":1,"wheelColor":3,"modTurbo":1,"model":-1540373595,"bodyHealth":825.0,"dirtLevel":7.0,"tyreSmokeColor":[255,255,255],"modArmor":-1,"modHydrolic":-1,"modSpeakers":-1},"stored":0,"owner":"license:0b645a0f332e565a6d10b21987f42b771b48000b"}}', '{}', '{}', 0, 35000),
	(211, 'salva_nation', 'Salva Nation', '{"PVRO7916":{"owner":"license:1d8c0cf417493f7b9afa2741dd82833dfd67765c","data":{"modDial":-1,"modHydrolic":-1,"modTransmission":2,"plate":"PVRO7916","modExhaust":-1,"tyreSmokeColor":[255,255,255],"engineHealth":660.6,"modTank":-1,"modArchCover":-1,"modAerials":-1,"bodyHealth":0.0,"modTrunk":-1,"modTurbo":1,"modLivery":-1,"modAirFilter":-1,"modEngineBlock":-1,"color2":66,"modSteeringWheel":-1,"wheels":6,"modStruts":-1,"modEngine":3,"modTrimA":-1,"dirtLevel":15.0,"tyreBurst":{"4":false,"0":false},"modDashboard":-1,"doorsBroken":{"0":false,"1":false},"fuelLevel":49.8,"modHorns":-1,"modRoof":-1,"modFrontBumper":-1,"modTrimB":-1,"modFrame":-1,"modOrnaments":-1,"tankHealth":700.0,"modBackWheels":-1,"modSideSkirt":-1,"modShifterLeavers":-1,"model":86520421,"modSmokeEnabled":false,"modAPlate":-1,"modSeats":-1,"modSpoilers":-1,"wheelColor":156,"modPlateHolder":-1,"extras":[],"modHood":-1,"modRightFender":-1,"neonColor":[255,0,255],"modFender":-1,"modGrille":-1,"modDoorR":-1,"modXenon":false,"xenonColor":255,"modBrakes":2,"modSpeakers":-1,"modLightbar":-1,"modRearBumper":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"windowsBroken":{"4":true,"5":true,"2":true,"3":true,"0":true,"1":true,"6":true,"7":true},"pearlescentColor":127,"color1":151,"plateIndex":0,"modDoorSpeaker":-1,"windowTint":-1,"modVanityPlate":-1,"modSuspension":-1,"modFrontWheels":-1},"stored":0},"PECJ1070":{"data":{"modDial":-1,"modHydrolic":-1,"modFrontWheels":1,"modAPlate":-1,"modExhaust":-1,"tyreSmokeColor":[255,255,255],"engineHealth":1000.0,"modTank":-1,"modArchCover":-1,"modAerials":-1,"bodyHealth":974.0,"modTrunk":-1,"modTurbo":1,"modLivery":-1,"modAirFilter":-1,"modEngineBlock":-1,"color2":132,"modSteeringWheel":-1,"wheels":4,"modStruts":-1,"modFender":-1,"modSmokeEnabled":false,"dirtLevel":0.0,"tyreBurst":{"0":false,"5":false,"1":false,"4":false},"modDashboard":-1,"modSeats":-1,"fuelLevel":57.9,"modHorns":0,"modRoof":-1,"modFrontBumper":-1,"modTrimB":-1,"modFrame":-1,"modOrnaments":-1,"tankHealth":995.5,"modBackWheels":-1,"modSideSkirt":-1,"color1":15,"extras":[],"windowTint":1,"plate":"PECJ1070","windowsBroken":{"4":true,"5":true,"2":false,"3":false,"0":true,"1":false,"6":false,"7":true},"modSpoilers":-1,"wheelColor":0,"modPlateHolder":-1,"modTrimA":-1,"modArmor":-1,"modRightFender":-1,"modBrakes":2,"modTransmission":2,"modGrille":-1,"modDoorR":-1,"modSpeakers":-1,"xenonColor":6,"modLightbar":-1,"modHood":-1,"modVanityPlate":-1,"modRearBumper":-1,"neonEnabled":[false,false,false,false],"model":1162065741,"modSuspension":3,"pearlescentColor":1,"neonColor":[255,0,255],"plateIndex":1,"modDoorSpeaker":-1,"doorsBroken":{"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"modXenon":1,"modEngine":3,"modShifterLeavers":-1},"stored":0,"owner":"license:3013a08221a92f6e90b2eeef69ebc02cad14648c"},"UEPJ1964":{"data":{"modDial":-1,"modHydrolic":-1,"modFrontWheels":-1,"modAPlate":-1,"modExhaust":-1,"tyreSmokeColor":[255,255,255],"engineHealth":999.1,"modTank":-1,"modArchCover":-1,"modAerials":-1,"bodyHealth":999.3,"modTrunk":-1,"modTurbo":false,"modLivery":-1,"modAirFilter":-1,"modEngineBlock":-1,"color2":0,"modSteeringWheel":-1,"wheels":6,"modStruts":-1,"modFender":-1,"modSmokeEnabled":false,"dirtLevel":0.2,"tyreBurst":{"4":false,"0":false},"modDashboard":-1,"modSeats":-1,"fuelLevel":63.1,"modHorns":-1,"modRoof":-1,"modFrontBumper":-1,"modTrimB":-1,"modFrame":-1,"modOrnaments":-1,"tankHealth":999.7,"modBackWheels":-1,"modSideSkirt":-1,"color1":0,"doorsBroken":{"0":false,"1":false},"neonColor":[255,0,255],"plate":"UEPJ1964","windowsBroken":{"4":true,"5":true,"2":true,"3":true,"0":true,"1":true,"6":true,"7":true},"modSpoilers":-1,"wheelColor":156,"modDoorR":-1,"modPlateHolder":-1,"modArmor":-1,"modRightFender":-1,"modTrimA":-1,"modVanityPlate":-1,"modGrille":-1,"modTransmission":-1,"model":788045382,"xenonColor":255,"modLightbar":-1,"modSpeakers":-1,"modHood":-1,"modRearBumper":-1,"neonEnabled":[false,false,false,false],"windowTint":-1,"modSuspension":-1,"pearlescentColor":0,"modBrakes":-1,"plateIndex":0,"modDoorSpeaker":-1,"extras":[],"modXenon":false,"modShifterLeavers":-1,"modEngine":-1},"stored":0,"owner":"license:3013a08221a92f6e90b2eeef69ebc02cad14648c"},"FINW4561":{"owner":"license:fb5c6025cd2784eca73bc4cc76529b388f0892fa","stored":0,"data":{"modDial":-1,"modHydrolic":-1,"modFrontWheels":20,"modAPlate":-1,"modExhaust":4,"tyreSmokeColor":[255,255,255],"engineHealth":993.2,"modTank":-1,"modArchCover":-1,"modAerials":-1,"bodyHealth":987.2,"modTrunk":-1,"modTurbo":1,"modLivery":1,"modAirFilter":-1,"modEngineBlock":-1,"windowTint":1,"modSteeringWheel":-1,"wheels":0,"modStruts":-1,"modEngine":2,"modSmokeEnabled":false,"dirtLevel":0.0,"tyreBurst":{"0":false,"1":false,"5":false,"4":false},"modDashboard":-1,"modSeats":-1,"fuelLevel":65.0,"modHorns":-1,"modRoof":4,"modFrontBumper":8,"modShifterLeavers":-1,"modFrame":-1,"modOrnaments":-1,"tankHealth":997.0,"modBackWheels":-1,"modSideSkirt":10,"color1":12,"neonColor":[255,0,255],"plate":"FINW4561","windowsBroken":{"4":true,"5":true,"2":false,"3":false,"0":false,"1":false,"6":false,"7":false},"modPlateHolder":-1,"modSpoilers":2,"modBrakes":1,"modTrimA":-1,"modFender":0,"modHood":9,"modDoorR":-1,"extras":[],"modTransmission":1,"modGrille":1,"modSpeakers":-1,"modLightbar":-1,"xenonColor":3,"modVanityPlate":-1,"model":-631322662,"modArmor":-1,"modRearBumper":3,"neonEnabled":[false,false,false,false],"color2":12,"modRightFender":-1,"pearlescentColor":1,"modTrimB":-1,"plateIndex":1,"modDoorSpeaker":-1,"doorsBroken":{"4":false,"2":false,"3":false,"0":false,"1":false},"modSuspension":2,"wheelColor":1,"modXenon":1}}}', '{"meth":{"name":"meth","count":34,"label":"Meth"},"coke":{"name":"coke","label":"Coke","count":43},"clip":{"name":"clip","label":"Chargeur","count":10},"lsd":{"name":"lsd","label":"LSD","count":172}}', '{}', 0, 207127),
	(212, 'cartel_de_cali', 'Cartel de Cali', '{}', '{"meth_pooch":{"count":57,"label":"Pochon de meth","name":"meth_pooch"},"meth":{"count":13,"label":"Meth","name":"meth"},"opium_pooch":{"count":392,"label":"Pochon d\'opium","name":"opium_pooch"},"fishingrod":{"count":1,"label":"Canne à pêche","name":"fishingrod"},"coke_pooch":{"count":259,"label":"Pochon de coke","name":"coke_pooch"}}', '{"WEAPON_KNIFE":[{"name":"WEAPON_KNIFE","label":"Couteau","ammo":600,"components":[]}],"WEAPON_MACHETE":[{"components":[],"label":"Machette","name":"WEAPON_MACHETE","ammo":301}],"WEAPON_SNSPISTOL":[{"components":[],"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":186}]}', 0, 2844),
	(213, 'cartel_de_juarez', 'Cartel de Juarez', '{"ALGC0159":{"stored":0,"owner":"license:cad264f699a9536e5cf7e67ab6c78dc41db4d0ac","data":{"extras":[],"modDoorR":-1,"neonEnabled":[false,false,false,false],"modDoorSpeaker":-1,"plate":"ALGC0159","modSuspension":-1,"modGrille":-1,"tankHealth":960.7,"wheelColor":156,"doorsBroken":{"4":false,"5":false,"2":false,"3":false,"0":false,"1":false,"6":false},"fuelLevel":58.8,"modRoof":-1,"windowTint":1,"modShifterLeavers":-1,"modTurbo":1,"xenonColor":255,"modRightFender":-1,"modTank":-1,"modTrunk":-1,"modFrontWheels":-1,"modExhaust":-1,"dirtLevel":14.5,"modArchCover":-1,"modBackWheels":-1,"wheels":5,"tyreBurst":{"4":false,"1":false,"5":false,"0":false},"modEngineBlock":-1,"modVanityPlate":-1,"model":872704284,"modAirFilter":-1,"modHorns":-1,"modAerials":-1,"bodyHealth":569.7,"modXenon":false,"modDashboard":-1,"modSteeringWheel":-1,"modTrimA":-1,"color2":15,"modSmokeEnabled":false,"plateIndex":0,"neonColor":[255,0,255],"modFrame":-1,"tyreSmokeColor":[255,255,255],"modSeats":-1,"modAPlate":-1,"color1":15,"modPlateHolder":-1,"modFender":-1,"modFrontBumper":-1,"modTransmission":2,"modStruts":-1,"modSideSkirt":-1,"windowsBroken":{"4":true,"5":true,"2":false,"3":false,"0":true,"1":false,"6":true,"7":true},"modDial":-1,"modHood":-1,"modTrimB":-1,"modOrnaments":-1,"modSpoilers":-1,"modArmor":-1,"modSpeakers":-1,"pearlescentColor":1,"modLightbar":-1,"modRearBumper":-1,"modHydrolic":-1,"modLivery":-1,"engineHealth":854.8,"modEngine":3,"modBrakes":2}}}', NULL, '{"WEAPON_MACHETE":[{"name":"WEAPON_MACHETE","components":[],"label":"Machette","ammo":1},{"name":"WEAPON_MACHETE","components":[],"label":"Machette","ammo":1}]}', 0, 62838),
	(214, 'black_crew', 'Black Crew', '{"WSJU3411":{"owner":"license:e40641665b4c9e42d16331ea996793cf50eb5eb2","stored":0,"data":{"modEngineBlock":-1,"modSeats":-1,"modDial":-1,"modRoof":-1,"modTurbo":false,"modFrontWheels":-1,"modHood":-1,"model":-16948145,"modSpoilers":-1,"modFender":-1,"doorsBroken":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"modTrimA":-1,"tankHealth":987.4,"modSpeakers":-1,"modFrame":-1,"modArchCover":-1,"modGrille":-1,"modArmor":-1,"modPlateHolder":-1,"xenonColor":255,"modStruts":-1,"modSteeringWheel":-1,"extras":{"10":1,"11":false},"modRightFender":-1,"modRearBumper":-1,"modLightbar":-1,"modBackWheels":-1,"modSmokeEnabled":false,"modTransmission":-1,"wheelColor":156,"neonColor":[0,0,0],"windowTint":-1,"tyreSmokeColor":[255,255,255],"modBrakes":-1,"dirtLevel":9.6,"modHorns":-1,"modVanityPlate":-1,"modHydrolic":-1,"plateIndex":0,"modEngine":-1,"tyreBurst":{"5":false,"0":false,"4":false,"1":false},"fuelLevel":37.4,"color2":0,"modAPlate":-1,"wheels":3,"modTank":-1,"modDoorR":-1,"modFrontBumper":-1,"modSideSkirt":-1,"modTrimB":-1,"color1":1,"windowsBroken":{"6":false,"7":false,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"modShifterLeavers":-1,"modAirFilter":-1,"modSuspension":-1,"engineHealth":976.8,"modAerials":-1,"plate":"WSJU3411","modExhaust":-1,"bodyHealth":893.2,"modLivery":-1,"modXenon":false,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"pearlescentColor":4,"modDoorSpeaker":-1,"modTrunk":-1,"modDashboard":-1}}}', '{"fishingrod":{"name":"fishingrod","label":"Canne à pêche","count":2},"weed":{"name":"weed","label":"Weed","count":11},"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":6},"meth_pooch":{"name":"meth_pooch","count":274,"label":"Pochon de meth"},"pepitor":{"name":"pepitor","label":"Pépite d\'or","count":2},"meth":{"name":"meth","label":"Meth","count":780}}', '{"WEAPON_MACHETE":[{"ammo":1,"components":[],"label":"Machette","name":"WEAPON_MACHETE"},{"ammo":1,"components":[],"label":"Machette","name":"WEAPON_MACHETE"}]}', 75385, 28940),
	(215, 'white', 'White', '{"BVLR4484":{"stored":0,"data":{"windowTint":1,"modAPlate":-1,"wheelColor":8,"plate":"BVLR4484","modGrille":-1,"doorsBroken":{"1":false,"0":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":false,"modTrimB":-1,"modFender":-1,"model":-1858654120,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modTrunk":-1,"modDoorR":-1,"modAirFilter":-1,"dirtLevel":1.8,"modDial":-1,"tyreBurst":{"1":false,"0":false,"5":false,"4":false},"extras":[],"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":0,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modLivery":-1,"modAerials":-1,"plateIndex":0,"modSpeakers":-1,"modHorns":-1,"modLightbar":-1,"fuelLevel":56.5,"engineHealth":1000.0,"modSmokeEnabled":false,"bodyHealth":1000.0,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"color1":132,"modTank":-1,"xenonColor":255,"modFrontBumper":5,"modSideSkirt":-1,"modSteeringWheel":-1,"modHood":-1,"modSpoilers":1,"modEngineBlock":-1,"modXenon":false,"modArmor":-1,"modRightFender":-1,"modTransmission":-1,"modBackWheels":-1,"neonColor":[255,0,255],"tankHealth":1000.0,"modSuspension":-1,"modOrnaments":-1,"modVanityPlate":-1,"wheels":0,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":true,"4":true,"3":true,"2":true},"modShifterLeavers":-1,"pearlescentColor":1,"modFrame":-1,"modBrakes":-1,"modExhaust":5,"modFrontWheels":55},"owner":"license:65289f4e2cc5cb4c5592af4c0230464162858bc4"}}', '{"lsd":{"count":40,"label":"LSD","name":"lsd"},"lsd_pooch":{"count":14,"label":"Pochon de LSD","name":"lsd_pooch"}}', '{"WEAPON_KNIFE":[{"components":[],"label":"Couteau","name":"WEAPON_KNIFE","ammo":1}],"WEAPON_BAT":[{"ammo":99,"label":"Batte","components":[],"name":"WEAPON_BAT"}],"WEAPON_MACHETE":[{"components":[],"label":"Machette","ammo":801,"name":"WEAPON_MACHETE"}],"WEAPON_PISTOL":[{"components":[],"label":"Pistolet","name":"WEAPON_PISTOL","ammo":1}]}', 0, 291203),
	(216, 'cartel_de_tijuana', 'Cartel de Tijuana', '{"NTPN3837":{"stored":1,"data":{"windowTint":1,"modAPlate":-1,"wheelColor":156,"plate":"NTPN3837","modVanityPlate":-1,"doorsBroken":{"1":false,"0":false,"6":false,"5":false,"4":false,"3":false,"2":false},"modTrimA":-1,"modTurbo":1,"modTrimB":-1,"modFender":-1,"model":-16948145,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modTrunk":-1,"modDoorR":-1,"modAirFilter":-1,"dirtLevel":15.0,"modDial":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false},"extras":{"11":false,"10":false},"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":0,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"modShifterLeavers":-1,"modAerials":-1,"plateIndex":0,"modSpeakers":-1,"modHorns":-1,"modLightbar":-1,"fuelLevel":96.1,"engineHealth":990.4,"modSmokeEnabled":false,"bodyHealth":503.7,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modSteeringWheel":-1,"modTank":-1,"xenonColor":2,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":true,"4":true,"3":false,"2":false},"modSideSkirt":-1,"modLivery":-1,"modBrakes":-1,"modBackWheels":-1,"modEngineBlock":-1,"modFrame":-1,"modArmor":-1,"modRightFender":-1,"modTransmission":-1,"pearlescentColor":1,"neonColor":[255,0,255],"tankHealth":999.8,"modSuspension":-1,"modOrnaments":-1,"modGrille":-1,"wheels":4,"modHood":-1,"modSpoilers":-1,"color1":155,"modXenon":1,"modFrontBumper":-1,"modExhaust":-1,"modFrontWheels":-1},"owner":"license:ac7fd6688d982d825d8f26800c83fbdce555cd3b"},"JXIF7540":{"stored":1,"data":{"windowTint":-1,"modAPlate":-1,"wheelColor":156,"plate":"JXIF7540","modGrille":-1,"doorsBroken":{"1":false,"0":false},"modTrimA":-1,"modTurbo":false,"modTrimB":-1,"modFender":-1,"model":788045382,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modTrunk":-1,"modDoorR":-1,"modAirFilter":-1,"dirtLevel":5.4,"modDial":-1,"tyreBurst":{"0":false,"4":false},"extras":[],"modPlateHolder":-1,"modDashboard":-1,"modRoof":-1,"color2":0,"modDoorSpeaker":-1,"modHydrolic":-1,"modSeats":-1,"modArchCover":-1,"modStruts":-1,"neonColor":[255,0,255],"modAerials":-1,"plateIndex":3,"modSpeakers":-1,"modHorns":-1,"modLightbar":-1,"fuelLevel":57.6,"engineHealth":950.0,"modSmokeEnabled":false,"bodyHealth":904.2,"neonEnabled":[false,false,false,false],"modRearBumper":-1,"modBackWheels":-1,"modTank":-1,"xenonColor":255,"windowsBroken":{"1":true,"0":true,"7":true,"6":true,"5":true,"4":true,"3":true,"2":true},"modSideSkirt":-1,"modSpoilers":-1,"pearlescentColor":0,"tankHealth":968.2,"modHood":-1,"modArmor":-1,"modFrame":-1,"modRightFender":-1,"modTransmission":-1,"modShifterLeavers":-1,"modSuspension":-1,"modBrakes":-1,"modFrontBumper":-1,"modOrnaments":-1,"modVanityPlate":-1,"modLivery":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"wheels":6,"modXenon":false,"color1":0,"modExhaust":-1,"modFrontWheels":-1},"owner":"license:ac7fd6688d982d825d8f26800c83fbdce555cd3b"}}', '{"meth":{"count":3,"label":"Meth","name":"meth"},"lsd_pooch":{"count":430,"label":"Pochon de LSD","name":"lsd_pooch"},"coke_pooch":{"count":133,"label":"Pochon de coke","name":"coke_pooch"},"meth_pooch":{"count":84,"label":"Pochon de meth","name":"meth_pooch"},"weed_pooch":{"count":136,"label":"Pochon de weed","name":"weed_pooch"},"water":{"count":27,"label":"Bouteille d\'eau","name":"water"},"bread":{"count":27,"label":"Pain","name":"bread"},"lsd":{"count":211,"label":"LSD","name":"lsd"}}', '{"WEAPON_PISTOL":[{"components":[],"label":"Pistolet","ammo":550,"name":"WEAPON_PISTOL"},{"components":[],"label":"Pistolet","name":"WEAPON_PISTOL","ammo":1},{"components":[],"label":"Pistolet","name":"WEAPON_PISTOL","ammo":1},{"components":[],"label":"Pistolet","name":"WEAPON_PISTOL","ammo":171}]}', 0, 1075737),
	(217, '83', '83', '{"TUWI4661":{"data":{"plate":"TUWI4661","pearlescentColor":145,"windowsBroken":{"5":true,"6":true,"7":true,"0":true,"1":false,"2":true,"3":false,"4":true},"modRoof":-1,"modHood":-1,"plateIndex":0,"modSmokeEnabled":false,"model":-1726022652,"modDoorR":-1,"modLightbar":-1,"modHydrolic":-1,"wheels":0,"modAirFilter":-1,"modTrimB":-1,"modTransmission":2,"color2":0,"modBrakes":2,"modDial":-1,"modDashboard":-1,"modHorns":-1,"modXenon":1,"windowTint":1,"tankHealth":981.2,"engineHealth":955.7,"modSpoilers":10,"doorsBroken":{"0":false,"1":false,"2":false,"3":false,"4":false},"modAerials":-1,"modSteeringWheel":-1,"modLivery":-1,"modTrunk":-1,"modPlateHolder":-1,"color1":11,"modAPlate":-1,"extras":[],"modTurbo":1,"modExhaust":-1,"modFrontBumper":-1,"modArmor":-1,"modTank":-1,"modSuspension":3,"modShifterLeavers":-1,"modSeats":-1,"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"modRightFender":-1,"modStruts":-1,"modDoorSpeaker":-1,"wheelColor":0,"modEngineBlock":-1,"neonColor":[255,5,190],"bodyHealth":927.8,"modFrame":-1,"modEngine":3,"modSideSkirt":-1,"fuelLevel":82.5,"modBackWheels":-1,"modOrnaments":-1,"modGrille":-1,"neonEnabled":[1,1,1,1],"modFender":-1,"modRearBumper":-1,"modArchCover":-1,"modSpeakers":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"xenonColor":11,"dirtLevel":3.4,"modTrimA":-1,"modFrontWheels":-1},"stored":1,"owner":"license:6736b595c600f118d267dfb9f4b2df6ccfb2a7e8"}}', '{"coke_pooch":{"name":"coke_pooch","label":"Pochon de coke","count":11},"meth":{"name":"meth","label":"Meth","count":62},"coke":{"name":"coke","label":"Coke","count":8},"meth_pooch":{"name":"meth_pooch","label":"Pochon de meth","count":86},"clip":{"name":"clip","label":"Chargeur","count":9},"weed_pooch":{"name":"weed_pooch","label":"Pochon de weed","count":7},"opium_pooch":{"name":"opium_pooch","label":"Pochon d\'opium","count":122},"opium":{"name":"opium","label":"Opium","count":1},"weed":{"name":"weed","label":"Weed","count":17}}', '{"WEAPON_SNSPISTOL":[{"components":[],"name":"WEAPON_SNSPISTOL","label":"Pistolet sns","ammo":50}],"WEAPON_MACHETE":[{"components":[],"name":"WEAPON_MACHETE","label":"Machette","ammo":300},{"components":[],"name":"WEAPON_MACHETE","label":"Machette","ammo":300}]}', 0, 0),
	(218, 'boxe', 'Boxe', NULL, NULL, NULL, 0, 0),
	(219, 'chantier', 'Chantier', NULL, NULL, NULL, 0, 0),
	(220, 'roxsherif', 'R.S.D', NULL, NULL, NULL, 0, 0),
	(221, 'bahamas', 'Bahamas', NULL, NULL, NULL, 0, 0);

-- Listage de la structure de la table exelity. society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.society_moneywash : ~0 rows (environ)

-- Listage de la structure de la table exelity. staff
CREATE TABLE IF NOT EXISTS `staff` (
  `name` text NOT NULL DEFAULT 'Inconu',
  `license` varchar(50) NOT NULL,
  `evaluation` text NOT NULL DEFAULT '{}',
  `report` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.staff : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_accounts
CREATE TABLE IF NOT EXISTS `tebex_accounts` (
  `steam` varchar(50) NOT NULL DEFAULT '0',
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `vip` tinyint(4) NOT NULL DEFAULT 0,
  `expiration` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_boutique
CREATE TABLE IF NOT EXISTS `tebex_boutique` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `name` text NOT NULL,
  `descriptions` text NOT NULL,
  `price` int(11) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `action` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_boutique : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_boutique_category
CREATE TABLE IF NOT EXISTS `tebex_boutique_category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `descriptions` text NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `uptated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_boutique_category : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_commands
CREATE TABLE IF NOT EXISTS `tebex_commands` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `command` varchar(50) NOT NULL DEFAULT '0',
  `argument` varchar(50) NOT NULL DEFAULT '0',
  `transaction` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_commands : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_fidelite
CREATE TABLE IF NOT EXISTS `tebex_fidelite` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL DEFAULT '0',
  `havebuy` int(11) NOT NULL DEFAULT 0,
  `totalbuy` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_fidelite : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_logs_commands
CREATE TABLE IF NOT EXISTS `tebex_logs_commands` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `command` varchar(50) NOT NULL DEFAULT '0',
  `argument` varchar(50) NOT NULL DEFAULT '0',
  `transaction` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_logs_commands : ~0 rows (environ)

-- Listage de la structure de la table exelity. tebex_players_wallet
CREATE TABLE IF NOT EXISTS `tebex_players_wallet` (
  `identifiers` text NOT NULL,
  `transaction` text DEFAULT NULL,
  `price` text NOT NULL,
  `currency` text DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tebex_players_wallet : ~0 rows (environ)

-- Listage de la structure de la table exelity. tiktok_users
CREATE TABLE IF NOT EXISTS `tiktok_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `bio` text NOT NULL DEFAULT '',
  `birthday` varchar(50) NOT NULL DEFAULT '0',
  `videos` text NOT NULL DEFAULT '{}',
  `followers` text NOT NULL,
  `following` text NOT NULL,
  `liked` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tiktok_users : ~0 rows (environ)

-- Listage de la structure de la table exelity. tiktok_videos
CREATE TABLE IF NOT EXISTS `tiktok_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `created` varchar(50) NOT NULL DEFAULT '00:00:00',
  `data` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.tiktok_videos : ~0 rows (environ)

-- Listage de la structure de la table exelity. timeleft
CREATE TABLE IF NOT EXISTS `timeleft` (
  `identifier` varchar(100) NOT NULL,
  `remainingTasks` int(11) NOT NULL,
  `reward` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.timeleft : ~0 rows (environ)

-- Listage de la structure de la table exelity. tinder_accounts
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tinder_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. tinder_likes
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tinder_likes : ~0 rows (environ)

-- Listage de la structure de la table exelity. tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(1024) DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.tinder_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleModel` int(11) NOT NULL DEFAULT 0,
  `vehiclePlate` varchar(50) NOT NULL,
  `items` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehiclePlate` (`vehiclePlate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.trunk_inventory : ~0 rows (environ)

-- Listage de la structure de la table exelity. twitter_account
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.twitter_account : ~0 rows (environ)

-- Listage de la structure de la table exelity. twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.twitter_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. twitter_hashtags
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.twitter_hashtags : ~0 rows (environ)

-- Listage de la structure de la table exelity. twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`) USING BTREE,
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.twitter_likes : ~0 rows (environ)

-- Listage de la structure de la table exelity. twitter_mentions
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.twitter_mentions : ~0 rows (environ)

-- Listage de la structure de la table exelity. twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.twitter_tweets : ~0 rows (environ)

-- Listage de la structure de la table exelity. users
CREATE TABLE IF NOT EXISTS `users` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(155) NOT NULL,
  `permission_group` varchar(50) DEFAULT 'user',
  `permission_level` int(11) DEFAULT 0,
  `position` longtext DEFAULT '{"x":-774.95, "y":318.24, "z":195.86}',
  `skin` longtext DEFAULT NULL,
  `accounts` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `loadout` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `isDead` int(11) DEFAULT 0,
  `status` longtext DEFAULT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `dateofbirth` varchar(25) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `animations` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `purge` varchar(11) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `coins` int(11) DEFAULT 0,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `xp` int(11) NOT NULL DEFAULT 0,
  `xp2` int(11) NOT NULL DEFAULT 0,
  `rp_rank` int(11) NOT NULL DEFAULT 1,
  `roue` int(11) DEFAULT 1,
  `statuscompte` tinyint(1) DEFAULT 0,
  `viplevel` int(1) NOT NULL DEFAULT 0,
  `kills` varchar(255) DEFAULT '0',
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `charinfo` text DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `adventcalendar` longtext DEFAULT '[]',
  `ammo` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`character_id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.users : ~0 rows (environ)

-- Listage de la structure de la table exelity. user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.user_licenses : ~0 rows (environ)

-- Listage de la structure de la table exelity. user_parkings
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.user_parkings : ~0 rows (environ)

-- Listage de la structure de la table exelity. user_tenue
CREATE TABLE IF NOT EXISTS `user_tenue` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `tenue` longtext NOT NULL,
  `label` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.user_tenue : 0 rows
/*!40000 ALTER TABLE `user_tenue` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tenue` ENABLE KEYS */;

-- Listage de la structure de la table exelity. vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `model` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.vehicles : ~414 rows (environ)
INSERT INTO `vehicles` (`model`, `name`, `price`, `category`) VALUES
	('Dubsta3', 'Benefactor Dubsta 6x6', 250000, 'offroad'),
	('adder', 'Truffade Adder', 250000, 'super'),
	('akuma', 'Dinka Akuma ', 3750, 'motorcycles'),
	('alpha', 'Albany Alpha', 22500, 'sports'),
	('alphaz1', 'Buckingham Alpha-Z1', 312500, 'avionfdp'),
	('asbo', 'Maxwell Asbo', 16000, 'compacts'),
	('asea', 'Declasse Asea', 6250, 'sedans'),
	('asterope', 'Karin Asterope', 12500, 'sedans'),
	('astron', 'Pfister Astron', 25000, 'suvs'),
	('autarch', 'Overflod Autarch', 450000, 'super'),
	('avarus', 'Liberty City Cycles Avarus', 12500, 'motorcycles'),
	('bagger', 'Bagger', 10000, 'motorcycles'),
	('baller', 'Gallivanter Baller LE LWB', 17500, 'suvs'),
	('baller2', 'Gallivanter Baller LE', 25000, 'suvs'),
	('baller4', 'Gallivanter Baller LE LWB Custom', 37500, 'suvs'),
	('baller7', 'Gallivanter Baller ST', 65000, 'suvs'),
	('banshee', 'Bravado Banshee', 25000, 'sports'),
	('banshee2', 'Banshee Custom', 450000, 'super'),
	('bati', 'Pegassi Bati 801', 13750, 'motorcycles'),
	('bati2', 'Pegassi Bati 801', 16250, 'motorcycles'),
	('bestiagts', 'Grotti Bestia GTS', 20000, 'sports'),
	('bf400', 'Nagasaki BF400', 10000, 'motorcycles'),
	('bfinjection', 'BF Injection', 2500, 'offroad'),
	('bifta', 'BF Bifta', 10000, 'offroad'),
	('bison', 'Bravado Bison', 12500, 'vans'),
	('bjxl', 'BeeJay XL', 17500, 'suvs'),
	('blade', 'Vapid Blade', 5500, 'muscle'),
	('blazer', 'Nagasaki Blazer', 7500, 'offroad'),
	('blazer3', 'Hot Rod Blazer', 8750, 'offroad'),
	('blazer4', 'Blazer Street', 13750, 'offroad'),
	('blista', 'Dinka Blista', 6250, 'compacts'),
	('blista2', 'Blista Compact', 20000, 'sports'),
	('bobcatxl', 'Vapid Bobcat XL', 12500, 'vans'),
	('bodhi2', 'Bodhi', 13750, 'offroad'),
	('brawler', 'Coil Brawler', 32500, 'offroad'),
	('brioso', 'Grotti Brioso R/A', 17750, 'compacts'),
	('brioso2', 'Brioso', 22500, 'compacts'),
	('btype', 'B Type', 50000, 'sportsclassics'),
	('btype2', 'Btype2 Hotrood Sedan', 55000, 'sportsclassics'),
	('btype3', 'Roosevelt Valor', 62500, 'sportsclassics'),
	('buccaneer', 'Albany Buccaneer', 7500, 'muscle'),
	('buccaneer2', 'Buccaneer Custom', 12500, 'muscle'),
	('buffalo', 'Bravado Buffalo', 12500, 'sports'),
	('buffalo2', 'Bravado Buffalo S', 18750, 'sports'),
	('bullet', 'Vapid Bullet', 75000, 'super'),
	('burrito3', 'Burrito', 15000, 'vans'),
	('calico', 'Karin Calico GTF', 23750, 'sports'),
	('camper', 'Brute Camper', 15000, 'vans'),
	('caracara2', 'Vapid 4x4 Caracara', 125000, 'offroad'),
	('carbonizzare', 'Grotti Carbonizzare', 40000, 'sports'),
	('carbonrs', 'Nagasaki Carbon RS', 12000, 'motorcycles'),
	('casco', 'Lampadati Casco', 32500, 'sportsclassics'),
	('cavalcade', 'Albany Cavalcade', 10000, 'suvs'),
	('cavalcade2', 'Albany Cavalcade', 12500, 'suvs'),
	('cheburek', 'RUNE Cheburek', 22500, 'sportsclassics'),
	('cheetah', 'Grotti Cheetah', 500000, 'super'),
	('cheetah2', 'Grotti Cheetah Classic', 125000, 'sportsclassics'),
	('chimera', 'Nagasaki Chimera', 22500, 'motorcycles'),
	('chino', 'Vapid Chino', 7500, 'muscle'),
	('chino2', 'Chino Custom', 11250, 'muscle'),
	('cinquemila', 'Lampadati Cinquemila', 42500, 'sports'),
	('cliffhanger', 'Cliffhanger', 21250, 'motorcycles'),
	('clique', 'Vapid Clique', 7500, 'muscle'),
	('club', 'BF Club', 6250, 'compacts'),
	('cog55', 'Enus Cognoscenti 55', 10000, 'sedans'),
	('cogcabrio', 'Enus Cognoscenti Cabrio', 25000, 'coupes'),
	('cognoscenti', 'Enus Cognoscenti', 32500, 'sedans'),
	('comet2', 'Pfister Comet', 25000, 'sports'),
	('comet3', 'Pfister Comet Rétro Custom', 37500, 'sports'),
	('comet5', 'Pfister Comet SR', 25000, 'sports'),
	('comet6', 'Pfister Comet S2', 62500, 'sports'),
	('comet7', 'Pfister Comet S2 Cabrio', 87500, 'sports'),
	('contender', 'Vapid Contender', 75000, 'suvs'),
	('coquette3', 'Invetero Coquette', 30000, 'muscle'),
	('coquette4', 'Invetero Coquette', 500000, 'sports'),
	('cuban800', 'Cuban 800', 225000, 'avionfdp'),
	('cyclone', 'oil Cyclone', 750000, 'super'),
	('cypher', 'Ubermacht Cypher', 25000, 'sports'),
	('daemon', 'Daemon', 10500, 'motorcycles'),
	('daemon2', 'Daemon', 21250, 'motorcycles'),
	('defiler', 'Shitzu Defiler', 15000, 'motorcycles'),
	('deveste', 'Principe Deveste Eight', 875000, 'sports'),
	('deviant', 'Schyster Deviant', 35000, 'muscle'),
	('diablous', 'Diablous', 17500, 'motorcycles'),
	('diablous2', 'Diablous', 22500, 'motorcycles'),
	('dilettante', 'Karin Dilettante', 5000, 'compacts'),
	('dinghy', 'Nagasaki Dinghy', 187500, 'superboat'),
	('dloader', 'Bravado Duneloader', 12500, 'offroad'),
	('dodo', 'Mammoth Dodo', 175000, 'avionfdp'),
	('dominator', 'Vapid Dominator', 15000, 'muscle'),
	('dominator3', 'Vapid Dominator GTX', 37500, 'muscle'),
	('dominator7', 'Vapid Dominator ASP', 50000, 'muscle'),
	('double', 'Dinka Double T', 11250, 'motorcycles'),
	('drafter', 'Obey 8F Drafter', 75000, 'sports'),
	('dubsta', 'Benefactor Dubsta', 13750, 'suvs'),
	('dubsta2', 'Benefactor Dubsta', 16250, 'suvs'),
	('dukes', 'Imponte Dukes', 10000, 'muscle'),
	('dune', 'BF Dune Buggy', 6250, 'offroad'),
	('dynasty', 'Weeny Dynasty', 17500, 'sportsclassics'),
	('elegy', 'Annis Elegy RH8 Retro Custom', 100000, 'sports'),
	('elegy2', 'Annis Elegy RH8', 10000, 'sports'),
	('ellie', 'Vapid Ellie', 10000, 'muscle'),
	('emerus', 'Progen Emerus', 425000, 'super'),
	('emperor', 'Albany Emperor', 6250, 'sedans'),
	('enduro', 'Dinka Enduro', 10000, 'motorcycles'),
	('entity2', 'Entity XXR', 750000, 'super'),
	('entityxf', 'Overflod Entity XF', 225000, 'super'),
	('esskey', 'Pegassi Esskey', 12500, 'motorcycles'),
	('euros', 'Annis Euros', 20000, 'sports'),
	('everon', 'Karin Everon', 200000, 'offroad'),
	('exemplar', 'Dewbauchee Exemplar', 33750, 'coupes'),
	('f620', 'Ocelot F620', 18750, 'coupes'),
	('faction', 'Willard Faction', 6250, 'muscle'),
	('faction2', 'Faction Custom', 21250, 'muscle'),
	('faction3', 'Faction Custom', 26250, 'muscle'),
	('fagaloa', 'Vulcar Fagaloa', 16250, 'sportsclassics'),
	('faggio', 'Faggio', 3750, 'motorcycles'),
	('faggio2', 'Faggio', 3750, 'motorcycles'),
	('faggio3', 'Faggio', 3750, 'motorcycles'),
	('fcr', 'Pegassi FCR 1000', 18750, 'motorcycles'),
	('fcr2', 'Pegassi FCR 1000', 21250, 'motorcycles'),
	('felon', 'Lampadati Felon', 8750, 'coupes'),
	('feltzer2', 'Benefactor Feltzer', 23750, 'sports'),
	('feltzer3', 'Feltzer Clasique', 25000, 'sportsclassics'),
	('flashgt', 'Vapid Flash GT', 62500, 'sports'),
	('fmj', 'Vapid FMJ', 30000, 'super'),
	('freecrawler', 'Canis Freecrawler', 75000, 'offroad'),
	('frogger', 'Maibatsu Frogger', 250000, 'avionfdp'),
	('fugitive', 'Cheval Fugitive', 12500, 'sedans'),
	('furia', 'Grotti Furia', 62500, 'super'),
	('furoregt', 'Lampadati Furore GT', 17500, 'sports'),
	('fusilade', 'Schyster Fusilade', 16250, 'sports'),
	('futo', 'Karin Futo', 7500, 'sports'),
	('futo2', 'Futo GTX', 23750, 'sports'),
	('gargoyle', 'Gargoyle', 32500, 'motorcycles'),
	('gauntlet', 'Bravado Gauntlet', 13750, 'muscle'),
	('gauntlet3', 'Bravado Gauntlet Classic', 16250, 'muscle'),
	('gauntlet4', 'Bravado Gauntlet Hellfire', 23750, 'muscle'),
	('gb200', 'Vapid GB 200', 25000, 'sports'),
	('gburrito', 'Burrito de gang', 15000, 'suvs'),
	('glendale', 'Benefactor Glendale', 16250, 'sedans'),
	('glendale2', 'Benefactor Glendale', 18750, 'sedans'),
	('gp1', 'Progen GP1', 27500, 'super'),
	('granger', 'Declasse Granger', 20000, 'suvs'),
	('greenwood', 'Bravado Greenwood', 16250, 'muscle'),
	('gresley', 'Bravado Gresley', 7500, 'suvs'),
	('growler', 'Pfister Growler', 125000, 'sports'),
	('gt500', 'Grotti GT500', 22500, 'sportsclassics'),
	('guardian', 'Guardian', 62500, 'suvs'),
	('habanero', 'Emperor Habanero', 6250, 'suvs'),
	('hakuchou', 'Shitzu Hakuchou', 18250, 'motorcycles'),
	('hakuchou2', 'Shitzu Hakuchou Drag', 68750, 'motorcycles'),
	('hellion', 'Annis Hellion', 37500, 'offroad'),
	('hermes', 'Albany Hermes', 22500, 'muscle'),
	('hexer', 'Hexer', 16250, 'motorcycles'),
	('hotknife', 'Vapid Hotknife', 10000, 'muscle'),
	('hotring', 'Declasse Hotring Sabre', 31250, 'sports'),
	('howard', 'Buckingham Howard NX-25', 625000, 'avionfdp'),
	('huntley', 'Enus Huntley S', 7500, 'suvs'),
	('hustler', 'Vapid Hustler', 10000, 'muscle'),
	('ignus', 'Pegassi Ignus', 625000, 'super'),
	('imorgon', 'Overflod Imorgon', 47500, 'sports'),
	('impaler', 'Declasse Impaler', 6250, 'muscle'),
	('infernus', 'Pegassi Infernus', 18750, 'super'),
	('infernus2', 'Pegassi Infernus classic', 125000, 'sportsclassics'),
	('ingot', 'Vulcar Ingot', 5000, 'sedans'),
	('innovation', 'Liberty City Cycles Hexer', 17500, 'motorcycles'),
	('intruder', 'Karin Intruder', 10000, 'sedans'),
	('issi2', 'Weeny Issi', 4000, 'compacts'),
	('issi3', 'Weeny Issi Classic', 13000, 'compacts'),
	('issi7', 'Issi Sport', 14000, 'sports'),
	('italigtb', 'Progen Itali GTB', 150000, 'super'),
	('italigtb2', 'Progen Itali GTB Custom', 62500, 'super'),
	('italigto', 'Grotti Itali GTO', 100000, 'sports'),
	('italirsx', 'Grotti Itali RSX', 187500, 'sports'),
	('iwagen', 'Obey I-Wagen', 62500, 'suvs'),
	('jackal', 'Ocelot Jackal', 20000, 'coupes'),
	('jester', 'Dinka Jester', 25000, 'sports'),
	('jester2', 'Dinka Jester', 25000, 'sports'),
	('jester3', 'Dinka Jester Classic', 75000, 'sports'),
	('jester4', 'Dinka Jester RR', 37500, 'sports'),
	('jetmax', 'Shitzu Jetmax', 226250, 'superboat'),
	('journey', 'Zirconium Journey', 6250, 'vans'),
	('jugular', 'Ocelot Jugular', 500000, 'sports'),
	('kalahari', 'Canis Kalahari', 4000, 'offroad'),
	('kamacho', 'Canis Kamacho', 275000, 'offroad'),
	('kanjo', 'Dinka Blista Kanjo', 7500, 'compacts'),
	('kanjosj', 'Dinka KanjoSJ', 12500, 'coupes'),
	('khamelion', 'Hijak Khamelion', 16250, 'sports'),
	('komoda', 'Lampadati Komoda', 50000, 'sports'),
	('krieger', 'Benefactor Krieger', 750000, 'super'),
	('landstalker', 'Dundreary Landstalker', 6250, 'suvs'),
	('landstalker2', 'Dundreary Landstalker', 11250, 'suvs'),
	('le7b', 'RE-7B', 750000, 'super'),
	('lectro', 'Principe Lectro', 50000, 'motorcycles'),
	('lm87', 'Benefactor Lm87', 750000, 'super'),
	('locust', 'Ocelot Locust', 37500, 'sports'),
	('longfin', 'Shitzu Longfin', 750000, 'superboat'),
	('lurcher', 'Albany Lurcher', 8750, 'muscle'),
	('luxor', 'Buckingham Luxor', 1062500, 'avionfdp'),
	('luxor2', 'Buckingham Luxor Deluxe', 1375000, 'avionfdp'),
	('lynx', 'Ocelot Lynx', 21250, 'sports'),
	('mamba', 'Declasse Mamba', 225000, 'sportsclassics'),
	('mammatus', 'JoBuilt Mammatus', 175000, 'avionfdp'),
	('manana', 'Albany Manana', 25000, 'sportsclassics'),
	('manana2', 'Albany Manana Custom', 25000, 'sportsclassics'),
	('manchez', 'Maibatsu Manchez', 12500, 'motorcycles'),
	('manchez2', 'MMaibatsu Manchez Black', 16250, 'motorcycles'),
	('marquis', 'Dinka Marquis', 275000, 'superboat'),
	('massacro', 'Dewbauchee Massacro', 23750, 'sports'),
	('maverick', 'Buckingham Maverick', 250000, 'avionfdp'),
	('mesa', 'Canis Mesa', 50000, 'suvs'),
	('mesa3', 'Canis Mesa Custom', 67500, 'offroad'),
	('michelli', 'Michelli GT', 32500, 'sportsclassics'),
	('minivan', 'Vapid Minivan', 12500, 'vans'),
	('monroe', 'Pegassi Monroe', 17500, 'sportsclassics'),
	('moonbeam', 'Declasse Moonbeam', 15000, 'muscle'),
	('moonbeam2', 'Declasse Moonbeam Custom', 21250, 'muscle'),
	('nebula', 'Vulcar Nebula Turbo', 17000, 'sportsclassics'),
	('nemesis', 'Principe Nemesis', 8750, 'motorcycles'),
	('neo', 'Vysser Neo', 35000, 'sports'),
	('neon', 'Pfister Neon', 225000, 'sports'),
	('nero', 'Truffade Nero', 550000, 'super'),
	('nero2', 'Truffade Nero Custom', 875000, 'super'),
	('nightblade', 'Nightblade', 27500, 'motorcycles'),
	('nightshade', 'Imponte Nightshade', 25000, 'muscle'),
	('nimbus', 'Buckingham Nimbus', 625000, 'avionfdp'),
	('ninef', 'Obey 9F', 16250, 'sports'),
	('novak', 'Lampadati Novak', 87500, 'suvs'),
	('omnis', 'Obey Omnis', 12500, 'sports'),
	('oracle', 'Ubermacht Oracle XS', 11250, 'coupes'),
	('oracle2', 'Ubermacht Oracle ', 18750, 'coupes'),
	('osiris', 'Pegassi Osiris', 187500, 'super'),
	('outlaw', 'Nagasaki Outlaw', 200000, 'offroad'),
	('panto', 'Benefactor Panto', 3750, 'compacts'),
	('paragon', 'nus Paragon R', 200000, 'sports'),
	('pariah', 'Ocelot Pariah', 300000, 'sports'),
	('patriot', 'Mammoth Patriot', 15000, 'suvs'),
	('patriot2', 'Mammoth Patriot Limo', 31250, 'suvs'),
	('pcj', 'Shitzu PCJ 600', 6250, 'motorcycles'),
	('penetrator', 'Ocelot Penetrator', 31000, 'super'),
	('penumbra', 'Maibatsu Penumbra', 16250, 'sports'),
	('penumbra2', 'Maibatsu Penumbra', 18750, 'sports'),
	('peyote', 'Vapid Peyote', 18750, 'sportsclassics'),
	('peyote2', 'Peyote Gasser', 22500, 'muscle'),
	('peyote3', 'Vapid Peyote Custom', 18750, 'sportsclassics'),
	('pfister811', 'Pfister 811', 245000, 'super'),
	('phoenix', 'Imponte Phoenix', 7500, 'muscle'),
	('picador', 'Cheval Picador', 5000, 'muscle'),
	('pigalle', 'Lampadati Pigalle', 23500, 'sportsclassics'),
	('postlude', 'Dinka Postlude', 7500, 'coupes'),
	('prairie', 'Bollokan Prairie', 6750, 'compacts'),
	('premier', 'Declasse Premier', 6250, 'sedans'),
	('previon', 'Karin Previon', 42500, 'coupes'),
	('primo', 'Albany Primo ', 11250, 'sedans'),
	('primo2', 'Primo Custom', 33750, 'sedans'),
	('prototipo', 'Grotti X80 Proto', 625000, 'super'),
	('radi', 'Vapid Radius', 9000, 'suvs'),
	('raiden', 'Coil Raiden', 52500, 'sports'),
	('rancherxl', 'Declasse Rancher XL', 5500, 'offroad'),
	('rapidgt', 'Dewbauchee Rapid GT', 47500, 'sports'),
	('rapidgt3', 'Rapid GT Classic', 23500, 'sportsclassics'),
	('raptor', 'BF Raptor', 25000, 'sports'),
	('ratbike', 'Ratbike', 7500, 'motorcycles'),
	('ratloader2', 'Bravado Rat-Loader', 3750, 'muscle'),
	('reaper', 'Pegassi Reaper', 90000, 'super'),
	('rebel', 'Karin Rebel', 7500, 'offroad'),
	('rebla', 'Ubermacht Rebla GTS', 125000, 'suvs'),
	('reever', 'Western Reever', 13750, 'motorcycles'),
	('regina', 'Dundreary Regina', 5000, 'sedans'),
	('remus', 'Annis Remus', 22500, 'sports'),
	('retinue', 'Vapid Retinue', 18750, 'sportsclassics'),
	('retinue2', 'Vapid Retinue Mk II', 18750, 'sportsclassics'),
	('rhapsody', 'Declasse Rhapsody', 6250, 'compacts'),
	('rhinehart', 'Rhinehart', 200000, 'sedans'),
	('riata', 'Vapid Riata', 11250, 'offroad'),
	('rocoto', 'Obey Rocoto', 7500, 'suvs'),
	('rrocket', 'Rampant Rocket', 60000, 'motorcycles'),
	('rt3000', 'Dinka RT3000', 30000, 'sports'),
	('ruffian', 'Pegassi Ruffian', 10000, 'motorcycles'),
	('ruiner', 'Imponte Ruiner', 3750, 'muscle'),
	('ruiner4', 'Imponte Ruiner ZZ-8', 20000, 'muscle'),
	('rumpo', 'Bravado Rumpo', 18750, 'vans'),
	('rumpo3', 'Bravado Rumpo Custom', 31250, 'vans'),
	('ruston', 'Hijak Ruston', 18750, 'sports'),
	('s80', 'Annis S80RR', 300000, 'super'),
	('sabregt', 'Declasse Sabre Turbo', 11250, 'muscle'),
	('sabregt2', 'Sabre Turbo Custom', 13750, 'muscle'),
	('sanchez', 'Maibatsu Sanchez', 3750, 'motorcycles'),
	('sanctus', 'Liberty City Cycles Sanctus', 21250, 'motorcycles'),
	('sandking', 'Vapid Sandking XL', 3000, 'offroad'),
	('sandking2', 'Sandking XL', 4750, 'offroad'),
	('sc1', 'Ubermacht SC1', 25000, 'super'),
	('schafter2', 'Schafter V12', 18750, 'sports'),
	('schafter3', 'Schafter V12', 75000, 'sports'),
	('schafter4', 'Schafter V12 LWB', 81250, 'sports'),
	('schlagen', 'Benefactor Schlagen GT', 181250, 'sports'),
	('schwarzer', 'Benefactor Schwartzer', 25000, 'sports'),
	('seabreeze', 'Seabreeze', 632500, 'avionfdp'),
	('seashark', 'Speedophile Seashark', 87500, 'superboat'),
	('seminole', 'Canis Seminole', 6750, 'suvs'),
	('seminole2', 'Canis Seminole', 17500, 'suvs'),
	('sentinel', 'Ubermacht Sentinel', 16250, 'coupes'),
	('sentinel2', 'Ubermacht Sentinel XS', 18750, 'coupes'),
	('sentinel3', 'Ubermacht Sentinel Classic', 5000, 'sports'),
	('serrano', 'Benefactor Serrano', 6250, 'suvs'),
	('seven70', 'Dewbauchee Seven-70', 16250, 'sports'),
	('sheava', 'Emperor ETR1', 91500, 'super'),
	('shinobi', 'Nagasaki Shinobi', 18750, 'motorcycles'),
	('slamvan', 'Vapid Slamvan', 18750, 'muscle'),
	('slamvan2', 'Vapid Slamvan', 26250, 'muscle'),
	('slamvan3', 'Vapid Slamvan Custom', 38750, 'muscle'),
	('specter', 'Dewbauchee Specter', 16250, 'sports'),
	('specter2', 'Specter Custom', 16250, 'sports'),
	('speeder', 'Pegassi Speeder', 250000, 'superboat'),
	('speedo', 'Vapid Speedo', 12500, 'vans'),
	('squaddie', 'Squaddie', 15000, 'suvs'),
	('squalo', 'Squalo', 150000, 'superboat'),
	('stafford', 'Enus Stafford', 62500, 'sedans'),
	('stalion', 'Declasse Stallion', 18750, 'muscle'),
	('stanier', 'Vapid Stanier', 8250, 'sedans'),
	('stinger', 'Grotti Stinger', 28000, 'sportsclassics'),
	('stingergt', 'Grotti Stinger GT', 47500, 'sportsclassics'),
	('stratum', 'Zirconium Stratum', 6250, 'sedans'),
	('streiter', 'Benefactor Streiter', 31250, 'sports'),
	('stretch', 'Dundreary Stretch', 25000, 'sedans'),
	('stryder', 'Nagasaki Stryder', 38750, 'motorcycles'),
	('sugoi', 'Dinka Sugoi', 62500, 'sports'),
	('sultan', 'Karin Sultan 1', 25000, 'sports'),
	('sultan2', 'Karin Sultan 2', 30000, 'sports'),
	('sultan3', 'Karin Sultan 3', 35000, 'sports'),
	('sultanrs', 'Karin Sultan RS', 72500, 'super'),
	('suntrap', 'Shitzu Squalo', 112500, 'superboat'),
	('superd', 'Enus Super Diamond', 31250, 'sedans'),
	('supervolito', 'Buckingham SuperVolito', 750000, 'avionfdp'),
	('supervolito2', 'Buckingham SuperVolito Carbon', 875000, 'avionfdp'),
	('surano', 'Benefactor Surano', 11750, 'sports'),
	('surfer', 'BF Surfer', 12500, 'vans'),
	('surge', 'Cheval Surge', 7500, 'sedans'),
	('swift', 'Buckingham Swift', 2000000, 'avionfdp'),
	('swift2', 'Buckingham Swift Deluxe', 1250000, 'avionfdp'),
	('swinger', 'Ocelot Swinger', 169500, 'sportsclassics'),
	('t20', 'Progen T20', 312500, 'super'),
	('tailgater', 'Obey Tailgater', 21250, 'sedans'),
	('tailgater2', 'Obey Tailgater S', 42250, 'sedans'),
	('taipan', 'Cheval Taipan', 202500, 'super'),
	('tampa', 'Declasse Tampa', 42500, 'muscle'),
	('tampa2', 'Declasse Tampa drift', 71250, 'sports'),
	('tempesta', 'Pegassi Tempesta', 335000, 'super'),
	('tezeract', 'Pegassi Tezeract', 775000, 'super'),
	('thrax', 'Truffade Thrax', 635000, 'super'),
	('thrust', 'Dinka Thrust', 18750, 'motorcycles'),
	('tigon', 'Lampadati Tigon', 33750, 'super'),
	('torero', 'Pegassi Torero', 62500, 'sportsclassics'),
	('tornado', 'Declasse Tornado', 10500, 'sportsclassics'),
	('toro', 'Lampadati Toro', 400000, 'superboat'),
	('toros', 'Pegassi Toros', 125000, 'suvs'),
	('trophytruck', 'Vapid Trophy Truck', 33250, 'offroad'),
	('trophytruck2', 'Vapid Trophy Truck', 33750, 'offroad'),
	('tropic', 'Tropic', 152500, 'superboat'),
	('tropos', 'Lampadati Tropos rallye', 31250, 'sports'),
	('tulip', 'Declasse Tulip', 34000, 'muscle'),
	('turismo2', 'Grotti Turismo Classic', 131000, 'sportsclassics'),
	('turismor', 'Grotti Turismo R', 62500, 'super'),
	('tyrant', 'Overflod Tyrant', 280000, 'super'),
	('tyrus', 'Progen Tyrus', 327500, 'super'),
	('vacca', 'Pegassi Vacca', 30500, 'super'),
	('vader', 'Shitzu Vader', 6250, 'motorcycles'),
	('vagner', 'Dewbauchee Vagner', 500000, 'super'),
	('vagrant', 'Maxwell Vagrant', 33750, 'offroad'),
	('vamos', 'Declasse Vamos', 8750, 'muscle'),
	('vectre', 'Emperor Vectre', 13750, 'sports'),
	('velum', 'JoBuilt Velum', 137500, 'avionfdp'),
	('verlierer2', 'Bravado Verlierer', 33750, 'sports'),
	('verus', 'Dinka Verus', 31250, 'offroad'),
	('vestra', 'Buckingham Vestra', 177500, 'avionfdp'),
	('vigero', 'Declasse Vigero', 12500, 'muscle'),
	('vindicator', 'Dinka Vindicator', 25000, 'motorcycles'),
	('virgo', 'Albany Virgo', 16000, 'muscle'),
	('virgo2', 'Albany Virgo Custom', 21000, 'muscle'),
	('virgo3', 'Albany Virgo Custom', 22500, 'muscle'),
	('visione', 'Grotti Visione', 775000, 'super'),
	('volatus', 'Buckingham Volatus', 1375000, 'avionfdp'),
	('voltic', 'Coil Voltic', 57750, 'super'),
	('voodoo', 'Declasse Voodoo custom', 12500, 'muscle'),
	('vortex', 'Pegassi Vortex', 45000, 'motorcycles'),
	('vstr', 'Albany V-STR', 225000, 'sports'),
	('warrener', 'Vulcar Warrener', 5500, 'sedans'),
	('washington', 'Albany Washington', 11250, 'sedans'),
	('weevil', 'BF Weevil', 21250, 'compacts'),
	('windsor', 'Enus Windsor', 100000, 'coupes'),
	('windsor2', 'Windsor Drop', 100000, 'coupes'),
	('winky', 'Vapid Winky', 62500, 'offroad'),
	('wolfsbane', 'Wolfsbane', 23750, 'motorcycles'),
	('xa21', 'Ocelot XA-21', 475000, 'super'),
	('xls', 'Benefactor XLS', 7500, 'suvs'),
	('yosemite', 'Declasse Yosemite', 11250, 'muscle'),
	('yosemite2', 'Declasse Drift Yosemite', 22500, 'muscle'),
	('yosemite3', 'Yosemite', 8750, 'muscle'),
	('youga', 'Bravado Youga', 18750, 'vans'),
	('youga2', 'Bravado Youga Classic', 21250, 'vans'),
	('youga3', 'Bravado Youga Classic 4x4', 25000, 'vans'),
	('youga4', 'Youga Custom', 17500, 'vans'),
	('z190', 'Karin 190z', 67500, 'sportsclassics'),
	('zeno', 'Overflod Zeno', 575000, 'super'),
	('zentorno', 'Pegassi Zentorno', 150000, 'super'),
	('zion', 'Ubermacht Zion', 15000, 'coupes'),
	('zion2', 'Ubermacht Zion', 15000, 'coupes'),
	('zion3', 'Ubermacht Zion Classic', 67500, 'sportsclassics'),
	('zombiea', 'Zombie', 25000, 'motorcycles'),
	('zombieb', 'Zombie Custom', 25000, 'motorcycles'),
	('zorrusso', 'Pegassi Zorrusso', 187500, 'super'),
	('zr350', 'Annis ZR350', 18750, 'sports'),
	('ztype', 'Truffade Z-Type ', 225000, 'sportsclassics');

-- Listage de la structure de la table exelity. vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.vehicle_categories : ~14 rows (environ)
INSERT INTO `vehicle_categories` (`name`, `label`, `society`) VALUES
	('avionfdp', 'Avion - Hélico', 'planeshop'),
	('compacts', 'Compacts', 'carshop'),
	('coupes', 'Coupes', 'carshop'),
	('imports', 'Imports', 'carshop'),
	('motorcycles', 'Motos', 'carshop'),
	('muscle', 'Muscle', 'carshop'),
	('offroad', 'Off Road', 'carshop'),
	('sedans', 'Sedans', 'carshop'),
	('sports', 'Sports', 'carshop'),
	('sportsclassics', 'Sports Classics', 'carshop'),
	('super', 'Super', 'carshop'),
	('superboat', 'Bateau', 'boatshop'),
	('suvs', 'SUVs', 'carshop'),
	('vans', 'Vans', 'carshop');

-- Listage de la structure de la table exelity. vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `society` varchar(50) NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table exelity.vehicle_sold : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_accounts
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.whatsapp_accounts : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_chats
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.whatsapp_chats : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_chats_messages
CREATE TABLE IF NOT EXISTS `whatsapp_chats_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chat` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `readed` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.whatsapp_chats_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_groups
CREATE TABLE IF NOT EXISTS `whatsapp_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.whatsapp_groups : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_groups_messages
CREATE TABLE IF NOT EXISTS `whatsapp_groups_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.whatsapp_groups_messages : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_groups_users
CREATE TABLE IF NOT EXISTS `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table exelity.whatsapp_groups_users : ~0 rows (environ)

-- Listage de la structure de la table exelity. whatsapp_stories
CREATE TABLE IF NOT EXISTS `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.whatsapp_stories : ~0 rows (environ)

-- Listage de la structure de la table exelity. yellowpages_posts
CREATE TABLE IF NOT EXISTS `yellowpages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text NOT NULL,
  `mesaj` text NOT NULL,
  `isim` text NOT NULL,
  `telno` text NOT NULL,
  `resim` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table exelity.yellowpages_posts : ~0 rows (environ)

CREATE TABLE `clothes_societies` (
  `id` int(11) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `equip` varchar(50) DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `clothes_societies`
ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `clothes_societies`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14368;

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_studio', 'Studio', 1);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_studio', 'Studio', 1);

INSERT INTO `jobs` (`name`, `label`) VALUES
('studio', 'Studio');

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(30, 'studio', 0, 'novice', 'Recrue', 100, '', ''),
(31, 'studio', 1, 'experimente', 'Experimenté', 100, '', ''),
(32, 'studio', 2, 'boss', 'Gérant', 100, '', '');

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_cardealer2', 'ConcessionnaireNord', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_cardealer2', 'ConcesionnaireNord', 1)
;


INSERT INTO `jobs` (`name`, `label`, `societyType`, `canWashMoney`, `canUseOffshore`) VALUES
	('cardealer2', 'ConcesionnaireNord', 1, 1, 0)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('cardealer2', 0, 'recruit', 'Recrue', 400, '{}', '{}'),
	('cardealer2', 1, 'novice', 'Novice', 500, '{}', '{}'),
	('cardealer2', 2, 'experienced', 'Experimente', 800, '{}', '{}'),
	('cardealer2', 3, 'boss', 'Co-Patron', 1000, '{}', '{}'),
	('cardealer2', 4, 'boss', 'Patron', 1000, '{}', '{}')
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
