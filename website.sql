-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2021 at 03:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

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
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `followers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `userid`, `followers`) VALUES
(11, 3, '[{\"userid\":2,\"date\":\"2021-03-28 12:03:37\"}]'),
(16, 2, '[{\"userid\":5,\"date\":\"2021-03-28 00:06:15\"}]'),
(17, 5, '[{\"userid\":2,\"date\":\"2021-03-28 10:41:24\"}]'),
(18, 6, '[]');

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
(17, 'post', 4, '[]'),
(18, 'post', 5, '[{\"userid\":2,\"date\":\"2021-03-26 11:16:26\"}]'),
(19, 'post', 15, '[{\"userid\":2,\"date\":\"2021-03-26 11:16:31\"}]'),
(20, 'post', 9, '[]');

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
(1, 2, 'test', 'test', 0, 'UserPost', '2021-03-14 18:43:07', '', 0, 0),
(2, 2, 'test2', 'test2', 0, 'UserPost', '2021-03-14 18:48:39', '', 0, 1),
(3, 2, 'Check', 'Please, work :\'(', 0, 'UserPost', '2021-03-14 19:43:40', '', 0, 0),
(4, 2, 'First picture', 'Hopefully', 0, 'UserPost', '2021-03-15 00:01:23', '1615762883_dope_profile.png', 0, 0),
(5, 3, NULL, 'What if there is no title in the post?', 1, 'UserPost', '2021-03-15 11:24:02', '', 0, 2),
(6, 2, NULL, 'Trying comments.', 0, 'UserPost', '2021-03-16 16:17:01', NULL, 2, 0),
(7, 2, 'My first question', 'WIll it work?', 0, 'ForumPost', '2021-03-16 17:13:54', NULL, 0, 0),
(8, 2, 'Second question', 'I don\'t know why it\'s not working', 0, 'ForumPost', '2021-03-16 17:17:48', NULL, 0, 0),
(9, 3, 'Third question', 'I don\'t know what to ask', 0, 'ForumPost', '2021-03-16 17:22:44', NULL, 0, 2),
(10, 3, NULL, 'Testing the forum comments', 0, 'UserPost', '2021-03-16 17:24:43', NULL, 9, 0),
(15, 2, NULL, 'This is a trial comment.', 1, 'UserPost', '2021-03-16 17:54:59', NULL, 5, 0),
(21, 2, NULL, 'fadkoz', 0, 'UserPost', '2021-03-16 18:06:12', NULL, 5, 0),
(22, 2, NULL, 'An answer', 0, 'UserPost', '2021-03-16 18:09:56', NULL, 9, 0),
(23, 2, 'HI-C', 'Did you know that Hi-C uses high-throughput sequencing to find the nucleotide sequence of fragments and uses paired end sequencing, which retrieves a short sequence from each end of each ligated fragment? As such, for a given ligated fragment, the two sequences obtained should represent two different restriction fragments that were ligated together in the proximity based ligation step', 0, 'UserPost', '2021-03-26 11:30:22', '1616754622_HI_C1.png', 0, 0),
(24, 2, 'How to check if an array value exists in php?', 'How can I check if $something[\'say\'] has the value of \'bla\' or \'omg\'?', 0, 'ForumPost', '2021-03-26 11:36:06', NULL, 0, 6),
(25, 2, NULL, 'You could use the PHP in_array function:\r\n\r\nif (in_array( \"bla\" ,$yourarray ) )\r\n{\r\n    echo \"has bla\";\r\n}', 0, 'UserPost', '2021-03-26 11:37:53', NULL, 24, 0),
(26, 2, NULL, 'You can use:\r\n\r\n1. array_search()\r\n2. in_array()\r\n3. A combination of array_flip() and array_key_exists()', 0, 'UserPost', '2021-03-26 11:41:48', NULL, 24, 0),
(27, 2, NULL, 'You can test whether an array has a certain element at all or not with isset() or sometimes even better array_key_exists() (the documentation explains the differences). If you can\'t be sure if the array has an element with the index \'say\' you should test that first or you might get \'warning: undefined index....\' messages.', 0, 'UserPost', '2021-03-26 11:44:17', NULL, 24, 0),
(28, 2, NULL, 'You can use:\r\n\r\n1. array_search()\r\n2. in_array()\r\n3. A combination of array_flip() and array_key_exists()', 0, 'UserPost', '2021-03-26 11:48:26', NULL, 24, 0),
(29, 2, NULL, 'You can use: \r\n\r\n1. array_search()\r\n2. in_array()\r\n3. A combination of array_flip() and array_key_exists()', 0, 'UserPost', '2021-03-26 11:52:30', NULL, 24, 0),
(30, 2, NULL, 'You can use:\r\n<br>\r\n1. array_search()\r\n<br>\r\n2. in_array()\r\n<br>\r\n3. A combination of array_flip() and array_key_exists()', 0, 'UserPost', '2021-03-26 11:53:01', NULL, 24, 0);

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
-- Table structure for table `Quotes`
--

CREATE TABLE `Quotes` (
  `id` int(11) NOT NULL,
  `quote` text NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Quotes`
--

