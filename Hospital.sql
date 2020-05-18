-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2020 at 01:33 PM
-- Server version: 5.7.25-28-log
-- PHP Version: 7.3.18

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Daily_Inspection`
--

CREATE TABLE `Daily_Inspection` (
  `InspDate` date NOT NULL,
  `InspResult` varchar(50) NOT NULL,
  `InspExtraNotes` varchar(50) NOT NULL,
  `InspID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `DepID` int(11) NOT NULL,
  `DepName` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Perform`
--

CREATE TABLE `Perform` (
  `InspID` int(11) NOT NULL,
  `DevID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PPM`
--

CREATE TABLE `PPM` (
  `PpmID` int(11) NOT NULL,
  `PpmExtraNotes` varchar(50) NOT NULL,
  `PpmResult` varchar(50) NOT NULL,
  `PpmDate` date NOT NULL,
  `Cost` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PPM`
--

INSERT INTO `PPM` (`PpmID`, `PpmExtraNotes`, `PpmResult`, `PpmDate`, `Cost`) VALUES
(0, 'This is Default PPM', '0', '2020-05-07', '0 EGP');

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
-- Indexes for table `PPM`
--
ALTER TABLE `PPM`
  ADD PRIMARY KEY (`PpmID`);

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
