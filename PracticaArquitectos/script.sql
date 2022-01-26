CREATE TYPE Tipo_Direccion As
(Tipo_via Varchar(4),
Nombre_via Varchar(100),
Poblacion VarChar(50),
CP Varchar(4),
Provincia VarChar(50));

CREATE TYPE Proyecto AS
(Cod_Proyecto Integer,
Nombre VarChar(50));

CREATE TYPE JefeProyecto AS
(Cod_JefeProyecto Integer,
Nombre VarChar(50),
Dirección Tipo_Direccion,
Teléfono VarChar(10));

ALTER TYPE JefeProyecto ADD ATTRIBUTE Dirige Proyecto;

CREATE TYPE Plano AS
(CodPlano Integer,
F_entrega Date,
Arquitectos VarChar(15)Array[10],
DibujoPlano VarChar(50),
Num_Figuras Integer);

ALTER TYPE plano ADD ATTRIBUTE DibujoPlano VarChar(50);

ALTER TYPE Proyecto ADD ATRIBUTE Dirigido_por JefeProyecto;
ALTER TYPE Proyecto ADD ATTRIBUTE Tiene_planos Plano;

CREATE TYPE Figura AS (
Cod_Figura Integer,
Nombre VarChar(30),
Color Varchar(30),
Plano_Pert Plano);

ALTER TYPE plano ADD ATTRIBUTE Tiene_Fig Boolean;

CREATE TABLE T_Jefe_Proyecto OF JefeProyecto (
PRIMARY KEY Cod_JefeProyecto,
UNIQUE Nombre);

CREATE TABLE T_Proyecto OF JefeProyecto(
PRIMARY KEY Cod_Proyecto,
NOT NULL Dirigido_por);



CREATE TABLE T_Plano OF Plano (
PRIMARY KEY CodPlano);



CREATE TABLE T_Figura OF Figura(
PRIMARY KEY Cod_Figura,
NOT NULL Plano_Pert);

CREATE TYPE Poligon UNDER Figura AS(
    Num_Lineas Integer,
    Tiene_Lineas REF Linea MULTISET
);

CREATE TABLE T_Poligono OF Poligono UNDER T_Figura;

CREATE TYPE Punto As (
CoordX Integer
CoordY Integer);

CREATE TYPE Linea AS (
Id_Linea Number,
Tiene_Puntos Punto ARRAY(2));

CREATE TABLE TLinea OF Linea(
Id_Linea PRIMARY KEY);