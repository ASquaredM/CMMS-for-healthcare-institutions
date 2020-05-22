-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2020 at 03:17 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assign`
--

CREATE TABLE `Assign` (
  `FormID` int(11) NOT NULL,
  `DevID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Daily_Inspection`
--

CREATE TABLE `Daily_Inspection` (
  `InspDate` date NOT NULL,
  `InspResult` varchar(50) NOT NULL,
  `InspExtraNotes` varchar(50) NOT NULL,
  `InspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `DepID` int(11) NOT NULL,
  `DepName` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`DepID`, `DepName`, `Location`) VALUES
(1, 'Operating Room', 'Basement'),
(2, 'Radiology', 'Basement'),
(3, 'Intensive Care Unit (ICU)', 'Basement');

-- --------------------------------------------------------

--
-- Table structure for table `Device`
--

CREATE TABLE `Device` (
  `DevID` int(11) NOT NULL,
  `DevName` varchar(50) NOT NULL,
  `DevType` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Serial_Number` varchar(50) NOT NULL,
  `Manufacturer` varchar(50) NOT NULL,
  `InstallationDate` date NOT NULL,
  `PpmPeriod` varchar(50) NOT NULL,
  `Family` varchar(50) NOT NULL,
  `Vendor` varchar(50) NOT NULL,
  `Warranty` varchar(50) NOT NULL,
  `PpmID` int(11) NOT NULL,
  `DepID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Device`
--

INSERT INTO `Device` (`DevID`, `DevName`, `DevType`, `Model`, `Serial_Number`, `Manufacturer`, `InstallationDate`, `PpmPeriod`, `Family`, `Vendor`, `Warranty`, `PpmID`, `DepID`) VALUES
(1, 'Anesthesia machine', 'GE', 'AVANCE CS2', 'ANBQ02024', 'USA', '2018-05-01', '1 month', 'Anesthesia machines', 'GE for Medical systems', '3 years', 0, 1),
(2, 'Vital Sign monitor', 'sony', 'LND-1950MD', '2008565', 'Japan', '2015-11-10', '6 months', 'Monitors', 'El Shourbagy', '5 years', 0, 1),
(3, 'Suction Pump', 'CA-MI', 'HOSPIVAC 350', '12401', 'ITALY', '2016-03-09', '3 months', 'Suction pumps', 'El Falwa', '2 years', 0, 1),
(4, 'Operating table', 'STERIS', 'EASYMAX', '15759', 'France', '2018-09-15', '6 months', 'Beds', 'El Falwa', '2 years', 0, 1),
(5, 'Surgical Headlamp', 'HERAEUS', 'Hanaulux 2004 OP lamp', '210802', 'Germany', '2016-11-17', '6 months', 'Surgical lamps', 'Almya for Medical Equipment', '2 years', 0, 1),
(6, 'Tourniquet', 'ZIMMER', 'PTS 7000', '1700012', 'US', '2018-11-06', '6 months', 'Tourniquets', 'El Shourbagy', '2 years', 0, 1),
(7, 'Infusion pump', 'K-MED', 'KH171', 'N7309018', 'U.K', '2019-12-09', '4 months', 'Infusion pumps', 'El Falwa', '2 years', 0, 1),
(8, 'C-ARM MOBILE STAND', 'ZIEHM IMAGING', 'ZIEHM VISION R', '10680', 'Germany', '2018-11-01', '3 months', 'C-ARMs', 'El Shourbagy', '2 years', 0, 1),
(9, 'Defibrillator', 'BEXEN', 'Reanibex 700', '2013/20024831', 'Spain', '2017-10-15', '1 month', 'Defibrillators', 'El Shourbagy', '3 years', 0, 1),
(10, 'Diathermy', 'COVIDIEN', 'Force FX-8C', 'F4E73043AX', 'USA', '2019-07-02', '3 months', 'Diathermys', 'El Shourbagy', '3 years', 0, 1),
(11, 'Ventilator', 'Philips RESPIRONICS', 'Trilogy 202', 'TV014050555', 'USA', '2017-07-12', '1 month', 'ventilators', 'Egyptian Group', '2 years', 0, 1),
(12, 'ECG', 'Schiller', 'Cardio vit AT-102', '070-12249', 'Swizerland', '2019-02-08', '3 months', 'ECGs', 'Egyptian Group', '2 years', 0, 1),
(13, 'Infusion pump', 'Fresenuis Kabi', 'INJECTOMAT AGILIA IS', '19952133', 'France', '2018-04-04', '4 months', 'Infusion pumps', 'El Falwa', '2 years', 0, 2),
(14, 'Monitor', 'Spacelabs', 'Ultraview SL2700', '1387-112247', 'USA', '2017-04-01', '6 months', 'Monitors', 'El Shourbagy', '5 years', 0, 2),
(15, 'Electric ICU bed', 'Malvestio', 'H-RANG 346760', '0113', 'Italy', '2016-02-08', '3 months', 'Beds', 'El Falwa', '2 years', 0, 2),
(16, 'Ultra sound', 'Toshiba', 'Aplio', 'DU582997', 'Japan', '2018-04-11', '1 month', 'Ultra sounds', 'Egyptian Group', '2 years', 0, 2),
(17, 'ECG', 'Schiller', 'Cardio vit AT-102', '070-12266', 'Swizerland', '2019-11-01', '3 months', 'ECGs', 'Egyptian Group', '2 years', 0, 2),
(18, 'Defibrillator', 'philips', 'heartStart XL', 'US41412123', 'USA', '2018-04-01', '1 month', 'Defibrillators', 'El Shourbagy', '3 years', 0, 2),
(19, 'C-ARM', 'philips', 'BV Endura', '0705CS142', 'USA', '2020-02-01', '6 months', 'C-ARMs', 'El Shourbagy', '2 years', 0, 2),
(20, 'ventilator', 'Airliquide', 'Extend XT', '2019', 'France', '2018-04-01', '1 month', 'ventilators', 'Egyptian Group', '2 years', 0, 2),
(21, 'Suction pump', '3A HEALTHCARE', 'MaxiA speed 6.4p', '182431', 'Italy', '2016-02-08', '3  months', 'Suction pumps', 'El Falwa', '2 years', 0, 2),
(22, 'Printer', 'Fujifiilm', 'DRYPIX smart', '36420374', 'Japan', '2019-11-01', '3 months', 'Printers', 'Philips', '2 years', 0, 3),
(23, 'MRI', 'Philips', 'INGENA', '781396', 'USA', '2018-08-25', '1 month', 'MRIs', 'Philips', '2 years', 0, 3),
(24, 'Injector', 'Medrad', 'Spectris Solaris EP', '301201261310', 'USA', '2015-11-01', '3 months', 'Injectors', 'Philips', '2 years', 0, 3),
(25, 'Anesthesia machine', 'DAMCA', 'DAMCA MRI 508', 'MRI505087191', 'USA', '2016-11-10', '1 month', 'Anesthesia machines', 'El Gomhorya', '5 years', 0, 3),
(26, 'Ultra sound', 'GE', 'Logiq P7', 'LP7050064', 'Korea', '2018-04-06', '1 month', 'Ultra sounds', 'Medical technology', '3 years', 0, 3),
(27, 'Bone Mineral Densitometry', 'GE', 'Prodigy', '69690', 'USA', '2016-11-09', '1 month', 'X-rays', 'Kimit', '2 years', 0, 3),
(28, 'X-ray', 'Philips', 'Duo diagnost', '451220202201', 'USA', '2017-10-04', '1 month', 'X-rays', 'Kimit', '3 years', 0, 3),
(29, 'FCR', 'Fujifilm', 'FCR-XG5000', '96525518', 'JAPAN', '2020-01-24', '3 months', 'FCRs', 'El Gomhorya', '2 years', 0, 3),
(30, 'CT', 'GE', 'Lightspeed ultra advabtage', '69891HM0', 'USA', '2018-12-03', '1 month', 'CTs', 'GE for Medical systems', '3 years', 0, 3),
(31, 'Mammogram', 'GE', 'Performa MGF 110', '12220', 'USA', '2018-03-06', '1 month', 'Mammograms', 'kan Medical', '3 years', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Form`
--

CREATE TABLE `Form` (
  `Text` varchar(50) NOT NULL,
  `FormID` int(11) NOT NULL,
  `FormType` varchar(50) NOT NULL,
  `FormFamily` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Perform`
--

CREATE TABLE `Perform` (
  `InspID` int(11) NOT NULL,
  `DevID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"full_screen\":\"on\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('hospital', 1, 'Schematic_Des');

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"hospital\",\"table\":\"ppm\"},{\"db\":\"hospital\",\"table\":\"report forms\"},{\"db\":\"hospital\",\"table\":\"room by room list\"},{\"db\":\"hospital\",\"table\":\"device\"},{\"db\":\"hospital\",\"table\":\"department\"},{\"db\":\"hospital\",\"table\":\"daily_inspection\"},{\"db\":\"hospital\",\"table\":\"assign\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('hospital', 'assign', 1, 256, 559),
('hospital', 'daily_inspection', 1, 42, 422),
('hospital', 'department', 1, 261, 753),
('hospital', 'device', 1, 40, 533),
('hospital', 'form', 1, 465, 542),
('hospital', 'perform', 1, 257, 471),
('hospital', 'pma__bookmark', 1, 791, 392),
('hospital', 'pma__central_columns', 1, 36, 220),
('hospital', 'pma__column_info', 1, 500, 215),
('hospital', 'pma__designer_settings', 1, 786, 215),
('hospital', 'pma__export_templates', 1, 1014, 532),
('hospital', 'pma__favorite', 1, 499, 431),
('hospital', 'pma__history', 1, 1263, 214),
('hospital', 'pma__navigationhiding', 1, 1259, 453),
('hospital', 'pma__pdf_pages', 1, 288, 302),
('hospital', 'pma__recent', 1, 791, 518),
('hospital', 'pma__relation', 1, 1449, 215),
('hospital', 'pma__savedsearches', 1, 787, 276),
('hospital', 'pma__table_coords', 1, 1038, 339),
('hospital', 'pma__table_info', 1, 1261, 365),
('hospital', 'pma__table_uiprefs', 1, 1037, 215),
('hospital', 'pma__tracking', 1, 38, 5),
('hospital', 'pma__userconfig', 1, 288, 214),
('hospital', 'pma__usergroups', 1, 285, 385),
('hospital', 'pma__users', 1, 1059, 466),
('hospital', 'ppm', 1, 256, 632);

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `config_data`) VALUES
('root', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Table structure for table `ppm`
--

CREATE TABLE `ppm` (
  `PpmID` int(11) NOT NULL,
  `PpmExtraNotes` varchar(50) NOT NULL,
  `PpmResult` varchar(50) NOT NULL,
  `PpmDate` date NOT NULL,
  `Cost` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ppm`
--

INSERT INTO `ppm` (`PpmID`, `PpmExtraNotes`, `PpmResult`, `PpmDate`, `Cost`) VALUES
(0, 'This is Default PPM', '0', '2020-05-07', '0 EGP');

-- --------------------------------------------------------

--
-- Table structure for table `report forms`
--

CREATE TABLE `report forms` (
  `ID` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Family` varchar(40) NOT NULL,
  `Check` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `report forms`
--

INSERT INTO `report forms` (`ID`, `Type`, `Family`, `Check`) VALUES
(1, 'Installation', 'All', '?Acceptance Test?Warranty?Installation Date?'),
(2, 'PPM', 'MRIs', '?Headphones?Laser Localizer?Table Operation?Intercom?RF Shielding?Cables?Spatial Resolution?Field Homogeneity?Slice Thickness Accuracy?Geometric Distortion?Center Frequency?Patient Alarm Ball?'),
(3, 'Daily Inspection', 'MRIs', '?Image Quality?Headphones?Cables?Intercom?'),
(4, 'PPM', 'X-rays', '?Shielding?Collimator?Fluoroscopic Timer?Spot Film Reproducibility?Interlocks?Aprons?Gloves?Drapes?Spatial Resolution?Low Contrast Performance?'),
(5, 'Daily Inspection', 'X-rays', '?Equipment Functioning?Shielding?Aprons?Gloves?Safety and Mechanical Checks?'),
(6, 'PPM', 'CTs', '?Slice Thickness?Scan Time?Imaging Volume?Internal and External cleaning?Performance and Diagnostic Testing?'),
(7, 'Daily Inspection', 'CTs', '?Imaging Volume?Internal and External Cleaning?Performance Testing?\r\n'),
(8, 'PPM', 'Mammograms', '?Monitor?Printer?Software?Field Digital System?Tests of Spicemen Cabinet?Image Quality Tests?Flat-field Detector Calibration?Mechanical Safety?Function Tests?'),
(9, 'Daily Inspection', 'Mammograms', '?System Check?Aquisition and Reporting Monitors?Printer?Software?Field Digital System?Tests of Spicemen Cabinet?Image Quality Tests?'),
(10, 'PPM', 'C-ARMs', '?Battery Check?Sanitization and Cleaning?Cables?Brakes?Wheels?Monitors?'),
(11, 'Daily Inspection', 'C-ARMs', '?Cables?Monitors?Brakes?Battery Check?Sanitization and Cleaning?Wheels?'),
(12, 'PPM', 'Anesthesia Machines', '?Vaporizer Examination?Tubing and Fittings Inspection?Soap Bubble Test?Oxygen Flush Valve?Smooth turn of Vaporizer Handwheel?'),
(13, 'Daily Inspection', 'Anesthesia Machines', '?Oxygen Check?Leakage Check?Flow Check?Oxygen Monitor Calibration?'),
(14, 'PPM', 'Ventilators', '?Visual Inspection?Unit Sanitization?Air and Oxygen Filters Check?Simulator Check?'),
(15, 'Daily Inspection', 'Ventilators', '?Thermostat Check?Fans Check?Belt Check?Flush Tanks Check?'),
(16, 'PPM', 'ECGs', '?Connectors Examination?Electrodes Check?Controls and Switches?AC Plug?Line Cord?Cable and Lead Inspection?'),
(17, 'Daily Inspection', 'ECGs', '?Electrodes Check?Monitor Check?AC Plug Check?'),
(18, 'PPM', 'Defibrillator', '?Paddles and Electrodes Check?Displays Check?Accessories Check?Synchronizer?Chassis Check?Fasteners Check?AC Plug?Strain Reliefs?Circuit Breaker?Cables?'),
(19, 'Daily Inspection', 'Defibrillator', '?Cables?Paddles and Electrodes Check?Displays Check?'),
(20, 'PPM', 'Electrosurgical Unit (Diathermy)', '?Chassis Cleanliness?Fasteners Check?AC Plug?Breaks?Cables?Insulation of Line Plug?Dispersive Electrodes Connection?Switches?Leakage Check?'),
(21, 'Daily Inspection', 'Electrosurgical Unit (Diathermy)', '?Insulation of Line Plug?Dispersive Electrodes Connection?Leakage Check?'),
(22, 'PPM', 'Infusion Pumps', '?Alarms Check?Displays Check?Flow-Stop Mechanism Check?Chassis Check?AC Plug?Breaks?Line Cord Cables?Switches?Leakage Check?'),
(23, 'Daily Inspection', 'Infusion Pumps', '?Leakage Check?Flow-Stop Mechanism Check?Alarms Check?Displays Check?'),
(24, 'PPM', 'Surgical Lamps', '?Fuse Check?Arm Adjustment?Head Adjustment?Sterilization and cleaning Check?'),
(25, 'Daily Inspection', 'Surgical Lamps', '?Sterilization Check?Fuse Check?'),
(26, 'PPM', 'Tourniquets', '?Cuffs Check?Cleaning Check?'),
(27, 'Daily Inspection', 'Tourniquets', '?Cuffs Check?Cleaning Check?'),
(28, 'PPM', 'Operating Tables', '?Oil Removal Check?Casters and Floor Locks Cleaning?Bearing Lubrication?Charge Batteries?'),
(29, 'Daily Inspection', 'Operating Tables', '?Cleaning Casters?'),
(30, 'PPM', 'Injectors', '?Desiccant Dryer Inspection?Clean Screen?Suction Calibration?Leakage Check?'),
(31, 'Daily Inspection', 'Injectors', '?Suction Calibration?Leakage Check?'),
(32, 'PPM', 'Ultrasound', '?Clean Filters?Power Supply Fans Check?Backup Battery Check?Clean Transducers Check?Probes Inspection?'),
(33, 'Daily Inspection', 'Ultrasound', '?Wires and Cables Check?Transducers Check?');

-- --------------------------------------------------------

--
-- Table structure for table `room by room list`
--

CREATE TABLE `room by room list` (
  `DevID` int(50) NOT NULL,
  `DevName` varchar(50) NOT NULL,
  `DevType` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Serial_Number` varchar(50) NOT NULL,
  `Made in` varchar(50) NOT NULL,
  `InstallationDate` date NOT NULL,
  `PPM` varchar(50) NOT NULL,
  `Family` varchar(50) NOT NULL,
  `Vendor` varchar(50) NOT NULL,
  `Warranty` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `room by room list`
--

INSERT INTO `room by room list` (`DevID`, `DevName`, `DevType`, `Model`, `Serial_Number`, `Made in`, `InstallationDate`, `PPM`, `Family`, `Vendor`, `Warranty`) VALUES
(13, 'Infusion pump', 'Fresenuis Kabi', 'INJECTOMAT AGILIA IS', '19952133', 'France', '2018-04-04', '4 months', 'Infusion pumps', 'El falwa', '2 years'),
(14, 'Monitor', 'Spacelabs', 'Ultraview SL2700', '1387-112247', 'USA', '2017-04-01', '6 months', 'Monitors', 'El Shourbagy', '5 years'),
(15, 'Electric ICU bed', 'Malvestio', 'H-RANG 346760', '0113', 'Italy', '2016-02-08', '3 months', 'Beds', 'El falwa', '2 years'),
(16, 'Ultra sound', 'Toshiba', 'Aplio', 'DU582997', 'Japan', '2018-04-11', '1 month', 'Ultra sounds', 'Egyptian group', '2 years'),
(17, 'ECG', 'Schiller', 'Cardio vit AT-102', '070-12266', 'Swizerland', '2019-11-01', '3 months', 'ECGs', 'Egyptian group', '2 years'),
(18, 'Defibrillator', 'philips', 'heartStart XL', 'US41412123', 'USA', '2018-04-01', '1 month', 'Defibrillators', 'El Shourbagy', '3 years'),
(19, 'C-ARM', 'philips', 'BV Endura', '0705CS142', 'USA', '2020-02-01', '6 months', 'C-ARMs', 'El Shourbagy', '2 years'),
(20, 'ventilator', 'Airliquide', 'Extend XT', '2019', 'France', '2018-04-01', '1 month', 'ventilators', 'Egyptian group', '2 years'),
(21, 'Suction pump', '3A HEALTHCARE', 'MaxiA speed 6.4p', '182431', 'Italy', '2016-02-08', '3  months', 'Suction pumps', 'El falwa', '2 years');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assign`
--
ALTER TABLE `Assign`
  ADD PRIMARY KEY (`FormID`),
  ADD KEY `DevID` (`DevID`);

--
-- Indexes for table `Daily_Inspection`
--
ALTER TABLE `Daily_Inspection`
  ADD PRIMARY KEY (`InspID`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepID`);

--
-- Indexes for table `Device`
--
ALTER TABLE `Device`
  ADD PRIMARY KEY (`DevID`),
  ADD UNIQUE KEY `Serial_Number` (`Serial_Number`),
  ADD KEY `PpmID` (`PpmID`),
  ADD KEY `DepID` (`DepID`);

--
-- Indexes for table `Form`
--
ALTER TABLE `Form`
  ADD PRIMARY KEY (`FormID`);

--
-- Indexes for table `Perform`
--
ALTER TABLE `Perform`
  ADD PRIMARY KEY (`InspID`),
  ADD KEY `DevID` (`DevID`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Indexes for table `ppm`
--
ALTER TABLE `PPM`
  ADD PRIMARY KEY (`PpmID`);

--
-- Indexes for table `report forms`
--
ALTER TABLE `report forms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `room by room list`
--
ALTER TABLE `room by room list`
  ADD PRIMARY KEY (`DevID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report forms`
--
ALTER TABLE `report forms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assign`
--
ALTER TABLE `Assign`
  ADD CONSTRAINT `Assign_ibfk_1` FOREIGN KEY (`FormID`) REFERENCES `Form` (`FormID`),
  ADD CONSTRAINT `Assign_ibfk_2` FOREIGN KEY (`DevID`) REFERENCES `Device` (`DevID`);

--
-- Constraints for table `Device`
--
ALTER TABLE `Device`
  ADD CONSTRAINT `Device_ibfk_1` FOREIGN KEY (`PpmID`) REFERENCES `PPM` (`PpmID`),
  ADD CONSTRAINT `Device_ibfk_2` FOREIGN KEY (`DepID`) REFERENCES `Department` (`DepID`);

--
-- Constraints for table `Perform`
--
ALTER TABLE `Perform`
  ADD CONSTRAINT `Perform_ibfk_1` FOREIGN KEY (`InspID`) REFERENCES `Daily_Inspection` (`InspID`),
  ADD CONSTRAINT `Perform_ibfk_2` FOREIGN KEY (`DevID`) REFERENCES `Device` (`DevID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
