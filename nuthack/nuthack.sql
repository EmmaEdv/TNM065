-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 26, 2015 at 04:24 PM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `nuthack`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE `Activity` (
  `userId` int(6) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text NOT NULL,
  `place` varchar(150) NOT NULL,
  `activityType` varchar(10) NOT NULL,
`activityId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Activity`
--

INSERT INTO `Activity` (`userId`, `date`, `text`, `place`, `activityType`, `activityId`) VALUES
(1, '2015-11-25 14:56:15', 'Bra springtur', 'Vrinneviskogen, Norrköping', 'Running', 1),
(1, '2015-11-24 15:46:00', 'Bra gympass', 'WorldClass Pronova, Norrköping', 'Gym', 2),
(1, '2015-11-25 14:59:45', 'Simmade sjukt långt', 'Medley, Norrköping', 'Swimming', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Gym`
--

CREATE TABLE `Gym` (
  `activityId` int(11) NOT NULL,
  `exercise` varchar(100) NOT NULL,
  `weight` int(11) NOT NULL,
  `repetitions` int(11) NOT NULL,
`gymId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Gym`
--

INSERT INTO `Gym` (`activityId`, `exercise`, `weight`, `repetitions`, `gymId`) VALUES
(1, 'DL', 140, 2, 1),
(2, 'C and J', 79, 5, 2),
(3, 'PC', 90, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Running`
--

CREATE TABLE `Running` (
  `activityId` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `time` time NOT NULL,
`runningId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Running`
--

INSERT INTO `Running` (`activityId`, `length`, `time`, `runningId`) VALUES
(1, 5000, '23:02:12', 1),
(2, 5000, '23:02:18', 5),
(3, 5000, '23:23:12', 6);

-- --------------------------------------------------------

--
-- Table structure for table `Swimming`
--

CREATE TABLE `Swimming` (
  `stroke` varchar(100) NOT NULL,
  `length` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Swimming`
--

INSERT INTO `Swimming` (`stroke`, `length`, `activityId`, `time`) VALUES
('Fr', 50, 1, '00:00:00'),
('Fj', 200, 2, '00:00:00'),
('Ry', 100, 3, '00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Activity`
--
ALTER TABLE `Activity`
 ADD PRIMARY KEY (`activityId`);

--
-- Indexes for table `Gym`
--
ALTER TABLE `Gym`
 ADD PRIMARY KEY (`gymId`);

--
-- Indexes for table `Running`
--
ALTER TABLE `Running`
 ADD UNIQUE KEY `runningId` (`runningId`);

--
-- Indexes for table `Swimming`
--
ALTER TABLE `Swimming`
 ADD UNIQUE KEY `activityId` (`activityId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Activity`
--
ALTER TABLE `Activity`
MODIFY `activityId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Gym`
--
ALTER TABLE `Gym`
MODIFY `gymId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Running`
--
ALTER TABLE `Running`
MODIFY `runningId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;