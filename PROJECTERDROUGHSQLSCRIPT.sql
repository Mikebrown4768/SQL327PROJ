SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PolishITPostings
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS PolishITPostings;

-- -----------------------------------------------------
-- Schema PolishITPostings
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS PolishITPostings DEFAULT CHARACTER SET utf8;
USE PolishITPostings;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Location;

CREATE TABLE IF NOT EXISTS Location (
  Location_ID INT NOT NULL,
  city_name VARCHAR(45) NULL,
  Country_code VARCHAR(45) NULL,
  PRIMARY KEY (Location_ID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Marker_Icon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Marker_Icon;

CREATE TABLE IF NOT EXISTS Marker_Icon (
  Marker_Icon_ID INT NOT NULL,
  Marker_Icon VARCHAR(45) NULL,
  PRIMARY KEY (Marker_Icon_ID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Experience_Level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Experience_Level;

CREATE TABLE IF NOT EXISTS Experience_Level (
  Experience_Level_ID INT NOT NULL,
  Experience_Level VARCHAR(45) NULL,
  PRIMARY KEY (Experience_Level_ID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Skills;

CREATE TABLE IF NOT EXISTS Skills (
  Skill_ID INT NOT NULL,
  Skill_Name VARCHAR(45) NULL,
  Skill_Value VARCHAR(45) NULL,
  PRIMARY KEY (Skill_ID)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Job_Posting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Job_Posting;

CREATE TABLE IF NOT EXISTS Job_Posting (
  Job_ID INT NOT NULL,
  Company_Size_ID INT NOT NULL,
  Title VARCHAR(45) NULL,
  Location_ID INT NULL,
  Workplace_Type VARCHAR(45) NULL,
  Experience_Level_ID INT NULL,
  Published_At VARCHAR(45) NULL,
  Remote_Interview VARCHAR(45) NULL,
  Remote VARCHAR(45) NULL,
  Open_To_Hire_Ukrainians VARCHAR(45) NULL,
  Contract_Type VARCHAR(45) NULL,
  Marker_Icon_ID INT NULL,
  PRIMARY KEY (Job_ID, Company_Size_ID),
  INDEX Location_ID_idx (Location_ID ASC) VISIBLE,
  INDEX Experience_Level_ID_idx (Experience_Level_ID ASC) VISIBLE,
  INDEX Marker_Icon_ID_idx (Marker_Icon_ID ASC) VISIBLE,
  CONSTRAINT fk_Job_Posting_Location_ID
    FOREIGN KEY (Location_ID)
    REFERENCES Location (Location_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Job_Posting_Experience_Level_ID
    FOREIGN KEY (Experience_Level_ID)
    REFERENCES Experience_Level (Experience_Level_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Job_Posting_Marker_Icon_ID
    FOREIGN KEY (Marker_Icon_ID)
    REFERENCES Marker_Icon (Marker_Icon_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Job_Skill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Job_Skill;

CREATE TABLE IF NOT EXISTS Job_Skill (
  Job_ID INT NOT NULL,
  Skill_ID INT NOT NULL,
  PRIMARY KEY (Job_ID, Skill_ID),
  INDEX Skill_ID_idx (Skill_ID ASC) VISIBLE,
  CONSTRAINT fk_Job_Skill_Job_ID
    FOREIGN KEY (Job_ID)
    REFERENCES Job_Posting (Job_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Job_Skill_Skill_ID
    FOREIGN KEY (Skill_ID)
    REFERENCES Skills (Skill_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Job_Skill_Values`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Job_Skill_Values;

CREATE TABLE IF NOT EXISTS Job_Skill_Values (
  Job_ID INT NOT NULL,
  Skill_Value_ID INT NOT NULL,
  PRIMARY KEY (Job_ID, Skill_Value_ID),
  INDEX Skill_Value_ID_idx (Skill_Value_ID ASC) VISIBLE,
  CONSTRAINT fk_Job_Skill_Values_Job_ID
    FOREIGN KEY (Job_ID)
    REFERENCES Job_Posting (Job_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Job_Skill_Values_Skill_Value_ID
    FOREIGN KEY (Skill_Value_ID)
    REFERENCES Skills (Skill_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Salary;

CREATE TABLE IF NOT EXISTS Salary (
  Salary_Type_ID INT NOT NULL AUTO_INCREMENT,
  Job_ID INT NOT NULL,
  Contract_Type VARCHAR(45) NULL,
  Salary_From VARCHAR(45) NULL,
  Salary_To VARCHAR(45) NULL,
  Salary_Currency VARCHAR(45) NULL,
  PRIMARY KEY (Salary_Type_ID),
  INDEX Job_ID_idx (Job_ID ASC) VISIBLE,
  CONSTRAINT fk_Salary_Job_ID
    FOREIGN KEY (Job_ID)
    REFERENCES Job_Posting (Job_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PolishITPostings`.`Company_Size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS Company_Size;

CREATE TABLE IF NOT EXISTS Company_Size (
  Company_Size_ID INT NOT NULL AUTO_INCREMENT,
  Job_ID INT NOT NULL,
  Company_Size_From VARCHAR(45) NULL,
  Company_Size_To VARCHAR(45) NULL,
  PRIMARY KEY (Company_Size_ID),
  CONSTRAINT fk_Company_Size_Job_ID
    FOREIGN KEY (Job_ID)
    REFERENCES Job_Posting (Job_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
