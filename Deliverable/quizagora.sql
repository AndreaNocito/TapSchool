-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 29, 2017 alle 18:00
-- Versione del server: 10.1.21-MariaDB
-- Versione PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizagora`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `classi`
--

CREATE TABLE `classi` (
  `ID` int(11) NOT NULL,
  `indirizzo` varchar(40) DEFAULT NULL,
  `anno` int(11) DEFAULT NULL,
  `sezione` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `classi`
--

INSERT INTO `classi` (`ID`, `indirizzo`, `anno`, `sezione`) VALUES
(1, 'Informatica', 5, 'C'),
(2, 'Meccanica', 4, 'A');

-- --------------------------------------------------------

--
-- Struttura della tabella `concetti`
--

CREATE TABLE `concetti` (
  `ID` int(11) NOT NULL,
  `testo` varchar(40) DEFAULT NULL,
  `IDDomandaAperta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `domandeaperte`
--

CREATE TABLE `domandeaperte` (
  `ID` int(11) NOT NULL,
  `risposta` varchar(40) DEFAULT NULL,
  `IDQuiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `domandeaperte`
--

INSERT INTO `domandeaperte` (`ID`, `risposta`, `IDQuiz`) VALUES
(1, 'Alessandro Manzoni', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `domandemultiple`
--

CREATE TABLE `domandemultiple` (
  `ID` int(11) NOT NULL,
  `IDQuiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `domandemultiple`
--

INSERT INTO `domandemultiple` (`ID`, `IDQuiz`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `elencoquestionari`
--

CREATE TABLE `elencoquestionari` (
  `ID` int(11) NOT NULL,
  `IDQuestionario` int(11) DEFAULT NULL,
  `IDClasse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `insegna`
--

CREATE TABLE `insegna` (
  `ID` int(11) NOT NULL,
  `IDProfessore` int(11) DEFAULT NULL,
  `IDClasse` int(11) DEFAULT NULL,
  `IDMateria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `materie`
--

CREATE TABLE `materie` (
  `ID` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `materie`
--

INSERT INTO `materie` (`ID`, `nome`) VALUES
(1, 'Tecnologia'),
(2, 'Matematica');

-- --------------------------------------------------------

--
-- Struttura della tabella `professori`
--

CREATE TABLE `professori` (
  `ID` int(11) NOT NULL,
  `IDUtente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `professori`
--

INSERT INTO `professori` (`ID`, `IDUtente`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `questionari`
--

CREATE TABLE `questionari` (
  `ID` int(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `IDProfessore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `questionari`
--

INSERT INTO `questionari` (`ID`, `nome`, `IDProfessore`) VALUES
(1, 'ordineGenerale', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `quiz`
--

CREATE TABLE `quiz` (
  `ID` int(11) NOT NULL,
  `testo` varchar(40) DEFAULT NULL,
  `tipo` varchar(40) DEFAULT NULL,
  `penalita` float DEFAULT NULL,
  `feedback` varchar(40) DEFAULT NULL,
  `IDQuestionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `quiz`
--

INSERT INTO `quiz` (`ID`, `testo`, `tipo`, `penalita`, `feedback`, `IDQuestionario`) VALUES
(1, 'Le provincie della Liguria sono...', 'Domande Multiple', 0.333333, NULL, 1),
(2, 'La capitale della Spagna ...', 'Domande Multiple', 0.333333, NULL, 1),
(3, 'Chi ha scritto i Promessi Sposi', 'Domande Aperte', 0.333333, 'Facile', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `risposta`
--

CREATE TABLE `risposta` (
  `ID` int(11) NOT NULL,
  `testo` varchar(40) DEFAULT NULL,
  `punteggio` int(11) DEFAULT NULL,
  `IDQuiz` int(11) DEFAULT NULL,
  `IDStudente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `rispostemultiple`
--

CREATE TABLE `rispostemultiple` (
  `ID` int(11) NOT NULL,
  `testo` varchar(40) DEFAULT NULL,
  `punteggio` int(11) DEFAULT NULL,
  `feedback` varchar(40) DEFAULT NULL,
  `corretta` tinyint(1) DEFAULT NULL,
  `IDDomandaMultipla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `rispostemultiple`
--

INSERT INTO `rispostemultiple` (`ID`, `testo`, `punteggio`, `feedback`, `corretta`, `IDDomandaMultipla`) VALUES
(1, 'Genova', 75, 'Esatto', 1, 1),
(2, 'Alessandria', -50, NULL, 0, 1),
(3, 'Avellino', -50, NULL, 0, 1),
(4, 'Imperia', 25, NULL, 1, 1),
(5, 'Barcellona', -100, NULL, 0, 2),
(6, 'Madrid', 100, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `ID` int(11) NOT NULL,
  `IDUtente` int(11) DEFAULT NULL,
  `IDClasse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `studenti`
--

INSERT INTO `studenti` (`ID`, `IDUtente`, `IDClasse`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `ID` int(11) NOT NULL,
  `nomeUtente` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `cognome` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`ID`, `nomeUtente`, `password`, `nome`, `cognome`, `email`, `tipo`) VALUES
(1, 'AndreaBernardo', '5f4dcc3b5aa765d61d8327deb882cf99', 'Andrea', 'Bernardo', 'andrea.bernardo@gmail.com', 'S'),
(2, 'AndreaNocito', '6e6bc4e49dd477ebc98ef4046c067b5f', 'Andrea', 'Nocito', 'andreanocito@gmail.com', 'P');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `concetti`
--
ALTER TABLE `concetti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDDomandaAperta` (`IDDomandaAperta`);

--
-- Indici per le tabelle `domandeaperte`
--
ALTER TABLE `domandeaperte`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDQuiz` (`IDQuiz`);

--
-- Indici per le tabelle `domandemultiple`
--
ALTER TABLE `domandemultiple`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDQuiz` (`IDQuiz`);

--
-- Indici per le tabelle `elencoquestionari`
--
ALTER TABLE `elencoquestionari`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDQuestionario` (`IDQuestionario`),
  ADD KEY `IDClasse` (`IDClasse`);

--
-- Indici per le tabelle `insegna`
--
ALTER TABLE `insegna`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDProfessore` (`IDProfessore`),
  ADD KEY `IDClasse` (`IDClasse`),
  ADD KEY `IDMateria` (`IDMateria`);

--
-- Indici per le tabelle `materie`
--
ALTER TABLE `materie`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `professori`
--
ALTER TABLE `professori`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDUtente` (`IDUtente`);

--
-- Indici per le tabelle `questionari`
--
ALTER TABLE `questionari`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDProfessore` (`IDProfessore`);

--
-- Indici per le tabelle `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDQuestionario` (`IDQuestionario`);

--
-- Indici per le tabelle `risposta`
--
ALTER TABLE `risposta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDQuiz` (`IDQuiz`),
  ADD KEY `IDStudente` (`IDStudente`);

--
-- Indici per le tabelle `rispostemultiple`
--
ALTER TABLE `rispostemultiple`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDDomandaMultipla` (`IDDomandaMultipla`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDUtente` (`IDUtente`),
  ADD KEY `IDClasse` (`IDClasse`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `classi`
--
ALTER TABLE `classi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `concetti`
--
ALTER TABLE `concetti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `domandeaperte`
--
ALTER TABLE `domandeaperte`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `domandemultiple`
--
ALTER TABLE `domandemultiple`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `elencoquestionari`
--
ALTER TABLE `elencoquestionari`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `insegna`
--
ALTER TABLE `insegna`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `materie`
--
ALTER TABLE `materie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `professori`
--
ALTER TABLE `professori`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT per la tabella `questionari`
--
ALTER TABLE `questionari`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `quiz`
--
ALTER TABLE `quiz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT per la tabella `risposta`
--
ALTER TABLE `risposta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la tabella `rispostemultiple`
--
ALTER TABLE `rispostemultiple`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT per la tabella `studenti`
--
ALTER TABLE `studenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `concetti`
--
ALTER TABLE `concetti`
  ADD CONSTRAINT `concetti_ibfk_1` FOREIGN KEY (`IDDomandaAperta`) REFERENCES `domandeaperte` (`ID`);

--
-- Limiti per la tabella `domandeaperte`
--
ALTER TABLE `domandeaperte`
  ADD CONSTRAINT `domandeaperte_ibfk_1` FOREIGN KEY (`IDQuiz`) REFERENCES `quiz` (`ID`);

--
-- Limiti per la tabella `domandemultiple`
--
ALTER TABLE `domandemultiple`
  ADD CONSTRAINT `domandemultiple_ibfk_1` FOREIGN KEY (`IDQuiz`) REFERENCES `quiz` (`ID`);

--
-- Limiti per la tabella `elencoquestionari`
--
ALTER TABLE `elencoquestionari`
  ADD CONSTRAINT `elencoquestionari_ibfk_1` FOREIGN KEY (`IDQuestionario`) REFERENCES `questionari` (`ID`),
  ADD CONSTRAINT `elencoquestionari_ibfk_2` FOREIGN KEY (`IDClasse`) REFERENCES `classi` (`ID`);

--
-- Limiti per la tabella `insegna`
--
ALTER TABLE `insegna`
  ADD CONSTRAINT `insegna_ibfk_1` FOREIGN KEY (`IDProfessore`) REFERENCES `professori` (`ID`),
  ADD CONSTRAINT `insegna_ibfk_2` FOREIGN KEY (`IDClasse`) REFERENCES `classi` (`ID`),
  ADD CONSTRAINT `insegna_ibfk_3` FOREIGN KEY (`IDMateria`) REFERENCES `materie` (`ID`);

--
-- Limiti per la tabella `professori`
--
ALTER TABLE `professori`
  ADD CONSTRAINT `professori_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utenti` (`ID`);

--
-- Limiti per la tabella `questionari`
--
ALTER TABLE `questionari`
  ADD CONSTRAINT `questionari_ibfk_1` FOREIGN KEY (`IDProfessore`) REFERENCES `professori` (`ID`);

--
-- Limiti per la tabella `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`IDQuestionario`) REFERENCES `questionari` (`ID`);

--
-- Limiti per la tabella `risposta`
--
ALTER TABLE `risposta`
  ADD CONSTRAINT `risposta_ibfk_1` FOREIGN KEY (`IDQuiz`) REFERENCES `quiz` (`ID`),
  ADD CONSTRAINT `risposta_ibfk_2` FOREIGN KEY (`IDStudente`) REFERENCES `studenti` (`ID`);

--
-- Limiti per la tabella `rispostemultiple`
--
ALTER TABLE `rispostemultiple`
  ADD CONSTRAINT `rispostemultiple_ibfk_1` FOREIGN KEY (`IDDomandaMultipla`) REFERENCES `domandemultiple` (`ID`);

--
-- Limiti per la tabella `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utenti` (`ID`),
  ADD CONSTRAINT `studenti_ibfk_2` FOREIGN KEY (`IDClasse`) REFERENCES `classi` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
