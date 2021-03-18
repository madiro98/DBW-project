-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2021 at 06:44 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website`
--

-- --------------------------------------------------------

--
-- Table structure for table `Authors`
--

CREATE TABLE `Authors` (
  `idAuthors` int(11) NOT NULL,
  `Full_name` varchar(60) DEFAULT NULL,
  `Institution` varchar(60) DEFAULT NULL,
  `NewsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Author_has_news`
--

CREATE TABLE `Author_has_news` (
  `Authors_idAuthors` int(11) NOT NULL,
  `News_idNews` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `idCategories` int(11) NOT NULL,
  `Type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `idComments` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `Content` text DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`idComments`, `PostID`, `Content`, `Likes`, `UserID`, `Date`) VALUES
(1, 4, 'What a beautiful picture.', 0, 2, '2021-03-15 17:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `Journal`
--

CREATE TABLE `Journal` (
  `idJournal` int(11) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `Publication_date` datetime DEFAULT NULL,
  `NewsID` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `contentid` bigint(20) NOT NULL,
  `likes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `type`, `contentid`, `likes`) VALUES
(7, 'post', 5, '[{\"userid\":5,\"date\":\"2021-03-15 23:15:23\"},{\"userid\":2,\"date\":\"2021-03-15 23:29:33\"}]'),
(8, 'post', 4, '[{\"userid\":3,\"date\":\"2021-03-15 23:35:45\"},{\"userid\":2,\"date\":\"2021-03-16 10:50:00\"}]'),
(9, 'post', 2, '[{\"userid\":null,\"date\":\"2021-03-16 15:38:46\"}]'),
(10, 'post', 1, '[{\"userid\":3,\"date\":\"2021-03-15 23:35:54\"}]'),
(11, 'post', 6, '[]'),
(12, 'post', 9, '[{\"userid\":3,\"date\":\"2021-03-16 17:24:32\"}]'),
(13, 'post', 10, '[]'),
(14, 'post', 11, '[{\"userid\":3,\"date\":\"2021-03-16 17:25:13\"}]'),
(15, 'post', 3, '[{\"userid\":2,\"date\":\"2021-03-16 17:28:03\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `News`
--

CREATE TABLE `News` (
  `idNews` int(11) NOT NULL,
  `Title` varchar(300) NOT NULL,
  `Subtitle` varchar(300) DEFAULT NULL,
  `URL` varchar(150) NOT NULL,
  `Category` int(11) NOT NULL,
  `JournalID` int(11) DEFAULT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `idPosts` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Title` varchar(300) DEFAULT NULL,
  `Description` text NOT NULL,
  `Likes` int(11) DEFAULT NULL,
  `Section` enum('UserPost','ForumPost') NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `Comments` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`idPosts`, `UserID`, `Title`, `Description`, `Likes`, `Section`, `Date`, `image`, `parent`, `Comments`) VALUES
(1, 2, 'test', 'test', 1, 'UserPost', '2021-03-14 18:43:07', '', 0, 0),
(2, 2, 'test2', 'test2', 1, 'UserPost', '2021-03-14 18:48:39', '', 0, 1),
(3, 2, 'Check', 'Please, work :\'(', 1, 'UserPost', '2021-03-14 19:43:40', '', 0, 0),
(4, 2, 'First picture', 'Hopefully', 2, 'UserPost', '2021-03-15 00:01:23', '1615762883_dope_profile.png', 0, 0),
(5, 3, NULL, 'What if there is no title in the post?', 2, 'UserPost', '2021-03-15 11:24:02', '', 0, 2),
(6, 2, NULL, 'Trying comments.', 0, 'UserPost', '2021-03-16 16:17:01', NULL, 2, 0),
(7, 2, 'My first question', 'WIll it work?', 0, 'ForumPost', '2021-03-16 17:13:54', NULL, 0, 0),
(8, 2, 'Second question', 'I don\'t know why it\'s not working', 0, 'ForumPost', '2021-03-16 17:17:48', NULL, 0, 0),
(9, 3, 'Third question', 'I don\'t know what to ask', 1, 'ForumPost', '2021-03-16 17:22:44', NULL, 0, 2),
(10, 3, NULL, 'Testing the forum comments', 0, 'UserPost', '2021-03-16 17:24:43', NULL, 9, 0),
(15, 2, NULL, 'This is a trial comment.', 0, 'UserPost', '2021-03-16 17:54:59', NULL, 5, 0),
(21, 2, NULL, 'fadkoz', 0, 'UserPost', '2021-03-16 18:06:12', NULL, 5, 0),
(22, 2, NULL, 'An answer', 0, 'UserPost', '2021-03-16 18:09:56', NULL, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Privileges`
--

CREATE TABLE `Privileges` (
  `Type_of_privilege` varchar(45) NOT NULL,
  `Code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `idUser` int(11) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Surname` varchar(45) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `Privileges` int(11) DEFAULT NULL,
  `Date_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`idUser`, `Username`, `Password`, `Name`, `Surname`, `email`, `Privileges`, `Date_birth`) VALUES
(2, 'maria', 'maria', NULL, NULL, 'maria@prova.com', NULL, NULL),
(3, 'mdr', 'mdr', NULL, NULL, 'mdr@mdr.com', NULL, NULL),
(5, 'maria2', 'maria2', NULL, NULL, 'maria2@prova.com', NULL, NULL),
(6, 'maria2', 'maria2', NULL, NULL, 'maria2@prova.com', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Authors`
--
ALTER TABLE `Authors`
  ADD PRIMARY KEY (`idAuthors`);

--
-- Indexes for table `Author_has_news`
--
ALTER TABLE `Author_has_news`
  ADD PRIMARY KEY (`Authors_idAuthors`,`News_idNews`),
  ADD KEY `fk_Authors_has_News_News1` (`News_idNews`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`idCategories`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`idComments`),
  ADD KEY `fk_Comments_Posts1` (`PostID`),
  ADD KEY `fk_Comments_Users1` (`UserID`);

--
-- Indexes for table `Journal`
--
ALTER TABLE `Journal`
  ADD PRIMARY KEY (`idJournal`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contentid` (`contentid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `News`
--
ALTER TABLE `News`
  ADD PRIMARY KEY (`idNews`),
  ADD KEY `fk_News_Categories1` (`Category`),
  ADD KEY `fk_News_Journal1` (`JournalID`);

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`idPosts`),
  ADD KEY `fk_Posts_1` (`UserID`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `Privileges`
--
ALTER TABLE `Privileges`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `fk_Users_Privileges` (`Privileges`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Authors`
--
ALTER TABLE `Authors`
  MODIFY `idAuthors` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `idComments` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Journal`
--
ALTER TABLE `Journal`
  MODIFY `idJournal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `News`
--
ALTER TABLE `News`
  MODIFY `idNews` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `idPosts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Author_has_news`
--
ALTER TABLE `Author_has_news`
  ADD CONSTRAINT `fk_Authors_has_News_Authors1` FOREIGN KEY (`Authors_idAuthors`) REFERENCES `Authors` (`idAuthors`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Authors_has_News_News1` FOREIGN KEY (`News_idNews`) REFERENCES `News` (`idNews`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `fk_Comments_Posts1` FOREIGN KEY (`PostID`) REFERENCES `Posts` (`idPosts`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Comments_Users1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `News`
--
ALTER TABLE `News`
  ADD CONSTRAINT `fk_News_Categories1` FOREIGN KEY (`Category`) REFERENCES `Categories` (`idCategories`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_News_Journal1` FOREIGN KEY (`JournalID`) REFERENCES `Journal` (`idJournal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `fk_Posts_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `fk_Users_Privileges` FOREIGN KEY (`Privileges`) REFERENCES `Privileges` (`Code`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
