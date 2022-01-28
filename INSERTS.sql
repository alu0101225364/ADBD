-- -----------------------------------------------------
-- Data for table `FINAL`.`USUARIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`USUARIO` (`DNI`, `Nombre_Usuario`, `Email`, `Telefono`, `Contraseña`) VALUES ('12345678L', 'alee', 'alu@ull.es', 12345566, 'soyelmejor');
INSERT INTO `FINAL`.`USUARIO` (`DNI`, `Nombre_Usuario`, `Email`, `Telefono`, `Contraseña`) VALUES ('12398734O', 'Angel', 'angel@ull.es', 123123123, 'nosoyelmejor');
INSERT INTO `FINAL`.`USUARIO` (`DNI`, `Nombre_Usuario`, `Email`, `Telefono`, `Contraseña`) VALUES ('98764222E', 'pablo', 'pablo@ull.es', 1212121212, 'sisoyelmejor');
INSERT INTO `FINAL`.`USUARIO` (`DNI`, `Nombre_Usuario`, `Email`, `Telefono`, `Contraseña`) VALUES ('98764022E', 'diego', 'diego@ull.es', 1212121212, 'puedesoyelmejor');
INSERT INTO `FINAL`.`USUARIO` (`DNI`, `Nombre_Usuario`, `Email`, `Telefono`, `Contraseña`) VALUES ('98760022E', 'dani', 'dani@ull.es', 1212121212, 'tengounaempresa');


COMMIT;

SELECT * FROM USUARIO;
-- -----------------------------------------------------
-- Data for table `FINAL`.`DIRECCION`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`DIRECCION` (`Provincia`, `Calle`, `Ciudad`, `CP`, `Pais`, `Usuario_DNI`) VALUES ('Tenerife', 'PIOPIO', 'LA LAGUNA', '12345', 'España', '12345678L');
INSERT INTO `FINAL`.`DIRECCION` (`Provincia`, `Calle`, `Ciudad`, `CP`, `Pais`, `Usuario_DNI`) VALUES ('Tenerife', 'CHICHARRERO', 'LA LAGUNA', '12345', 'España', '12345678L');
INSERT INTO `FINAL`.`DIRECCION` (`Provincia`, `Calle`, `Ciudad`, `CP`, `Pais`, `Usuario_DNI`) VALUES ('Gran Canaria', 'CARNAVALERO', 'LAS PALMAS', '22332', 'España', '98764222E');
INSERT INTO `FINAL`.`DIRECCION` (`Provincia`, `Calle`, `Ciudad`, `CP`, `Pais`, `Usuario_DNI`) VALUES ('Gran Canaria', 'CARNAVALERO', 'LAS PALMAS', '22332', 'España', '98764022E');
INSERT INTO `FINAL`.`DIRECCION` (`Provincia`, `Calle`, `Ciudad`, `CP`, `Pais`, `Usuario_DNI`) VALUES ('Gran Canaria', 'CARNAVALERO', 'LAS PALMAS', '22332', 'España', '98760022E');

COMMIT;
SELECT * FROM DIRECCION;

-- -----------------------------------------------------
-- Data for table `FINAL`.`PRODUCTO`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (123, 'Movil', NULL, 20, 200);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (456, 'Berenjena', NULL, 15, 2.6);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (789, 'COD', NULL, 50, 50);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (111, 'Harry Potter', NULL, 3, 20);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (124, 'Iphone', NULL, 20, 200);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (457, 'Mojo', NULL, 15, 2.6);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (790, 'Battlefield', NULL, 50, 50);
INSERT INTO `FINAL`.`PRODUCTO` (`Num_Producto`, `Nombre`, `Descripcion`, `Stock`, `Coste`) VALUES (112, 'Percy Jackson', NULL, 3, 20);

COMMIT;
SELECT * FROM PRODUCTO;

-- -----------------------------------------------------
-- Data for table `FINAL`.`ELECTRONICA`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`ELECTRONICA` (`SO`, `PRODUCTO_Num_Producto`) VALUES ('IOS', 123);
INSERT INTO `FINAL`.`ELECTRONICA` (`SO`, `PRODUCTO_Num_Producto`) VALUES ('WINDOWS PHONE', 124);
COMMIT;
SELECT * FROM ELECTRONICA;


-- -----------------------------------------------------
-- Data for table `FINAL`.`ALIMENTACION`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`ALIMENTACION` (`Procesado`, `PRODUCTO_Num_Producto`) VALUES (false, 456);
INSERT INTO `FINAL`.`ALIMENTACION` (`Procesado`, `PRODUCTO_Num_Producto`) VALUES (true, 457);

COMMIT;
SELECT * FROM ALIMENTACION;

-- -----------------------------------------------------
-- Data for table `FINAL`.`JUEGOS`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`JUEGOS` (`Edad_Recomendada`, `PRODUCTO_Num_Producto`) VALUES (16, 789);
INSERT INTO `FINAL`.`JUEGOS` (`Edad_Recomendada`, `PRODUCTO_Num_Producto`) VALUES (18, 790);
COMMIT;
SELECT * FROM JUEGOS;

-- -----------------------------------------------------
-- Data for table `FINAL`.`LIBROS`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`LIBROS` (`ISBN`, `Fecha_Publicacion`, `PRODUCTO_Num_Producto`) VALUES (453634, '2010-05-19', 111);
INSERT INTO `FINAL`.`LIBROS` (`ISBN`, `Fecha_Publicacion`, `PRODUCTO_Num_Producto`) VALUES (453635, '2019-05-19', 112);

COMMIT;
SELECT * FROM LIBROS;

-- -----------------------------------------------------
-- Data for table `FINAL`.`AUTOR`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`AUTOR` (`DNI`, `Nombre`, `Biografía`) VALUES ('12345643K', 'Rigoberto', NULL);
INSERT INTO `FINAL`.`AUTOR` (`DNI`, `Nombre`, `Biografía`) VALUES ('12345644J', 'Robert de Niro', NULL);
COMMIT;
SELECT * FROM AUTOR;

-- -----------------------------------------------------
-- Data for table `FINAL`.`IDIOMA`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`IDIOMA` (`Idioma`, `LIBROS_PRODUCTO_Num_Producto`) VALUES ('Español', 111);
INSERT INTO `FINAL`.`IDIOMA` (`Idioma`, `LIBROS_PRODUCTO_Num_Producto`) VALUES ('Ingles', 111);
INSERT INTO `FINAL`.`IDIOMA` (`Idioma`, `LIBROS_PRODUCTO_Num_Producto`) VALUES ('Español', 112);
INSERT INTO `FINAL`.`IDIOMA` (`Idioma`, `LIBROS_PRODUCTO_Num_Producto`) VALUES ('Ingles', 112);

COMMIT;
SELECT * FROM IDIOMA;

-- -----------------------------------------------------
-- Data for table `FINAL`.`ESCRITO_POR`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`ESCRITO_POR` (`LIBROS_PRODUCTO_Num_Producto`, `AUTOR_DNI`) VALUES (111, '12345643K');
INSERT INTO `FINAL`.`ESCRITO_POR` (`LIBROS_PRODUCTO_Num_Producto`, `AUTOR_DNI`) VALUES (112, '12345644J');

COMMIT;
SELECT * FROM ESCRITO_POR;

-- -----------------------------------------------------
-- Data for table `FINAL`.`PEDIDO`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`PEDIDO` (`Num_Pedido`, `Fecha`, `Coste_Total`, `Usuario_DNI`, `Coste_Productos`) VALUES (1, '2020-03-10', 0, '12345678L', 0);
INSERT INTO `FINAL`.`PEDIDO` (`Num_Pedido`, `Fecha`, `Coste_Total`, `Usuario_DNI`, `Coste_Productos`) VALUES (2, '2021-05-09', 0, '12345678L', 0);
INSERT INTO `FINAL`.`PEDIDO` (`Num_Pedido`, `Fecha`, `Coste_Total`, `Usuario_DNI`, `Coste_Productos`) VALUES (1, '2020-03-10', 0, '12398734O', 0);
INSERT INTO `FINAL`.`PEDIDO` (`Num_Pedido`, `Fecha`, `Coste_Total`, `Usuario_DNI`, `Coste_Productos`) VALUES (1, '2021-05-09', 0, '98760022E', 0);
INSERT INTO `FINAL`.`PEDIDO` (`Num_Pedido`, `Fecha`, `Coste_Total`, `Usuario_DNI`, `Coste_Productos`) VALUES (1, '2021-05-09', 0, '98764222E', 0);
INSERT INTO `FINAL`.`PEDIDO` (`Num_Pedido`, `Fecha`, `Coste_Total`, `Usuario_DNI`, `Coste_Productos`) VALUES (1, '2021-05-09', 0, '98764022E', 0);


COMMIT;

SELECT * FROM PEDIDO;

-- EN LOS SIGUIENTES INSERTS SE PUEDE APRECIAR EL USO DE LOS TRIGGERS AL MODIFICAR EL COSTE TOTAL DE LOS PRODUCTOS CON LAS INSERCIONES EN LAS TABLAS ENVIO Y PEDIDO_HAS_PRODUCTO

-- -----------------------------------------------------
-- Data for table `FINAL`.`ENVIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`ENVIO` (`Metodo`, `Coste`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Aereo', 20, 1, '12345678L');
INSERT INTO `FINAL`.`ENVIO` (`Metodo`, `Coste`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Aereo', 20, 1, '12398734O');
INSERT INTO `FINAL`.`ENVIO` (`Metodo`, `Coste`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Naval', 10, 1, '98760022E');
INSERT INTO `FINAL`.`ENVIO` (`Metodo`, `Coste`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Aereo', 20, 1, '98764222E');
INSERT INTO `FINAL`.`ENVIO` (`Metodo`, `Coste`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Naval', 10, 1, '98764022E');

COMMIT;

SELECT * FROM ENVIO;
-- SE LE DEBE DE HABER SUAMDO AL COSTE TOTAL DEL PEDIDO EL PRECIO DEL ENVIO
SELECT * FROM PEDIDO;

-- -----------------------------------------------------
-- Data for table `FINAL`.`PEDIDO_has_PRODUCTO`
-- -----------------------------------------------------
-- AL INTRODUCIR UN ELEMENTO EN ESTA TABLA DEBE SUMARSE EL PRECIO DEL PRODUCTO AL COSTE DE PRODUCTOS Y AL COSTE TOTAL
-- AL INTRODUCIR UN ELEMENTO EN ESTA TABLA DEBE RESTARSE AL STOCK DE LA TABLA PRODUCTOS
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '12345678L', 123, 2);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '12345678L', 457, 3);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '12398734O', 456, 3);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '12398734O', 457, 1);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '98760022E', 111, 1);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '98760022E', 456, 3);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '98764222E', 457, 1);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '98764222E', 123, 3);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '98764022E', 457, 2);
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '98764022E', 123, 1);
SELECT * FROM PEDIDO;
SELECT * FROM PRODUCTO;
INSERT INTO `FINAL`.`PEDIDO_has_PRODUCTO` (`PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`, `PRODUCTO_Num_Producto`, `Cantidad`) VALUES (1, '12345678L', 789, 1);
SELECT * FROM PEDIDO;
SELECT * FROM PRODUCTO;


