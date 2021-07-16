-- -----------------------------------------------------
-- Table `instance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance` ;

CREATE TABLE IF NOT EXISTS `instance` (
  `instanceid` VARCHAR(36) NOT NULL,
  `instancetype` VARCHAR(36) NOT NULL,
  `code` VARCHAR(36) NULL,
  PRIMARY KEY (`instanceid`));




-- -----------------------------------------------------
-- Table `referentiel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `referentiel` ;

CREATE TABLE IF NOT EXISTS `referentiel` (
  `referentielid` VARCHAR(36) NOT NULL,
  `code` VARCHAR(45) NULL,
  PRIMARY KEY (`referentielid`))
;


-- -----------------------------------------------------
-- Table `concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concept` ;

CREATE TABLE IF NOT EXISTS `concept` (
  `conceptid` VARCHAR(36) NOT NULL,
  `code` VARCHAR(10) NULL,
  `referentielid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`conceptid`),
  
  CONSTRAINT `fk_concept_1`
    FOREIGN KEY (`referentielid`)
    REFERENCES `referentiel` (`referentielid`)
    
    )
;


-- -----------------------------------------------------
-- Table `referentiel_text`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `referentiel_text` ;

CREATE TABLE IF NOT EXISTS `referentiel_text` (
  `textid` VARCHAR(36) NOT NULL,
  `texttype` VARCHAR(45) NOT NULL,
  `textlang` VARCHAR(45) NULL,
  `textvalue` VARCHAR(45) NOT NULL,
  `referentielid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`textid`),
  
  CONSTRAINT `fk_referentielid`
    FOREIGN KEY (`referentielid`)
    REFERENCES `referentiel` (`referentielid`)
    
    )
;


-- -----------------------------------------------------
-- Table `instance_identifier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_identifier` ;

CREATE TABLE IF NOT EXISTS `instance_identifier` (
  `identifierid` VARCHAR(36) NOT NULL,
  `identifiertype` VARCHAR(45) NOT NULL,
  `identifiervalue` VARCHAR(45) NOT NULL,
  `instanceid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`identifierid`),
  
  CONSTRAINT `fk_instance_identifier_1`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )


;

-- -----------------------------------------------------
-- Table `concept_text`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concept_text` ;

CREATE TABLE IF NOT EXISTS `concept_text` (
  `textid` VARCHAR(36) NOT NULL,
  `textlang` VARCHAR(45) NULL,
  `texttype` VARCHAR(45) NOT NULL,
  `textvalue` VARCHAR(45) NOT NULL,
  `conceptid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`textid`),
  
  CONSTRAINT `fk_concept_text_1`
    FOREIGN KEY (`conceptid`)
    REFERENCES `concept` (`conceptid`)
    
    )
;


-- -----------------------------------------------------
-- Table `instance_concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_concept` ;

CREATE TABLE IF NOT EXISTS `instance_concept` (
  `instanceid` VARCHAR(36) NOT NULL,
  `conceptid` VARCHAR(36) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_instance_concept_1`     FOREIGN KEY (`conceptid`)     REFERENCES `concept` (`conceptid`)
    , CONSTRAINT fk2 FOREIGN KEY (instanceid)    REFERENCES `instance` (`instanceid`)
    )
;


-- -----------------------------------------------------
-- Table `instance_instance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_instance` ;

CREATE TABLE IF NOT EXISTS `instance_instance` (
  `sourceinstanceid` VARCHAR(36) NOT NULL,
  `targetinstanceid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,  
  CONSTRAINT `fk_instance_instance_1`
    FOREIGN KEY (`sourceinstanceid`)
    REFERENCES `instance` (`instanceid`),
	CONSTRAINT `fk_instance_instance_2`
    FOREIGN KEY (`targetinstanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )


;

-- -----------------------------------------------------
-- Table `instance_text`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_text` ;

CREATE TABLE IF NOT EXISTS `instance_text` (
  `textid` VARCHAR(36) NOT NULL,
  `texttype` VARCHAR(45) NOT NULL,
  `textlang` VARCHAR(45) NULL,
  `instanceid` VARCHAR(45) NOT NULL,
  `textvalue` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`textid`),
  
  CONSTRAINT `fk_instance_text_1`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )
;


-- -----------------------------------------------------
-- Table `agent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agent` ;

CREATE TABLE IF NOT EXISTS `agent` (
  `agentid` VARCHAR(36) NOT NULL,
  `agenttype` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`agentid`))
