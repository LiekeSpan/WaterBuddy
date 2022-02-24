

-- aanmaken tabel klanten 


CREATE TABLE `Klanten` ( 
`Klantnummer` INT (10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`Voornaam` VARCHAR (60) NOT NULL,
`Achternaam` VARCHAR (60) NOT NULL,
`Straat` VARCHAR (60) NOT NULL,
`Huisnummer`INT(6) NOT NULL,
`Toevoeginghuisnummer` VARCHAR (5),
`Postcode` VARCHAR(6) NOT NULL,
`Plaats` VARCHAR (40) NOT NULL,
`Land` VARCHAR (40) NOT NULL,
`Telefoon` INT (20) NOT NULL,
`Email` VARCHAR (60) NOT NULL ) 

INSERT INTO `Klanten` (`Klantnummer`, `Voornaam`, `Achternaam`, `Straat`, `Huisnummer`,`Toevoeginghuisnummer`, `Postcode`, `Plaats`, `Land`, `Telefoonnummer`, `Email`) VALUES
('Anna', 'Berendsen', 'Jipstraat',2, NULL, '5200LK', 'Arnhem', 'Nederland',0612345678, 'annaberendsen@avans.nl'),
('Bram', 'Wijds', 'Vogelstraat', 4, NULL, '6500BK', 'Nijmegen', 'Nederland',0645987536, 'bramwijds@avans.nl'),
('Dirk', 'Klaassen', 'Groteweg', 6, 'B', '1452KL', 'Ettenleur', 'Nederland',0685978569 ,'dirkklaassen@avans.nl'),
('Evert', 'Bruin', 'Willemsweg', 18, NULL,'6538HH', 'Nijmegen', 'Nederland',0674569325, 'evertbruin@avans.nl'),
('Jan', 'Vermeulen', 'Brugstraat', 225, NULL, '7855TL', 'Vlissingen', 'Nederland',0633589611, 'janvermeulen@avans.nl'),
('Kim', 'Witten', 'Imkerstraat', 24, NULL, '4456RR', 'Ede', 'Nederland',0645225879, 'kimwitten@avans.nl'),
('Maria', 'Vink', 'Kleineweg', 77, NULL, '1254WS', 'Amsterdam', 'Nederland',025899784, 'mariavink@avans.nl'),
('Jolanda', 'Evers', 'Berenweg', 132, 'A', '2654MN', 'Rotterdam', 'Nederland',0635647591, 'jolandaevers@avans.nl'),
('Bart', 'Thijsen', 'Molenweg', 88, NULL, '6534FH', 'Nijmegen', 'Nederland',0678859632 ,'bartthijsen@avans.nl'),
('Thijs', 'Jansen', 'Middenstraat', 169, NULL, '5569BL', 'Nieuwegein', 'Nederland',0687452221, 'thijsjansen@avans.nl'),
('Harrie', 'Willemsen', 'Honingstraat', 425, NULL, '1236AA', 'Almere', 'Nederland',0669585632, 'harriewillemsen@avans.nl'),
('Rebecca', 'Roest', 'Rozenplein', 44, NULL, '8554RT', 'Helmond', 'Nederland',0625678945, 'rebeccaroest@avans.nl'),
('Nico', 'Bruin', 'Groenestraat',888, NULL, '6533MN', 'Weert', 'Nederland',0654589632, 'nicobruin@avans.nl'),
('Lisa', 'Kersten', 'Hatertseweg', 55,'F', '5589FV', 'Rosmalen', 'Nederland',0657841234, 'lisakersten@avans.nl'),
('Lieke', 'Been', 'Herenstraat', 98, NULL, '3569GH', 'Geffen', 'Nederland',0685612347 ,'liekebeen@avans.nl');


-- Aanmaken tabel Bestellingen

CREATE TABLE `Bestellingen`(
`Bestelnummer` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
`Klantnummer` INT(10) NOT NULL,
`Factuuradres` VARCHAR(100) NOT NULL,
`Leveradres` VARCHAR(100) NOT NULL,
`Datum` DATE NOT NULL,
  CONSTRAINT `BestellingenFK`
        FOREIGN KEY (`Klantnummer`)
        REFERENCES `Klanten`(`Klantnummer`)
)

INSERT INTO `Bestellingen`(`Klantnummer`, `Factuuradres`, `Leveradres`,`Datum`),
(1, 'Jipstraat 2 5200LK Arnhem Nederland','Jipstraat 2 5200LK Arnhem Nederland', 17-2-2022),
(2, 'Vogelstraat 4 6500BK Nijmegen Nederland', 'Vogelstraat 4 6500BK Nijmegen Nederland', 14-2-2022), 
(3, 'Groteweg 6B 1452KL Ettenleur Nederland', 'Grotestraat 22 1453HH Ettenleur Nederland', 18-2-2022),
(4, 'Willemsweg 18 6538HH Nijmegen Nederland', 'Willemsweg 18 6538HH Nijmegen Nederland',10-2-2022),
(5, 'Brugstraat 225 7855TL Vlissingen Nederland','Brugstraat 225 7855TL Vlissingen Nederland', 17-2-2022),
(6, 'Imkerstraat 24 4456RR Ede Nederland', 'Imkerstraat 24 4456RR Ede Nederland', 13-2-2022),
(7, 'Kleineweg 77 1254WS Amsterdam Nederland', 'Kleineweg 77 1254WS Amsterdam Nederland', 11-2-2022),
(8, 'Berenweg 132 A 2654MN Rotterdam Nederland','Berenweg 132 A 2654MN Rotterdam Nederland', 9-2-2022),
(9, 'Molenweg 88 6534FH Nijmegen Nederland','Molenweg 88 6534FH Nijmegen Nederland', 8-2-2022),
(10, 'Middenstraat 169 5569BL Nieuwegein Nederland','Middenstraat 169 5569BL Nieuwegein Nederland', 7-2-2022),
(11, 'Honingstraat 425 1236AA Almere Nederland', 'Honingstraat 425 1236AA Almere Nederland', 19-2-2022),
(12, 'Rozenplein 44 8554RT Helmond Nederland', 'Rozenplein 44 8554RT Helmond Nederland', 20-2-2022),
(13, 'Groenestraat 888 6533MN Weert Nederland', 'Groenestraat 888 6533MN Weert Nederland', 21-2-2022),
(14, 'Hatertseweg 55F 5589FV Rosmalen Nederland', 'Hatertseweg 53 5589FV Rosmalen Nederland', 22-2-2022),
(15, 'Herenstraat 98 3569GH Geffen Nederland', 'Zuiderstraat 24 3567NL Geffen Nederland', 23-2-2022);


-- Aanmaken tabel Bestelregel

  CREATE TABLE `Producten`(
  `Productnummer` INT(40) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Productnaam`   VARCHAR(30) NOT NULL,
  `Beschrijving`  VARCHAR(30) NOT NULL,
  `Prijs`         DECIMAL (6,2) NOT NULL,
  )

  INSERT INTO `Producten`(`Productnaam`, `Beschrijving`, `Prijs`)
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99),
  ('WaterBuddyPro', 'Tweede editie',24.99), 
  ('WaterBuddy', 'Eerste editie',14.99);

  CREATE TABLE `Bestelregel`( 
  `Bestelnummer` INT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Productnummer`  INT(10) NOT NULL, 
  `Aantal`       INT(20) NOT NULL,
    CONSTRAINT `BestelregelFK`
        PRIMARY KEY (`Productnummer`)
        REFERENCES `Producten`(`Bestelnummer`)
  )

  INSERT INTO `Bestelregel`(`Bestelnummer`, `Klantnummer`, `Aantal`)
  (1,1,2),
  (2,2,2),
  (3,3,4),
  (4,4,7),
  (5,5,1),
  (6,6,3),
  (7,7,6),
  (8,8,8),
  (9,9,1),
  (10,10,2),
  (11,11,3),
  (12,12,2),
  (13,13,1),
  (14,14,1),
  (15,15,2);


 

 