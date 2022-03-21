-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Pizzeria` ;

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Pizzeria` ;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Provincia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Provincia` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvincia`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Localidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Localidad` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Localidad` (
  `idLocalidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `idProvincia` INT NOT NULL,
  PRIMARY KEY (`idLocalidad`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Cliente` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `codigoPostal` INT NOT NULL,
  `telefono` INT NOT NULL,
  `idLocalidad` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `idLocalidad`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`TipoProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`TipoProducto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`TipoProducto` (
  `idTipoProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoProducto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Producto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NOT NULL,
  `precio` FLOAT NOT NULL,
  `idTipoProducto` INT NOT NULL,
  `categoriaProducto` ENUM(' Italiana', ' Americana') NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`TipoEntrega`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`TipoEntrega` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`TipoEntrega` (
  `idTipoEntrega` INT NOT NULL AUTO_INCREMENT,
  `entrega` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoEntrega`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Tienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Tienda` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Tienda` (
  `idTienda` INT NOT NULL AUTO_INCREMENT,
  `direccionTienda` VARCHAR(256) NOT NULL,
  `cpTienda` INT NOT NULL,
  `idLocalodadTienda` INT NOT NULL,
  PRIMARY KEY (`idTienda`, `idLocalodadTienda`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Empleado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(10) NOT NULL,
  `telefono` INT NOT NULL,
  `idTienda` INT NOT NULL,
  `tipoEmpleado` ENUM('Repartidor', ' Cocinero') NOT NULL,
  PRIMARY KEY (`idEmpleado`, `idTienda`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Orden` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Orden` (
  `idOrden` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idOrden`, `idProducto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Pedido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pedido` (
  `idPedido` INT NOT NULL,
  `idCliente` INT NOT NULL,
  `idTipoEntrega` INT NOT NULL,
  `fechaPedido` DATETIME NOT NULL,
  `idOrden` INT NOT NULL,
  `precioTotal` FLOAT NOT NULL,
  `idTienda` INT NOT NULL,
  `idEmpleado` INT NULL,
  `horaEntrega` DATETIME NULL,
  PRIMARY KEY (`idPedido`, `idCliente`, `idTipoEntrega`, `idOrden`, `idTienda`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Provincia`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre`) VALUES (1, 'Barcelona');
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre`) VALUES (2, 'Gerona ');
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre`) VALUES (3, 'Lleida');
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre`) VALUES (4, 'Tarragona');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Localidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (1, 'Barcelona', 1);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (2, 'Tarragona', 4);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (3, 'Gerona', 2);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (4, 'Lleida', 3);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (5, 'Sabadell', 1);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (6, 'Ripoll', 2);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (7, 'Olot', 2);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (8, 'Balaguer', 3);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (9, 'Reus', 4);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (10, 'Badalona', 1);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre`, `idProvincia`) VALUES (11, 'Hospitalet de Llobregar', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `codigoPostal`, `telefono`, `idLocalidad`) VALUES (1, 'Alejandro', 'Rodriguez', 'Calle ample 34 - 4to 2da', 08001, 630210218, 1);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `codigoPostal`, `telefono`, `idLocalidad`) VALUES (2, 'Rene', 'Morales', 'Av Roma 23 - Pp 1', 08002, 678319726, 1);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `codigoPostal`, `telefono`, `idLocalidad`) VALUES (3, 'Camilo ', 'Romero', 'Paseing Catalan - Bajo 1', 43201, 672187261, 9);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `codigoPostal`, `telefono`, `idLocalidad`) VALUES (4, 'Andrea', 'Puig', 'Rambla badal - At B', 08901, 676216581, 11);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `codigoPostal`, `telefono`, `idLocalidad`) VALUES (5, 'Jessica ', 'Farfan', 'Calle Urgell - 2do 2da', 43201, 676532651, 9);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre`, `apellido`, `direccion`, `codigoPostal`, `telefono`, `idLocalidad`) VALUES (6, 'Ramon ', 'Quijano', 'Av madrid - 1ro A', 08004, 698327141, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`TipoProducto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`TipoProducto` (`idTipoProducto`, `nombre`) VALUES (1, 'Pizza');
INSERT INTO `Pizzeria`.`TipoProducto` (`idTipoProducto`, `nombre`) VALUES (2, 'Hamburguesa');
INSERT INTO `Pizzeria`.`TipoProducto` (`idTipoProducto`, `nombre`) VALUES (3, 'Bebidas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (1, 'Pizza Hawaina', 'Tomate, queso, jamon, piña 200', 9.90, 1, '2');
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (2, 'Pizza Margarita', 'Tomate, queso, albahaca', 6.50, 1, '1');
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (3, 'Hamburguesa Clasica', 'Carne 200gr, tomate, cebolla, queso', 8.90, 2, NULL);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (4, 'Pizza Diavola', 'Tomate, queso, chirizo', 9.20, 1, '1');
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (5, 'Acuarius', '500 ml', 2.75, 3, NULL);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (6, 'Coca cola', '350 ml', 1.90, 3, NULL);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (7, 'Pizza BBQ', 'Pollo, tomate, queso, salsa bbq', 10.90, 1, '2');
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (8, 'Pizza Mariana', 'Tomate, ajo', 5.90, 1, '1');
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre`, `descripcion`, `precio`, `idTipoProducto`, `categoriaProducto`) VALUES (9, 'Pizza 4 Quesos', 'Quesos, tomate', 8.90, 1, '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`TipoEntrega`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`TipoEntrega` (`idTipoEntrega`, `entrega`) VALUES (1, 'Tienda');
INSERT INTO `Pizzeria`.`TipoEntrega` (`idTipoEntrega`, `entrega`) VALUES (2, 'Reparto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Tienda`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccionTienda`, `cpTienda`, `idLocalodadTienda`) VALUES (1, 'Calle rubiales 12', 08001, 1);
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccionTienda`, `cpTienda`, `idLocalodadTienda`) VALUES (2, 'Av Pepe Reina 665', 43201, 9);
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccionTienda`, `cpTienda`, `idLocalodadTienda`) VALUES (3, 'Calle Paris 234', 08001, 1);
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccionTienda`, `cpTienda`, `idLocalodadTienda`) VALUES (4, 'Rambla Brazil', 43201, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre`, `apellido`, `nif`, `telefono`, `idTienda`, `tipoEmpleado`) VALUES (1, 'Cristian ', 'Ramirez', '12345678Y', 653271012, 1, '1');
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre`, `apellido`, `nif`, `telefono`, `idTienda`, `tipoEmpleado`) VALUES (2, 'Ramon ', 'Canales', '87654321B', 600908916, 1, '2');
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre`, `apellido`, `nif`, `telefono`, `idTienda`, `tipoEmpleado`) VALUES (3, 'Andrea ', 'Reus', '76543219A', 678889734, 2, '2');
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre`, `apellido`, `nif`, `telefono`, `idTienda`, `tipoEmpleado`) VALUES (4, 'Jessenia', 'Esteves', '23456789Z', 654442524, 2, '1');
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre`, `apellido`, `nif`, `telefono`, `idTienda`, `tipoEmpleado`) VALUES (5, 'Jordi', 'Petruz', '45678123G', 677771829, 1, '2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Orden`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (1, 1, 1);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (1, 3, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (1, 4, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (1, 5, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (2, 3, 4);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (2, 5, 1);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (3, 8, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (3, 1, 1);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (3, 6, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (4, 9, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (4, 6, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `idProducto`, `cantidad`) VALUES (4, 5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Pedido`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `idCliente`, `idTipoEntrega`, `fechaPedido`, `idOrden`, `precioTotal`, `idTienda`, `idEmpleado`, `horaEntrega`) VALUES (1, 1, 2, '2021-01-11 16:35:01', 1, 51.60, 1, 1, '2021-01-11 17:01:00');
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `idCliente`, `idTipoEntrega`, `fechaPedido`, `idOrden`, `precioTotal`, `idTienda`, `idEmpleado`, `horaEntrega`) VALUES (2, 2, 1, '2021-01-12 12:45:00', 2, 39.55, 1, NULL, NULL);
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `idCliente`, `idTipoEntrega`, `fechaPedido`, `idOrden`, `precioTotal`, `idTienda`, `idEmpleado`, `horaEntrega`) VALUES (3, 1, 2, '2021-01-19 11:15:45', 3, 25.59, 2, 4, '2021-01-19 11:35:23');
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `idCliente`, `idTipoEntrega`, `fechaPedido`, `idOrden`, `precioTotal`, `idTienda`, `idEmpleado`, `horaEntrega`) VALUES (4, 5, 2, '2021-02-01 17:22:01', 4, 24.35, 2, 4, '2021-02-01 17:56:01');