;


-- -----------------------------------------------------
-- Table `agent_text`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agent_text` ;

CREATE TABLE IF NOT EXISTS `agent_text` (
  `textid` VARCHAR(36) NOT NULL,
  `texttype` VARCHAR(45) NOT NULL,
  `textvalue` VARCHAR(45) NOT NULL,
  `textlang` VARCHAR(45) NULL,
  `agentid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`textid`),
  
  CONSTRAINT `fk_agent_text_1`
    FOREIGN KEY (`agentid`)
    REFERENCES `agent` (`agentid`)
    
    )
;


-- -----------------------------------------------------
-- Table `instance_agent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_agent` ;

CREATE TABLE IF NOT EXISTS `instance_agent` (
  `instanceid` VARCHAR(36) NOT NULL,
  `agentid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NULL,
  
  
  CONSTRAINT `fk_instance_agent_1`
    FOREIGN KEY (`agentid`)
    REFERENCES `agent` (`agentid`),CONSTRAINT `fk_instance_agent_2`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )
;


-- -----------------------------------------------------
-- Table `evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evenement` ;

CREATE TABLE IF NOT EXISTS `evenement` (
  `evenementid` VARCHAR(36) NOT NULL,
  `evenementtype` VARCHAR(45) NOT NULL,
  `datedebut` DATETIME NULL,
  `datefin` DATETIME NULL,
  PRIMARY KEY (`evenementid`))

;


-- -----------------------------------------------------
-- Table `instance_evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_evenement` ;

CREATE TABLE IF NOT EXISTS `instance_evenement` (
  `instanceid` VARCHAR(36) NOT NULL,
  `evenementid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,
  
  
  CONSTRAINT `fk_instance_evenement_1`
    FOREIGN KEY (`evenementid`)
    REFERENCES `evenement` (`evenementid`),
	CONSTRAINT `fk_instance_evenement_2`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )

;


-- -----------------------------------------------------
-- Table `agent_evenement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agent_evenement` ;

CREATE TABLE IF NOT EXISTS `agent_evenement` (
  `agentid` VARCHAR(36) NOT NULL,
  `evenementid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,
  
  
  CONSTRAINT `fk_agent_evenement_1`
    FOREIGN KEY (`agentid`)
    REFERENCES `agent` (`agentid`),
	CONSTRAINT `fk_agent_evenement_2`
    FOREIGN KEY (`evenementid`)
    REFERENCES `evenement` (`evenementid`)
    
    )
;


-- -----------------------------------------------------
-- Table `activite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activite` ;

CREATE TABLE IF NOT EXISTS `activite` (
  `activiteid` VARCHAR(36) NOT NULL,
  `activittetype` VARCHAR(45) NOT NULL,
  `activitedate` DATETIME NOT NULL,
  `activitecomment`VARCHAR(50) NULL,
  `agentid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`activiteid`),
  CONSTRAINT `fk_activite_1`
    FOREIGN KEY (`agentid`)
    REFERENCES `agent` (`agentid`)
    )
;


-- -----------------------------------------------------
-- Table `instance_activite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instance_activite` ;

