-- MySQL Script generated by MySQL Workbench
-- Fri Aug 16 09:39:46 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Library` ;
USE `Library` ;

-- -----------------------------------------------------
-- Table `Library`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`Book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_name` VARCHAR(45) NOT NULL,
  `book_category` ENUM("Comic", "Novel", "News", "Magazine") NOT NULL,
  `book_code` VARCHAR(45) NOT NULL,
  `book_author` VARCHAR(45) NOT NULL,
  `book_abstract` VARCHAR(45) NULL,
  `book_status` ENUM("Available", "Unvailable") NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE INDEX `book_code_UNIQUE` (`book_code` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `library`.`book` (`book_id`, `book_name`, `book_category`, `book_code`, `book_author`,`book_status`) VALUES 
		('1', 'Stay Night', 'Novel', 'B0001', 'Artoria', 'Available'),
		('2', 'Unlimited Blade Works', 'Comic', 'A0001', 'Ishtar', 'Available'),
		('3', 'Heaven Feel', 'Magazine', 'C0001', 'Parvati', 'Available');


-- -----------------------------------------------------
-- Table `Library`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`Customer` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_firstname` VARCHAR(45) NOT NULL,
  `user_lastname` VARCHAR(45) NOT NULL,
  `user_username` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_username_UNIQUE` (`user_username` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `library`.`customer` (`user_id`, `user_firstname`, `user_lastname`, `user_username`, `user_password`) VALUES 
		('1', 'Atago', 'Choukai', '111', '111'),
		('2', 'Takao', 'Choukai', '222', '222');

-- -----------------------------------------------------
-- Table `Library`.`History`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`History` (
  `history_id` INT NOT NULL AUTO_INCREMENT,
  `history_librarian` VARCHAR(45) NOT NULL,
  `history_customer` VARCHAR(45) NOT NULL,
  `history_borrow` DATETIME NOT NULL,
  `history_return` DATETIME NOT NULL,
  `book_situation` ENUM("Borrow", "Return", "Approve", "Accept") NOT NULL,
  `Book_book_id` INT NOT NULL,
  PRIMARY KEY (`history_id`),
  INDEX `fk_History_Book1_idx` (`Book_book_id` ASC) VISIBLE,
  CONSTRAINT `fk_History_Book1`
    FOREIGN KEY (`Book_book_id`)
    REFERENCES `Library`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`History_has_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`History_has_Customer` (
  `History_history_id` INT NOT NULL,
  `Customer_user_id` INT NOT NULL,
  PRIMARY KEY (`History_history_id`, `Customer_user_id`),
  INDEX `fk_History_has_Customer_Customer1_idx` (`Customer_user_id` ASC) VISIBLE,
  INDEX `fk_History_has_Customer_History1_idx` (`History_history_id` ASC) VISIBLE,
  CONSTRAINT `fk_History_has_Customer_History1`
    FOREIGN KEY (`History_history_id`)
    REFERENCES `Library`.`History` (`history_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_History_has_Customer_Customer1`
    FOREIGN KEY (`Customer_user_id`)
    REFERENCES `Library`.`Customer` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`History_has_Librarian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`History_has_Librarian` (
  `History_history_id` INT NOT NULL,
  `Librarian_user_id` INT NOT NULL,
  PRIMARY KEY (`History_history_id`, `Librarian_user_id`),
  INDEX `fk_History_has_Librarian_Librarian1_idx` (`Librarian_user_id` ASC) VISIBLE,
  INDEX `fk_History_has_Librarian_History1_idx` (`History_history_id` ASC) VISIBLE,
  CONSTRAINT `fk_History_has_Librarian_History1`
    FOREIGN KEY (`History_history_id`)
    REFERENCES `Library`.`History` (`history_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_History_has_Librarian_Librarian1`
    FOREIGN KEY (`Librarian_user_id`)
    REFERENCES `Library`.`Librarian` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`Librarian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`Librarian` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_firstname` VARCHAR(45) NOT NULL,
  `user_lasname` VARCHAR(45) NOT NULL,
  `user_username` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_username_UNIQUE` (`user_username` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO `library`.`librarian` (`user_id`, `user_firstname`, `user_lasname`, `user_username`, `user_password`) VALUES 
('1', 'Zchwazer', 'Zchwarzlanklerz', '3', '3');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;