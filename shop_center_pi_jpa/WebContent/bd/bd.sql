-- MySQL Script generated by MySQL Workbench
-- Sun Dec  9 11:28:52 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shoponlinedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `shoponlinedb` ;

-- -----------------------------------------------------
-- Schema shoponlinedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shoponlinedb` DEFAULT CHARACTER SET latin1 ;
USE `shoponlinedb` ;

-- -----------------------------------------------------
-- Table `shoponlinedb`.`tb_categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoponlinedb`.`tb_categoria` ;

CREATE TABLE IF NOT EXISTS `shoponlinedb`.`tb_categoria` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `shoponlinedb`.`tb_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoponlinedb`.`tb_user` ;

CREATE TABLE IF NOT EXISTS `shoponlinedb`.`tb_user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_firstname` VARCHAR(40) NULL DEFAULT NULL,
  `user_lastname` VARCHAR(40) NULL DEFAULT NULL,
  `foto` LONGBLOB NULL DEFAULT NULL,
  `user_name` VARCHAR(20) NULL DEFAULT NULL,
  `user_email` VARCHAR(50) NULL DEFAULT NULL,
  `user_password` VARCHAR(20) NULL DEFAULT NULL,
  `user_mobil` CHAR(9) NULL DEFAULT NULL,
  `user_movil2` CHAR(6) NULL DEFAULT NULL,
  `user_addres` VARCHAR(100) NULL DEFAULT NULL,
  `categoria_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `categoria_id` (`categoria_id` ASC),
  CONSTRAINT `tb_user_ibfk_1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `shoponlinedb`.`tb_categoria` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `shoponlinedb`.`tb_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoponlinedb`.`tb_company` ;

CREATE TABLE IF NOT EXISTS `shoponlinedb`.`tb_company` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(50) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `ruc` CHAR(11) NULL DEFAULT NULL,
  `foto` LONGBLOB NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC),
  CONSTRAINT `tb_company_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shoponlinedb`.`tb_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `shoponlinedb`.`tb_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shoponlinedb`.`tb_producto` ;

CREATE TABLE IF NOT EXISTS `shoponlinedb`.`tb_producto` (
  `id` INT(5) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `stock` INT(5) NULL DEFAULT NULL,
  `foto_pro` MEDIUMBLOB NULL DEFAULT NULL,
  `empresa_id` INT(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `empresa_id` (`empresa_id` ASC),
  CONSTRAINT `tb_producto_ibfk_1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `shoponlinedb`.`tb_company` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
