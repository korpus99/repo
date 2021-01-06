-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Sty 2021, 21:54
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `firma_kurierska`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `1. Imię i nazwisko kurierów` ()  NO SQL
SELECT imie, nazwisko FROM kurierzy$$

--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `2. Ilosc paczek` () RETURNS TEXT CHARSET utf8mb4 NO SQL
IF ( 
    SELECT COUNT(*) 
    FROM paczki  
) > 0
    	THEN RETURN  "Paczki gotowe.";   
ELSE
		RETURN "Brak paczek.";
END IF$$

CREATE DEFINER=`root`@`localhost` FUNCTION `3. Emerytura` () RETURNS TEXT CHARSET utf8mb4 NO SQL
IF (SELECT COUNT(*) FROM kurierzy WHERE staz_pracy > 20) > 0
    THEN RETURN "Można wysłać co najmniej jednego pracownika na emeryturę.";
ELSE 
	RETURN "Nie ma pracownikow, ktorych mozna wyslac na emeryture.";
END IF$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `1`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `1` (
`imie` varchar(25)
,`nazwisko` varchar(25)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `2`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `2` (
`imie` varchar(25)
,`nazwisko` varchar(25)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `3`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `3` (
`imie` varchar(30)
,`nazwisko` varchar(30)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `4` (
`Najwieksz Staz` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `5` (
`Sredni Staz` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `6` (
`Liczba Paczek` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `7` (
`Imie na litere R` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `8`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `8` (
`model` varchar(25)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `9`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `9` (
`Rodzaj Pracownika` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `10`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `10` (
`COUNT(rodzaj_pracownika)` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `11`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `11` (
`imie` varchar(30)
,`nazwisko` varchar(30)
,`nr_telefonu` int(9)
,`adres` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kadra`
--

CREATE TABLE `kadra` (
  `id` int(11) NOT NULL,
  `id_kuriera` int(11) NOT NULL,
  `rodzaj_pracownika` enum('Stary Pracownik','Młody Pracownik') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kadra`
--

INSERT INTO `kadra` (`id`, `id_kuriera`, `rodzaj_pracownika`) VALUES
(1, 1, 'Młody Pracownik'),
(2, 2, 'Stary Pracownik'),
(3, 3, 'Młody Pracownik'),
(4, 4, 'Stary Pracownik'),
(5, 5, 'Stary Pracownik'),
(6, 6, 'Stary Pracownik'),
(7, 7, 'Młody Pracownik'),
(8, 8, 'Młody Pracownik'),
(9, 9, 'Młody Pracownik'),
(10, 10, 'Stary Pracownik'),
(11, 11, 'Stary Pracownik'),
(12, 12, 'Stary Pracownik');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurierzy`
--

CREATE TABLE `kurierzy` (
  `id_kuriera` int(11) NOT NULL,
  `id_pojazdu` int(11) NOT NULL,
  `imie` varchar(25) NOT NULL,
  `nazwisko` varchar(25) NOT NULL,
  `staz_pracy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kurierzy`
--

INSERT INTO `kurierzy` (`id_kuriera`, `id_pojazdu`, `imie`, `nazwisko`, `staz_pracy`) VALUES
(1, 1, 'Lidia', 'Wróblewska', 2),
(2, 2, 'Wiesław', 'Laskowski', 13),
(3, 3, 'Oliwier', 'Andrzejewski', 1),
(4, 4, 'Ryszard', 'Kania', 5),
(5, 5, 'Ihor', 'Bednarczyk', 8),
(6, 6, 'Aleks', 'Jarosz', 22),
(7, 7, 'Sandra', 'Kowalska', 3),
(8, 8, 'Vitalii', 'Urbański', 1),
(9, 9, 'Michael', 'Wróbel', 4),
(10, 10, 'Anita', 'Kowalik', 6),
(11, 10, 'Ryszard', 'Chmielewski', 6),
(12, 4, 'Kazimierz', 'Kowalski', 11);

--
-- Wyzwalacze `kurierzy`
--
DELIMITER $$
CREATE TRIGGER `1. statystyki-kurier` AFTER INSERT ON `kurierzy` FOR EACH ROW UPDATE statystyki SET ilosc = ilosc + 1
WHERE nazwa='pracownicy'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `2. statystyki-kurier2` AFTER DELETE ON `kurierzy` FOR EACH ROW UPDATE statystyki SET ilosc = ilosc - 1
WHERE nazwa='pracownicy'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nadawcy`
--

CREATE TABLE `nadawcy` (
  `id_nadawcy` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `nr_telefonu` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `nadawcy`
--

INSERT INTO `nadawcy` (`id_nadawcy`, `imie`, `nazwisko`, `adres`, `nr_telefonu`) VALUES
(1, 'Janina', 'Jarosz', 'Zamkowa 13, 54-147 Wałbrzych', 579811392),
(2, 'Maja', 'Makowska', 'Różana 7, 14-623 Świnoujście', 455408602),
(3, 'Ryszard', 'Borowski', 'Piastowska 1, 06-783 Sopot', 453175526),
(4, 'Krystyna', 'Adamczyk', 'Orzeszkowej 22, 67-946 Elbląg', 511628922),
(5, 'Vladyslav', 'Wysocki', 'Matejki 22/5, 30-367 Zielona Góra', 519310255),
(6, 'Bolesława', 'Chmielewska', 'Sosnowa 53, 86-032 Ostrołęka', 573152680),
(7, 'Konrad', 'Chmielewski', 'Defiladowy 87, 03-144 Jaworzno', 511380798),
(8, 'Otylia', 'Śliwińska', 'Rzemieślnicza 22, 94-940 Jastrzębie-Zdrój', 535384756),
(9, 'Tatiana', 'Marciniak', 'Szkolna 12, 73-271 Lublin', 452211184),
(10, 'Klaudiusz', 'Dobrowolski', 'Lipowa 2, 09-883 Sosnowiec', 538564696);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odbiorcy`
--

CREATE TABLE `odbiorcy` (
  `id_odbiorcy` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `nr_telefonu` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `odbiorcy`
--

INSERT INTO `odbiorcy` (`id_odbiorcy`, `imie`, `nazwisko`, `adres`, `nr_telefonu`) VALUES
(1, 'Weronika', 'Zakrzewska', 'Widokowa 14, 91-344 Kalisz', 664523657),
(2, 'Stefan', 'Grzelak', 'Ogrodowa 65, 27-711 Opole', 721435895),
(3, 'Oliwia', 'Polak', 'Leśna 1, 40-111 Świnoujście', 554345876),
(4, 'Paweł', 'Kopeć', 'Leśna 3, 12-912 Włocławek', 777456111),
(5, 'Mia', 'Żywiec', 'Kwiatowa 1, 66-731 Szczecin', 888228186),
(6, 'Karolina', 'Pawlak', '3 maja 2a, 10-000 Olsztyn', 507157208),
(7, 'Julianna', 'Grzelak', 'Ogrodowa 5, 67-676 Siedlce', 602202112),
(8, 'Ariel', 'Szmit', 'Lniana 140, 67-676 Siedlce', 789246513),
(9, 'Ariel', 'Wrombel', 'Lotników 13/4, 87-300 Brodnica', 508794165),
(10, 'Dorian', 'Szmit', 'Lniana 140, 67-676 Siedlce', 697999871);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `paczki`
--

CREATE TABLE `paczki` (
  `id_paczki` int(11) NOT NULL,
  `id_kuriera` int(11) NOT NULL,
  `id_nadawcy` int(11) NOT NULL,
  `id_odbiorcy` int(11) NOT NULL,
  `wielkosc` enum('A','B','C') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `paczki`
--

INSERT INTO `paczki` (`id_paczki`, `id_kuriera`, `id_nadawcy`, `id_odbiorcy`, `wielkosc`) VALUES
(1, 5, 5, 3, 'C'),
(2, 7, 2, 10, 'B'),
(3, 6, 6, 2, 'A'),
(4, 9, 9, 5, 'B'),
(5, 1, 3, 1, 'C'),
(6, 10, 8, 4, 'B'),
(7, 2, 1, 9, 'C'),
(8, 3, 4, 7, 'A'),
(9, 4, 7, 6, 'A'),
(10, 8, 10, 8, 'C');

--
-- Wyzwalacze `paczki`
--
DELIMITER $$
CREATE TRIGGER `3. statystyki-paczki` AFTER INSERT ON `paczki` FOR EACH ROW UPDATE statystyki SET ilosc = ilosc + 1
WHERE nazwa='paczki'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `4. statystyki-paczki2` AFTER DELETE ON `paczki` FOR EACH ROW UPDATE statystyki SET ilosc = ilosc - 1
WHERE nazwa='paczki'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojazdy`
--

CREATE TABLE `pojazdy` (
  `id_pojazdu` int(11) NOT NULL,
  `model` varchar(25) NOT NULL,
  `rejestracja` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pojazdy`
--

INSERT INTO `pojazdy` (`id_pojazdu`, `model`, `rejestracja`) VALUES
(1, 'Renault Master', 'L-422Q'),
(2, 'Fiat Ducato', 'L-685kA'),
(3, 'Iveco Daily', 'L-945eA'),
(4, 'Iveco Daily', 'L-339LA'),
(5, 'Mercedes Sprinter', 'L-101IA'),
(6, 'Mercedes Sprinter', 'L-753CA'),
(7, 'Mercedes Sprinter', 'L-354NA'),
(8, 'Ford Transit', 'L-095ZA'),
(9, 'Fiat Fiorino', 'L-158sA'),
(10, 'Volkswagen Crafter', 'L-674FA');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statystyki`
--

CREATE TABLE `statystyki` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `statystyki`
--

INSERT INTO `statystyki` (`id`, `nazwa`, `ilosc`) VALUES
(1, 'pracownicy', 12),
(2, 'paczki', 10);

-- --------------------------------------------------------

--
-- Struktura widoku `1`
--
DROP TABLE IF EXISTS `1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `1`  AS SELECT `kurierzy`.`imie` AS `imie`, `kurierzy`.`nazwisko` AS `nazwisko` FROM (`kurierzy` join `paczki` on(`kurierzy`.`id_kuriera` = `paczki`.`id_kuriera`)) WHERE `paczki`.`wielkosc` = 'C' ORDER BY `kurierzy`.`imie` ASC ;

-- --------------------------------------------------------

--
-- Struktura widoku `2`
--
DROP TABLE IF EXISTS `2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `2`  AS SELECT `kurierzy`.`imie` AS `imie`, `kurierzy`.`nazwisko` AS `nazwisko` FROM (`kurierzy` join `pojazdy` on(`kurierzy`.`id_pojazdu` = `pojazdy`.`id_pojazdu`)) WHERE `pojazdy`.`rejestracja` = 'L-422Q' ;

-- --------------------------------------------------------

--
-- Struktura widoku `3`
--
DROP TABLE IF EXISTS `3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `3`  AS SELECT `odbiorcy`.`imie` AS `imie`, `odbiorcy`.`nazwisko` AS `nazwisko` FROM ((`odbiorcy` join `paczki` on(`paczki`.`id_odbiorcy` = `odbiorcy`.`id_odbiorcy`)) join `nadawcy` on(`nadawcy`.`id_nadawcy` = `paczki`.`id_nadawcy`)) WHERE `nadawcy`.`imie` = 'Tatiana' ;

-- --------------------------------------------------------

--
-- Struktura widoku `4`
--
DROP TABLE IF EXISTS `4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4`  AS SELECT max(`kurierzy`.`staz_pracy`) AS `Najwieksz Staz` FROM `kurierzy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `5`
--
DROP TABLE IF EXISTS `5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `5`  AS SELECT avg(`kurierzy`.`staz_pracy`) AS `Sredni Staz` FROM `kurierzy` ;

-- --------------------------------------------------------

--
-- Struktura widoku `6`
--
DROP TABLE IF EXISTS `6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `6`  AS SELECT count(0) AS `Liczba Paczek` FROM `paczki` ;

-- --------------------------------------------------------

--
-- Struktura widoku `7`
--
DROP TABLE IF EXISTS `7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `7`  AS SELECT count(0) AS `Imie na litere R` FROM `kurierzy` WHERE `kurierzy`.`imie` like 'R%' ;

-- --------------------------------------------------------

--
-- Struktura widoku `8`
--
DROP TABLE IF EXISTS `8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `8`  AS SELECT `pojazdy`.`model` AS `model` FROM (`pojazdy` join `kurierzy` on(`pojazdy`.`id_pojazdu` = `kurierzy`.`id_pojazdu`)) WHERE `kurierzy`.`staz_pracy` > 5 ORDER BY `pojazdy`.`model` ASC ;

-- --------------------------------------------------------

--
-- Struktura widoku `9`
--
DROP TABLE IF EXISTS `9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `9`  AS SELECT count(`kadra`.`rodzaj_pracownika`) AS `Rodzaj Pracownika` FROM `kadra` WHERE `kadra`.`rodzaj_pracownika` = 'Młody Pracownik' ;

-- --------------------------------------------------------

--
-- Struktura widoku `10`
--
DROP TABLE IF EXISTS `10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `10`  AS SELECT count(`kadra`.`rodzaj_pracownika`) AS `COUNT(rodzaj_pracownika)` FROM `kadra` GROUP BY `kadra`.`rodzaj_pracownika` ORDER BY `kadra`.`rodzaj_pracownika` ASC ;

-- --------------------------------------------------------

--
-- Struktura widoku `11`
--
DROP TABLE IF EXISTS `11`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `11`  AS SELECT `odbiorcy`.`imie` AS `imie`, `odbiorcy`.`nazwisko` AS `nazwisko`, `odbiorcy`.`nr_telefonu` AS `nr_telefonu`, `odbiorcy`.`adres` AS `adres` FROM `odbiorcy` WHERE `odbiorcy`.`adres` like '%Siedlce' ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kadra`
--
ALTER TABLE `kadra`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  ADD PRIMARY KEY (`id_kuriera`);

--
-- Indeksy dla tabeli `nadawcy`
--
ALTER TABLE `nadawcy`
  ADD PRIMARY KEY (`id_nadawcy`);

--
-- Indeksy dla tabeli `odbiorcy`
--
ALTER TABLE `odbiorcy`
  ADD PRIMARY KEY (`id_odbiorcy`);

--
-- Indeksy dla tabeli `paczki`
--
ALTER TABLE `paczki`
  ADD PRIMARY KEY (`id_paczki`);

--
-- Indeksy dla tabeli `pojazdy`
--
ALTER TABLE `pojazdy`
  ADD PRIMARY KEY (`id_pojazdu`);

--
-- Indeksy dla tabeli `statystyki`
--
ALTER TABLE `statystyki`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kadra`
--
ALTER TABLE `kadra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `kurierzy`
--
ALTER TABLE `kurierzy`
  MODIFY `id_kuriera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `nadawcy`
--
ALTER TABLE `nadawcy`
  MODIFY `id_nadawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `odbiorcy`
--
ALTER TABLE `odbiorcy`
  MODIFY `id_odbiorcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `paczki`
--
ALTER TABLE `paczki`
  MODIFY `id_paczki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `pojazdy`
--
ALTER TABLE `pojazdy`
  MODIFY `id_pojazdu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `statystyki`
--
ALTER TABLE `statystyki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
