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
  `nombre_provincia` VARCHAR(45) NOT NULL,
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
  `nombre_localidad` VARCHAR(45) NOT NULL,
  `id_Provincia` INT NOT NULL,
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
  `nombre_cliente` VARCHAR(45) NOT NULL,
  `apellido_cliente` VARCHAR(45) NOT NULL,
  `direccion_cliente` VARCHAR(45) NOT NULL,
  `codigo_postal_cliente` INT NOT NULL,
  `telefono_cliente` INT NOT NULL,
  `id_Localidad` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `id_Localidad`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Categoria` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Categoria` (
  `idCategoria_pizza` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria_pizza`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Tipo_Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Tipo_Producto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Tipo_Producto` (
  `idTipo_Producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo_producto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Producto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Producto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(45) NOT NULL,
  `descripcion_producto` VARCHAR(256) NOT NULL,
  `precio_producto` FLOAT NOT NULL,
  `idTipo_Producto` INT NOT NULL,
  `idCategoria_pizza` INT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Tipo_entrega`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Tipo_entrega` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Tipo_entrega` (
  `idTipo_entrega` INT NOT NULL AUTO_INCREMENT,
  `entrega` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_entrega`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Tipo_Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Tipo_Empleado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Tipo_Empleado` (
  `idTipo_Empleado` INT NOT NULL AUTO_INCREMENT,
  `tipo_empleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Empleado`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Tienda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Tienda` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Tienda` (
  `idTienda` INT NOT NULL AUTO_INCREMENT,
  `direccion_tienda` VARCHAR(256) NOT NULL,
  `codigo_postal_tienda` INT NOT NULL,
  `id_Localidad_tienda` INT NOT NULL,
  PRIMARY KEY (`idTienda`, `id_Localidad_tienda`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Empleado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  `apellido_empleado` VARCHAR(45) NOT NULL,
  `nif_empleado` VARCHAR(10) NOT NULL,
  `telefono_empleado` INT NOT NULL,
  `id_tipo_Empleado` INT NOT NULL,
  `id_Tienda` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`, `id_tipo_Empleado`, `id_Tienda`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Orden` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Orden` (
  `idOrden` INT NOT NULL,
  `id_Producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idOrden`, `id_Producto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pizzeria`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`Pedido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pizzeria`.`Pedido` (
  `idPedido` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `tipo_entrega_id` INT NOT NULL,
  `fecha_pedido` DATETIME NOT NULL,
  `Orden_idOrden` INT NOT NULL,
  `precio_total` FLOAT NOT NULL,
  `id_Tienda` INT NOT NULL,
  `Empleado_idEmpleado` INT NULL,
  `hora_entrega` DATETIME NULL,
  PRIMARY KEY (`idPedido`, `id_Cliente`, `tipo_entrega_id`, `Orden_idOrden`, `id_Tienda`))
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
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre_provincia`) VALUES (1, 'Barcelona');
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre_provincia`) VALUES (2, 'Gerona ');
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre_provincia`) VALUES (3, 'Lleida');
INSERT INTO `Pizzeria`.`Provincia` (`idProvincia`, `nombre_provincia`) VALUES (4, 'Tarragona');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Localidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (1, 'Barcelona', 1);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (2, 'Tarragona', 4);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (3, 'Gerona', 2);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (4, 'Lleida', 3);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (5, 'Sabadell', 1);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (6, 'Ripoll', 2);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (7, 'Olot', 2);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (8, 'Balaguer', 3);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (9, 'Reus', 4);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (10, 'Badalona', 1);
INSERT INTO `Pizzeria`.`Localidad` (`idLocalidad`, `nombre_localidad`, `id_Provincia`) VALUES (11, 'Hospitalet de Llobregar', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `codigo_postal_cliente`, `telefono_cliente`, `id_Localidad`) VALUES (1, 'Alejandro', 'Rodriguez', 'Calle ample 34 - 4to 2da', 08001, 630210218, 1);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `codigo_postal_cliente`, `telefono_cliente`, `id_Localidad`) VALUES (2, 'Rene', 'Morales', 'Av Roma 23 - Pp 1', 08002, 678319726, 1);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `codigo_postal_cliente`, `telefono_cliente`, `id_Localidad`) VALUES (3, 'Camilo ', 'Romero', 'Paseing Catalan - Bajo 1', 43201, 672187261, 9);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `codigo_postal_cliente`, `telefono_cliente`, `id_Localidad`) VALUES (4, 'Andrea', 'Puig', 'Rambla badal - At B', 08901, 676216581, 11);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `codigo_postal_cliente`, `telefono_cliente`, `id_Localidad`) VALUES (5, 'Jessica ', 'Farfan', 'Calle Urgell - 2do 2da', 43201, 676532651, 9);
INSERT INTO `Pizzeria`.`Cliente` (`idCliente`, `nombre_cliente`, `apellido_cliente`, `direccion_cliente`, `codigo_postal_cliente`, `telefono_cliente`, `id_Localidad`) VALUES (6, 'Ramon ', 'Quijano', 'Av madrid - 1ro A', 08004, 698327141, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Categoria` (`idCategoria_pizza`, `nombre_categoria`) VALUES (1, 'Italianas');
INSERT INTO `Pizzeria`.`Categoria` (`idCategoria_pizza`, `nombre_categoria`) VALUES (2, 'Americanas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Tipo_Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Tipo_Producto` (`idTipo_Producto`, `nombre_tipo_producto`) VALUES (1, 'Pizza');
INSERT INTO `Pizzeria`.`Tipo_Producto` (`idTipo_Producto`, `nombre_tipo_producto`) VALUES (2, 'Hamburguesa');
INSERT INTO `Pizzeria`.`Tipo_Producto` (`idTipo_Producto`, `nombre_tipo_producto`) VALUES (3, 'Bebidas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (1, 'Pizza Hawaina', 'Tomate, queso, jamon, piña 200', 9.90, 1, 2);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (2, 'Pizza Margarita', 'Tomate, queso, albahaca', 6.50, 1, 1);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (3, 'Hamburguesa Clasica', 'Carne 200gr, tomate, cebolla, queso', 8.90, 2, NULL);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (4, 'Pizza Diavola', 'Tomate, queso, chirizo', 9.20, 1, 1);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (5, 'Acuarius', '500 ml', 2.75, 3, NULL);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (6, 'Coca cola', '350 ml', 1.90, 3, NULL);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (7, 'Pizza BBQ', 'Pollo, tomate, queso, salsa bbq', 10.90, 1, 2);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (8, 'Pizza Mariana', 'Tomate, ajo', 5.90, 1, 1);
INSERT INTO `Pizzeria`.`Producto` (`idProducto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `idTipo_Producto`, `idCategoria_pizza`) VALUES (9, 'Pizza 4 Quesos', 'Quesos, tomate', 8.90, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Tipo_entrega`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Tipo_entrega` (`idTipo_entrega`, `entrega`) VALUES (1, 'Tienda');
INSERT INTO `Pizzeria`.`Tipo_entrega` (`idTipo_entrega`, `entrega`) VALUES (2, 'Reparto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Tipo_Empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Tipo_Empleado` (`idTipo_Empleado`, `tipo_empleado`) VALUES (1, 'Repartidor');
INSERT INTO `Pizzeria`.`Tipo_Empleado` (`idTipo_Empleado`, `tipo_empleado`) VALUES (2, 'Cocinero');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Tienda`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccion_tienda`, `codigo_postal_tienda`, `id_Localidad_tienda`) VALUES (1, 'Calle rubiales 12', 08001, 1);
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccion_tienda`, `codigo_postal_tienda`, `id_Localidad_tienda`) VALUES (2, 'Av Pepe Reina 665', 43201, 9);
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccion_tienda`, `codigo_postal_tienda`, `id_Localidad_tienda`) VALUES (3, 'Calle Paris 234', 08001, 1);
INSERT INTO `Pizzeria`.`Tienda` (`idTienda`, `direccion_tienda`, `codigo_postal_tienda`, `id_Localidad_tienda`) VALUES (4, 'Rambla Brazil', 43201, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre_empleado`, `apellido_empleado`, `nif_empleado`, `telefono_empleado`, `id_tipo_Empleado`, `id_Tienda`) VALUES (1, 'Cristian ', 'Ramirez', '12345678Y', 653271012, 1, 1);
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre_empleado`, `apellido_empleado`, `nif_empleado`, `telefono_empleado`, `id_tipo_Empleado`, `id_Tienda`) VALUES (2, 'Ramon ', 'Canales', '87654321B', 600908916, 2, 1);
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre_empleado`, `apellido_empleado`, `nif_empleado`, `telefono_empleado`, `id_tipo_Empleado`, `id_Tienda`) VALUES (3, 'Andrea ', 'Reus', '76543219A', 678889734, 2, 2);
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre_empleado`, `apellido_empleado`, `nif_empleado`, `telefono_empleado`, `id_tipo_Empleado`, `id_Tienda`) VALUES (4, 'Jessenia', 'Esteves', '23456789Z', 654442524, 1, 2);
INSERT INTO `Pizzeria`.`Empleado` (`idEmpleado`, `nombre_empleado`, `apellido_empleado`, `nif_empleado`, `telefono_empleado`, `id_tipo_Empleado`, `id_Tienda`) VALUES (5, 'Jordi', 'Petruz', '45678123G', 677771829, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Orden`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (1, 1, 1);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (1, 3, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (1, 4, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (1, 5, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (2, 3, 4);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (2, 5, 1);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (3, 8, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (3, 1, 1);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (3, 6, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (4, 9, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (4, 6, 2);
INSERT INTO `Pizzeria`.`Orden` (`idOrden`, `id_Producto`, `cantidad`) VALUES (4, 5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`Pedido`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `id_Cliente`, `tipo_entrega_id`, `fecha_pedido`, `Orden_idOrden`, `precio_total`, `id_Tienda`, `Empleado_idEmpleado`, `hora_entrega`) VALUES (1, 1, 2, '2021-01-11 16:35:01', 1, 51.60, 1, 1, '2021-01-11 17:01:00');
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `id_Cliente`, `tipo_entrega_id`, `fecha_pedido`, `Orden_idOrden`, `precio_total`, `id_Tienda`, `Empleado_idEmpleado`, `hora_entrega`) VALUES (2, 2, 1, '2021-01-12 12:45:00', 2, 39.55, 1, NULL, NULL);
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `id_Cliente`, `tipo_entrega_id`, `fecha_pedido`, `Orden_idOrden`, `precio_total`, `id_Tienda`, `Empleado_idEmpleado`, `hora_entrega`) VALUES (3, 1, 2, '2021-01-19 11:15:45', 3, 25.59, 2, 4, '2021-01-19 11:35:23');
INSERT INTO `Pizzeria`.`Pedido` (`idPedido`, `id_Cliente`, `tipo_entrega_id`, `fecha_pedido`, `Orden_idOrden`, `precio_total`, `id_Tienda`, `Empleado_idEmpleado`, `hora_entrega`) VALUES (4, 5, 2, '2021-02-01 17:22:01', 4, 24.35, 2, 4, '2021-02-01 17:56:01');

COMMIT;

-- Querys

-- Select producto.nombre_producto, categoria.nombre_categoria From producto Left join categoria on producto.idCategoria_pizza = categoria.idCategoria_pizza Where categoria.nombre_categoria = 'Italianas' ;

-- 1. Lista cuántos productos de tipo 'Bebidas' se han vendido en una determinada localidad

SELECT nombre_producto, orden.cantidad, pedido.fecha_pedido FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.id_Localidad_tienda INNER JOIN pedido ON tienda.idTienda = pedido.id_Tienda INNER JOIN orden ON pedido.Orden_idOrden = orden.idOrden INNER JOIN producto ON orden.id_Producto = producto.idProducto INNER JOIN tipo_producto ON producto.idTipo_Producto = tipo_producto.idTipo_Producto  WHERE localidad.nombre_localidad = 'Barcelona' AND producto.idTipo_Producto = 3;
SELECT localidad.nombre_localidad, sum(orden.cantidad) AS Cantidad_De_Bebidas_vendidas FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.id_Localidad_tienda INNER JOIN pedido ON tienda.idTienda = pedido.id_Tienda INNER JOIN orden ON pedido.Orden_idOrden = orden.idOrden INNER JOIN producto ON orden.id_Producto = producto.idProducto INNER JOIN tipo_producto ON producto.idTipo_Producto = tipo_producto.idTipo_Producto  WHERE localidad.nombre_localidad = 'Barcelona' AND producto.idTipo_Producto = 3;

SELECT nombre_producto, orden.cantidad, pedido.fecha_pedido FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.id_Localidad_tienda INNER JOIN pedido ON tienda.idTienda = pedido.id_Tienda INNER JOIN orden ON pedido.Orden_idOrden = orden.idOrden INNER JOIN producto ON orden.id_Producto = producto.idProducto INNER JOIN tipo_producto ON producto.idTipo_Producto = tipo_producto.idTipo_Producto  WHERE localidad.nombre_localidad = 'Reus' AND producto.idTipo_Producto = 3;
SELECT localidad.nombre_localidad, sum(orden.cantidad) AS Cantidad_De_Bebidas_vendidas FROM localidad INNER JOIN tienda ON localidad.idLocalidad = tienda.id_Localidad_tienda INNER JOIN pedido ON tienda.idTienda = pedido.id_Tienda INNER JOIN orden ON pedido.Orden_idOrden = orden.idOrden INNER JOIN producto ON orden.id_Producto = producto.idProducto INNER JOIN tipo_producto ON producto.idTipo_Producto = tipo_producto.idTipo_Producto  WHERE localidad.nombre_localidad = 'Reus' AND producto.idTipo_Producto = 3;


-- 2. Lista cuántos pedidos ha efectuado un determinado empleado

SELECT pedido.idPedido, pedido.fecha_pedido, pedido.hora_entrega, empleado.nombre_empleado, pedido.id_Tienda FROM pedido INNER JOIN empleado ON pedido.Empleado_idEmpleado = empleado.idEmpleado WHERE empleado.nombre_empleado = 'Jessenia';

SELECT pedido.idPedido, pedido.fecha_pedido, pedido.hora_entrega, empleado.nombre_empleado, pedido.id_Tienda FROM pedido INNER JOIN empleado ON pedido.Empleado_idEmpleado = empleado.idEmpleado WHERE empleado.nombre_empleado = 'Cristian ';