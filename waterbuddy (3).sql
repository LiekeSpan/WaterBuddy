-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 27 mrt 2022 om 14:43
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waterbuddy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `bekijkProducten` (IN `limit` INT(11), IN `offset` INT(11))  BEGIN
    SELECT `Productnaam`, `Prijs` from `Producten` ORDER BY `Productnummer` LIMIT `limit` OFFSET `offset`; 
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `bijwerkenVoorraad` (IN `p_productnummer` INT)  BEGIN

 -- Bijwerken voorraad met 1 voor meegeleverde productnummer
 UPDATE producten 
    SET voorraad = voorraad - 1
  WHERE Productnummer = p_productnummer;                                  
END$$

--
-- Functies
--
CREATE DEFINER=`root`@`localhost` FUNCTION `groteLetters` (`par_tekst` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET utf8mb4 BEGIN
  RETURN UPPER(par_tekst);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kleineLetters` (`p_tekst` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET utf8mb4 BEGIN
  RETURN LOWER(p_tekst);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `administratoren`
--

CREATE TABLE `administratoren` (
  `AdministratorID` int(9) NOT NULL,
  `Voornaam` varchar(50) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Wachtwoord` varchar(100) DEFAULT NULL,
  `Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `administratoren`
--

INSERT INTO `administratoren` (`AdministratorID`, `Voornaam`, `Achternaam`, `Email`, `Wachtwoord`, `Datum`) VALUES
(100, 'Jan', 'Janssen', 'Janjanssen@avans.nl', 'Ikbenjan123!', '2022-01-01'),
(101, 'Teun', 'Hendriks', 'Teunhendriks@avans.nl', 'Ikbenteun122!', '2022-02-01'),
(102, 'Daisy', 'Engelen', 'Daisyengelen@avans.nl', 'Ikbendaisy124!', '2022-02-20'),
(103, 'Linda', 'deJong', 'Lindadejong@avans.nl', 'Ikbenlinda125!', '2022-03-01');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen`
--

CREATE TABLE `bestellingen` (
  `Bestelnummer` int(10) NOT NULL,
  `Klantnummer` int(10) NOT NULL,
  `Factuuradres` varchar(100) NOT NULL,
  `Leveradres` varchar(100) NOT NULL,
  `Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `bestellingen`
--

INSERT INTO `bestellingen` (`Bestelnummer`, `Klantnummer`, `Factuuradres`, `Leveradres`, `Datum`) VALUES
(1, 1, 'Jipstraat 2 5200LK Arnhem Nederland', 'Jipstraat 2 5200LK Arnhem Nederland', '2022-01-11'),
(2, 2, 'Vogelstraat 4 6500BK Nijmegen Nederland', 'Vogelstraat 4 6500BK Nijmegen Nederland', '2022-02-14'),
(3, 3, 'Groteweg 6B 1452KL Ettenleur Nederland', 'Grotestraat 22 1453HH Ettenleur Nederland', '2022-01-20'),
(4, 4, 'Willemsweg 18 6538HH Nijmegen Nederland', 'Willemsweg 18 6538HH Nijmegen Nederland', '2022-02-07'),
(5, 5, 'Brugstraat 225 7855TL Vlissingen Nederland', 'Brugstraat 225 7855TL Vlissingen Nederland', '2022-02-17'),
(6, 6, 'Imkerstraat 24 4456RR Ede Nederland', 'Imkerstraat 24 4456RR Ede Nederland', '2022-02-13'),
(7, 7, 'Kleineweg 77 1254WS Amsterdam Nederland', 'Kleineweg 77 1254WS Amsterdam Nederland', '2022-01-15'),
(8, 8, 'Berenweg 132 A 2654MN Rotterdam Nederland', 'Berenweg 132 A 2654MN Rotterdam Nederland', '2022-01-27'),
(9, 9, 'Molenweg 88 6534FH Nijmegen Nederland', 'Molenweg 88 6534FH Nijmegen Nederland', '2022-03-01'),
(10, 10, 'Middenstraat 169 5569BL Nieuwegein Nederland', 'Middenstraat 169 5569BL Nieuwegein Nederland', '2022-03-07'),
(11, 11, 'Honingstraat 425 1236AA Almere Nederland', 'Honingstraat 425 1236AA Almere Nederland', '2022-02-15'),
(12, 12, 'Rozenplein 44 8554RT Helmond Nederland', 'Rozenplein 44 8554RT Helmond Nederland', '2022-02-03'),
(13, 13, 'Groenestraat 888 6533MN Weert Nederland', 'Groenestraat 888 6533MN Weert Nederland', '2022-01-12'),
(14, 14, 'Hatertseweg 55F 5589FV Rosmalen Nederland', 'Hatertseweg 53 5589FV Rosmalen Nederland', '2022-02-28'),
(15, 15, 'Herenstraat 98 3569GH Geffen Nederland', 'Zuiderstraat 24 3567NL Geffen Nederland', '2022-02-10');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelregels`
--

CREATE TABLE `bestelregels` (
  `Bestelnummer` int(20) NOT NULL,
  `Productnummer` int(10) NOT NULL,
  `Aantal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `bestelregels`
--

INSERT INTO `bestelregels` (`Bestelnummer`, `Productnummer`, `Aantal`) VALUES
(1, 1, 2),
(3, 1, 4),
(5, 1, 1),
(7, 1, 6),
(9, 1, 1),
(11, 1, 3),
(13, 1, 1),
(15, 1, 2),
(2, 2, 2),
(4, 2, 7),
(6, 2, 3),
(8, 2, 8),
(10, 2, 2),
(12, 2, 2),
(14, 2, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

CREATE TABLE `klanten` (
  `Klantnummer` int(10) NOT NULL,
  `Voornaam` varchar(60) NOT NULL,
  `Achternaam` varchar(60) NOT NULL,
  `Straat` varchar(60) NOT NULL,
  `Huisnummer` int(6) NOT NULL,
  `Toevoeginghuisnummer` varchar(5) DEFAULT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Plaats` varchar(40) NOT NULL,
  `Land` varchar(40) NOT NULL,
  `Telefoon` int(20) NOT NULL,
  `Email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `klanten`
--

INSERT INTO `klanten` (`Klantnummer`, `Voornaam`, `Achternaam`, `Straat`, `Huisnummer`, `Toevoeginghuisnummer`, `Postcode`, `Plaats`, `Land`, `Telefoon`, `Email`) VALUES
(1, 'Anna', 'Berendsen', 'Jipstraat', 2, NULL, '5200LK', 'Arnhem', 'Nederland', 612345678, 'annaberendsen@avans.nl'),
(2, 'Bram', 'Wijds', 'Vogelstraat', 4, NULL, '6500BK', 'Nijmegen', 'Nederland', 645987536, 'bramwijds@avans.nl'),
(3, 'Dirk', 'Klaassen', 'Groteweg', 6, 'B', '1452KL', 'Ettenleur', 'Nederland', 685978569, 'dirkklaassen@avans.nl'),
(4, 'Evert', 'Bruin', 'Willemsweg', 18, NULL, '6538HH', 'Nijmegen', 'Nederland', 674569325, 'evertbruin@avans.nl'),
(5, 'Jan', 'Vermeulen', 'Brugstraat', 225, NULL, '7855TL', 'Vlissingen', 'Nederland', 633589611, 'janvermeulen@avans.nl'),
(6, 'Kim', 'Witten', 'Imkerstraat', 24, NULL, '4456RR', 'Ede', 'Nederland', 645225879, 'kimwitten@avans.nl'),
(7, 'Maria', 'Vink', 'Kleineweg', 77, NULL, '1254WS', 'Amsterdam', 'Nederland', 25899784, 'mariavink@avans.nl'),
(8, 'Jolanda', 'Evers', 'Berenweg', 132, 'A', '2654MN', 'Rotterdam', 'Nederland', 635647591, 'jolandaevers@avans.nl'),
(9, 'Bart', 'Thijsen', 'Molenweg', 88, NULL, '6534FH', 'Nijmegen', 'Nederland', 678859632, 'bartthijsen@avans.nl'),
(10, 'Thijs', 'Jansen', 'Middenstraat', 169, NULL, '5569BL', 'Nieuwegein', 'Nederland', 687452221, 'thijsjansen@avans.nl'),
(11, 'Harrie', 'Willemsen', 'Honingstraat', 425, NULL, '1236AA', 'Almere', 'Nederland', 669585632, 'harriewillemsen@avans.nl'),
(12, 'Rebecca', 'Roest', 'Rozenplein', 44, NULL, '8554RT', 'Helmond', 'Nederland', 625678945, 'rebeccaroest@avans.nl'),
(13, 'Nico', 'Bruin', 'Groenestraat', 888, NULL, '6533MN', 'Weert', 'Nederland', 654589632, 'nicobruin@avans.nl'),
(14, 'Lisa', 'Kersten', 'Hatertseweg', 55, 'F', '5589FV', 'Rosmalen', 'Nederland', 657841234, 'lisakersten@avans.nl'),
(15, 'Lieke', 'Been', 'Herenstraat', 98, NULL, '3569GH', 'Geffen', 'Nederland', 685612347, 'liekebeen@avans.nl');

--
-- Triggers `klanten`
--
DELIMITER $$
CREATE TRIGGER `groteLetters` BEFORE INSERT ON `klanten` FOR EACH ROW BEGIN
  SET NEW.Plaats = groteLetters(NEW.Plaats);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structuur voor view `klant_bestellingen`
-- (Zie onder voor de actuele view)
--
CREATE TABLE `klant_bestellingen` (
);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveranciers`
--

CREATE TABLE `leveranciers` (
  `LeveranciersID` int(20) NOT NULL,
  `Bedrijfsnaam` varchar(50) NOT NULL,
  `Adres` varchar(50) NOT NULL,
  `Huisnummer` int(6) NOT NULL,
  `Toevoeginghuisnummer` varchar(5) DEFAULT NULL,
  `Plaats` varchar(50) NOT NULL,
  `Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `leveranciers`
--

INSERT INTO `leveranciers` (`LeveranciersID`, `Bedrijfsnaam`, `Adres`, `Huisnummer`, `Toevoeginghuisnummer`, `Plaats`, `Datum`) VALUES
(1, 'Groene koerier', 'Groenestraat', 22, 'A', 'Breda', '0000-00-00'),
(2, 'Plantenwereld', 'Hogeschoollaan', 136, NULL, 'Breda', '0000-00-00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `producten`
--

CREATE TABLE `producten` (
  `Productnummer` int(40) NOT NULL,
  `LeveranciersID` int(20) DEFAULT NULL,
  `Productnaam` varchar(30) NOT NULL,
  `Beschrijving` varchar(30) NOT NULL,
  `Prijs` decimal(6,2) NOT NULL,
  `Voorraad` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `producten`
--

INSERT INTO `producten` (`Productnummer`, `LeveranciersID`, `Productnaam`, `Beschrijving`, `Prijs`, `Voorraad`) VALUES
(1, 1, 'WaterBuddy', 'Eerste editie', '18.99', 2000),
(2, 2, 'WaterBuddyPro', 'Tweede editie', '24.99', 4000);

--
-- Triggers `producten`
--
DELIMITER $$
CREATE TRIGGER `prod_before_insert` BEFORE INSERT ON `producten` FOR EACH ROW BEGIN
  -- Zet productnaam om naar kleine letters
  SET NEW.Productnaam = kleineLetters(NEW.Productnaam);

  -- Bijwerken voorraad
  CALL bijwerkenVoorraad(NEW.Productnummer);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `winkelmanden`
--

CREATE TABLE `winkelmanden` (
  `Klantnummer` int(20) NOT NULL,
  `Productnummer` int(10) NOT NULL,
  `Aantal` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `winkelmanden`
--

INSERT INTO `winkelmanden` (`Klantnummer`, `Productnummer`, `Aantal`) VALUES
(1, 1, 2),
(2, 1, 2),
(2, 2, 3),
(3, 1, 1),
(4, 2, 1),
(5, 1, 2),
(5, 2, 1),
(6, 1, 4),
(6, 2, 2),
(7, 1, 1),
(8, 2, 1),
(9, 1, 1),
(10, 2, 1),
(11, 1, 1),
(11, 2, 1),
(12, 2, 1),
(13, 1, 3),
(13, 2, 1),
(14, 1, 1),
(14, 2, 4),
(15, 1, 3),
(15, 2, 1);

-- --------------------------------------------------------

--
-- Structuur voor de view `klant_bestellingen`
--
DROP TABLE IF EXISTS `klant_bestellingen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `klant_bestellingen`  AS SELECT `klan`.`Klantnummer` AS `Klantnummer`, `klan`.`Voornaam` AS `Voornaam`, `klan`.`Achternaam` AS `Achternaam`, `klan`.`Straat` AS `Straat`, `klan`.`Huisnummer` AS `Huisnummer`, `klan`.`Toevoeginghuisnummer` AS `Toevoeginghuisnummer`, `klan`.`Postcode` AS `Postcode`, `klan`.`Plaats` AS `Plaats`, `klan`.`Land` AS `Land`, `klan`.`Telefoon` AS `Telefoon`, `klan`.`Email` AS `Email`, `best`.`Factuuradres` AS `Factuuradres`, `best`.`Leveradres` AS `Leveradres`, `best`.`Datum` AS `Datum`, `breg`.`Aantal` AS `Aantal`, `prod`.`Productnummer` AS `Productnummer`, `prod`.`Productnaam` AS `Productnaam`, `prod`.`Beschrijving` AS `Beschrijving`, `prod`.`Prijs` AS `Prijs`, `prod`.`voorraad` AS `voorraad` FROM (((`bestellingen` `best` join `bestelregel` `breg` on(`best`.`Bestelnummer` = `breg`.`Bestelnummer`)) join `producten` `prod` on(`prod`.`Productnummer` = `breg`.`Productnummer`)) join `klanten` `klan` on(`klan`.`Klantnummer` = `best`.`Klantnummer`)) ORDER BY `best`.`Klantnummer` ASC ;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `administratoren`
--
ALTER TABLE `administratoren`
  ADD PRIMARY KEY (`AdministratorID`);

--
-- Indexen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`Bestelnummer`),
  ADD KEY `BestellingenFK` (`Klantnummer`);

--
-- Indexen voor tabel `bestelregels`
--
ALTER TABLE `bestelregels`
  ADD PRIMARY KEY (`Productnummer`,`Bestelnummer`),
  ADD KEY `BestellingFK` (`Bestelnummer`);

--
-- Indexen voor tabel `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`Klantnummer`);

--
-- Indexen voor tabel `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`LeveranciersID`);

--
-- Indexen voor tabel `producten`
--
ALTER TABLE `producten`
  ADD PRIMARY KEY (`Productnummer`),
  ADD KEY `LeveranciersFK` (`LeveranciersID`);

--
-- Indexen voor tabel `winkelmanden`
--
ALTER TABLE `winkelmanden`
  ADD PRIMARY KEY (`Klantnummer`,`Productnummer`),
  ADD KEY `ProductenFK` (`Productnummer`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `Bestelnummer` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT voor een tabel `bestelregels`
--
ALTER TABLE `bestelregels`
  MODIFY `Bestelnummer` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT voor een tabel `klanten`
--
ALTER TABLE `klanten`
  MODIFY `Klantnummer` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT voor een tabel `leveranciers`
--
ALTER TABLE `leveranciers`
  MODIFY `LeveranciersID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `producten`
--
ALTER TABLE `producten`
  MODIFY `Productnummer` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT voor een tabel `winkelmanden`
--
ALTER TABLE `winkelmanden`
  MODIFY `Klantnummer` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD CONSTRAINT `BestellingenFK` FOREIGN KEY (`Klantnummer`) REFERENCES `klanten` (`Klantnummer`);

--
-- Beperkingen voor tabel `bestelregels`
--
ALTER TABLE `bestelregels`
  ADD CONSTRAINT `BestellingFK` FOREIGN KEY (`Bestelnummer`) REFERENCES `bestellingen` (`Bestelnummer`),
  ADD CONSTRAINT `ProductFK` FOREIGN KEY (`Productnummer`) REFERENCES `producten` (`Productnummer`);

--
-- Beperkingen voor tabel `producten`
--
ALTER TABLE `producten`
  ADD CONSTRAINT `LeveranciersFK` FOREIGN KEY (`LeveranciersID`) REFERENCES `leveranciers` (`LeveranciersID`);

--
-- Beperkingen voor tabel `winkelmanden`
--
ALTER TABLE `winkelmanden`
  ADD CONSTRAINT `KlantenFK` FOREIGN KEY (`Klantnummer`) REFERENCES `klanten` (`Klantnummer`),
  ADD CONSTRAINT `ProductenFK` FOREIGN KEY (`Productnummer`) REFERENCES `producten` (`Productnummer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