COMMIT;

SELECT * FROM PEDIDO_has_PRODUCTO;

-- -----------------------------------------------------
-- Data for table `FINAL`.`PAGO`
-- -----------------------------------------------------
-- LA INSERCION EN LA TABLA DE PAGO MOSTRARA UN ERROR SI EL ATRIBUTO CANTIDAD PAGADA NO ES IGUAL AL ATRIBUTO COSTE TOTAL DEL PEDIDO AL QUE SE REFIERE
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`PAGO` (`Tipo_Pago`, `Cantidad_Pagada`, `Fecha`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Transferencia', 214.2, '2021-03-19', 1, '12345678L');
COMMIT;
SELECT * FROM PAGO;

START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`PAGO` (`Tipo_Pago`, `Cantidad_Pagada`, `Fecha`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Transferencia', 215.2, '2021-03-19', 1, '98764022E');
INSERT INTO `FINAL`.`PAGO` (`Tipo_Pago`, `Cantidad_Pagada`, `Fecha`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Transferencia', 37.8, '2021-03-19', 1, '98760022E');
COMMIT;
SELECT * FROM PAGO;


-- -----------------------------------------------------
-- Data for table FINAL.REVISA`
-- ----------------------------------------------------
START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`REVISA` (`Titulo`, `Puntuacion`, `Descipcion`, `Usuario_DNI`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Gran Producto', 10, NULL, '12345678L', 1, '12345678L');
INSERT INTO `FINAL`.`REVISA` (`Titulo`, `Puntuacion`, `Descipcion`, `Usuario_DNI`, `PEDIDO_Num_Pedido`, `PEDIDO_Usuario_DNI`) VALUES ('Gran Producto', 10, NULL, '12398734O', 1, '12345678L');
COMMIT;
SELECT * FROM REVISA;

-- COMPROBACIÓN DE HERENCIA TOTAL

START TRANSACTION;
USE `FINAL`;
INSERT INTO `FINAL`.`ALIMENTACION` (`Procesado`, `PRODUCTO_Num_Producto`) VALUES (false, 123);

COMMIT;


