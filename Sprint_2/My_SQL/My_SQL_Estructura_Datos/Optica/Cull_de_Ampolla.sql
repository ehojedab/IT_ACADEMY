-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cul_de_Ampolla
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Cul_de_Ampolla` ;

-- -----------------------------------------------------
-- Schema Cul_de_Ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul_de_Ampolla` DEFAULT CHARACTER SET utf8 ;
USE `Cul_de_Ampolla` ;

-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Direccion` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Direccion` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `piso` VARCHAR(45) NOT NULL,
  `puerta` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigoPostal` INT NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `fax` INT NULL,
  `idDireccion` INT NOT NULL,
  PRIMARY KEY (`idProveedor`, `idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Marca` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `idProveedor` INT NOT NULL,
  PRIMARY KEY (`idMarca`, `idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Montura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Montura` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Montura` (
  `idMontura` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMontura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Gafas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Gafas` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Gafas` (
  `idGafas` INT NOT NULL AUTO_INCREMENT,
  `graIzq` FLOAT NOT NULL,
  `graDer` FLOAT NOT NULL,
  `colorIzq` VARCHAR(45) NOT NULL,
  `colorDer` VARCHAR(45) NOT NULL,
  `colorMontura` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `idMarca` INT NOT NULL,
  `idMontura` INT NOT NULL,
  PRIMARY KEY (`idGafas`, `idMarca`, `idMontura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `codigPostal` INT NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `idReferido` INT NULL,
  `fechaRegistro` DATE NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Vendedor` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedor`, `nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul_de_Ampolla`.`Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cul_de_Ampolla`.`Compra` ;

CREATE TABLE IF NOT EXISTS `Cul_de_Ampolla`.`Compra` (
  `idCompra` INT NOT NULL AUTO_INCREMENT,
  `fechaVenta` DATE NOT NULL,
  `idVendedor` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idGafas` INT NOT NULL,
  PRIMARY KEY (`idCompra`, `idGafas`, `idCliente`, `idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Direccion`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Direccion` (`idDireccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigoPostal`, `pais`) VALUES (1, 'princep de viana ', 14, 'atico', '1', 'barcelona', 08001, 'españa');
INSERT INTO `Cul_de_Ampolla`.`Direccion` (`idDireccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigoPostal`, `pais`) VALUES (2, 'gran via', 678, '3', 'a', 'madrid', 28012, 'españa');
INSERT INTO `Cul_de_Ampolla`.`Direccion` (`idDireccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigoPostal`, `pais`) VALUES (3, 'av perez prado', 1234, 'bajo', '3', 'malaga', 09201, 'españa');
INSERT INTO `Cul_de_Ampolla`.`Direccion` (`idDireccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigoPostal`, `pais`) VALUES (4, 'ronda sant antoni', 23, 'principal', 'b', 'barcelona', 23086, 'españa');
INSERT INTO `Cul_de_Ampolla`.`Direccion` (`idDireccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `codigoPostal`, `pais`) VALUES (5, 'ample', 107, '4', '2', 'gijon', 03867, 'españa');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Proveedor` (`idProveedor`, `nombre`, `telefono`, `nif`, `fax`, `idDireccion`) VALUES (1, 'gafas monroe', 602467112, '123456y', 90023454, 1);
INSERT INTO `Cul_de_Ampolla`.`Proveedor` (`idProveedor`, `nombre`, `telefono`, `nif`, `fax`, `idDireccion`) VALUES (2, 'internacional de lentes', 678900231, '678901s', 90014312, 2);
INSERT INTO `Cul_de_Ampolla`.`Proveedor` (`idProveedor`, `nombre`, `telefono`, `nif`, `fax`, `idDireccion`) VALUES (3, 'importadora america', 678123098, '578235q', 90065411, 3);
INSERT INTO `Cul_de_Ampolla`.`Proveedor` (`idProveedor`, `nombre`, `telefono`, `nif`, `fax`, `idDireccion`) VALUES (4, 'comercial de lentes y monturas', 643267009, '819253o', 90023232, 4);
INSERT INTO `Cul_de_Ampolla`.`Proveedor` (`idProveedor`, `nombre`, `telefono`, `nif`, `fax`, `idDireccion`) VALUES (5, 'china lents', 672912176, '675283t', 90021751, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Marca`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Marca` (`idMarca`, `nombre`, `idProveedor`) VALUES (1, 'Rayban', 1);
INSERT INTO `Cul_de_Ampolla`.`Marca` (`idMarca`, `nombre`, `idProveedor`) VALUES (2, 'Oakley', 2);
INSERT INTO `Cul_de_Ampolla`.`Marca` (`idMarca`, `nombre`, `idProveedor`) VALUES (3, 'Polaroid ', 1);
INSERT INTO `Cul_de_Ampolla`.`Marca` (`idMarca`, `nombre`, `idProveedor`) VALUES (4, ' Tous', 3);
INSERT INTO `Cul_de_Ampolla`.`Marca` (`idMarca`, `nombre`, `idProveedor`) VALUES (5, ' Police', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Montura`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Montura` (`idMontura`, `nombre`) VALUES (1, 'flotante');
INSERT INTO `Cul_de_Ampolla`.`Montura` (`idMontura`, `nombre`) VALUES (2, 'pasta ');
INSERT INTO `Cul_de_Ampolla`.`Montura` (`idMontura`, `nombre`) VALUES (3, 'metalica');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Gafas`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Gafas` (`idGafas`, `graIzq`, `graDer`, `colorIzq`, `colorDer`, `colorMontura`, `precio`, `idMarca`, `idMontura`) VALUES (1, 0.25, 0.0, 'azul', 'azul', 'rojo', 120, 1, 1);
INSERT INTO `Cul_de_Ampolla`.`Gafas` (`idGafas`, `graIzq`, `graDer`, `colorIzq`, `colorDer`, `colorMontura`, `precio`, `idMarca`, `idMontura`) VALUES (2, 0.75, 0.50, 'blanco', 'blanco', 'cafe', 230, 3, 3);
INSERT INTO `Cul_de_Ampolla`.`Gafas` (`idGafas`, `graIzq`, `graDer`, `colorIzq`, `colorDer`, `colorMontura`, `precio`, `idMarca`, `idMontura`) VALUES (3, 1.0, 1.25, 'verde', 'verde', 'negro', 180, 4, 3);
INSERT INTO `Cul_de_Ampolla`.`Gafas` (`idGafas`, `graIzq`, `graDer`, `colorIzq`, `colorDer`, `colorMontura`, `precio`, `idMarca`, `idMontura`) VALUES (4, 1.25, 0.0, 'blanco', 'blanco', 'marron', 130, 5, 2);
INSERT INTO `Cul_de_Ampolla`.`Gafas` (`idGafas`, `graIzq`, `graDer`, `colorIzq`, `colorDer`, `colorMontura`, `precio`, `idMarca`, `idMontura`) VALUES (5, 0.25, 0.50, 'azul', 'blanco', 'negro ', 200, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Cliente` (`idCliente`, `nombre`, `codigPostal`, `telefono`, `email`, `idReferido`, `fechaRegistro`) VALUES (1, 'Havier', 08001, 602435657, 'anti@gmail.com', NULL, '2021-01-07');
INSERT INTO `Cul_de_Ampolla`.`Cliente` (`idCliente`, `nombre`, `codigPostal`, `telefono`, `email`, `idReferido`, `fechaRegistro`) VALUES (2, 'Carlos', 28012, 647318327, 'carlos@gmail.com', 1, '2021-01-10');
INSERT INTO `Cul_de_Ampolla`.`Cliente` (`idCliente`, `nombre`, `codigPostal`, `telefono`, `email`, `idReferido`, `fechaRegistro`) VALUES (3, 'Nora ', 12006, 654219823, 'nora@gmail.com', NULL, '2021-03-09');
INSERT INTO `Cul_de_Ampolla`.`Cliente` (`idCliente`, `nombre`, `codigPostal`, `telefono`, `email`, `idReferido`, `fechaRegistro`) VALUES (4, 'Vianca', 08023, 680092198, 'vianca@gmail.com', 2, '2021-07-12');
INSERT INTO `Cul_de_Ampolla`.`Cliente` (`idCliente`, `nombre`, `codigPostal`, `telefono`, `email`, `idReferido`, `fechaRegistro`) VALUES (5, 'Raul', 09230, 600091008, 'raul@gmail.com', 3, '2022-01-02');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Vendedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Vendedor` (`idVendedor`, `nombre`) VALUES (1, 'Ramiro');
INSERT INTO `Cul_de_Ampolla`.`Vendedor` (`idVendedor`, `nombre`) VALUES (2, 'Clara');
INSERT INTO `Cul_de_Ampolla`.`Vendedor` (`idVendedor`, `nombre`) VALUES (3, 'Humberto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cul_de_Ampolla`.`Compra`
-- -----------------------------------------------------
START TRANSACTION;
USE `Cul_de_Ampolla`;
INSERT INTO `Cul_de_Ampolla`.`Compra` (`idCompra`, `fechaVenta`, `idVendedor`, `idCliente`, `idGafas`) VALUES (1, '2021-12-30', 1, 3, 2);
INSERT INTO `Cul_de_Ampolla`.`Compra` (`idCompra`, `fechaVenta`, `idVendedor`, `idCliente`, `idGafas`) VALUES (2, '2021-12-31', 3, 1, 1);
INSERT INTO `Cul_de_Ampolla`.`Compra` (`idCompra`, `fechaVenta`, `idVendedor`, `idCliente`, `idGafas`) VALUES (3, '2021-12-31', 2, 2, 2);
INSERT INTO `Cul_de_Ampolla`.`Compra` (`idCompra`, `fechaVenta`, `idVendedor`, `idCliente`, `idGafas`) VALUES (4, '2022-02-17', 2, 2, 3);
INSERT INTO `Cul_de_Ampolla`.`Compra` (`idCompra`, `fechaVenta`, `idVendedor`, `idCliente`, `idGafas`) VALUES (5, '2022-02-21', 1, 4, 1);
INSERT INTO `Cul_de_Ampolla`.`Compra` (`idCompra`, `fechaVenta`, `idVendedor`, `idCliente`, `idGafas`) VALUES (6, '2022-02-22', 2, 2, 4);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- 1 Lista el total de compras de un cliente
SELECT compra.idCompra, compra.fechaVenta, compra.idVendedor, compra.idGafas, cliente.nombre FROM compra LEFT JOIN cliente ON  compra.idCliente = cliente.idCliente WHERE cliente.idCliente ='2';

-- 2 Lista las distintas gafas que ha vendido un empleado durante un año (Agrego otros campos para tener mayor control)
SELECT vendedor.nombre AS Nombre_Vendedor, compra.fechaVenta, gafas.idGafas, gafas.precio, gafas.colorMontura FROM Gafas LEFT JOIN Compra ON gafas.idGafas = compra.idGafas  LEFT JOIN vendedor ON compra.idVendedor = vendedor.idVendedor WHERE  vendedor.nombre = 'Clara' and compra.fechaVenta LIKE "2022%";

-- 3 Lista los distintos proveedores que han suministrado gafas vendidas con éxito por la óptica (Agrego otros campos para tener mayor control)
SELECT Gafas.idGafas , proveedor.nombre AS Nombre_Proveedor, compra.fechaVenta,   marca.nombre AS Marca FROM proveedor LEFT JOIN marca ON proveedor.idProveedor = marca.idProveedor LEFT JOIN gafas ON marca.idMarca = gafas.idMarca INNER JOIN compra ON  compra.idGafas = gafas.idGafas ;



