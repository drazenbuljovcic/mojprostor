-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2016 at 06:38 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `business_pictures`
--

INSERT INTO `business_pictures` (`id_picture`, `picture_name`, `id_business_space`) VALUES
(1, 'image5b4d87fc583bfa35539a709099df7c05e1e135794adb2', 3),
(2, 'image8a8769f22e0947758e643edc770b61cfe6b5b084568a0', 3),
(3, 'image27fd0c2ce0122b0f8fd9dc87165d2cf14792f59001af4', 3),
(4, 'imagebd199ebbdcf652039a3da3bf5fb8022e48347c9b91312', 3),
(5, 'imageff40d396fea40c67819a26c8120f05edf70c500d8edd2', 3),
(6, '20150830105012T1441279592_540c.jpg', 4),
(7, '20150830105218T1441279608_540c.jpg', 4),
(8, '20150830105452T1441280056_540c.jpg', 4),
(9, '20150830105720T1441280060_540c.jpg', 4),
(10, '127842319525187114927891996622239nT1456928574_540c', 5),
(11, 'img3239T1431677255_540c.jpg', 5),
(12, 'img3249T1431677284_540c.jpg', 5),
(13, 'img3255T1431677279_540c.jpg', 5),
(14, 'img3257T1431677047_540c.jpg', 5);

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
  `heating` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id_business_space`,`id_user`,`id_location`),
  KEY `fk_business_space_user_idx` (`id_user`),
  KEY `fk_business_space_location1_idx` (`id_location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `business_space`
--

