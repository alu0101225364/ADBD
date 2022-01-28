START TRANSACTION;

-- -----------------------------------------------------
-- Schema FINAL
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS FINAL ;

-- -----------------------------------------------------
-- Schema FINAL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS  FINAL DEFAULT CHARACTER SET utf8 ;
USE  FINAL  ;

-- -----------------------------------------------------
-- Table    FINAL.USUARIO 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.USUARIO  ;

CREATE TABLE IF NOT EXISTS    FINAL.USUARIO  (
   DNI  VARCHAR(9) NOT NULL,
   Nombre_Usuario  VARCHAR(45) NOT NULL,
   Email  VARCHAR(45) NOT NULL,
   Telefono  INT NULL,
   Contraseña  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( DNI ))
;


-- -----------------------------------------------------
-- Table    FINAL.PEDIDO 
-- -----------------------------------------------------
DROP TABLE IF EXISTS  FINAL.PEDIDO  ;

CREATE TABLE IF NOT EXISTS    FINAL.PEDIDO  (
   Num_Pedido  INT NOT NULL AUTO_INCREMENT,
   Fecha  DATETIME NOT NULL,
   Coste_Total  DOUBLE NOT NULL,
   Usuario_DNI  VARCHAR(9) NOT NULL,
   Coste_Productos  DOUBLE NOT NULL,
  PRIMARY KEY ( Num_Pedido ,  Usuario_DNI ),
  INDEX  fk_PEDIDO_Usuario_idx  ( Usuario_DNI  ASC),
  CONSTRAINT  fk_PEDIDO_Usuario 
    FOREIGN KEY ( Usuario_DNI )
    REFERENCES    FINAL.USUARIO  ( DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE) 
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table    FINAL.ENVIO 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.ENVIO  ;

CREATE TABLE IF NOT EXISTS    FINAL.ENVIO  (
   Metodo  VARCHAR(45) NOT NULL,
   Coste  DOUBLE NOT NULL,
   PEDIDO_Num_Pedido  INT NOT NULL AUTO_INCREMENT,
   PEDIDO_Usuario_DNI  VARCHAR(9) NOT NULL,
  PRIMARY KEY ( PEDIDO_Num_Pedido ,  PEDIDO_Usuario_DNI ),
  CONSTRAINT  fk_ENVÍO_PEDIDO1 
    FOREIGN KEY ( PEDIDO_Num_Pedido  ,  PEDIDO_Usuario_DNI )
    REFERENCES    FINAL.PEDIDO  ( Num_Pedido  ,  Usuario_DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.PAGO 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.PAGO  ;

CREATE TABLE IF NOT EXISTS    FINAL.PAGO  (
   Tipo_Pago  VARCHAR(45) NOT NULL,
   Cantidad_Pagada  DOUBLE NOT NULL,
   Fecha  DATETIME NOT NULL,
   PEDIDO_Num_Pedido  INT NOT NULL AUTO_INCREMENT,
   PEDIDO_Usuario_DNI  VARCHAR(9) NOT NULL,
  PRIMARY KEY (  PEDIDO_Num_Pedido ,  PEDIDO_Usuario_DNI ),
  INDEX  fk_PAGO_PEDIDO1_idx  ( PEDIDO_Num_Pedido  ASC,  PEDIDO_Usuario_DNI  ASC),
  CONSTRAINT  fk_PAGO_PEDIDO1 
    FOREIGN KEY ( PEDIDO_Num_Pedido  ,  PEDIDO_Usuario_DNI )
    REFERENCES    FINAL.PEDIDO  ( Num_Pedido  ,  Usuario_DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.PRODUCTO 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.PRODUCTO  ;

CREATE TABLE IF NOT EXISTS    FINAL.PRODUCTO  (
   Num_Producto  INT NOT NULL,
   Nombre  VARCHAR(45) NOT NULL,
   Descripcion  VARCHAR(200) NULL,
   Stock  INT NOT NULL,
   Coste  DOUBLE NOT NULL,
  PRIMARY KEY ( Num_Producto ))
;


-- -----------------------------------------------------
-- Table    FINAL.ELECTRONICA 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.ELECTRONICA  ;

CREATE TABLE IF NOT EXISTS    FINAL.ELECTRONICA  (
   SO  VARCHAR(45) NOT NULL,
   PRODUCTO_Num_Producto  INT NOT NULL,
  PRIMARY KEY ( PRODUCTO_Num_Producto ),
  CONSTRAINT  fk_Electrónica_PRODUCTO1 
    FOREIGN KEY ( PRODUCTO_Num_Producto )
    REFERENCES    FINAL.PRODUCTO  ( Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.ALIMENTACION 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.ALIMENTACION  ;

CREATE TABLE IF NOT EXISTS    FINAL.ALIMENTACION  (
   Procesado  TINYINT NOT NULL,
   PRODUCTO_Num_Producto  INT NOT NULL,
  PRIMARY KEY ( PRODUCTO_Num_Producto ),
  CONSTRAINT  fk_Alimentación_PRODUCTO1 
    FOREIGN KEY ( PRODUCTO_Num_Producto )
    REFERENCES    FINAL.PRODUCTO  ( Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.JUEGOS 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.JUEGOS  ;

CREATE TABLE IF NOT EXISTS    FINAL.JUEGOS  (
   Edad_Recomendada  INT NOT NULL,
   PRODUCTO_Num_Producto  INT NOT NULL,
  PRIMARY KEY ( PRODUCTO_Num_Producto ),
  CONSTRAINT  fk_JUEGOS_PRODUCTO1 
    FOREIGN KEY ( PRODUCTO_Num_Producto )
    REFERENCES    FINAL.PRODUCTO  ( Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.LIBROS 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.LIBROS  ;

CREATE TABLE IF NOT EXISTS    FINAL.LIBROS  (
   ISBN  INT NOT NULL,
   Fecha_Publicacion  DATETIME NOT NULL,
   PRODUCTO_Num_Producto  INT NOT NULL,
  UNIQUE INDEX  ISBN_UNIQUE  ( ISBN  ASC),
  PRIMARY KEY ( PRODUCTO_Num_Producto ),
  CONSTRAINT  fk_LIBROS_PRODUCTO1 
    FOREIGN KEY ( PRODUCTO_Num_Producto )
    REFERENCES    FINAL.PRODUCTO  ( Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.AUTOR 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.AUTOR  ;

CREATE TABLE IF NOT EXISTS    FINAL.AUTOR  (
   DNI  VARCHAR(9) NOT NULL,
   Nombre  VARCHAR(45) NOT NULL,
   Biografía  VARCHAR(200) NULL,
  PRIMARY KEY ( DNI ))
;


-- -----------------------------------------------------
-- Table    FINAL.ESCRITO_POR 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.ESCRITO_POR  ;

CREATE TABLE IF NOT EXISTS    FINAL.ESCRITO_POR  (
   LIBROS_PRODUCTO_Num_Producto  INT NOT NULL,
   AUTOR_DNI  VARCHAR(9) NOT NULL,
  PRIMARY KEY ( LIBROS_PRODUCTO_Num_Producto ,  AUTOR_DNI ),
  INDEX  fk_LIBROS_has_AUTOR_AUTOR1_idx  ( AUTOR_DNI  ASC),
  INDEX  fk_LIBROS_has_AUTOR_LIBROS1_idx  ( LIBROS_PRODUCTO_Num_Producto  ASC),
  CONSTRAINT  fk_LIBROS_has_AUTOR_LIBROS1 
    FOREIGN KEY ( LIBROS_PRODUCTO_Num_Producto )
    REFERENCES    FINAL.LIBROS  ( PRODUCTO_Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_LIBROS_has_AUTOR_AUTOR1 
    FOREIGN KEY ( AUTOR_DNI )
    REFERENCES    FINAL.AUTOR  ( DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.DISTRIBUIDOR 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.DISTRIBUIDOR  ;

CREATE TABLE IF NOT EXISTS    FINAL.DISTRIBUIDOR  (
   CIF  INT NOT NULL,
   Email  VARCHAR(45) NOT NULL,
   Sector  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( CIF ),
  UNIQUE INDEX  Email_UNIQUE  ( Email  ASC))
;


-- -----------------------------------------------------
-- Table    FINAL.DISTRIBUIDO_POR 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.DISTRIBUIDO_POR  ;

CREATE TABLE IF NOT EXISTS    FINAL.DISTRIBUIDO_POR  (
   DISTRIBUIDOR_CIF  INT NOT NULL,
   PRODUCTO_Num_Producto  INT NOT NULL,
  PRIMARY KEY ( DISTRIBUIDOR_CIF ,  PRODUCTO_Num_Producto ),
  INDEX  fk_DISTRIBUIDOR_has_PRODUCTO_PRODUCTO1_idx  ( PRODUCTO_Num_Producto  ASC),
  INDEX  fk_DISTRIBUIDOR_has_PRODUCTO_DISTRIBUIDOR1_idx  ( DISTRIBUIDOR_CIF  ASC),
  CONSTRAINT  fk_DISTRIBUIDOR_has_PRODUCTO_DISTRIBUIDOR1 
    FOREIGN KEY ( DISTRIBUIDOR_CIF )
    REFERENCES    FINAL.DISTRIBUIDOR  ( CIF )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_DISTRIBUIDOR_has_PRODUCTO_PRODUCTO1 
    FOREIGN KEY ( PRODUCTO_Num_Producto )
    REFERENCES    FINAL.PRODUCTO  ( Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.IDIOMA 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.IDIOMA  ;

CREATE TABLE IF NOT EXISTS    FINAL.IDIOMA  (
   Idioma  VARCHAR(45) NOT NULL,
   LIBROS_PRODUCTO_Num_Producto  INT NOT NULL,
  PRIMARY KEY ( Idioma ,  LIBROS_PRODUCTO_Num_Producto ),
  INDEX  fk_IDIOMA_LIBROS1_idx  ( LIBROS_PRODUCTO_Num_Producto  ASC),
  CONSTRAINT  fk_IDIOMA_LIBROS1 
    FOREIGN KEY ( LIBROS_PRODUCTO_Num_Producto )
    REFERENCES    FINAL.LIBROS  ( PRODUCTO_Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.DIRECCION 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.DIRECCION  ;

CREATE TABLE IF NOT EXISTS    FINAL.DIRECCION  (
   Provincia  VARCHAR(45) NOT NULL,
   Calle  VARCHAR(45) NOT NULL,
   Ciudad  VARCHAR(45) NOT NULL,
   CP  VARCHAR(45) NOT NULL,
   Pais  VARCHAR(45) NOT NULL,
   Usuario_DNI  VARCHAR(9) NOT NULL,
  PRIMARY KEY ( Usuario_DNI ),
  INDEX  fk_DIRECCIÓN_Usuario1_idx  ( Usuario_DNI  ASC),
  CONSTRAINT  fk_DIRECCIÓN_Usuario1 
    FOREIGN KEY ( Usuario_DNI )
    REFERENCES    FINAL.USUARIO  ( DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.PEDIDO_has_PRODUCTO 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.PEDIDO_has_PRODUCTO  ;

CREATE TABLE IF NOT EXISTS    FINAL.PEDIDO_has_PRODUCTO  (
   PEDIDO_Num_Pedido  INT NOT NULL,
   PEDIDO_Usuario_DNI  VARCHAR(9) NOT NULL,
   PRODUCTO_Num_Producto  INT NOT NULL,
   Cantidad  INT NOT NULL,
  PRIMARY KEY ( PEDIDO_Num_Pedido ,  PEDIDO_Usuario_DNI ,  PRODUCTO_Num_Producto ),
  INDEX  fk_PEDIDO_has_PRODUCTO_PRODUCTO1_idx  ( PRODUCTO_Num_Producto  ASC),
  INDEX  fk_PEDIDO_has_PRODUCTO_PEDIDO1_idx  ( PEDIDO_Num_Pedido  ASC,  PEDIDO_Usuario_DNI  ASC),
  CONSTRAINT  fk_PEDIDO_has_PRODUCTO_PEDIDO1 
    FOREIGN KEY ( PEDIDO_Num_Pedido  ,  PEDIDO_Usuario_DNI )
    REFERENCES    FINAL.PEDIDO  ( Num_Pedido  ,  Usuario_DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_PEDIDO_has_PRODUCTO_PRODUCTO1 
    FOREIGN KEY ( PRODUCTO_Num_Producto )
    REFERENCES    FINAL.PRODUCTO  ( Num_Producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table    FINAL.REVISA 
-- -----------------------------------------------------
DROP TABLE IF EXISTS    FINAL.REVISA  ;

CREATE TABLE IF NOT EXISTS    FINAL.REVISA  (
   Titulo  VARCHAR(45) NOT NULL,
   Puntuacion  DOUBLE NOT NULL,
   Descipcion  VARCHAR(200) NULL,
   Usuario_DNI  VARCHAR(9) NOT NULL,
   PEDIDO_Num_Pedido  INT NOT NULL AUTO_INCREMENT,
   PEDIDO_Usuario_DNI  VARCHAR(9) NOT NULL,
  PRIMARY KEY ( Usuario_DNI ,  PEDIDO_Num_Pedido ,  PEDIDO_Usuario_DNI ),
  INDEX  fk_REVISA_PEDIDO1_idx  ( PEDIDO_Num_Pedido  ASC,  PEDIDO_Usuario_DNI  ASC),
  CONSTRAINT  fk_REVISA_Usuario1 
    FOREIGN KEY ( Usuario_DNI )
    REFERENCES    FINAL.USUARIO  ( DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_REVISA_PEDIDO1 
    FOREIGN KEY ( PEDIDO_Num_Pedido  ,  PEDIDO_Usuario_DNI )
    REFERENCES    FINAL.PEDIDO  ( Num_Pedido  ,  Usuario_DNI )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;

COMMIT;