CREATE TABLE IF NOT EXISTS `instance_activite` (
  `instanceid` VARCHAR(36) NOT NULL,
  `activiteid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,
  
  
  CONSTRAINT `fk_instance_activite_1`
    FOREIGN KEY (`activiteid`)
    REFERENCES `activite` (`activiteid`),
	CONSTRAINT `fk_instance_activite_2`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )
;


-- -----------------------------------------------------
-- Table `adresse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adresse` ;

CREATE TABLE IF NOT EXISTS `adresse` (
  `adresseid` VARCHAR(36) NOT NULL,
  `adressetype` VARCHAR(45) NOT NULL,
  `rue` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `ville` VARCHAR(45) NULL,
  `departement` VARCHAR(45) NULL,
  `instanceid` VARCHAR(45) NOT NULL,
  `arrondissement` INT NULL,
  PRIMARY KEY (`adresseid`),
  
  
  
  
  CONSTRAINT `fk_rue`
    FOREIGN KEY (`rue`)
    REFERENCES `concept` (`conceptid`),
	CONSTRAINT `fk_ville`
    FOREIGN KEY (`ville`)
    REFERENCES `concept` (`conceptid`),
	CONSTRAINT `fk_dpt`
    FOREIGN KEY (`departement`)
    REFERENCES `concept` (`conceptid`),
	CONSTRAINT `fk_instance`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )
;


-- -----------------------------------------------------
-- Table `geolocalisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `geolocalisation` ;

CREATE TABLE IF NOT EXISTS `geolocalisation` (
  `geolocalisationid` VARCHAR(36) NOT NULL,
  `latitude` REAL NOT NULL,
  `longitude` REAL NOT NULL,
  `instanceid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`geolocalisationid`),
  
  CONSTRAINT `fk_geolocalisation_1`
    FOREIGN KEY (`instanceid`)
    REFERENCES `instance` (`instanceid`)
    
    )
;


-- -----------------------------------------------------
-- Table `synthese`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `synthese` ;

CREATE TABLE IF NOT EXISTS `synthese` (
  `syntheseid` VARCHAR(36) NOT NULL,
  `agentid` VARCHAR(45) NOT NULL,
  `synthesetype` VARCHAR(45) NULL,
  PRIMARY KEY (`syntheseid`),
  
  CONSTRAINT `fk_synthese_1`
    FOREIGN KEY (`agentid`)
    REFERENCES `agent` (`agentid`)
    
    )

;


-- -----------------------------------------------------
-- Table `droit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `droit` ;

CREATE TABLE IF NOT EXISTS `droit` (
  `droitid` VARCHAR(36) NOT NULL,
  `droittype` VARCHAR(45) NOT NULL,
  `datedebut` DATETIME NULL,
  `datefin` DATETIME NULL,
  PRIMARY KEY (`droitid`))


;

-- -----------------------------------------------------
-- Table `synthese_droit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `synthese_droit` ;

CREATE TABLE IF NOT EXISTS `synthese_droit` (
  `syntheseid` VARCHAR(36) NOT NULL,
  `droitid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NULL,
  
  
  CONSTRAINT `fk_synthese_droit_1`
    FOREIGN KEY (`droitid`)
    REFERENCES `droit` (`droitid`),
	CONSTRAINT `fk_synthese_droit_2`
    FOREIGN KEY (`syntheseid`)
    REFERENCES `synthese` (`syntheseid`)
    
    )
;


-- -----------------------------------------------------
-- Table `droit_concept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `droit_concept` ;

CREATE TABLE IF NOT EXISTS `droit_concept` (
  `droitid` VARCHAR(36) NOT NULL,
  `conceptid` VARCHAR(36) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,
  
  
  CONSTRAINT `fk_droit_concept_1`
    FOREIGN KEY (`conceptid`)
    REFERENCES `concept` (`conceptid`),
	CONSTRAINT `fk_droit_concept_2`
    FOREIGN KEY (`droitid`)
    REFERENCES `droit` (`droitid`)
    
    )
;


-- -----------------------------------------------------
-- Table `droit_text`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `droit_text` ;

CREATE TABLE IF NOT EXISTS `droit_text` (
  `textid` VARCHAR(36) NOT NULL,
  `textlang` VARCHAR(45) NULL,
  `texttype` VARCHAR(45) NOT NULL,
  `textvalue` VARCHAR(45) NOT NULL,
  `droitid` VARCHAR(45) NULL,
  PRIMARY KEY (`textid`),
  
  CONSTRAINT `fk_droit_text_1`
    FOREIGN KEY (`droitid`)
    REFERENCES `droit` (`droitid`)
    
    )
;


-- -----------------------------------------------------
-- Table `synthese_activite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `synthese_activite` ;

CREATE TABLE IF NOT EXISTS `synthese_activite` (
  `syntheseid` VARCHAR(36) NOT NULL,
  `activiteid` VARCHAR(45) NOT NULL,
  `relationtype` VARCHAR(45) NOT NULL,
  
  
  CONSTRAINT `fk_instance_activite_10`
    FOREIGN KEY (`activiteid`)
    REFERENCES `activite` (`activiteid`),
	CONSTRAINT `fk_instance_activite_12`
    FOREIGN KEY (`syntheseid`)
    REFERENCES `synthese` (`syntheseid`)
    
    )
;