INSERT INTO `business_space` (`id_business_space`, `size_m2`, `description`, `parking_space`, `price`, `date_added`, `date_expired`, `is_premium`, `status`, `id_user`, `id_location`, `heating`, `picture`) VALUES
(3, '50.00', 'IZDAJEM LOKAL U STROGOM CENTRU NOVIH BANOVACA, PREKO PUTA OSNOVNE SKOLE I POSTE, ISPRED LOKALA AUTOBUSKA STANICA. LOKAL IMA 50 KVADRATA, POGODAN JE ZA SVE VRSTE DELATNOSTIi. PROSTRAN I OSVETLJEN. NA JAKO LEPOM MESTU, U ISTOJ KUCI SE NA SPRATU NALAZIi SALA ZA PILATES I AEROBIK, A U SUTERENU TERETANA "BEST GYM".', 5, 200, '2016-04-16 14:00:45', '0000-00-00 00:00:00', 'n', 'r', 4, 1, 'ta pec', 'image5b4d87fc583bfa35539a709099df7c05e1e135794adb2.jpg'),
(4, '30.00', '30m2 + 7m2 galerija. Izlog i ulaz sa ulice. Mermerni pod, sanitarni čvor, telefon, internet, video nadzor, alarm. Roletna sa motorom.', 0, 200000, '2016-04-16 14:03:49', '0000-00-00 00:00:00', 'y', 's', 8, 2, 'centeralno', '20150830105012T1441279592_540c.jpg'),
(5, '20.00', 'Izdajem lokal/radno mesto za manikir pedikir ili u svrhe koje Vama odgovara. U namestenom salonu Naturalis. U prometnoj ulici. Placanje po dogovoru.', 2, 80, '2016-04-16 14:05:20', '0000-00-00 00:00:00', 'n', 'r', 6, 3, 'nema', 'img3239T1431677255_540c.jpg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id_location`, `lat`, `lon`, `street`, `city`, `zip`) VALUES
(1, '45', '20', 'Svetosavska 33', 'Novi Banovci', 22303),
(2, '45', '21', 'Ulofa Palmea 4g', 'Beograd', 11000),
(3, '45', '20', 'Kralja Milana ', 'Beograd', 11000),
(4, '45', '20', 'Branka Krsmanovića 29', 'Beograd', 11000),
(5, '46', '20', 'Karadjordjev put 89a', 'Subotica', 24000),
(6, '46', '20', 'Severna', 'Subotica', 24000),
(7, '45', '20', 'Bulevar oslobodjenja 66', 'Novi Sad', 21000),
(8, '45', '20', 'Danila kiša 15', 'Novi Sad', 21000),
(9, '43', '22', 'Marka kraljevića bb', 'Leskovac', 16000);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `student_pictures`
--

INSERT INTO `student_pictures` (`id_picture`, `picture_name`, `id_student_space`) VALUES
(1, '20160416094012T1460805251_540c.jpg', 1),
(2, 'img0681T1458820474_540c.jpg', 1),
(3, 'img0684T1458820428_540c.jpg', 1),
(4, 'img0686T1458820406_540c.jpg', 1),
(5, 'img0689T1458820421_540c.jpg', 1),
(6, 'image.jpg', 2),
(7, 'image1a10.jpg', 2),
(8, 'image3b35.jpg', 2),
(9, 'image5.jpg', 2),
(10, 'image17e.jpg', 2),
(11, '3T1443273288_540c.jpg', 3),
(12, 'p1609121822T1443273356_540c.jpg', 3),
(13, 'p1609121824T1443273361_540c.jpg', 3),
(14, 'p1609121827T1443273367_540c.jpg', 3),
(15, 'p1609121828T1443273377_540c.jpg', 3),
(16, 'img20160405163102T1460038441_540c.jpg', 4),
(17, 'img20160405163111T1460038442_540c.jpg', 4),
(18, 'img20160405163124T1460038443_540c.jpg', 4),
(19, 'img20160405163133T1460038445_540c.jpg', 4),
(20, '1T1460014256_540c.jpg', 5),
(21, '3T1460014265_540c.jpg', 5),
(22, '5T1460014278_540c.jpg', 5),
(23, '6T1460014282_540c.jpg', 5),
(24, '8T1460014326_540c.jpg', 5),
(25, 'dnevnasobaT1456137960_540c.jpg', 8),
(26, 'kuhinjaT1456137952_540c.jpg', 8),
(27, 'kupatiloT1456137930_540c.jpg', 8),
(28, 'wcT1456137943_540c.jpg', 8);

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
  `heating` varchar(20) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id_student_space`,`id_user`,`id_location`),
  KEY `fk_student_space_user1_idx` (`id_user`),
  KEY `fk_student_space_location1_idx` (`id_location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `student_space`
--

INSERT INTO `student_space` (`id_student_space`, `size_m2`, `description`, `rental_price`, `date_added`, `date_expired`, `is_premium`, `no_roommates`, `id_user`, `id_location`, `heating`, `picture`) VALUES
(1, '54.00', 'Dvosoban namesten stan kod Djerma. Novogradnja sa garaznim mestom uracunatim u cenu.', 300, '2016-04-16 14:08:06', '0000-00-00 00:00:00', 'n', 0, 6, 4, 'centeralno', '20160416094012T1460805251_540c.jpg'),
(2, '56.00', 'Izdajem trosoban stan na Karađorđevom putu u blizini škole Sečenji Ištvan. Stan renoviran sa pripadajućim podrumom.', 200, '2016-04-16 14:11:04', '0000-00-00 00:00:00', 'y', 0, 8, 5, 'toplana', 'image.jpg'),
(3, '151.00', NULL, 250, '2016-04-16 14:12:26', '0000-00-00 00:00:00', 'n', 3, 5, 6, 'ima', '3T1443273288_540c.jpg'),
(4, '26.00', 'GARSONJERA 26m²,BULEVAR KOD FUTOŠKE PIJACE… NA ODLIČNOJ LOKACIJI,PRVI SPRAT ,TERASA,LIFT…', 140, '2016-04-16 14:13:54', '0000-00-00 00:00:00', 'n', 0, 7, 7, 'nema', 'img20160405163102T1460038441_540c.jpg'),
(5, '68.00', 'Na jednoj od najatraktivnijih lokacija u gradu, nudimo Vam funkcionalan, trosoban stan po izuzetno povoljnoj ceni! Blizina škole, pijace, centra, keja i svog drugog sadržaja za funkcionisanje porodice. Stan je za adaptaciju. Uknjižen, pa postoji mogućnost realizacije putem stambenog kredita. Pogledajte.', 260, '2016-04-16 14:15:32', '0000-00-00 00:00:00', 'y', 2, 8, 8, '', '1T1460014256_540c.jpg'),
(8, '94.00', 'Izdaje se trosoban renoviran stan na prvom spratu kod tri sesira, Stan poseduje 2 terase i podrum. Moze za familije i kao doktorska oridinacija. ', 160, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'y', 0, 8, 9, 'nema', 'dnevnasobaT1456137960_540c.jpg');

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
  `premium` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `first_name`, `last_name`, `adds_limit`, `active_adds`, `created`, `premium`) VALUES
(4, 'mirko.slavko@gmail.com', 'smrtfasizmu', 'slavko', 'mirkovic', 2, 1, '2016-04-16 12:38:15', 0),
(5, 'john_wayne@ymail.com', 'searchers', 'Jovan', 'milivojevic', 2, 1, '2016-04-16 12:38:38', 0),
(6, 'babini_stanovi hotmail.com', 'dobra_domacica', 'Marija', 'Markovic', 2, 2, '2016-04-16 12:38:50', 0),
(7, 'betmenrobinovski@gmail.com', 'suprheroes', 'zivojin', 'pavlovic', 2, 1, '2016-04-16 12:39:02', 0),
(8, 'valjam_nekretnine@gmail.com', 'zavrcem_kupce', 'sumnjivi', 'lik', 10, 5, '2016-04-16 12:39:13', 1);

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
  ADD CONSTRAINT `fk_business_space_location1` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_business_space_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_pictures`
--
ALTER TABLE `student_pictures`
  ADD CONSTRAINT `fk_student_pictures_student_space1` FOREIGN KEY (`id_student_space`) REFERENCES `student_space` (`id_student_space`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_space`
--
ALTER TABLE `student_space`
  ADD CONSTRAINT `fk_student_space_location1` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_space_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
