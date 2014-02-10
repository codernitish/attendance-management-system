-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2014 at 02:44 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `new_fpa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alter_class`
--

CREATE TABLE IF NOT EXISTS `alter_class` (
  `course_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `day` varchar(10) NOT NULL,
  `time1_start` time NOT NULL DEFAULT '00:00:00',
  `time1_end` time NOT NULL DEFAULT '00:00:00',
  `time2_start` time NOT NULL,
  `time2_end` time NOT NULL,
  `type` varchar(1) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `userid` varchar(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `count`
--

CREATE TABLE IF NOT EXISTS `count` (
  `count` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_details`
--

CREATE TABLE IF NOT EXISTS `course_details` (
  `course_name` varchar(30) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `id_no` varchar(15) NOT NULL,
  `starting_date` date NOT NULL,
  `finishing_date` date NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_schedule`
--

CREATE TABLE IF NOT EXISTS `course_schedule` (
  `course_id` varchar(10) NOT NULL,
  `day` varchar(10) NOT NULL,
  `time1_start` time NOT NULL,
  `time1_end` time NOT NULL,
  `time2_start` time NOT NULL,
  `time2_end` time NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE IF NOT EXISTS `details` (
  `class` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rollno` varchar(10) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_details`
--

CREATE TABLE IF NOT EXISTS `enrolled_details` (
  `id_no` varchar(11) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  PRIMARY KEY (`id_no`,`course_id`),
  KEY `course_id` (`course_id`),
  KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE IF NOT EXISTS `faculty` (
  `id` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE IF NOT EXISTS `registered` (
  `serial_no` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `id_no` varchar(11) NOT NULL COMMENT 'emp_id / roll_no',
  `phone_no` int(15) NOT NULL,
  `email_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id_no`),
  UNIQUE KEY `serial_no` (`serial_no`),
  KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alter_class`
--
ALTER TABLE `alter_class`
  ADD CONSTRAINT `alter_class_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course_details` (`course_id`);

--
-- Constraints for table `course_details`
--
ALTER TABLE `course_details`
  ADD CONSTRAINT `course_details_ibfk_1` FOREIGN KEY (`id_no`) REFERENCES `registered` (`id_no`);

--
-- Constraints for table `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD CONSTRAINT `course_schedule_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_details` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrolled_details`
--
ALTER TABLE `enrolled_details`
  ADD CONSTRAINT `enrolled_details_ibfk_3` FOREIGN KEY (`id_no`) REFERENCES `registered` (`id_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrolled_details_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `course_details` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