INSERT INTO `Quotes` (`id`, `quote`, `author`) VALUES
(1, '“Two things are infinite: the universe and human stupidity; and I\'m not sure about the universe.”', 'Albert Einstein'),
(2, '“The saddest aspect of life right now is that science gathers knowledge faster than society gathers wisdom.”', 'Isaac Asimov'),
(3, '“Never memorize something that you can look up.”', 'Albert Einstein'),
(4, '“Science without religion is lame, religion without science is blind.”', 'Albert Einstein'),
(5, '“One, remember to look up at the stars and not down at your feet. Two, never give up work. Work gives you meaning and purpose and life is empty without it. Three, if you are lucky enough to find love, remember it is there and don\'t throw it away.”', 'Stephen Hawking'),
(6, '“If we knew what it was we were doing, it would not be called research, would it?”', 'Albert Einstein'),
(7, '“Somewhere, something incredible is waiting to be known.”', 'Carl Sagan'),
(8, '\"The important thing is not to stop questioning. Curiosity has its own reason for existence. One cannot help but be in awe when he contemplates the mysteries of eternity, of life, of the marvelous structure of reality. It is enough if one tries merely to comprehend a little of this mystery each day.\"', 'Albert Einstein'),
(9, '“The fact that we live at the bottom of a deep gravity well, on the surface of a gas covered planet going around a nuclear fireball 90 million miles away and think this to be normal is obviously some indication of how skewed our perspective tends to be.”', 'Douglas Adams'),
(10, '“The most beautiful experience we can have is the mysterious. It is the fundamental emotion that stands at the cradle of true art and true science.”', 'Albert Einstein'),
(11, '“We are just an advanced breed of monkeys on a minor planet of a very average star. But we can understand the Universe. That makes us something very special.”', 'Stephen Hawking'),
(12, '“An expert is a person who has made all the mistakes that can be made in a very narrow field.”', 'Niels Bohr'),
(13, '“I\'m sure the universe is full of intelligent life. It\'s just been too intelligent to come here.”', 'Arthur C. Clarke'),
(14, '“Science and religion are not at odds. Science is simply too young to understand.”', 'Dan Brown'),
(15, '“In the beginning there was nothing, which exploded.”', 'Terry Pratchett'),
(16, '“That which can be asserted without evidence, can be dismissed without evidence.”', 'Christopher Hitchens'),
(17, '“Everything must be made as simple as possible. But not simpler.”', 'Albert Einstein'),
(18, '“A man who dares to waste one hour of time has not discovered the value of life.”', 'Charles Darwin'),
(19, '“The good thing about science is that it\'s true whether or not you believe in it.”', 'Neil deGrasse Tyson'),
(20, '“Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.”', 'Marie Curie'),
(21, '“For me, I am driven by two main philosophies: know more today about the world than I knew yesterday and lessen the suffering of others. You\'d be surprised how far that gets you.”', 'Neil deGrasse Tyson'),
(22, '“Your assumptions are your windows on the world. Scrub them off every once in a while, or the light won\'t come in.”', 'Isaac Asimov'),
(23, '“Space is big. You just won\'t believe how vastly, hugely, mind-bogglingly big it is. I mean, you may think it\'s a long way down the road to the chemist\'s, but that\'s just peanuts to space.”', 'Douglas Adams'),
(24, '“If I have seen further it is by standing on the shoulders of Giants.”', 'Isaac Newton'),
(25, '“If you wish to make an apple pie from scratch, you must first invent the universe.”', 'Carl Sagan'),
(26, '“A thinker sees his own actions as experiments and questions--as attempts to find out something. Success and failure are for him answers above all.”', 'Friedrich Nietzsche'),
(27, '“It would be possible to describe everything scientifically, but it would make no sense; it would be without meaning, as if you described a Beethoven symphony as a variation of wave pressure.”', 'Albert Einstein'),
(28, '“Life would be tragic if it weren\'t funny.”', 'Stephen Hawking'),
(29, '“We are going to die, and that makes us the lucky ones. Most people are never going to die because they are never going to be born. The potential people who could have been here in my place but who will in fact never see the light of day outnumber the sand grains of Arabia. Certainly those unborn ghosts include greater poets than Keats, scientists greater than Newton. We know this because the set of possible people allowed by our DNA so massively exceeds the set of actual people. In the teeth of these stupefying odds it is you and I, in our ordinariness, that are here.We privileged few, who won the lottery of birth against all odds, how dare we whine at our inevitable return to that prior state from which the vast majority have never stirred?”', 'Richard Dawkins'),
(30, '“Any sufficiently advanced technology is indistinguishable from magic.”', 'Arthur C. Clarke'),
(31, '“For me, it is far better to grasp the Universe as it really is than to persist in delusion, however satisfying and reassuring.”', 'Carl Sagan'),
(32, '“You never change things by fighting the existing reality.\r\nTo change something, build a new model that makes the existing model obsolete.”', 'Buckminster Fuller'),
(33, '“Extraordinary claims require extraordinary evidence.”', 'Carl Sagan'),
(34, '“Who is more humble? The scientist who looks at the universe with an open mind and accepts whatever the universe has to teach us, or somebody who says everything in this book must be considered the literal truth and never mind the fallibility of all the human beings involved?”', 'Carl Sagan'),
(35, '“In my opinion, we don\'t devote nearly enough scientific research to finding a cure for jerks.”', 'Bill Watterson'),
(36, '“Do you know what we call opinion in the absence of evidence? We call it prejudice.”', 'Michael Crichton'),
(37, '“If you try and take a cat apart to see how it works, the first thing you have on your hands is a non-working cat.”', 'Douglas Adams'),
(38, '“We are an impossibility in an impossible universe.”', 'Ray Bradbury'),
(39, '“In science it often happens that scientists say, \'You know that\'s a really good argument; my position is mistaken,\' and then they would actually change their minds and you never hear that old view from them again. They really do it. It doesn\'t happen as often as it should, because scientists are human and change is sometimes painful. But it happens every day. I cannot recall the last time something like that happened in politics or religion.”', 'Carl Sagan'),
(40, '“Wisdom is not a product of schooling but of the lifelong attempt to acquire it.”', 'Albert Einstein'),
(41, '“Beware the irrational, however seductive. Shun the \'transcendent\' and all who invite you to subordinate or annihilate yourself. Distrust compassion; prefer dignity for yourself and others. Don\'t be afraid to be thought arrogant or selfish. Picture all experts as if they were mammals. Never be a spectator of unfairness or stupidity. Seek out argument and disputation for their own sake; the grave will supply plenty of time for silence. Suspect your own motives, and all excuses. Do not live for others any more than you would expect others to live for you.”', 'Christopher Hitchens'),
(42, '“God does not play dice with the universe.”', 'Albert Einstein'),
(43, '“Science investigates; religion interprets. Science gives man knowledge, which is power; religion gives man wisdom, which is control. Science deals mainly with facts; religion deals mainly with values. The two are not rivals.”', 'Martin Luther King, Jr'),
(44, '“For, after all, how do we know that two and two make four? Or that the force of gravity works? Or that the past is unchangeable? If both the past and the external world exist only in the mind, and if the mind itself is controllable – what then?”', 'George Orwell'),
(45, '“The most incomprehensible thing about the world is that it is at all comprehensible.”', 'Albert Einstein'),
(46, '“I suppose it is tempting, if the only tool you have is a hammer, to treat everything as if it were a nail.”', 'Abraham Maslow'),
(47, '“Reading, after a certain age, diverts the mind too much from its creative pursuits. Any man who reads too much and uses his own brain too little falls into lazy habits of thinking.”', 'Albert Einstein'),
(48, '“I do not feel obliged to believe that the same God who has endowed us with sense, reason, and intellect has intended us to forgo their use.”', 'Galileo Galilei'),
(49, '“We are stuck with technology when what we really want is just stuff that works.”', 'Douglas Adams'),
(50, '“I am an atheist, out and out. It took me a long time to say it. I\'ve been an atheist for years and years, but somehow I felt it was intellectually unrespectable to say one was an atheist, because it assumed knowledge that one didn\'t have. Somehow, it was better to say one was a humanist or an agnostic. I finally decided that I\'m a creature of emotion as well as of reason. Emotionally, I am an atheist. I don\'t have the evidence to prove that God doesn\'t exist, but I so strongly suspect he doesn\'t that I don\'t want to waste my time.”', 'Isaac Asimov'),
(51, '“Student: Dr. Einstein, Aren\'t these the same questions as last year\'s [physics] final exam?\r\n\r\nDr. Einstein: Yes; But this year the answers are different.”', 'Albert Einstein'),
(52, '“I like the scientific spirit—the holding off, the being sure but not too sure, the willingness to surrender ideas when the evidence is against them: this is ultimately fine—it always keeps the way beyond open—always gives life, thought, affection, the whole man, a chance to try over again after a mistake—after a wrong guess.”', 'Walt Whitman'),
(53, '“I learned very early the difference between knowing the name of something and knowing something.”', 'Richard P. Feynman'),
(54, '“Every atom in your body came from a star that exploded. And, the atoms in your left hand probably came from a different star than your right hand. It really is the most poetic thing I know about physics: You are all stardust. You couldn’t be here if stars hadn’t exploded, because the elements - the carbon, nitrogen, oxygen, iron, all the things that matter for evolution and for life - weren’t created at the beginning of time. They were created in the nuclear furnaces of stars, and the only way for them to get into your body is if those stars were kind enough to explode. So, forget Jesus. The stars died so that you could be here today.”', 'Lawrence M. Krauss'),
(55, '“Even if there is only one possible unified theory, it is just a set of rules and equations. What is it that breathes fire into the equations and makes a universe for them to describe? The usual approach of science of constructing a mathematical model cannot answer the questions of why there should be a universe for the model to describe. Why does the universe go to all the bother of existing?”', 'Stephen Hawking'),
(56, '“The first principle is that you must not fool yourself and you are the easiest person to fool.”', 'Richard P. Feynman'),
(57, '“We can judge our progress by the courage of our questions and the depth of our answers, our willingness to embrace what is true rather than what feels good.”', 'Carl Sagan'),
(58, '“From the standpoint of daily life, however, there is one thing we do know: that we are here for the sake of each other - above all for those upon whose smile and well-being our own happiness depends, and also for the countless unknown souls with whose fate we are connected by a bond of sympathy. Many times a day I realize how much my own outer and inner life is built upon the labors of my fellow men, both living and dead, and how earnestly I must exert myself in order to give in return as much as I have received.”', 'Albert Einstein'),
(59, '“You will be required to do wrong no matter where you go. It is the basic condition of life, to be required to violate your own identity. At some time, every creature which lives must do so. It is the ultimate shadow, the defeat of creation; this is the curse at work, the curse that feeds on all life. Everywhere in the universe.”', 'Philip K. Dick'),
(60, '“For millions of years, mankind lived just like the animals. Then something happened which unleashed the power of our imagination. We learned to talk and we learned to listen. Speech has allowed the communication of ideas, enabling human beings to work together to build the impossible. Mankind\'s greatest achievements have come about by talking, and its greatest failures by not talking. It doesn\'t have to be like this. Our greatest hopes could become reality in the future. With the technology at our disposal, the possibilities are unbounded. All we need to do is make sure we keep talking.”', 'Stephen Hawking'),
(61, '“Scientists have calculated that the chances of something so patently absurd actually existing are millions to one.\r\nBut magicians have calculated that million-to-one chances crop up nine times out of ten.”', 'Terry Pratchett, Mort'),
(62, '“The scientist is not a person who gives the right answers, he\'s one who asks the right questions.”', 'Claude Levi-Strauss'),
(63, '“Ignorance more frequently begets confidence than does knowledge: it is those who know little, not those who know much, who so positively assert that this or that problem will never be solved by science.”', 'Charles Darwin'),
(64, '“Science is organized knowledge. Wisdom is organized life.”', 'Will Durant'),
(65, '“The day science begins to study non-physical phenomena, it will make more progress in one decade than in all the previous centuries of its existence.”', 'Nikola Tesla'),
(66, '“I don\'t want to believe. I want to know.”', 'Carl Sagan'),
(67, '“I\'m a pessimist because of intelligence, but an optimist because of will.”', 'Antonio Gramsci'),
(68, '“The opposite of a correct statement is a false statement. But the opposite of a profound truth may well be another profound truth.”', 'Niels Bohr'),
(69, '“I do not know what I may appear to the world, but to myself I seem to have been only like a boy playing on the sea-shore, and diverting myself in now and then finding a smoother pebble or a prettier shell than ordinary, whilst the great ocean of truth lay all undiscovered before me.”', 'Isaac Newton'),
(70, '“Science, my lad, is made up of mistakes, but they are mistakes which it is useful to make, because they lead little by little to the truth.”', 'Jules Verne'),
(71, '“We are a way for the cosmos to know itself.”', 'Carl Sagan'),
(72, '“The most merciful thing in the world, I think, is the inability of the human mind to correlate all its contents... some day the piecing together of dissociated knowledge will open up such terrifying vistas of reality, and of our frightful position therein, that we shall either go mad from the revelation or flee from the light into the peace and safety of a new Dark Age.”', 'H.P. Lovecraft'),
(73, '“A reliable way to make people believe in falsehoods is frequent repetition, because familiarity is not easily distinguished from truth. Authoritarian institutions and marketers have always known this fact.”', 'Daniel Kahneman,'),
(74, '“Thus, from the war of nature, from famine and death, the most exalted object which we are capable of conceiving, namely, the production of the higher animals, directly follows. There is grandeur in this view of life, with its several powers, having been originally breathed into a few forms or into one; and that, whilst this planet has gone cycling on according to the fixed law of gravity, from so simple a beginning endless forms most beautiful and most wonderful have been, and are being, evolved.”', 'Charles Darwin'),
(75, '“Faith is universal. Our specific methods for understanding it are arbitrary. Some of us pray to Jesus, some of us go to Mecca, some of us study subatomic particles. In the end we are all just searching for truth, that which is greater than ourselves.”', 'Dan Brown'),
(76, '“It is absurd for the Evolutionist to complain that it is unthinkable for an admittedly unthinkable God to make everything out of nothing, and then pretend that it is more thinkable that nothing should turn itself into everything.”', 'G.K. Chesterton'),
(77, '“The most beautiful thing we can experience is the mysterious. It is the source of all true art and all science. He to whom this emotion is a stranger, who can no longer pause to wonder and stand rapt in awe, is as good as dead: his eyes are closed.”', 'Albert Einstein'),
(78, '“The time will come when diligent research over long periods will bring to light things which now lie hidden. A single lifetime, even though entirely devoted to the sky, would not be enough for the investigation of so vast a subject... And so this knowledge will be unfolded only through long successive ages. There will come a time when our descendants will be amazed that we did not know things that are so plain to them... Many discoveries are reserved for ages still to come, when memory of us will have been effaced.”', 'Seneca'),
(79, '“First we thought the PC was a calculator. Then we found out how to turn numbers into letters with ASCII — and we thought it was a typewriter. Then we discovered graphics, and we thought it was a television. With the World Wide Web, we\'ve realized it\'s a brochure.”', 'Douglas Adams'),
(80, '“Science is what we understand well enough to explain to a computer; art is everything else.”', 'Donald E. Knuth'),
(81, '“What a computer is to me is the most remarkable tool that we have ever come up with. It\'s the equivalent of a bicycle for our minds.”', 'Steve Jobs'),
(82, '“The most important thing about a technology is how it changes people.”', 'Jaron Lanier'),
(83, '“Religion is a culture of faith; science is a culture of doubt.”', 'Richard P. Feynman'),
(84, '“I believe the simplest explanation is, there is no God. No one created the universe and no one directs our fate. This leads me to a profound realization that there probably is no heaven and no afterlife either. We have this one life to appreciate the grand design of the universe and for that, I am extremely grateful.”', 'Stephen Hawking'),
(85, '“It is impossible to escape the impression that people commonly use false standards of measurement — that they seek power, success and wealth for themselves and admire them in others, and that they underestimate what is of true value in life.”', 'Sigmund Freud'),
(86, '“One thing I have learned in a long life: that all our science, measured against reality, is primitive and childlike -- and yet it is the most precious thing we have.”', 'Albert Einstein'),
(87, '“Isn’t that what it means to be a scientist? To push the boundaries of the unknown? To bravely, actively explore the enormity of our universe ?”', 'Robyn Mundell'),
(88, '“The beauty of a living thing is not the atoms that go into it, but the way those atoms are put together.”', 'Carl Sagan'),
(89, '“[In the Universe it may be that] Primitive life is very common and intelligent life is fairly rare. Some would say it has yet to occur on Earth.”', 'Stephen Hawking'),
(90, '“I would rather have questions that can\'t be answered than answers that can\'t be questioned.”', 'Richard Feynman'),
(91, '“Technological progress has merely provided us with more efficient means for going backwards.”', 'Aldous Huxley'),
(92, '“The real problem of humanity is the following: We have Paleolithic emotions, medieval institutions and godlike technology. And it is terrifically dangerous, and it is now approaching a point of crisis overall.”', 'Edward O. Wilson'),
(93, '“It seems to me, Golan, that the advance of civilization is nothing but an exercise in the limiting of privacy.”', 'Isaac Asimov'),
(94, '“Science and technology multiply around us. To an increasing extent they dictate the languages in which we speak and think. Either we use those languages, or we remain mute.”', 'J.G. Ballard'),
(95, '“Nature never appeals to intelligence until habit and instinct are useless. There is no intelligence where there is no need of change.”', 'H.G. Wells'),
(96, '“I consider it an extremely dangerous doctrine, because the more likely we are to assume that the solution comes from the outside, the less likely we are to solve our problems ourselves.”', 'Carl Sagan'),
(97, '“To invent, you need a good imagination and a pile of junk.”', 'Thomas A. Edison'),
(98, '“We know very little, and yet it is astonishing that we know so much, and still more astonishing that so little knowledge can give us so much power.”', 'Bertrand Russell'),
(99, '“No, our science is no illusion. But an illusion it would be to suppose that what science cannot give us we can get elsewhere.”', 'Sigmund Freud'),
(100, '“Not only is the Universe stranger than we think, it is stranger than we can think.”', 'Werner Heisenberg'),
(101, '“The advancement of science and the diffusion of information [is] the best aliment to true liberty.”', 'James Madison'),
(102, '“There’s as many atoms in a single molecule of your DNA as there are stars in the typical galaxy. We are, each of us, a little universe.”', 'Neil deGrasse Tyson'),
(103, '“We are trying to prove ourselves wrong as quickly as possible, because only in that way can we find progress.”', 'Richard P. Feynman'),
(104, '“In questions of science, the authority of a thousand is not worth the humble reasoning of a single individual.”', 'Galileo Galilei'),
(105, '“If you thought that science was certain - well, that is just an error on your part.”', 'Richard P. Feynman'),
(106, '“There are in fact two things, science and opinion; the former begets knowledge, the latter ignorance.”', 'Hippocrates'),
(107, '“Science is a way of thinking much more than it is a body of knowledge.”', 'Carl Sagan'),
(108, '“Gravity explains the motions of the planets, but it cannot explain who sets the planets in motion.”', 'Isaac Newton'),
(109, '“If time travel is possible, where are the tourists from the future?”', 'Stephen Hawking'),
(110, '“It is harder to crack prejudice than an atom.”', 'Albert Einstein'),
(111, '“A process cannot be understood by stopping it. Understanding must move with the flow of the process, must join it and flow with it.”', 'Frank Herbert, Dune'),
(112, '“Magic\'s just science that we don\'t understand yet.”', 'Arthur C. Clarke'),
(113, '“To surrender to ignorance and call it God has always been premature, and it remains premature today.”', 'Isaac Asimov'),
(114, '“Extinction is the rule. Survival is the exception.”', 'Carl Sagan'),
(115, '“There is a fundamental difference between religion, which is based on authority, and science, which is based on observation and reason. Science will win because it works.”', 'Stephen Hawking'),
(116, '“It is a curious situation that the sea, from which life first arose should now be threatened by the activities of one form of that life. But the sea, though changed in a sinister way, will continue to exist; the threat is rather to life itself.”', 'Rachel Carson'),
(117, '“Life is funny that way. Sometimes the dumbest thing you do turns out to be the smartest.”', 'Robyn Mundell'),
(118, '“When my information changes, I alter my conclusions. What do you do, sir?”', 'John Maynard Keynes'),
(119, '“Science is the great antidote to the poison of enthusiasm and superstition.”', 'Adam Smith'),
(120, '“God is an ever-receding pocket of﻿ scientific ignorance.”', 'Neil DeGrasse Tyson');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `AdminEmailId` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '$2y$12$i4LMfeFPQpGSNPTaccIkKuwxAkJ4PhBr3JND7FpXwWFjRvchQn17C', 'dbwproject_news@gmail.com', 1, '2021-03-25 15:27:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(1, 'Bioinformatics', 'News related to the Bioinformatic field', '2021-03-25 15:33:15', NULL, 1),
(2, 'Biology', 'News related to the Biology field', '2021-03-25 15:33:47', NULL, 1),
(3, 'Chemistry', 'News related to the Chemistry field', '2021-03-25 15:34:14', NULL, 1),
(4, 'Physics', 'News related to the physics field', '2021-03-25 15:34:33', NULL, 1),
(5, 'Natural environment', 'News related to the enviromnent', '2021-03-25 15:35:01', NULL, 1),
(6, 'COVID-19', 'News related to Covid-19', '2021-03-29 15:01:54', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` char(11) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `name` varchar(120) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `comment` mediumtext CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) NOT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'Science News Portal', '\r\nWe are a group of students from master in bioinformatics at UPF. This website is related to a project that we have to perform in DBW. We believe that is very important to share information between the scientific community. For that reason, we have created this webpage, that is inside a social scientific website, that would allow you to know the latest news in different science fields. We hope that this could be useful! If you have any doubt, please go to the contact-us site and don\'t hesitate to send us an e-mail. \r\n\r\n', '2021-03-25 17:53:41', NULL),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Institution :&nbsp; </b> Universitat Pompeu Fabra </p><p><b>Adress : </b> Carrer del Dr. Aiguader, 80, Barcelona</p><p><b>Postal code : </b> 08003 </p><p><b>Email -id : </b>sciencenews@gmail.com</p><p><br></p>', '2021-03-26 15:24:48', '2021-03-29 10:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `PostImage` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(7, 'Antarctic seafloor exposed after 50 years of ice cover', 5, 12, '<p><br></p><div data-component=\"text-block\" class=\"ssrcss-uf6wea-RichTextComponentWrapper e1xue1i83\"><div class=\"ssrcss-3z08n3-RichTextContainer e5tfeyi2\"><p><b class=\"ssrcss-14iz86j-BoldText e5tfeyi0\"><b class=\"ssrcss-14iz86j-BoldText e5tfeyi0\">Life gets busy wherever it can, even under thick ice cover in Antarctica.</b></b></p></div></div><p><br></p><div data-component=\"text-block\" class=\"ssrcss-uf6wea-RichTextComponentWrapper e1xue1i83\"><div class=\"ssrcss-3z08n3-RichTextContainer e5tfeyi2\"><p>German\r\n scientists have inspected an area of seafloor newly exposed by the \r\ncalving of mega-iceberg A74 and found it to be teeming with animals. Video cameras tracked abundant filter-feeders thriving among the soft muds. It\r\n was a remarkable opportunity for the team as their ship, RV Polarstern,\r\n threaded the still narrow gap that exists between A74 and the Brunt Ice\r\n Shelf, which produced the giant berg. </p><p>https://www.bbc.com/news/science-environment-56424338<br></p></div></div>', '2021-03-26 15:40:12', '2021-03-26 15:42:57', 1, 'Antarctic-seafloor-exposed-after-50-years-of-ice-cover', '6966ce5f4ef395661bf44d7ea3db533e.jpg'),
(8, 'The ‘USS Jellyfish’ emits strange radio waves from a distant galaxy cluster', 4, 11, '<p>Something’s fishy in the southern constellation Phoenix.</p><p>Strange radio emissions from a distant galaxy cluster take the shape \r\nof a gigantic jellyfish, complete with head and tentacles. Moreover, the\r\n cosmic jellyfish emits <a href=\"https://iopscience.iop.org/article/10.3847/1538-4357/abe384\">only the lowest radio frequencies</a>\r\n and can’t be detected at higher frequencies. The unusual shape and \r\nradio spectrum tell a tale of intergalactic gas washing over galaxies \r\nand gently revving up electrons spewed out by gargantuan black holes \r\nlong ago, researchers report in the March 10 <em>Astrophysical Journal</em>.</p><p>Spanning 1.2 million light-years, the strange entity lies in Abell \r\n2877, a cluster of galaxies 340 million light-years from Earth. \r\nResearchers have dubbed the object the USS Jellyfish, because of its \r\nultra-steep spectrum, or USS, from low to high radio frequencies.</p><p>“This is a source which is invisible to most of the radio telescopes \r\nthat we have been using for the last 40 years,” says Melanie \r\nJohnston-Hollitt, an astrophysicist at Curtin University in Perth, \r\nAustralia. “It holds the record for dropping off the fastest” with \r\nincreasing radio frequency.</p><p>Johnston-Hollitt’s colleague Torrance Hodgson, a graduate student at \r\nCurtin, discovered the USS Jellyfish while analyzing data from the \r\nMurchison Widefield Array, a complex of radio telescopes in Australia \r\nthat detect low-frequency radio waves. These radio waves are more than a\r\n meter long and correspond to photons, particles of light, with the \r\nlowest energies. Remarkably, the USS Jellyfish is about 30 times \r\nbrighter at 87.5 megahertz — a frequency similar to that of an FM radio \r\nstation — than at 185.5 MHz.</p><p>https://www.sciencenews.org/article/uss-jellyfish-galaxy-cluster-strange-radio-waves<br></p><p><br></p>', '2021-03-26 15:53:13', NULL, 1, 'The-‘USS-Jellyfish’-emits-strange-radio-waves-from-a-distant-galaxy-cluster', 'b678bb17e8d4940134f5f81ad95b67bf.jpg'),
(9, 'Betelgeuse went dark, but didn’t go supernova. What happened?', 4, 11, '<p>Astrophysicist Miguel Montargès has a clear memory of the moment the \r\nstars became real places to him. He was 7 or 8 years old, looking up \r\nfrom the garden of his parents’ apartment in the south of France. A \r\nhuge, red star winked in the night. The young space fan connected the \r\nstar to a map he had studied in an astronomy magazine and realized he \r\nknew its name: Betelgeuse.</p><p>\r\n\r\n\r\n\r\nSomething shifted for him. That star was no longer an anonymous speck\r\n floating in a vast uncharted sea. It was a destination, with a name.</p><p>\r\n\r\n\r\n\r\n“I thought, wow, for the first time … I can name a star,” he says. The realization was life-changing.</p><p>\r\n\r\n\r\n\r\nSince then, Montargès, now at the Paris Observatory, has written his \r\nPh.D. thesis and about a dozen papers about Betelgeuse. He considers the\r\n star an old friend, observing it many times a year, for work and for \r\nfun. He says good-bye every May when the star slips behind the sun from \r\nthe perspective of Earth, and says hello again in August when the star \r\ncomes back.</p><p>So in late 2019, when the bright star suddenly dimmed for no apparent\r\n reason, Montargès was a little alarmed. Some people speculated that \r\nBetelgeuse was about to explode in a brilliant supernova that would \r\noutshine the full moon. Astronomers know the star is old and its days \r\nare numbered, but Montargès wasn’t ready to see it go.</p><p>\r\n\r\n\r\n\r\n“It’s my favorite star,” he says. “I don’t want it to die.”</p><p>\r\n\r\n\r\n\r\nOther researchers, though, were eager to watch Betelgeuse explode in real time. Supernovas mark the <a href=\"https://www.sciencenews.org/article/supernova-star-death-giant-lasers-explosive-mysterious-physics\">violent deaths of stars</a> that are at least eight times as massive as the sun (<em>SN: 11/7/20, p. 20</em>). But astronomers still don’t know what would signal that one is about to blow. The outbursts <a href=\"https://www.sciencenews.org/article/when-nearby-star-goes-supernova-scientists-will-be-ready\">sprinkle interstellar space with elements</a> that ultimately form the bulk of planets and people — carbon, oxygen, iron (<em>SN: 2/18/17, p. 24</em>). So the question of how supernovas occur is a question of our own origins.</p><br><p>\r\n\r\n\r\n\r\nBut the explosions are rare — astronomers estimate that one occurs in\r\n our galaxy just a few times a century. The last one spotted nearby, <a href=\"https://www.sciencenews.org/article/30-year-anniversary-supernova-1987a\">SN 1987A</a>, was more than 33 years ago in a neighboring galaxy (<em>SN: 2/18/17, p. 20</em>).\r\n Betelgeuse is just one of the many aging, massive stars — called red \r\nsupergiants — that could go supernova at any moment. But as one of the \r\nclosest and brightest, Betelgeuse is the one that space enthusiasts know\r\n best.</p><p>\r\n\r\n\r\n\r\nSo when the star started acting strangely at the end of last year, \r\nMontargès and a small band of Betelgeuse diehards aimed every telescope \r\nthey could at the dimming giant. Over the following months, the star \r\nreturned to its usual brightness, and the excitement over an imminent \r\nsupernova faded. But the flurry of data collected in the rush to figure \r\nout what was happening might help answer a different long-standing \r\nquestion: How do massive, old stars send their planet-building star \r\nstuff into the cosmos even before they explode</p><p><br></p><p>https://www.sciencenews.org/article/betelgeuse-star-dim-supernova-death-what-happened<br></p>', '2021-03-26 15:55:07', NULL, 1, 'Betelgeuse-went-dark,-but-didn’t-go-supernova.-What-happened?', '6564205d0676c34e7cd0a5f61b5735f6.jpg'),
(19, 'AstraZeneca’s COVID-19 vaccine holds up in an updated analysis of trial data', 6, 13, '<p>Analysis of the latest data from a clinical trial for a coronavirus \r\nvaccine developed by AstraZeneca and the University of Oxford shows the \r\nshot is still effective at preventing COVID-19 symptoms, the \r\npharmaceutical company reported March 25.</p><p>\r\n\r\n\r\n\r\nThe news comes after the U.S. National Institutes of Allergy and Infectious Diseases aired concerns that AstraZeneca <a href=\"https://www.sciencenews.org/article/coronavirus-covid-astrazeneca-vaccine-effective-us-trial-results\">may have included outdated information </a>in an interim analysis of the trial (<em>SN: 2/22/21</em>).\r\n That interim analysis, announced on March 22, found the vaccine was 79 \r\npercent effective. The efficacy was based on 141 cases of COVID-19 among\r\n the trial’s 32,449 participants, but the cases were recorded only \r\nthrough February 17.</p><p>Since that date, more people in the trial tested positive for the coronavirus. The latest analysis <a href=\"https://www.astrazeneca.com/content/astraz/media-centre/press-releases/2021/azd1222-us-phase-iii-primary-analysis-confirms-safety-and-efficacy.html\">included an additional 49 cases</a>,\r\n bringing the total to 190, AstraZeneca said in a March 25 statement. \r\nTaking the new data into account, the vaccine now has an efficacy of 76 \r\npercent — only three percentage points lower than in the interim report.\r\n There are an additional 14 possible COVID-19 cases in the trial that \r\nresearchers still need to confirm, AstraZeneca said in its statement. \r\nThe company has not specified how many cases were in people who got the \r\nvaccine or in those who got a placebo.</p><p>\r\n\r\n\r\n\r\n\r\n\r\nThe slight decrease in efficacy <a href=\"https://www.sciencemediacentre.org/expert-reaction-to-press-release-from-astrazeneca-announcing-primary-data-on-safety-and-efficacy-from-the-us-trial-of-the-oxford-astrazeneca-covid-19-vaccine/\">is not unexpected</a>,\r\n Stephen Evans, a vaccine expert at the London School of Hygiene and \r\nTropical Medicine said in a statement released by the Science Media \r\nCentre. As more participants in the trial catch the coronavirus and \r\ndevelop symptoms, overall efficacy can fluctuate.</p><p>\r\n\r\n\r\n\r\nIn fact, the vaccine’s efficacy for trial participants aged 65 and \r\nolder actually got better with the new analysis. While the interim \r\nanalysis reported an efficacy of 80 percent in that age group, the more \r\nrecent results push it higher to 85 percent.</p><p>\r\n\r\n\r\n\r\nIt’s unclear whether the results from both analyses are statistically\r\n different from one another. It’s possible that the reported efficacies \r\nin the groups fall within a similar margin of error, so the differences \r\nmay mean little in the real world.</p><p><br></p><div class=\"single__byline-container___3EW6e\">\r\n			<div class=\"single__byline-wrapper___pSAjm\">\r\n				\r\n<div class=\"byline__wrapper___4FOTC\">\r\n	<div class=\"byline-inner\">\r\n		<p class=\"byline__authors___2KZu0\" align=\"right\">By <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/erin-garcia-de-jesus\">Erin Garcia de Jesús</a></span></p>\r\n					<p class=\"byline__published___3GjAo\" align=\"right\"><time class=\"date entry-date byline__published___3GjAo\" datetime=\"2021-03-25T12:58:35-04:00\">March 25, 2021 at 12:58 pm</time></p>\r\n			</div>\r\n	</div>\r\n			</div>\r\n		</div><p><br></p><p><br></p>', '2021-03-29 15:06:15', NULL, 1, 'AstraZeneca’s-COVID-19-vaccine-holds-up-in-an-updated-analysis-of-trial-data', '231a2cc7805862b26e56bddf28efebfc.jpg'),
(20, 'New drugs that block a brain chemical are game changers for some migraine sufferers', 2, 3, '<p align=\"justify\">Hayley Gudgin of Sammamish, Wash., got her first migraine in 1991 when she was a 19-year-old nursing student.</p><p align=\"justify\">\r\n\r\n\r\n\r\n“I was convinced I was having a brain hemorrhage,” she says. “There \r\nwas no way anything could be that painful and not be really serious.”</p><p align=\"justify\">\r\n\r\n\r\n\r\nShe retreated to her bed and woke up feeling better the next day. But\r\n it wasn’t long until another migraine hit. And another. Taking a pill \r\nthat combines caffeine with the pain relievers acetaminophen and codeine\r\n made life manageable until she got pregnant and had to stop taking her \r\nmedication. After her son was born, the migraines came back. She started\r\n taking the drugs again, but they didn’t work and actually made her \r\nattacks worse.</p><p align=\"justify\">\r\n\r\n\r\n\r\nBy the time Gudgin gave birth to her second son in 1997, she was \r\nhaving about 15 attacks a month. Her symptoms worsened over time and \r\nincluded severe pain, nausea, sensitivity to light, swollen hands, \r\ndifficulty speaking, vomiting and diarrhea so intense she often wound up\r\n dehydrated in the emergency room.</p><p align=\"justify\">“It hit me [that] I had to do something when I was vomiting in the \r\ntoilet, and my 3-year-old came and pulled my hair back,” she says. “It \r\nwas no way to live — and not just because of the pain. You go to sleep \r\nevery night not knowing how you’re going to wake up. You make plans \r\nknowing you might have to cancel them.”</p><p align=\"justify\">\r\n\r\n\r\n\r\nA headache specialist prescribed several preventive medicines, but \r\neach caused side effects for Gudgin, including weight gain and kidney \r\nstones. Then, in 2018, Gudgin read about a new type of treatment for \r\nfrequent migraine sufferers. Her neurologist agreed it was worth a try. \r\nAfter much wrangling with her insurance company — the drug is costly, \r\nand she had to prove that two other drugs had failed to help her — she \r\ngot approval to take it.</p><p align=\"justify\">\r\n\r\n\r\n\r\nIn August 2018, Gudgin received her first monthly injection of \r\nerenumab, sold as Aimovig. By the end of September, she was down to one \r\nor two attacks a month. “And the migraines I do get are usually gone \r\nwithin six hours. I don’t have to go to the ER or lie in a dark room all\r\n day,” she says. “It’s just been life changing.”</p><p align=\"justify\">\r\n\r\n\r\n\r\nGudgin injects the drug into her leg once a month using a device \r\nsimilar to an EpiPen. Erenumab is one of four monoclonal antibodies, \r\nmanufactured proteins that can bind to substances in the body, that have\r\n been approved since 2018 by the U.S. Food and Drug Administration to \r\nprevent migraines. The antibodies inhibit the action of a \r\nneurotransmitter called calcitonin gene-related peptide, or CGRP, either\r\n by changing the peptide’s shape or attaching to its receptors in the \r\nbrain.</p><p align=\"justify\">The drugs have changed the game for some migraine sufferers. Roughly \r\nhalf of people who took one of the four drugs in clinical trials saw at \r\nleast a 50 percent reduction in monthly migraines, says neurologist \r\nDavid Dodick of the Mayo Clinic in Phoenix, who reported the findings at\r\n a Migraine Trust International Symposium in October. About a third of \r\npatients had a 75 percent drop in migraine days.</p><p align=\"justify\">\r\n\r\n\r\n\r\nThe CGRP-blockers appear to be an improvement over existing \r\npreventive treatments, which were developed for other disorders. The \r\nnewer drugs were designed specifically to target one of the mechanisms \r\nthat researchers think leads to the painful episodes.</p><p align=\"justify\">\r\n\r\n\r\n\r\nDoctors are embracing the new drugs because they can work better and \r\ngenerally have much fewer side effects than other options. “It’s really \r\nbeneficial for improving quality of life in our patients with migraines.\r\n [The new drugs] don’t cause weight gain, sleepiness, brain fog,” says \r\nneurologist Nina Riggins, a headache specialist at the University of \r\nCalifornia, San Francisco.</p><p align=\"justify\">\r\n\r\n\r\n\r\nAnd the options for blocking CGRP are expanding. Rimegepant, or \r\nNurtec, is one of several drugs known as gepants that bind to the CGRP \r\nreceptor. The drug, an oral tablet rather than a shot, was approved as a\r\n treatment for acute migraine in February 2020. When taken every other \r\nday, rimegepant appears to also <a href=\"https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(20)32544-7/fulltext#seccestitle190\">offer some benefit as a preventive</a>, as reported January 2 in the <em>Lancet</em>.</p><p align=\"justify\"><br></p><h4 align=\"justify\">Nothing typical</h4><p align=\"justify\">\r\n\r\n\r\n\r\nMigraine is the third most common disorder in the world, according to\r\n the World Health Organization. Migraines or severe headaches <a href=\"https://www.cdc.gov/mmwr/volumes/69/wr/mm6912a8.htm\">affect more than 15 percent of U.S. adults</a>,\r\n striking women twice as often as men, the U.S. Centers for Disease \r\nControl and Prevention reports. In all, more than 39 million Americans \r\nget migraine attacks, which can last four to 72 hours.</p><p align=\"center\"><img src=\"https://www.sciencenews.org/wp-content/uploads/2021/03/032721_migrane_inline-1_680_desktop.png\" alt=\"graph of U.S. adults reporting migraines or severe headaches in 2018\" class=\"wp-image-3097460\" style=\"width: 50%; float: none;\" width=\"680\" height=\"375\"></p><p align=\"justify\"><br></p><p>Along with the most common symptom — severe throbbing pain in the \r\nhead — patients can experience sensitivity to light, smells and sound; \r\ndizziness; vomiting; numbness; and visual disturbances such as blind \r\nspots and tunnel vision.</p><p>“Migraine is probably more than one disease,” says neurologist \r\nRichard Lipton of Albert Einstein College of Medicine in the Bronx, N.Y.\r\n “There are more than 40 identified genes that contribute to the risk of\r\n migraine. What that means is that there are multiple pathways that lead\r\n to migraine, and as a consequence of that, migraine is not a \r\none-size-fits-all condition.”</p><p>\r\n\r\n\r\n\r\nAlthough many genes have been identified as playing a role, \r\nresearchers have not pinpointed the exact mechanisms involved with \r\nmigraine. The long-held notion of blood vessel dilation being to blame \r\nhas even fallen out of favor, says Amaal Starling, a neurologist at the \r\nMayo Clinic in Scottsdale, Ariz.</p><p align=\"justify\">\r\n\r\n\r\n\r\n“We know pain is caused by … abnormal activity in multiple parts of \r\nthe brain, including the trigeminal nerve, trigeminal nucleus caudalis \r\nin the brain stem, and the pain networks,” Starling says. This leads to \r\nmigraine-related pain in the head, face and neck.Some theories suggest that migraine occurs — and a cascade starts — \r\nwhen nerve cells in the brain get overexcited and stimulate the \r\ntrigeminal nerve, which controls movement of the jaw muscle and \r\nsensations of touch, pain and temperature in the face. The trigger can \r\nbe hormonal changes, stress, food, smells, sounds, a visual stimulus or \r\nsome combination. The first step in the cascade releases CGRP in the \r\nbrain, which causes transmission of pain siThe pain signals trigger an additional release of CGRP and other \r\npeptides. These molecules tell the brain to increase the dilation of \r\nblood vessels, releasing toxic chemicals. This is why, at least for some\r\n people, CGRP may be a big part of the problem. <br></p><p align=\"right\"><br></p><div class=\"single__byline-container___3EW6e\" align=\"right\">\r\n			<div class=\"single__byline-wrapper___pSAjm\">\r\n				\r\n<div class=\"byline__wrapper___4FOTC\">\r\n	<div class=\"byline-inner\">\r\n		<p class=\"byline__authors___2KZu0\">By <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/karen-j-bannan\">Karen J. Bannan</a></span></p>\r\n					<p class=\"byline__published___3GjAo\"><time class=\"date entry-date byline__published___3GjAo\" datetime=\"2021-03-22T06:00:00-04:00\">March 22, 2021 at 6:00 am</time></p>\r\n			</div>\r\n	</div>\r\n			</div>\r\n		</div><p><br></p><p><br></p><p><br></p><p><br></p>', '2021-03-29 15:14:17', NULL, 1, 'New-drugs-that-block-a-brain-chemical-are-game-changers-for-some-migraine-sufferers', '8fe629a118b85338f5210ffb47d9fca0.jpg'),
(21, 'The COVID-19 pandemic is now a year old. What have scientists learned?', 6, 15, '<p>One year ago, the World Health Organization <a href=\"https://www.sciencenews.org/article/coronavirus-outbreak-who-pandemic\">declared that the novel coronavirus outbreak was a pandemic</a> (<em>SN: 3/11/20</em>).\r\n Little did we know the uncertainty, anxiety, frustration and loss that \r\nwas in store. It’s been a year that’s felt never-ending. It’s tested us \r\nall. It’s cost millions of lives, even as we’ve made remarkably rapid \r\nstrides in understanding this new foe and finding ways to fight it.</p><p>\r\n\r\n\r\n\r\nNow, as more and more people get vaccinated against COVID-19, there’s hope that the end of the pandemic is in sight.</p><p>\r\n\r\n\r\n\r\nWe asked five scientists who are among the many who have jumped in to\r\n tackle the coronavirus what has surprised them about the past year and \r\nwhat they’ve learned that could help us all as we enter the second year \r\nof the pandemic. Their answers have been edited for brevity and \r\nclarity.&nbsp;&nbsp;</p><h4>\r\n\r\n\r\n\r\nWhat has surprised you over the past year?</h4><p>\r\n\r\n\r\n\r\n\r\n\r\n<strong>Rajesh Gandhi</strong>, an infectious diseases physician at \r\nMassachusetts General Hospital and Harvard Medical School in Boston: \r\nWhat really hits home is that we were not prepared, despite concerns \r\nthat have been raised for many years that this was coming. We had to \r\nessentially prepare and implement our response to the pandemic during \r\nthe pandemic, as opposed to before.</p><p>\r\n\r\n\r\n\r\n<strong>Damir Huremovic</strong>, a psychiatrist with Northwell \r\nHealth in Manhasset, N.Y.: We constantly keep doing the wrong things; we\r\n can’t get our act together. That is probably because of some of the \r\nfeatures of this virus. It’s sitting on the border of very dangerous and\r\n not so dangerous. It’s playing tricks on our abilities to approximate \r\nrisk. </p><p>’m angry at myself for failing to foresee that the misinformation that we described in our book [<em><a href=\"https://www.springer.com/gp/book/9783030153458\">The Psychiatry of Pandemics</a></em>]\r\n in the chapter on immunizations is really not limited to vaccines. It’s\r\n more universal … So many people believe that this pandemic is all a \r\nhoax. As delusional as [that belief] may be from a psychiatric \r\nperspective, we still have to deal with it as a real issue. I wish I had\r\n become aware of this phenomenon much sooner.\r\n\r\n\r\n\r\n<br></p><p><strong>Maimuna Majumder, </strong>a computational epidemiologist at \r\nBoston’s Children’s Hospital and Harvard Medical who uses data from \r\nsearch trends, social media and local news to simulate the trajectory of\r\n outbreaks: There’s still plenty left to unearth about COVID-19, but I \r\nthink it’s fair to say that the speed of the research done to date – \r\nwith the goal of saving lives in mind – has been record-breaking.</p><p><strong>Kimberly Prather</strong>, an atmospheric chemist and aerosol\r\n scientist at the University of California, San Diego and Scripps \r\nInstitution of Oceanography who urged the World Health Organization and \r\nthe U.S. Centers for Disease Control and Prevention to say that <a href=\"https://www.sciencenews.org/article/covid-19-coronavirus-airborne-aerosol-transmission\">the coronavirus spreads through the air</a> (<em>SN: 7/7/20</em>):\r\n The pushback over acknowledging that this virus is in the air, is \r\nairborne … [from] public health agencies and others. I cannot believe \r\nthe resistance because all the evidence suggests that it’s there. … If \r\nwe acknowledge that it’s in the air, we can fix it. There’s so many \r\nfixable solutions to the problem. It’s killing me.</p><p><strong>Jonna Mazet</strong>, an epidemiologist and founding \r\nexecutive director of the UC Davis One Health Institute, which focuses \r\non the interplay between the health of animals, people and the \r\nenvironment: The politicizing of health and the resulting separation and\r\n divisions. That resulted in people making really different and \r\nsometimes risky choices for their own health. I did not anticipate that \r\nissue.</p><p>On the science side … the way scientists are raised in science is to \r\nbe successful, publish and be noticed. I think people rallied to the \r\ngreater global good and put that down and worked together across all \r\nkinds of boundaries. Geographic, disciplinary, and [across sectors] like\r\n academic, government, private sector — so that was a beautiful \r\nsurprise. We should all hope we can continue it.</p><p><br></p><div class=\"single__byline-container___3EW6e\">\r\n			<div class=\"single__byline-wrapper___pSAjm\">\r\n				\r\n<div class=\"byline__wrapper___4FOTC\">\r\n	<div class=\"byline-inner\">\r\n		<p class=\"byline__authors___2KZu0\" align=\"right\">By <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/erin-garcia-de-jesus\">Erin Garcia de Jesús</a></span>, <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/tina-hesman-saey\">Tina Hesman Saey</a></span>, <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/jonathan-lambert\">Jonathan Lambert</a></span>, <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/sujata-gupta\">Sujata Gupta</a></span> and <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/aimee-cunningham\">Aimee Cunningham</a></span></p>\r\n					<p class=\"byline__published___3GjAo\" align=\"right\"><time class=\"date entry-date byline__published___3GjAo\" datetime=\"2021-03-11T10:08:22-05:00\">March 11, 2021 at 10:08 am</time></p>\r\n			</div>\r\n	</div>\r\n			</div>\r\n		</div><p><br></p><p><br></p><p><br></p>', '2021-03-30 13:33:30', NULL, 1, 'The-COVID-19-pandemic-is-now-a-year-old.-What-have-scientists-learned?', '47b53c67597b4dfc2b328e5f0cef1bda.jpg'),
(22, 'The latest Ebola outbreak may have started with someone infected years ago', 2, 4, '<p>The ongoing Ebola outbreak in Guinea was most likely sparked by \r\nsomeone infected during the outbreak seven years ago, a new study shows.\r\n Viruses from both outbreaks are almost genetically identical, hinting \r\nthat the virus did not jump from an animal to people, as scientists \r\nexpected, but that it had lurked hidden in a human body for years.</p><p>“With this news, I was really, really shocked,” says Angela \r\nRasmussen, a virologist with Georgetown University in Washington, D.C.</p><p>\r\n\r\n\r\n\r\nPotential cases of Ebola began emerging in the West African nation in\r\n late January, and Guinean health officials declared an outbreak on \r\nFebruary 14 after <a href=\"https://www.who.int/csr/don/17-february-2021-ebola-gin/en/\">three people tested positive</a> for the virus. The region hadn’t seen an outbreak since the one in 2013<strong>–</strong>2016, which claimed over 11,000 lives. A <a href=\"https://www.who.int/csr/don/10-february-2021-ebola-drc/en/\">separate, unrelated outbreak in the Congo</a> was declared on February 7.</p><p>\r\n\r\n\r\n\r\nAs of March 6, <a href=\"https://www.africa-newsroom.com/press/africa-union-member-states-reporting-ebola-virus-disease-update-6-march-2021?lang=en\">29 cases and 13 deaths</a>\r\n had been reported in both countries, according to Africa Centres for \r\nDisease Control and Prevention. A genetic analysis found that four \r\nviruses from people infected in the Guinea outbreak were the close \r\nrelatives of viruses that had infected people in 2014, according to a <a href=\"https://virological.org/t/guinea-2021-ebov-genomes/651\">trio</a> of <a href=\"https://virological.org/t/guinea-2021-ebov-outbreak/643\">preliminary</a> <a href=\"https://virological.org/t/release-4-ebov-genomes-from-guinea-2021-outbreak/642\">reports</a>\r\n posted March 12 at virological.org. Only about a dozen mutations \r\nseparate these new cases from the 2014 cases. That’s far fewer than the \r\nmore than 100 mutations scientists expect would accumulate over that \r\nperiod if there were sustained transmission of the virus.</p><p><br></p><p>The lack of mutations suggests that the newest outbreak did not get \r\nits start when a bat virus jumped into humans and began spreading. \r\nRather, the most recent cases appear to be a resurgence of the same \r\nstrain that caused the 2013<strong>–</strong>2016 Ebola outbreak, carried by someone who was infected back then.</p><p>\r\n\r\n\r\n\r\nResearchers have known that Ebola virus can stick around in the body after recovery. Some cases in West Africa during the 2013<strong>–</strong>2016 outbreak stemmed from <a href=\"https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(18)30417-1/fulltext\">individuals who had been infected and had recovered months</a>, or even <a href=\"https://pubmed.ncbi.nlm.nih.gov/27585800/\">more than a year</a>,\r\n earlier. But the new findings show the most recent outbreak began after\r\n a five-year lull in cases and suggest that the virus wasn’t replicating\r\n during that time, meaning the virus may have gone dormant.</p><p>\r\n\r\n\r\n\r\nThe finding “suggests some sort of weird mechanism that hasn’t been \r\nseen before,” Rasmussen says, but doesn’t mean that Ebola outbreaks from\r\n dormant viruses in humans are going to be happening all the time. Right\r\n now, what might have happened is “a mystery. We’ll probably solve [the \r\nmechanism], but right now there’s just not very much known about it.”</p><p>\r\n\r\n\r\n\r\nOther recent research backs up the idea that Ebola can lie low in the body for years. Immune proteins that recognize the virus <a href=\"https://www.nature.com/articles/s41586-020-03146-y\">spiked in the blood in 39 out of 51 people</a> months after those people recovered, molecular virologist Georgios Pollakis and colleagues reported in the Feb. 18 <em>Nature</em>.\r\n Though the team could not find evidence in the blood that the virus was\r\n replicating, the roused immune response hints that the virus could be \r\nhiding somewhere in the body.</p><p>\r\n\r\n\r\n\r\n“We were quite surprised to see [that] data,” says Pollakis, of the University of Liverpool in England.</p><p>\r\n\r\n\r\n\r\nFor Pollakis, the new developments emphasize the need for continued \r\nsurveillance and research on diseases that aren’t top-of-mind. “The \r\nbiggest lesson is that public health needs serious investment,” Pollakis\r\n says. “We focus on what is [spreading] faster, on the biggest player. \r\nAnd then we leave the virus that doesn’t seem to be a burden for the \r\nmoment… now it comes back to haunt us.”&nbsp;</p><p>\r\n\r\n\r\n\r\nThough experts say transmission of the virus from people infected \r\nlong ago appears to be rare, the outbreak raises fears that Ebola \r\nsurvivors could face new stigmas.</p><p>\r\n\r\n\r\n\r\nHealth officials have sprung into action across the region to isolate\r\n potential contacts in the current outbreak and vaccinate them and their\r\n contacts, a strategy known as <a href=\"https://www.sciencenews.org/article/what-we-know-about-ebola-outbreak-congo-and-vaccine-help\">ring vaccination</a> (<em>SN: 5/18/18</em>). In Guinea, about 500 contacts have been identified, and over 1,600 people vaccinated as of March 5.</p><p>\r\n\r\n\r\n\r\nStill, public health officials may need to alter Ebola vaccination \r\nstrategies, Rasmussen says. While the current strategy is to control \r\noutbreaks with ring vaccination, “we need to think about maybe having a \r\nmass immunization campaign — not using vaccination as a control strategy\r\n but as a prevention strategy.” </p><p><br></p><div class=\"single__byline-container___3EW6e\">\r\n			<div class=\"single__byline-wrapper___pSAjm\">\r\n				\r\n<div class=\"byline__wrapper___4FOTC\">\r\n	<div class=\"byline-inner\">\r\n		<p class=\"byline__authors___2KZu0\" align=\"right\">By <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/erin-garcia-de-jesus\">Erin Garcia de Jesús</a></span> and <span class=\"byline author vcard\"><a class=\"byline-link url fn n\" href=\"https://www.sciencenews.org/author/jonathan-lambert\">Jonathan Lambert</a></span></p>\r\n					<p class=\"byline__published___3GjAo\" align=\"right\"><time class=\"date entry-date byline__published___3GjAo\" datetime=\"2021-03-12T18:00:45-05:00\">March 12, 2021 at 6:00 pm</time></p>\r\n			</div>\r\n	</div>\r\n			</div>\r\n		</div><p><br><br></p>', '2021-03-30 13:37:14', NULL, 1, 'The-latest-Ebola-outbreak-may-have-started-with-someone-infected-years-ago', 'ed6d4030d74a897312afb315810be558.jpg'),
(23, 'New SARS-CoV-2 genome variants identified in US mink', 1, 7, '<p align=\"justify\">Researchers in Canada have discovered two novel variants in severe \r\nacute respiratory syndrome coronavirus 2 (SARS-CoV-2) gene sequences \r\ncollected from mink in the United States. The SARS-CoV-2 virus is the agent responsible for the coronavirus \r\ndisease 2019 (COVID-19) pandemic that has now claimed the lives of more \r\nthan 2.78 million people globally.</p><p align=\"justify\">\r\n\r\nThe team identified a two-mutation (N501T-G142D) variant and a three-mutation (N501T-G142D-F486L) variant in the SARS-CoV-2 <a href=\"https://www.news-medical.net/health/What-are-Spike-Proteins.aspx\" class=\"linked-term\">spike protein</a> – the main structure the virus uses to bind to and infect cells. The receptor-binding domain (RBD) of the spike attaches to the host \r\ncell receptor angiotensin-converting enzyme 2 (ACE2) to enable viral \r\nfusion and cell entry.</p><p align=\"justify\">\r\n\r\nThe two variants were not found in mink-derived SARS-CoV-2 gene sequences collected in any other countries. Hugh Cai from the University of Guelph in Ontario and Allison Cai \r\nfrom the University of British Colombia say the findings suggest that \r\nthe variants evolved during human infection before they spread to mink \r\npopulations.</p><p align=\"justify\">\r\n\r\nThe team says it is vital to monitor the emerging new variants to determine their impact on human and animal healthA pre-print version of the research paper is available on the <em><a href=\"https://www.medrxiv.org/content/10.1101/2021.03.18.21253734v2\" rel=\"noopener\">medRxiv</a>*</em> server, while the article undergoes peer review.</p><p align=\"justify\">\r\n\r\n\r\n\r\n</p><p align=\"justify\">As of 17<sup>th</sup> March 2021, 22% of SARS-CoV-2 genomes within \r\nthe GISAID (Global Initiative on Sharing All Influenza Data) database \r\ncontained the N501Y mutation. This variant has been identified in the \r\nspike protein of the more transmissible and potentially more virulent \r\nlineages that recently emerged in the UK (B.1.1.7), South Africa \r\n(B.1.351), and Brazil (B.1.525).</p><p align=\"justify\">\r\n\r\n</p><p align=\"justify\">Since the first SARS-CoV-2 sequence was isolated from samples \r\ncollected in Wuhan, China, in December 2019, the virus has rapidly \r\nevolved spike protein mutations that have increased its transmissibility\r\n and virulence.</p><p align=\"justify\">\r\n\r\n</p><h2 align=\"justify\">The virus has rapidly evolved mutations in the spike protein</h2><p align=\"justify\"><a href=\"https://www.medrxiv.org/content/10.1101/2021.03.18.21253734v2\" rel=\"noopener\"><span itemprop=\"image\" itemscope=\"\" itemtype=\"https://schema.org/ImageObject\"></span></a>In Denmark, large numbers of mink were also found to be infected with\r\n SARS-CoV-2 containing the spike mutation Y453F, which triggered \r\nconcerns that this variant could be spread from animals to humans.</p><p align=\"justify\">As of 17<sup>th</sup> March 2021, 22% of SARS-CoV-2 genomes within \r\nthe GISAID (Global Initiative on Sharing All Influenza Data) database \r\ncontained the N501Y mutation. This variant has been identified in the \r\nspike protein of the more transmissible and potentially more virulent \r\nlineages that recently emerged in the UK (B.1.1.7), South Africa \r\n(B.1.351), and Brazil (B.1.525).</p><p align=\"justify\">\r\n\r\nIn Denmark, large numbers of mink were also found to be infected with\r\n SARS-CoV-2 containing the spike mutation Y453F, which triggered \r\nconcerns that this variant could be spread from animals to humans.</p><p align=\"justify\"><br></p><h2 align=\"justify\">What did the researchers do?</h2><p align=\"justify\">The researchers set out to determine the genetic characteristics of \r\nSARS-CoV-2 spike protein sequences collected from mink in the United \r\nStates and Canada.</p><p align=\"justify\">\r\n\r\nThe team analyzed all animal-derived SARS-CoV-2 sequences (977), all \r\nsequences collected in Canada (19,529), and all sequences collected in \r\nthe United States (173,277) that were deposited in GISAID between \r\nDecember 2019 and 12<sup>th</sup> March 2021.</p><p align=\"justify\">\r\n\r\nThe SARS-CoV-2 isolate Wuhan-Hu-1 collected on 19th December 2019 was used as a reference for mutation analysis. The “BLAST” function of the bioinformatics software “Geneious” was \r\nused to determine the incidence of any novel mutations locally and \r\nglobally.</p><p align=\"justify\"><br></p><h2 align=\"justify\">What did the analysis reveal?</h2><p align=\"justify\">\r\n\r\nNeither the N501Y mutation shared by the UK, South African, and \r\nBrazil variants nor the Y453F mutation identified among mink in Denmark \r\nwas present in any of the US and Canadian mink-derived SARS-CoV-2 \r\nsequences. However, the team identified two dominant novel variants in spike \r\nprotein sequences collected from mink in the US – the double mutation \r\nN501T-G142D and the triple mutation N501T-G142D-F486L. The variants were not found in sequences collected from mink in Canada or any other country.</p><p align=\"justify\">\r\n\r\nTo determine the origin of the novel variants, the researchers \r\nanalyzed all human-derived SARS-CoV-2 sequences collected from the US \r\nand Canada.</p><p align=\"justify\">\r\n\r\nThis revealed that the N501T mutation (without G142D or F486L) was \r\npresent in US human-derived sequences collected as early as August 2020 –\r\n two months prior to when the mink-derived sequences were collected \r\n(October 2020).</p><p align=\"justify\">\r\n\r\nThe team also says both the N501T-G142D and N501T-G142D-F486L \r\nvariants were identified in the human-derived sequences before they were\r\n identified in the mink-derived sequences.</p><p><br></p><p align=\"right\"><span class=\"article-meta-contents\"><span class=\"article-meta-author\">By <a href=\"https://www.news-medical.net/medical/authors/sally-robertson\" itemprop=\"url\"><span itemprop=\"name\">Sally Robertson, B.Sc.<br></span></a></span><span class=\"article-meta-date\">Mar 28 2021</span></span><br></p><p><br></p><p><a href=\"https://www.medrxiv.org/content/10.1101/2021.03.18.21253734v2\" rel=\"noopener\"><span itemprop=\"image\" itemscope=\"\" itemtype=\"https://schema.org/ImageObject\"><br></span></a><br></p>', '2021-03-30 13:43:26', NULL, 1, 'New-SARS-CoV-2-genome-variants-identified-in-US-mink', 'dc6ff26cad11db0501f1f085f040e01c.png'),
(24, 'How could AI be used to predict infection outcomes?', 1, 8, '<h2 align=\"justify\">How do bacteria cause infections?</h2><p align=\"justify\">\r\n\r\nDisease-causing bacteria employ multiple mechanisms and devices to \r\ncause infection. The key principles of pathogenesis are colonization, \r\nmultiplication, and evasion of host immune responses. While some \r\npathogens remain extracellular, others colonize by invading human cells.</p><p align=\"justify\">\r\n\r\nAn efficient way to get hold of the host and cause disease is to use \r\ncolonization factors, such as fimbrial adhesins (used for example by \r\nenterotoxigenic <em>E. coli</em> or <em>Vibrio cholerae</em>) and elaborate toxins that cause diarrhea.</p><p align=\"justify\">\r\n\r\nAlternatively, several common enteric pathogens (for example enteropathogenic <em>E. coli, Salmonella,</em> and <em>Shigella</em>)\r\n use nano-syringes (called type III secretion systems) to inject \r\nbacterial proteins, known as effectors, into human cells; these \r\neffectors facilitate colonization, enabling multiplication (either \r\nintra- or extra-cellularly) and subversion of innate immune responses. \r\nThis gives the pathogen a window of opportunity to survive in the host \r\nbefore adaptive immune responses (or treatment with antibiotics) clear \r\nthe infection. &nbsp;&nbsp; &nbsp; &nbsp;</p><p align=\"justify\">\r\n\r\n<br></p><h2 align=\"justify\">Why have studies so far only focused on single effectors as opposed to multiple ones? What are some of the limitations of this?</h2><p align=\"justify\">\r\n\r\nTraditionally, we have been studying one effector at a time in vitro \r\n(using cell biology, protein binding assays, and biochemical/structural \r\nmethodologies), to investigate their mechanism of action, the host cell \r\nprotein/s they bind or modify, and the signaling pathways they highjack;\r\n it is common that once the in vitro role of an effector is known, its \r\nfunction in vivo is tested.</p><p align=\"justify\">\r\n\r\nWhile in previous years there were some technical constraints in \r\ngenerating multiple gene deletions in a single bacterium, today, this is\r\n not really an issue. The fact that most studies are done on single \r\neffectors is more due to the current convention than to technical \r\nlimitations. &nbsp; &nbsp;</p><p align=\"justify\">\r\n\r\n<br></p><h2 align=\"justify\">Can you describe how you carried out your latest research into infections?</h2><p align=\"justify\">\r\n\r\nMy lab studies infections with the enteric human pathogens enteropathogenic and enterohaemorrhagic <em>E. coli</em>\r\n (EPEC and EHEC respectively); however, as EPEC is a human-restricted \r\npathogen, mice are inherently resistant to this pathogen. As our aim is \r\nto study infection in the context of the endogenous gut microbiota and \r\nimmune responses, we need to use animal models.</p><p align=\"justify\">\r\n\r\nAccordingly, we are lucky we can use <em>Citrobacter rodentium</em>, which is a mouse-restricted pathogen equivalent to EPEC. EPEC and <em>C. rodentium</em>\r\n share the same infection strategy, including the nano-syringe and \r\neffectors; while the prototype human EPEC strain E2348/69 injects 21 \r\neffectors into intestinal epithelial cells (IECs),<em> C. rodentium</em> injects 31 effectors, which include the 21 effectors used by EPEC.</p><p align=\"justify\">\r\n\r\nImportantly, over many years it has been shown that deletion of many \r\neffectors individually had little impact on the ability of the pathogen \r\nto infect the host. The original aim of this study was to determine what\r\n is the minimal number of virulence factors that could sustain the \r\ninfection, using <em>C. rodentium</em> as a model.&nbsp; While pursuing this \r\naim we developed the hypothesis that rather than working individually, \r\nthe effectors form a robust network, which could tolerate significant \r\nperturbation.</p><p align=\"justify\">\r\n\r\nTo test this hypothesis, we perturbed the network by sequentially \r\nremoving nodes (effectors), from two different starting points; in the \r\nfirst (pathway 1) we took an unbiased approach, deleting effector genes \r\nin a random order, in the second (pathway 2) we deleted genes encoding \r\neffectors that are thought to specifically target innate immune \r\nprocesses in IECs. Each intermediate mutant was tested for its ability \r\nto colonize mice above a 10<sup>7</sup> colony-forming counts / g of stool threshold.</p><p align=\"justify\">\r\n\r\nOnce we reached the robustness limits in pathways 1 and 2 (i.e. \r\nfurther effector mutants failing to colonize above the threshold), we \r\nuse proteomics and bioinformatics to study how, compared to the wild \r\ntype, these two synthetic <em>C. rodentium</em> strains affect cellular \r\nprocesses in IECs. We also characterized the type of immune response \r\nthey triggered. In addition, we removed the 10 extra effectors found in <em>C. rodentium</em> compared to EPEC and tested the impact on the infection outcome.</p><p align=\"justify\">\r\n\r\nAs in the process of sequential effector deletion we have generated \r\nover 100 intermediate mutants which were studied in vivo, we combined \r\nthese data with our knowledge of the effector function, to train a \r\nmachine model with the aim of using AI to predict infection outcomes. We\r\n used the AI model to score the 16,489,545 possible mutant combinations \r\nlacking up to 9 effectors.</p><p align=\"justify\"><br></p><h2 align=\"justify\">What did you discover?</h2><p align=\"justify\">We found that the effector network is highly robust, as it can \r\ntolerate contraction by 60%. In pathway 1, a mutant expressing only 12 \r\nof the 31 effectors (a strain we named CR14) maintained the ability to \r\ncolonize, while in pathway 2 the pathogen tolerated deletion of 10 \r\neffectors known to affect key innate immune responses (a strain we named\r\n CRi9). At this stage, we ended with three distinct functional effector \r\nnetworks (wild type, CR14, and CRi9).</p><p align=\"justify\">Interestingly, while expressing distinct effector networks, these \r\nstrains induced conserved infection signatures, which included shifting \r\nof ATP production from the mitochondria to the cytosol (via aerobic \r\nglycolysis) and tissue damage repair responses (i.e. proliferation of \r\nIECs). Conversely, infection with these strains triggered vastly \r\ndifferent immune responses (i.e. CR14 and CRi9 induced a significant \r\nincrease in the secretion of mucosal GMCSF and TNF/IL-22/IL-17/IFNgamma,\r\n respectively).</p><p align=\"justify\">Yet, the host was able to clear the infections and develop long-term \r\nprotective immunity. This shows that while the pathogen encodes a robust\r\n effector network, host immunity is similarly flexible and able to cope \r\nwith vastly different infection strategies.</p><p align=\"justify\">We found that the EPEC effector network did not enable efficient <em>C. rodentium</em> infection, suggesting that the composition of the effectors plays a role in host specificity.</p><p align=\"justify\">\r\n\r\nFinally, the best colonization failure predictions of five and nine \r\neffector deletions, predicted by the AI model, were tested in mice. \r\nRemarkably, these mutants failed to colonize. Importantly, the \r\nprediction of five effector deletions included four effectors that have \r\nfunctional homologs in <em>Shigella</em>, increasing the confidence in the AI. </p><p align=\"right\"><span class=\"article-meta-contents\"><span class=\"article-meta-author\">Interview conducted by <a href=\"https://www.news-medical.net/life-sciences/authors/emily-henderson\" itemprop=\"url\"><span itemprop=\"name\">Emily Henderson, B.Sc.<br></span></a></span><span class=\"article-meta-date\">Mar 23 2021</span></span><br></p>', '2021-03-30 13:50:10', NULL, 1, 'How-could-AI-be-used-to-predict-infection-outcomes?', 'f3ccdd27d2000e3f9255a7e3e2c48800.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `SubCatDescription` mediumtext CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(1, 1, 'Web Developing / Start-up', 'News related to the creation of an start-up and Web Developing in the science field', '2021-03-25 17:04:00', NULL, 1),
(2, 1, 'Omics', 'Omics aims at the collective characterization and quantification of pools of biological molecules that translate into the structure, function, and dynamics of an organism or organisms. ', '2021-03-25 17:10:04', NULL, 1),
(3, 2, 'Biochemistry', 'News related to biochemistry field', '2021-03-25 17:10:25', NULL, 1),
(4, 2, 'Biomedicine', 'News related to Biomedicine field', '2021-03-25 17:10:43', NULL, 1),
(5, 2, 'Biotechnology', 'News related to Biotechnology field', '2021-03-25 17:10:54', NULL, 1),
(6, 1, 'Structural Bioinformatics', 'News related to Structural Bioinformatics field', '2021-03-25 17:11:21', NULL, 1),
(7, 1, 'Genomics', 'News related to genomics field', '2021-03-25 17:11:36', NULL, 1),
(8, 1, 'Software development', 'News related to the development of software related to the bioinformatic field', '2021-03-25 17:12:28', NULL, 1),
(9, 5, 'Wild animals', 'Field related to the wild animals news', '2021-03-25 17:20:46', NULL, 1),
(10, 3, 'Organic', 'News related to organic chemistry field', '2021-03-26 15:33:25', NULL, 1),
(11, 4, 'Astrophysics', 'News related to Astrophysics field', '2021-03-26 15:34:39', NULL, 1),
(12, 5, 'Climate Change', '.', '2021-03-26 15:36:17', NULL, 1),
(13, 6, 'Vaccine', 'News related to Covid-19 vaccine', '2021-03-29 15:02:18', NULL, 1),
(14, 6, 'Cases', 'News related to the cases produced by covid-19', '2021-03-29 15:02:40', NULL, 1),
(15, 6, 'Disease', 'News related to the covid-19 disease', '2021-03-29 15:02:57', NULL, 1);

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
(2, 'maria', 'e21fc56c1a272b630e0d1439079d0598cf8b8329', 'Maria', 'Díaz', 'maria@prova.com', NULL, NULL),
(3, 'mdr', '64a50932049ddff830412e0fd9edb30198bf17f3', 'Marta', 'Ros', 'mdr@mdr.com', NULL, NULL),
(5, 'maria2', '9eef34da42166caafeca9f3770ec8b05ed7d7f8e', 'MariaD', NULL, 'maria2@prova.com', NULL, NULL),
(6, 'maria2', '9eef34da42166caafeca9f3770ec8b05ed7d7f8e', 'M', 'D', 'maria2@prova.com', NULL, NULL),
(7, 'mdiaz', '8630e2b730eab0833547c8de50162ff50ac73aef', NULL, NULL, 'mdiaz@gmail.com', NULL, NULL),
(12, 'Remei', '0f5a71b1798ccc726b1740137560e8b4b0868e7b', 'Remei', 'Ros', 'remei@gmail.com', NULL, NULL),
(13, 'R', 'c387c982a132d05cbd5f88840aef2c8157740049', 'R', 'R', 'remei@gmail.com', NULL, NULL);

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
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `Quotes`
--
ALTER TABLE `Quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

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
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Journal`
--
ALTER TABLE `Journal`
  MODIFY `idJournal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `News`
--
ALTER TABLE `News`
  MODIFY `idNews` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `idPosts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Quotes`
--
ALTER TABLE `Quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