COMMIT;

SELECT producto.nombre, orden.cantidad, pedido.fechaPedido FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.idLocalodadTienda INNER JOIN pedido ON tienda.idTienda = pedido.idTienda INNER JOIN orden ON pedido.idOrden = orden.idOrden INNER JOIN producto ON orden.idProducto = producto.idProducto INNER JOIN tipoProducto ON producto.idTipoProducto = tipoProducto.idTipoProducto  WHERE localidad.nombre = 'Barcelona' AND producto.idTipoProducto = 3;
SELECT localidad.nombre, sum(orden.cantidad) AS Cantidad_De_Bebidas_Vendidas FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.idLocalodadTienda INNER JOIN pedido ON tienda.idTienda = pedido.idTienda INNER JOIN orden ON pedido.idOrden = orden.idOrden INNER JOIN producto ON orden.idProducto = producto.idProducto INNER JOIN tipoProducto ON producto.idTipoProducto = tipoProducto.idTipoProducto  WHERE localidad.nombre = 'Barcelona' AND producto.idTipoProducto = 3;

SELECT producto.nombre, orden.cantidad, pedido.fechaPedido FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.idLocalodadTienda INNER JOIN pedido ON tienda.idTienda = pedido.idTienda INNER JOIN orden ON pedido.idOrden = orden.idOrden INNER JOIN producto ON orden.idProducto = producto.idProducto INNER JOIN tipoProducto ON producto.idTipoProducto = tipoProducto.idTipoProducto  WHERE localidad.nombre = 'Reus' AND producto.idTipoProducto = 3;
SELECT localidad.nombre, sum(orden.cantidad) AS Cantidad_De_Bebidas_Vendidas FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.idLocalodadTienda INNER JOIN pedido ON tienda.idTienda = pedido.idTienda INNER JOIN orden ON pedido.idOrden = orden.idOrden INNER JOIN producto ON orden.idProducto = producto.idProducto INNER JOIN tipoProducto ON producto.idTipoProducto = tipoProducto.idTipoProducto  WHERE localidad.nombre = 'Reus' AND producto.idTipoProducto = 3;



SELECT pedido.idPedido, pedido.fechaPedido, pedido.horaEntrega, empleado.nombre, pedido.idTienda FROM pedido INNER JOIN empleado ON pedido.idEmpleado = empleado.idEmpleado WHERE empleado.nombre = 'Jessenia';
SELECT pedido.idPedido, pedido.fechaPedido, pedido.horaEntrega, empleado.nombre, pedido.idTienda FROM pedido INNER JOIN empleado ON pedido.idEmpleado = empleado.idEmpleado WHERE empleado.nombre = 'Cristian';