CREATE TABLE IF NOT EXIST `Utenti`(
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`NomeUtente` VARCHAR(25) NOT NULL,
	`Password` VARCHAR(30) NOT NULL,
	`Nome` VARCHAR(25) NOT NULL,
	`Cognome` VARCHAR(25) NOT NULL,
	`Email` VARCHAR(40) NOT NULL,
	`Tipo` CHAR(1) NOT NULL,
	PRIMARY KEY(`Id`)
);

CREATE TABLE IF NOT EXIST `Professori`(
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`Materia` VARCHAR(15) NOT NULL,
	`Lotto1` BIT,
	`Lotto2` BIT,
	`Lotto3` BIT,
	`Utente` INT(11) NOT NULL,
	PRIMARY KEY(`Id`),
	FOREIGN KEY (`Utente`) REFERENCES Utenti(`Id`)
);

CREATE TABLE IF NOT EXIST `Studenti`(
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`Classe` INT(1) NOT NULL,
	`Sezione` CHAR(1) NOT NULL,
	`indirizzo` VARCHAR(4),
	`Utente` INT(11) NOT NULL,
	PRIMARY KEY(`Id`),
	CHECK((`Classe` >= 1) AND (`Classe` <= 5)),
	FOREIGN KEY (`Utente`) REFERENCES Utenti(`Id`)
);