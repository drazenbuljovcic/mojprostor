-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2016 at 11:52 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mojprostor`
--

-- --------------------------------------------------------

--
-- Table structure for table `business_pictures`
--

CREATE TABLE IF NOT EXISTS `business_pictures` (
  `id_picture` int(11) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(50) NOT NULL,
  `id_business_space` int(11) NOT NULL,
  PRIMARY KEY (`id_picture`,`id_business_space`),
  KEY `fk_business_pictures_business_space1_idx` (`id_business_space`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_space`
--

CREATE TABLE IF NOT EXISTS `business_space` (
  `id_business_space` int(11) NOT NULL AUTO_INCREMENT,
  `size_m2` decimal(5,2) NOT NULL,
  `description` text,
  `parking_space` int(2) NOT NULL DEFAULT '0',
  `price` int(6) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_expired` datetime NOT NULL,
  `is_premium` enum('y','n') NOT NULL DEFAULT 'n',
  `status` enum('r','s') NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  PRIMARY KEY (`id_business_space`,`id_user`,`id_location`),
  KEY `fk_business_space_user_idx` (`id_user`),
  KEY `fk_business_space_location1_idx` (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `lat` decimal(10,0) NOT NULL,
  `lon` decimal(10,0) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip` int(5) NOT NULL,
  PRIMARY KEY (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_pictures`
--

CREATE TABLE IF NOT EXISTS `student_pictures` (
  `id_picture` int(11) NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(50) NOT NULL,
  `id_student_space` int(11) NOT NULL,
  PRIMARY KEY (`id_picture`,`id_student_space`),
  KEY `fk_student_pictures_student_space1_idx` (`id_student_space`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_space`
--

CREATE TABLE IF NOT EXISTS `student_space` (
  `id_student_space` int(11) NOT NULL AUTO_INCREMENT,
  `size_m2` decimal(5,2) NOT NULL,
  `description` text,
  `rental_price` int(3) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_expired` datetime NOT NULL,
  `is_premium` enum('y','n') NOT NULL DEFAULT 'n',
  `no_roommates` int(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  PRIMARY KEY (`id_student_space`,`id_user`,`id_location`),
  KEY `fk_student_space_user1_idx` (`id_user`),
  KEY `fk_student_space_location1_idx` (`id_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `adds_limit` int(2) NOT NULL DEFAULT '2',
  `active_adds` int(2) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `first_name`, `last_name`, `adds_limit`, `active_adds`, `created`) VALUES
(1, 'dfsfds@fdsfds.com', '3e28355a8e3c933289310d5a33d5c42c76f1e0e3', 'sdgsgsd', 'sdfgsdgd', 2, 0, '2016-04-16 11:16:46'),
(2, 'dfsfds@fdsfds.com', '3e28355a8e3c933289310d5a33d5c42c76f1e0e3', 'sdgsgsd', 'sdfgsdgd', 2, 0, '2016-04-16 11:17:02'),
(3, 'dfsfds@fdsfds.com', '3e28355a8e3c933289310d5a33d5c42c76f1e0e3', 'sdgsgsd', 'sdfgsdgd', 2, 0, '2016-04-16 11:18:46');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_pictures`
--
ALTER TABLE `business_pictures`
  ADD CONSTRAINT `fk_business_pictures_business_space1` FOREIGN KEY (`id_business_space`) REFERENCES `business_space` (`id_business_space`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_space`
--
ALTER TABLE `business_space`
  ADD CONSTRAINT `fk_business_space_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_business_space_location1` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_pictures`
--
ALTER TABLE `student_pictures`
  ADD CONSTRAINT `fk_student_pictures_student_space1` FOREIGN KEY (`id_student_space`) REFERENCES `student_space` (`id_student_space`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_space`
--
ALTER TABLE `student_space`
  ADD CONSTRAINT `fk_student_space_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_space_location1` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
