-- MySQL Script generated by MySQL Workbench
-- Mon Jun  2 11:53:40 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sistema_ventas_4e
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistema_ventas_4e
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistema_ventas_4e` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sistema_ventas_4e` ;

-- -----------------------------------------------------
-- Table `sistema_ventas_4e`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4e`.`productos` (
  `id_productos` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(100) NOT NULL,
  `precio_producto` FLOAT NOT NULL,
  `stock_producto` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id_productos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4e`.`tipo_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4e`.`tipo_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(50) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4e`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4e`.`ventas` (
  `id_ventas` INT NOT NULL AUTO_INCREMENT,
  `tipo_usuario_id` INT NOT NULL,
  `fechas_venta` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id_ventas`),
  INDEX `fk_ventas_tipo_usuario` (`tipo_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_tipo_usuario`
    FOREIGN KEY (`tipo_usuario_id`)
    REFERENCES `sistema_ventas_4e`.`tipo_usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4e`.`detalle_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4e`.`detalle_ventas` (
  `id_detalle_venta` INT NOT NULL AUTO_INCREMENT,
  `id_ventas` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unitario` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id_detalle_venta`),
  INDEX `fk_detalle_ventas_ventas` (`id_ventas` ASC) VISIBLE,
  INDEX `fk_detalle_ventas_producto` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_ventas_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `sistema_ventas_4e`.`productos` (`id_productos`),
  CONSTRAINT `fk_detalle_ventas_ventas`
    FOREIGN KEY (`id_ventas`)
    REFERENCES `sistema_ventas_4e`.`ventas` (`id_ventas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sistema_ventas_4e`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistema_ventas_4e`.`usuarios` (
  `id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NULL DEFAULT NULL,
  `tipo_usuario_id` INT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` INT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `deleted` TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE INDEX `correo` (`correo` ASC) VISIBLE,
  INDEX `fk_usuario_tipo_usuario` (`tipo_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_tipo_usuario`
    FOREIGN KEY (`tipo_usuario_id`)
    REFERENCES `sistema_ventas_4e`.`tipo_usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE tipo_usuarios 
CHANGE COLUMN `descripcion_tipo` `descripcion_tipo` VARCHAR(200) NOT NULL AFTER `nombre_tipo`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

alter table productos
change column stock_producto stock int AFTER precio_producto;

alter table usuarios
change column nombre_tipo nombre_usuario varchar(100) not null;


ALTER TABLE usuarios  -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuarios_tipo
-- Añade referencia(FK)
FOREIGN KEY (venta_id) REFERENCES
ventas(id_ventas);


ALTER TABLE ventas
DROP FOREIGN KEY `fk_ventas_tipo_usuario`;
ALTER TABLE `sistema_ventas_4e`.`ventas` 
CHANGE COLUMN `tipo_usuario_id` `usuario_id` INT NOT NULL ,
CHANGE COLUMN `fechas_venta` `fecha` DATETIME NULL DEFAULT NULL ;
ALTER TABLE `sistema_ventas_4e`.`ventas` 
ADD CONSTRAINT `fk_ventas_tipo_usuario`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `sistema_ventas_4e`.`tipo_usuarios` (`id`);
