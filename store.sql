-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema store_cd
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `codigo_cliente` INT NOT NULL AUTO_INCREMENT,
  `telefono` VARCHAR(45) NOT NULL,
  `nombre_cliente` VARCHAR(100) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `nro_DNI` INT NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `fecha_inscripcion` DATETIME NOT NULL,
  `tema_interes` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ALQUILER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ALQUILER` (
  `nro_alquiler` INT NOT NULL AUTO_INCREMENT,
  `codigo_cliente` INT NOT NULL,
  `fecha_alquiler` DATETIME NOT NULL,
  `valor_alquiler` INT NOT NULL,
  PRIMARY KEY (`nro_alquiler`),
  INDEX `FK_ALQUILER_CODIGO_CLIENTE_idx` (`codigo_cliente` ASC) VISIBLE,
  CONSTRAINT `FK_ALQUILER_CODIGO_CLIENTE`
    FOREIGN KEY (`codigo_cliente`)
    REFERENCES `mydb`.`CLIENTE` (`codigo_cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SANCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SANCION` (
  `nro_sancion` INT NOT NULL AUTO_INCREMENT,
  `codigo_cliente` INT NOT NULL,
  `nro_alquiler` INT NOT NULL,
  `tipo_sancion` VARCHAR(45) NOT NULL,
  `nro_dias_sancion` INT NOT NULL,
  PRIMARY KEY (`nro_sancion`),
  INDEX `FK_SANCION_CODIGO_CLIENTE_idx` (`codigo_cliente` ASC) VISIBLE,
  INDEX `FK_SANSION_NRO_ALQUILER_idx` (`nro_alquiler` ASC) VISIBLE,
  CONSTRAINT `FK_SANCION_CODIGO_CLIENTE`
    FOREIGN KEY (`codigo_cliente`)
    REFERENCES `mydb`.`CLIENTE` (`codigo_cliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_SANSION_NRO_ALQUILER`
    FOREIGN KEY (`nro_alquiler`)
    REFERENCES `mydb`.`ALQUILER` (`nro_alquiler`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CD` (
  `codigo_titulo` INT NOT NULL AUTO_INCREMENT,
  `nro_CD` INT NOT NULL,
  `condicion` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_titulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DETALLE_ALQUILER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DETALLE_ALQUILER` (
  `nro_alquiler` INT NOT NULL AUTO_INCREMENT,
  `item` VARCHAR(45) NOT NULL,
  `codigo_titulo` INT NOT NULL,
  `nro_CD` INT NOT NULL,
  `dias_prestamo` INT NOT NULL,
  `fecha_devolucion` DATE NOT NULL,
  PRIMARY KEY (`nro_alquiler`),
  INDEX `FK_DETALLE_ALQUILER_NRO_CD_idx` (`codigo_titulo` ASC) VISIBLE,
  CONSTRAINT `FK_DETALLE_ALQUILETR_NRO_ALQUILER`
    FOREIGN KEY (`nro_alquiler`)
    REFERENCES `mydb`.`ALQUILER` (`nro_alquiler`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_DETALLE_ALQUILER_CODIGO_TITULO`
    FOREIGN KEY (`codigo_titulo`)
    REFERENCES `mydb`.`CD` (`codigo_titulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
