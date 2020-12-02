-- MySQL Script generated by MySQL Workbench
-- Mon Nov 30 09:55:29 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema veganerLand
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema veganerLand
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `veganerLand` DEFAULT CHARACTER SET utf8 ;
USE `veganerLand` ;

-- -----------------------------------------------------
-- Table `veganerLand`.`PRODUCTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veganerLand`.`PRODUCTS` (
  `PRODID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIP` VARCHAR(50) NOT NULL,
  `CAT` CHAR(1) NOT NULL,
  `STDPRICE` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`PRODID`),
  UNIQUE INDEX `PRODID_UNIQUE` (`PRODID` ASC));


-- -----------------------------------------------------
-- Table `veganerLand`.`ORDERITEMS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veganerLand`.`ORDERITEMS` (
  `ITEMID` INT NOT NULL AUTO_INCREMENT,
  `PRODID` INT NOT NULL,
  `QYT` INT NOT NULL,
  PRIMARY KEY (`ITEMID`),
  UNIQUE INDEX `ITEMID_UNIQUE` (`ITEMID` ASC),
  INDEX `fk_ORDERITEMS_PRODUCTS_idx` (`PRODID` ASC),
  CONSTRAINT `fk_ORDERITEMS_PRODUCTS`
    FOREIGN KEY (`PRODID`)
    REFERENCES `veganerLand`.`PRODUCTS` (`PRODID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `veganerLand`.`ADDRESS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veganerLand`.`ADDRESS` (
  `ADDRESSID` INT NOT NULL AUTO_INCREMENT,
  `STREET` VARCHAR(50) NOT NULL,
  `NUMBER` INT NOT NULL,
  `ZIP` CHAR(5) NOT NULL,
  `CITY` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ADDRESSID`),
  UNIQUE INDEX `ADDRESSID_UNIQUE` (`ADDRESSID` ASC));


-- -----------------------------------------------------
-- Table `veganerLand`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veganerLand`.`CUSTOMER` (
  `CUSTID` INT NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` VARCHAR(45) NOT NULL,
  `LASTNAME` VARCHAR(45) NOT NULL,
  `ADDRESSID` INT NOT NULL,
  `EMAIL` VARCHAR(150) NOT NULL,
  `PHONE1` VARCHAR(20) NOT NULL,
  `PHONE2` VARCHAR(20) NULL,
  `PASSWORD` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`CUSTID`),
  UNIQUE INDEX `CUSTID_UNIQUE` (`CUSTID` ASC),
  INDEX `fk_CUSTOMER_ADDRESS1_idx` (`ADDRESSID` ASC),
  CONSTRAINT `fk_CUSTOMER_ADDRESS1`
    FOREIGN KEY (`ADDRESSID`)
    REFERENCES `veganerLand`.`ADDRESS` (`ADDRESSID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `veganerLand`.`ORDERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veganerLand`.`ORDERS` (
  `ORDERID` INT NOT NULL AUTO_INCREMENT,
  `ITEMID` INT NOT NULL,
  `CUSTID` INT NOT NULL,
  `ORDERDATE` DATETIME NOT NULL,
  `SHIPDATE` DATETIME NULL,
  PRIMARY KEY (`ORDERID`),
  UNIQUE INDEX `ORDERID_UNIQUE` (`ORDERID` ASC),
  INDEX `fk_ORDERS_ORDERITEMS1_idx` (`ITEMID` ASC),
  INDEX `fk_ORDERS_CUSTOMER1_idx` (`CUSTID` ASC),
  CONSTRAINT `fk_ORDERS_ORDERITEMS1`
    FOREIGN KEY (`ITEMID`)
    REFERENCES `veganerLand`.`ORDERITEMS` (`ITEMID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDERS_CUSTOMER1`
    FOREIGN KEY (`CUSTID`)
    REFERENCES `veganerLand`.`CUSTOMER` (`CUSTID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
