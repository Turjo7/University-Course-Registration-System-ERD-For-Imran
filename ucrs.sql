-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2019 at 03:05 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ucrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user_name`, `user_password`) VALUES
(1, 'admin', 'admin@1234');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `credit_hour` int(11) DEFAULT NULL,
  `offered_semester` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_id`, `admin_id`, `department_name`, `course_name`, `course_code`, `credit_hour`, `offered_semester`) VALUES
(1, 1, 'CSE', 'Intensive English I', '	ENG 1105', 5, '1'),
(2, 1, 'CSE', 'Intensive English II', 'ENG 1207', 5, '1'),
(3, 1, 'CSE', 'SPL', 'CSE 121', 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `coursecart`
--

CREATE TABLE `coursecart` (
  `cc_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `credit_hour` int(11) DEFAULT NULL,
  `offered_semester` varchar(30) DEFAULT NULL,
  `reg_status` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coursecart`
--

INSERT INTO `coursecart` (`cc_id`, `admin_id`, `student_id`, `department_name`, `course_name`, `course_code`, `credit_hour`, `offered_semester`, `reg_status`) VALUES
(1, 1, 11151086, 'CSE', 'Structured Programming', 'CSE 121', 3, '1', NULL),
(2, 1, 11151075, 'CSE', 'Structured Programming', 'CSE 121', 3, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `s_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `student_name` varchar(50) DEFAULT NULL,
  `student_id` varchar(9) NOT NULL,
  `student_password` varchar(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`s_id`, `admin_id`, `student_name`, `student_id`, `student_password`, `department`) VALUES
(1, 1, 'Nasir Uddin Ahmed', '011151086', '1234', 'CSE'),
(2, 1, 'Md. Imran', '011151075', '1234', 'CSE'),
(3, 1, 'Sukannya Saha', '011151079', '1234', 'CSE'),
(4, 1, 'Nopa Islam', '011151062', '1234', 'CSE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`,`admin_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `coursecart`
--
ALTER TABLE `coursecart`
  ADD PRIMARY KEY (`cc_id`,`admin_id`,`student_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`,`admin_id`,`student_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coursecart`
--
ALTER TABLE `coursecart`
  MODIFY `cc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `coursecart`
--
ALTER TABLE `coursecart`
  ADD CONSTRAINT `coursecart_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
