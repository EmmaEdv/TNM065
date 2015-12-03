-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Skapad: 03 dec 2015 kl 04:55
-- Serverversion: 5.5.46-0ubuntu0.14.04.2
-- PHP-version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `nuthack`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `Activity`
--

CREATE TABLE IF NOT EXISTS `Activity` (
  `userId` int(6) NOT NULL,
  `date` date NOT NULL,
  `text` text COLLATE utf8_swedish_ci NOT NULL,
  `place` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `activityType` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=145 ;

--
-- Dumpning av Data i tabell `Activity`
--

INSERT INTO `Activity` (`userId`, `date`, `text`, `place`, `activityType`, `activityId`) VALUES
(1, '2015-12-01', 'Bra gympass', 'WorldClass Pronova, NorrkÃ¶ping', 'Gym', 2),
(1, '2015-11-25', 'Simmade sjuukt lÃ¥ngt', 'Medley, NorrkÃ¶ping', 'Swimming', 3),
(1, '2015-11-30', 'Maxtempo', 'StrÃ¶mmen, NorrkÃ¶ping', 'Running', 116),
(1, '2015-12-02', 'MilspÃ¥ret. ', 'Vrinneviskogen, NorrkÃ¶ping', 'Running', 144);

-- --------------------------------------------------------

--
-- Tabellstruktur `Gym`
--

CREATE TABLE IF NOT EXISTS `Gym` (
  `activityId` int(11) NOT NULL,
  `exercise` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `repetitions` int(11) NOT NULL,
  `gymId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`gymId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=12 ;

--
-- Dumpning av Data i tabell `Gym`
--

INSERT INTO `Gym` (`activityId`, `exercise`, `weight`, `repetitions`, `gymId`) VALUES
(2, 'C and J', 89, 5, 2);

-- --------------------------------------------------------

--
-- Tabellstruktur `Running`
--

CREATE TABLE IF NOT EXISTS `Running` (
  `activityId` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `time` time NOT NULL,
  `runningId` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `runningId` (`runningId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=55 ;

--
-- Dumpning av Data i tabell `Running`
--

INSERT INTO `Running` (`activityId`, `length`, `time`, `runningId`) VALUES
(116, 5000, '00:19:46', 30),
(144, 10000, '00:58:23', 54);

-- --------------------------------------------------------

--
-- Tabellstruktur `Swimming`
--

CREATE TABLE IF NOT EXISTS `Swimming` (
  `stroke` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `length` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `time` time NOT NULL,
  `swimmingId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`swimmingId`),
  UNIQUE KEY `activityId` (`activityId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=3 ;

--
-- Dumpning av Data i tabell `Swimming`
--

INSERT INTO `Swimming` (`stroke`, `length`, `activityId`, `time`, `swimmingId`) VALUES
('Ry', 123, 3, '00:58:06', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
