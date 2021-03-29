-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 29, 2021 at 07:37 PM
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
