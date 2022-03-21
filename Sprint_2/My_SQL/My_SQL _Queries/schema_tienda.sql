

DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


-- QUERIES


-- 1 Lista el nombre de todos los productos que hay en la mesa producto.
 SELECT nombre FROM producto; 

 -- 2 Lista los nombres y los precios de todos los productos de la mesa producto.
 SELECT nombre, precio FROM producto;

 -- 3 Lista todas las columnas de la tabla producto
 SELECT * FROM producto; 

 -- 4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
 SELECT nombre, precio, (precio*0,88) AS USD FROM producto;

 -- 5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses. Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares estadounidenses.
 SELECT nombre AS Nombre_de_Producto, precio AS Precio_Euros, (precio*0.88) AS Precio_Dolares  FROM PRODUCTO;

 -- 6 Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a mayúscula.
 SELECT upper(nombre), precio FROM producto;  

 -- 7 Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a minúscula.
 SELECT lower(nombre), precio FROM producto;  

 -- 8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
 SELECT nombre, upper(substring(nombre, 1,2)) AS 2_Letras FROM fabricante;

 -- 9 Lista los nombres y los precios de todos los productos de la mesa producto, redondeando el valor del precio.
 SELECT nombre, round(precio, 1) AS Precio_redondeado  FROM producto;

 -- 10 Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
 SELECT nombre, truncate(precio,0) AS Precio_sin_Decimal FROM producto;

 -- 11 Lista el código de los fabricantes que tienen productos en la mesa producto.
 SELECT codigo_fabricante FROM producto;

 -- 12 Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.
  SELECT  DISTINCT codigo_fabricante  FROM producto;

 -- 13 Lista los nombres de los fabricantes ordenados de forma ascendente.
 SELECT nombre FROM producto ORDER BY nombre ASC;

 -- 14 Lista los nombres de los fabricantes ordenados de forma descendente.
 SELECT nombre  FROM fabricante ORDER BY nombre DESC;

 -- 15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
 SELECT nombre, precio  FROM producto ORDER BY nombre ASC, precio DESC;

 -- 16 Devuelve una lista con las 5 primeras filas de la mesa fabricante.
 SELECT * FROM fabricante LIMIT 5;

 -- 17 Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa fabricante. La cuarta fila también debe incluirse en la respuesta.
 SELECT * FROM fabricante LIMIT 3,2;

-- 18 Lista el nombre y precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
 SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

 -- 19 Lista el nombre y precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
 SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

 -- 20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
 SELECT nombre FROM producto WHERE codigo_fabricante = 2; 

 -- 21 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
 SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

 -- 22 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
 SELECT producto.nombre, precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;

 -- 23 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
 SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

 -- 24 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
 SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ORDER BY producto.precio ASC LIMIT 1;

  --25 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
 SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ORDER BY producto.precio DESC LIMIT 1;

 -- 26 Devuelve una lista de todos los productos del fabricante Lenovo.
 SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante  = fabricante.codigo  WHERE fabricante.nombre = 'Lenovo';

 -- 27 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200 €.
 SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante  = fabricante.codigo  WHERE fabricante.nombre = 'Crucial' AND producto.precio >200;

 -- 28 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
 SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante  = fabricante.codigo  WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

 -- 29 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
 SELECT * FROM producto INNER JOIN fabricante ON producto.codigo_fabricante  = fabricante.codigo WHERE fabricante.nombre IN ('Asus','Hewlett-Packard','Seagate');

 -- 30 Devuelve un listado con el nombre y precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
 SELECT producto.nombre, producto.precio  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante  = fabricante.codigo WHERE fabricante.nombre LIKE ('%e');

 -- 31 Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
 SELECT producto.nombre, producto.precio FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE ('%w%');

 -- 32 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
 SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante  = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
 
 -- 33 Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
 SELECT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

 -- 34 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
 SELECT fabricante.codigo, fabricante.nombre, producto.nombre FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante; 

 -- 35 Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
 SELECT * FROM fabricante WHERE codigo != ALL ( SELECT codigo_fabricante FROM producto);


 -- 36 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
 SELECT * FROM producto WHERE codigo_fabricante = ( SELECT codigo FROM fabricante  WHERE nombre = 'Lenovo'); 

 --37 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
 SELECT * FROM producto WHERE precio = (  SELECT MAX(precio)  FROM producto  WHERE producto.codigo_fabricante = (  SELECT codigo  FROM fabricante  WHERE nombre = 'Lenovo'));


  -- 38 Lista el nombre del producto más caro del fabricante Lenovo.
 SELECT producto.nombre,  producto.precio  FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' AND producto.precio = (SELECT MAX(precio)FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Lenovo');
 

 -- 39 Lista el nombre del producto más barato del fabricante Hewlett-Packard.
 SELECT producto.nombre, producto.precio FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' AND producto.precio = (SELECT  MIN(precio)FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Hewlett-Packard');

 -- 40 Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo. (incluido el producto de lenovo?)
SELECT * FROM producto WHERE precio >= ( SELECT MAX(precio) FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo'); 

 -- 41 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.  (Los 2 productos Asus tiene un precio inferior al precio medio)
SELECT AVG(Precio) AS PrecioMedio FROM Producto;
SELECT * FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus';
SELECT * FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' AND producto.precio > ( SELECT AVG(precio) FROM producto);


