-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2020 at 12:02 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_chrisrenieris_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `cr10_chrisrenieris_biglibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr10_chrisrenieris_biglibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `creator`
--

CREATE TABLE `creator` (
  `creator_id` int(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `type` enum('author','director','singer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creator`
--

INSERT INTO `creator` (`creator_id`, `name`, `surname`, `type`) VALUES
(1, 'Twenty One ', 'Pilots', 'singer'),
(2, 'J.K.', 'Rowling', 'author'),
(3, 'Makoto ', 'Shinkai', 'director'),
(4, 'Kubo', 'Tide', 'author'),
(5, 'Yūto', 'Tsukuda', 'author'),
(6, 'LOGIC', 'Sir Robert Bryson Hall II', 'singer'),
(7, 'Kero Kero', 'Bonito', 'singer'),
(8, 'Sui ', 'Ishida', 'director'),
(9, 'Michael Benjamin', 'Bay', 'director'),
(10, 'Skindred', NULL, 'singer');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT 'none',
  `description` varchar(800) DEFAULT NULL,
  `type` enum('book','CD','DVD','comic','manga') DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `status` enum('available','reserved') DEFAULT 'available',
  `fk_publisher_id` int(50) DEFAULT NULL,
  `fk_user_id` int(50) DEFAULT NULL,
  `fk_creator_id` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `title`, `image`, `ISBN`, `description`, `type`, `genre`, `status`, `fk_publisher_id`, `fk_user_id`, `fk_creator_id`) VALUES
