SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Table `StreamScan`.`T_Enterprise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_Enterprise` (
  `PK_Enterprise` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `npa` INT(4) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `version` INT NOT NULL,
  PRIMARY KEY (`PK_Enterprise`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `StreamScan`.`T_Facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_Facility` (
  `PK_Facility` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `npa` INT(4) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `version` INT NOT NULL,
  `FK_Enterprise` INT NOT NULL,
  PRIMARY KEY (`PK_Facility`),
  CONSTRAINT `FK_Enterprise`
    FOREIGN KEY (`FK_Enterprise`)
    REFERENCES `StreamScan`.`T_Enterprise` (`PK_Enterprise`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `StreamScan`.`T_Property_Label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_Property_Label` (
  `PK_Property_Label` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(30) NULL,
  PRIMARY KEY (`PK_Property_Label`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `StreamScan`.`T_System`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_System` (
  `PK_System` INT NOT NULL,
  `FK_Facility` INT NOT NULL,
  `version` INT NOT NULL,
  PRIMARY KEY (`PK_System`),
  CONSTRAINT `FK_Facility`
    FOREIGN KEY (`FK_Facility`)
    REFERENCES `StreamScan`.`T_Facility` (`PK_Facility`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `StreamScan`.`T_System_Property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_System_Property` (
  `FK_System` INT NOT NULL,
  `FK_Property_Label` INT NOT NULL,
  `value` VARCHAR(120) NULL,
  PRIMARY KEY (`FK_System`, `FK_Property_Label`),
  CONSTRAINT `FK_System`
    FOREIGN KEY (`FK_System`)
    REFERENCES `StreamScan`.`T_System` (`PK_System`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Property_Label`
    FOREIGN KEY (`FK_Property_Label`)
    REFERENCES `StreamScan`.`T_Property_Label` (`PK_Property_Label`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `StreamScan`.`T_Component`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_Component` (
  `PK_Component` INT NOT NULL AUTO_INCREMENT,
  `version` VARCHAR(45) NULL,
  `name` VARCHAR(50) NOT NULL,
  `log` TINYINT(1) NULL,
  `FK_System` INT NOT NULL,
  PRIMARY KEY (`PK_Component`),
  CONSTRAINT `FK_System1`
    FOREIGN KEY (`FK_System`)
    REFERENCES `StreamScan`.`T_System` (`PK_System`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `StreamScan`.`T_User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `StreamScan`.`T_User` (
  `PK_User` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`PK_User`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET GLOBAL FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;