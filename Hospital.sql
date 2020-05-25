-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2020 at 01:02 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE IF NOT EXISTS `Assign` (
  `FormID` int(11) NOT NULL,
  `DevID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Daily_Inspection`
--

CREATE TABLE IF NOT EXISTS `Daily_Inspection` (
  `InspDate` date NOT NULL,
  `InspResult` varchar(50) NOT NULL,
  `InspExtraNotes` varchar(50) NOT NULL,
  `InspID` int(11) NOT NULL,
  `DevID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Daily_Inspection`
--

INSERT INTO `Daily_Inspection` (`InspDate`, `InspResult`, `InspExtraNotes`, `InspID`, `DevID`) VALUES
('2020-05-20', '1111000000', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS `Department` (
  `DepID` int(11) NOT NULL,
  `DepName` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE IF NOT EXISTS `Device` (
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
  `DepID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Device`
--

INSERT INTO `Device` (`DevID`, `DevName`, `DevType`, `Model`, `Serial_Number`, `Manufacturer`, `InstallationDate`, `PpmPeriod`, `Family`, `Vendor`, `Warranty`, `DepID`) VALUES
(1, 'Anesthesia machine', 'GE', 'AVANCE CS2', 'ANBQ02024', 'USA', '2018-05-01', '1 month', 'Anesthesia machines', 'GE for Medical systems', '3 years', 1),
(2, 'Vital Sign monitor', 'sony', 'LND-1950MD', '2008565', 'Japan', '2015-11-10', '6 months', 'Monitors', 'El Shourbagy', '5 years', 1),
(3, 'Suction Pump', 'CA-MI', 'HOSPIVAC 350', '12401', 'ITALY', '2016-03-09', '3 months', 'Suction pumps', 'El Falwa', '2 years', 1),
(4, 'Operating table', 'STERIS', 'EASYMAX', '15759', 'France', '2018-09-15', '6 months', 'Beds', 'El Falwa', '2 years', 1),
(5, 'Surgical Headlamp', 'HERAEUS', 'Hanaulux 2004 OP lamp', '210802', 'Germany', '2016-11-17', '6 months', 'Surgical lamps', 'Almya for Medical Equipment', '2 years', 1),
(6, 'Tourniquet', 'ZIMMER', 'PTS 7000', '1700012', 'US', '2018-11-06', '6 months', 'Tourniquets', 'El Shourbagy', '2 years', 1),
(7, 'Infusion pump', 'K-MED', 'KH171', 'N7309018', 'U.K', '2019-12-09', '4 months', 'Infusion pumps', 'El Falwa', '2 years', 1),
(8, 'C-ARM MOBILE STAND', 'ZIEHM IMAGING', 'ZIEHM VISION R', '10680', 'Germany', '2018-11-01', '3 months', 'C-ARMs', 'El Shourbagy', '2 years', 1),
(9, 'Defibrillator', 'BEXEN', 'Reanibex 700', '2013/20024831', 'Spain', '2017-10-15', '1 month', 'Defibrillators', 'El Shourbagy', '3 years', 1),
(10, 'Diathermy', 'COVIDIEN', 'Force FX-8C', 'F4E73043AX', 'USA', '2019-07-02', '3 months', 'Diathermys', 'El Shourbagy', '3 years', 1),
(11, 'Ventilator', 'Philips RESPIRONICS', 'Trilogy 202', 'TV014050555', 'USA', '2017-07-12', '1 month', 'ventilators', 'Egyptian Group', '2 years', 1),
(12, 'ECG', 'Schiller', 'Cardio vit AT-102', '070-12249', 'Swizerland', '2019-02-08', '3 months', 'ECGs', 'Egyptian Group', '2 years', 1),
(13, 'Infusion pump', 'Fresenuis Kabi', 'INJECTOMAT AGILIA IS', '19952133', 'France', '2018-04-04', '4 months', 'Infusion pumps', 'El Falwa', '2 years', 2),
(14, 'Monitor', 'Spacelabs', 'Ultraview SL2700', '1387-112247', 'USA', '2017-04-01', '6 months', 'Monitors', 'El Shourbagy', '5 years', 2),
(15, 'Electric ICU bed', 'Malvestio', 'H-RANG 346760', '0113', 'Italy', '2016-02-08', '3 months', 'Beds', 'El Falwa', '2 years', 2),
(16, 'Ultra sound', 'Toshiba', 'Aplio', 'DU582997', 'Japan', '2018-04-11', '1 month', 'Ultra sounds', 'Egyptian Group', '2 years', 2),
(17, 'ECG', 'Schiller', 'Cardio vit AT-102', '070-12266', 'Swizerland', '2019-11-01', '3 months', 'ECGs', 'Egyptian Group', '2 years', 2),
(18, 'Defibrillator', 'philips', 'heartStart XL', 'US41412123', 'USA', '2018-04-01', '1 month', 'Defibrillators', 'El Shourbagy', '3 years', 2),
(19, 'C-ARM', 'philips', 'BV Endura', '0705CS142', 'USA', '2020-02-01', '6 months', 'C-ARMs', 'El Shourbagy', '2 years', 2),
(20, 'ventilator', 'Airliquide', 'Extend XT', '2019', 'France', '2018-04-01', '1 month', 'ventilators', 'Egyptian Group', '2 years', 2),
(21, 'Suction pump', '3A HEALTHCARE', 'MaxiA speed 6.4p', '182431', 'Italy', '2016-02-08', '3  months', 'Suction pumps', 'El Falwa', '2 years', 2),
(22, 'Printer', 'Fujifiilm', 'DRYPIX smart', '36420374', 'Japan', '2019-11-01', '3 months', 'Printers', 'Philips', '2 years', 3),
(23, 'MRI', 'Philips', 'INGENA', '781396', 'USA', '2018-08-25', '1 month', 'MRIs', 'Philips', '2 years', 3),
(24, 'Injector', 'Medrad', 'Spectris Solaris EP', '301201261310', 'USA', '2015-11-01', '3 months', 'Injectors', 'Philips', '2 years', 3),
(25, 'Anesthesia machine', 'DAMCA', 'DAMCA MRI 508', 'MRI505087191', 'USA', '2016-11-10', '1 month', 'Anesthesia machines', 'El Gomhorya', '5 years', 3),
(26, 'Ultra sound', 'GE', 'Logiq P7', 'LP7050064', 'Korea', '2018-04-06', '1 month', 'Ultra sounds', 'Medical technology', '3 years', 3),
(27, 'Bone Mineral Densitometry', 'GE', 'Prodigy', '69690', 'USA', '2016-11-09', '1 month', 'X-rays', 'Kimit', '2 years', 3),
(28, 'X-ray', 'Philips', 'Duo diagnost', '451220202201', 'USA', '2017-10-04', '1 month', 'X-rays', 'Kimit', '3 years', 3),
(29, 'FCR', 'Fujifilm', 'FCR-XG5000', '96525518', 'JAPAN', '2020-01-24', '3 months', 'FCRs', 'El Gomhorya', '2 years', 3),
(30, 'CT', 'GE', 'Lightspeed ultra advabtage', '69891HM0', 'USA', '2018-12-03', '1 month', 'CTs', 'GE for Medical systems', '3 years', 3),
(31, 'Mammogram', 'GE', 'Performa MGF 110', '12220', 'USA', '2018-03-06', '1 month', 'Mammograms', 'kan Medical', '3 years', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Form`
--

CREATE TABLE IF NOT EXISTS `Form` (
  `FormID` int(11) NOT NULL,
  `FormType` varchar(50) NOT NULL,
  `FormFamily` varchar(50) NOT NULL,
  `Text` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Form`
--

INSERT INTO `Form` (`FormID`, `FormType`, `FormFamily`, `Text`) VALUES
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
-- Table structure for table `PPM`
--

CREATE TABLE IF NOT EXISTS `PPM` (
  `PPMID` int(11) NOT NULL,
  `PpmResult` varchar(50) NOT NULL,
  `PpmExtraNotes` varchar(255) NOT NULL,
  `Cost` int(12) NOT NULL DEFAULT '0',
  `PpmDate` date NOT NULL,
  `DevID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PPM`
--

INSERT INTO `PPM` (`PPMID`, `PpmResult`, `PpmExtraNotes`, `Cost`, `PpmDate`, `DevID`) VALUES
(2, '1111100000', 'very nice', 128, '2020-05-20', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assign`
--
ALTER TABLE `Assign`
  ADD PRIMARY KEY (`FormID`),
  ADD UNIQUE KEY `FormID` (`FormID`),
  ADD KEY `DevID` (`DevID`);

--
-- Indexes for table `Daily_Inspection`
--
ALTER TABLE `Daily_Inspection`
  ADD PRIMARY KEY (`InspDate`,`InspID`,`DevID`),
  ADD UNIQUE KEY `InspID` (`InspID`),
  ADD KEY `DevID` (`DevID`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepID`),
  ADD UNIQUE KEY `DepID` (`DepID`);

--
-- Indexes for table `Device`
--
ALTER TABLE `Device`
  ADD PRIMARY KEY (`DevID`),
  ADD UNIQUE KEY `DevID` (`DevID`),
  ADD UNIQUE KEY `Serial_Number` (`Serial_Number`),
  ADD KEY `DepID` (`DepID`);

--
-- Indexes for table `Form`
--
ALTER TABLE `Form`
  ADD PRIMARY KEY (`FormID`),
  ADD UNIQUE KEY `FormID` (`FormID`);

--
-- Indexes for table `PPM`
--
ALTER TABLE `PPM`
  ADD PRIMARY KEY (`PPMID`,`PpmDate`),
  ADD UNIQUE KEY `PPMID` (`PPMID`),
  ADD KEY `DevID` (`DevID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Daily_Inspection`
--
ALTER TABLE `Daily_Inspection`
  MODIFY `InspID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `DepID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Device`
--
ALTER TABLE `Device`
  MODIFY `DevID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `Form`
--
ALTER TABLE `Form`
  MODIFY `FormID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `PPM`
--
ALTER TABLE `PPM`
  MODIFY `PPMID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
-- Constraints for table `Daily_Inspection`
--
ALTER TABLE `Daily_Inspection`
  ADD CONSTRAINT `daily_inspection_ibfk_1` FOREIGN KEY (`DevID`) REFERENCES `Device` (`DevID`);

--
-- Constraints for table `Device`
--
ALTER TABLE `Device`
  ADD CONSTRAINT `Device_ibfk_2` FOREIGN KEY (`DepID`) REFERENCES `Department` (`DepID`);

--
-- Constraints for table `PPM`
--
ALTER TABLE `PPM`
  ADD CONSTRAINT `ppm_ibfk_1` FOREIGN KEY (`DevID`) REFERENCES `Device` (`DevID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
