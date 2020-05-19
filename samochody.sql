-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Maj 2020, 20:24
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `samochody`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posiada`
--

CREATE TABLE `posiada` (
  `pesel` int(11) NOT NULL,
  `vin` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `posiada`
--

INSERT INTO `posiada` (`pesel`, `vin`) VALUES
(1236488234, 'VS353J52N52JKJO57'),
(1236488234, 'WF05XXGCD56U79743'),
(1239549335, 'WAUZZZ8LZVA097418'),
(1239549335, 'WVWZZZ16ZCM140910'),
(1274588775, '1FMCU9G96EUB87590'),
(1274588775, 'WAUZZZ8LZVA097418');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `samochód`
--

CREATE TABLE `samochód` (
  `marka` varchar(20) NOT NULL,
  `model` varchar(15) NOT NULL,
  `kolor` varchar(10) NOT NULL,
  `vin` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `samochód`
--

INSERT INTO `samochód` (`marka`, `model`, `kolor`, `vin`) VALUES
('Opel', 'Astra', 'Srebrny', '1FMCU9G96EUB87590'),
('Mercedes', 'G klasa', 'Srebrny ', 'VS353J52N52JKJO57'),
('Audi', 'RS6', 'Szary', 'WAUZZZ8LZVA097418'),
('Ford', 'Mustang', 'Czerwony', 'WF05XXGCD56U79743'),
('VOLKSWAGEN', 'Polo', 'Zielony', 'WVWZZZ16ZCM140910'),
('Volkswagen', 'Passat', 'Czarny', 'WVWZZZ3CZEE101466');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlasciciel`
--

CREATE TABLE `wlasciciel` (
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `pesel` int(11) NOT NULL,
  `rok urodzenia` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wlasciciel`
--

INSERT INTO `wlasciciel` (`imie`, `nazwisko`, `pesel`, `rok urodzenia`) VALUES
('Piotr', 'Morningwood', 1236488234, 2001),
('Kamil', 'Morningwood', 1239549335, 1976),
('Mateusz', 'Michalski', 1274588775, 1998);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `posiada`
--
ALTER TABLE `posiada`
  ADD KEY `pesel` (`pesel`,`vin`);

--
-- Indeksy dla tabeli `samochód`
--
ALTER TABLE `samochód`
  ADD PRIMARY KEY (`vin`);

--
-- Indeksy dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  ADD PRIMARY KEY (`pesel`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `posiada`
--
ALTER TABLE `posiada`
  ADD CONSTRAINT `pesel` FOREIGN KEY (`pesel`) REFERENCES `wlasciciel` (`pesel`),
  ADD CONSTRAINT `vin` FOREIGN KEY (`vin`) REFERENCES `samochód` (`vin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