(1, 'Kimi No Nawa', 'https://vignette.wikia.nocookie.net/kiminonawa/images/6/62/Kimi-no-Na-wa.-Visual.jpg/revision/latest', '123456789', 'Two strangers find themselves linked in a bizarre way. When a connection forms, will distance be the only thing to keep them apart?', 'book', 'Animation, Drama, Fantasy', 'reserved', 3, 1, 3),
(2, 'Trench', 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Trench_Twenty_One_Pilots.png/220px-Trench_Twenty_One_Pilots.png', '', 'Trench continues the bands exploration of themes surrounding insecurity, faith, suicide, and mental health, prominent themes on Twenty One Pilots previous albums.', 'CD', 'Alternative hip hop, electropop, indie pop, pop rock, rap rock, alternative rock', 'reserved', 5, 4, 1),
(3, 'Harry Potter and the Philosopher\'s Stone', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg/220px-Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg', '747532699', 'This is the tale of Harry Potter, an ordinary eleven-year-old boy serving as a sort of slave for his aunt and uncle who learns that he is actually a wizard and has been invited to attend the Hogwarts School for Witchcraft and Wizardry.', 'book', 'Fantasy Novel', 'reserved', 2, 2, 2),
(4, 'Bleach', 'https://upload.wikimedia.org/wikipedia/en/thumb/7/72/Bleachanime.png/220px-Bleachanime.png', '', 'High school student Kurosaki Ichigo is unlike any ordinary kid because he can see ghosts. After an accident with a hollow, he got a power.So begins Kurosaki Ichigos training and duty as a Shinigami, Soul Reaper.', 'manga', 'Adventure , Supernatural', 'reserved', 1, 1, 4),
(5, 'Food Wars: Shokugeki no Soma', 'https://upload.wikimedia.org/wikipedia/en/d/d3/Shokugeki_no_Souma_Volume_1.jpg', '', 'Meet Souma, he is the son of the owner of a small eatery in Japan. For his age, Souma is a very talented person able to easily come up with new dishes; sometimes these dishes are some really weird combinations of the ingredients no one would use. After some time, the owner of the Souma\'s eatery, Souma\'s father, leaves the family business to work with his friend. Souma\'s restaurant is on the verge of closing. To improve his cooking skills and to save the restaurant, Souma begins studying in Engetsu Teahouse Culinary Academy, which is regarded as Japan\'s top culinary academy. The problem is that only a few are able to graduate from it, these few are world\'s best gourmet of culinary. Will Souma manage to graduate from the academy?', 'manga', 'Comedy, Drama, Slice of life', 'reserved', 1, 4, 5),
(6, 'Confessions of a Dangerous Mind', 'https://upload.wikimedia.org/wikipedia/en/thumb/9/90/Confessions_of_a_Dangerous_Mind_album_cover.jpg/220px-Confessions_of_a_Dangerous_Mind_album_cover.jpg', '', 'Music album', 'CD', 'Hip Hop', 'reserved', 6, 2, 6),
(7, 'Flamingo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTydf6KTQ3-2L9FDJOzivs_DPDdR3v5d5lyFBEeDLVUWIlbay3S', '', 'Song', 'CD', 'Indie pop, Electropop, dance-rock', 'reserved', 7, 4, 7),
(8, 'Tokyo Ghoul', 'https://vignette.wikia.nocookie.net/tokyoghoul/images/5/5c/Tokyo_Ghoul_Visual_2.png/revision/latest/scale-to-width-down/350?cb=20141203210530', '', 'The story follows Ken Kaneki, a college student who barely survives a deadly encounter with Rize Kamishiro, his date who reveals herself as a ghoul. He is taken to the hospital in critical condition. After recovering, Kaneki discovers that he underwent a surgery that transformed him into a half-ghoul. This was accomplished because some of Rize\'s organs were transferred into his body, and now, like normal ghouls, he must consume human flesh to survive. The ghouls who manage the coffee shop \"Anteiku\" take him in and teach him to deal with his new life as a half-ghoul. Some of his daily struggles include fitting into the ghoul society, as well as keeping his identity hidden from his human companions, especially from his best friend Hideyoshi Nagachika.', 'DVD', 'Dark Fantasy, Horror, Thriller', 'reserved', 1, 3, 8),
(9, '6 Underground', 'https://m.media-amazon.com/images/M/MV5BNzE2ZjQxNjEtNmI2ZS00ZmU0LTg4M2YtYzVhYmRiYWU0YzI1XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', '', 'Meet a new kind of action hero. Six untraceable agents, totally off the grid. They\'ve buried their pasts so they can change the future.', 'DVD', 'Action, Comedy, Thriller', 'reserved', 4, 3, 9),
(10, 'Big Tings', 'https://i.scdn.co/image/645c988d3043a23eb490eeddc44e19bbc762240e', '', 'Music Album', 'CD', 'Reggae metal, alternative metal', 'reserved', 8, 3, 10),
(11, 'test', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png', '', 'yet another test', 'DVD', NULL, 'available', NULL, NULL, NULL),
(20, 'test', 'test', '', 'TEST', 'comic', NULL, 'available', NULL, NULL, NULL),
(23, 'KAKE', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png', '141857481', 'KAKE', 'book', NULL, 'available', NULL, NULL, NULL),
(26, 'david', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png', '', 'test', 'manga', NULL, 'available', NULL, NULL, NULL),
(27, 'david2.0', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png', '', 'david2.0', 'CD', NULL, 'available', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `company_size` enum('small','medium','large') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `address`, `company_size`) VALUES
(1, 'Shueisha', 'Tokyo, Japan', 'medium'),
(2, 'Bloomsbury Publishing', 'WC1, London, England', 'large'),
(3, 'Toho Co.', 'Yūrakuchō, Chiyoda, Tokyo, Japan', 'medium'),
(4, 'Netflix', 'Los Gatos, California, U.S.', 'large'),
(5, 'Fueled by Ramen', 'New York City, U.S.', NULL),
(6, 'Visionary Music Group', 'U.S.', 'small'),
(7, 'Sony Music Entertainment Japan', 'Rokubancho, Chiyoda, Tokyo, Japan', 'large'),
(8, 'Napalm Records', 'Eisenerz, Styria, Austria', 'small');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(50) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `email`, `password`, `role`) VALUES
(1, 'ChriShiMo', 'chris@email.com', NULL, 'user'),
(2, 'bobbY', 'bob@bobby.com', NULL, 'user'),
(3, 'markJohn', 'mark@john.com', NULL, 'user'),
(4, 'aliceScarlet', 'alice@gmail.com', NULL, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `creator`
--
ALTER TABLE `creator`
  ADD PRIMARY KEY (`creator_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`),
  ADD KEY `fk_creator_id` (`fk_creator_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `creator`
--
ALTER TABLE `creator`
  MODIFY `creator_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_creator_id`) REFERENCES `creator` (`creator_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
