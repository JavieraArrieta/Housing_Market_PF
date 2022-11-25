use pf

#Bases de datos Dimensionales

drop table if exists estados

create table estados(
id varchar(10),
estado varchar(100),
primary key (id)
);


LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Estado.csv"
INTO TABLE estados
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from Estados

drop table if exists tipo_propiedades
create table tipo_propiedades(
	id int not null,
    tipo varchar(50),
    primary key(id)
    );
    
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Tipo_propiedades.csv"
INTO TABLE tipo_propiedades
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from tipo_propiedades

#Tablas de Hechos 

DROP TABLE datosmacro_usa ;

CREATE TABLE datosmacro_usa (
Fecha DATE,
IndicePreciosVivienda INT,
IndicePreciosAcciones INT,
IndicePreciosConsumidor INT,
Poblacion INT,
TasaDesempleo INT,
PIB INT,
TasaInteresHipotecario INT,
IngresosReales INT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- importar bases de datos dentro de la tabla creada

SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//annual_macroeconomic_factors_EDA.csv"
INTO TABLE datosmacro_usa
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from datosmacro_usa

DROP TABLE IF EXISTS Desempleo;
CREATE TABLE IF NOT EXISTS Desempleo (
  	ID_Estado 			VARCHAR(10),
  	Fecha 				VARCHAR(10),
  	Año 				int not null,
    Mes					int not null,
  	Tipo_Propiedad 		int not null,
    Precio				DECIMAL(10,2),
    Tasa_Desempleo 		DECIMAL(10,2),
    Clasificacion		VARCHAR(30),
	foreign key (ID_Estado) references estados(id),
    foreign key (Tipo_Propiedad) references tipo_propiedades(id)
);	

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Estado_desempleo.csv'
INTO TABLE Desempleo 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' 
IGNORE 1 LINES;

select * from Desempleo
-------------------------------------------
DROP TABLE IF EXISTS riesgo_pobreza
CREATE TABLE riesgo_pobreza (
IdEstado VARCHAR(10),
Estado VARCHAR(200),
Fecha YEAR,
CantidadPersonas BIGINT,
RiesgoPobreza INT,
Foreign key (IdEstado) references  estados(id) 
);


LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//pobreza_estados.csv"
INTO TABLE riesgo_pobreza
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;
-----
select * from riesgo_pobreza

DROP TABLE datosmacro_vivienda ;
CREATE TABLE datosmacro_vivienda (
Fecha DATE,
IndicePreciosVivienda INT,
Poblacion INT,
PIB INT,
TasaInteresHipotecario INT,
TasaEmpleo INT,
PPI INT,
M3 INT,
CCI INT,
TasaDelincuencia INT,
HCAI INT
);

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Housing_macroeconomic_factors_EDA.csv"
INTO TABLE datosmacro_vivienda
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from datosmacro_vivienda

DROP TABLE pib_estado

CREATE TABLE pib_estado (
IdEstado VARCHAR(10),
Fecha YEAR,
PIB VARCHAR(100),
VarPIB INT,
Estado VARCHAR(100),
Foreign key (IdEstado) references  estados(id)
);

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//pib_estados.csv"
INTO TABLE pib_estado
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from pib_estado
DROP TABLE tasa_desempleo ;
CREATE TABLE tasa_desempleo (
IdEstado VARCHAR(10),
Fecha YEAR,
Mes VARCHAR(100),
TasaDesempleo INT,
Estado VARCHAR(100),
Foreign key (IdEstado) references  estados(id)
);


LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//tasa_desempleo.csv"
INTO TABLE tasa_desempleo
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from tasa_desempleo

DROP TABLE IF EXISTS PIB_Estado_tipodevivienda

CREATE TABLE PIB_Estado_tipodevivienda	 (
IdEstado VARCHAR(10),
Fecha  datetime ,
tipo_propiedad int not null,
valorPIB float,
año int,
trimestre int not null,
resumenPIb varchar(100),
Foreign key (IdEstado) references  estados(id),
foreign key (tipo_propiedad) references tipo_propiedades(id)
); 

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//pibestadovivienda.csv"
INTO TABLE PIB_Estado_tipodevivienda
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from pib_estado_tipodevivienda
drop table if exists dias_promedio

create table dias_promedio(
estado varchar(10),
fecha date,
promedio_dias float,
foreign key (estado) references estados(id)
);

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//diaspromedio.csv"
INTO TABLE dias_promedio
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\r\n' STARTING BY ''
IGNORE 1 LINES;

select * from dias_promedio

drop table if exists permisos

create table permisos(
fecha date,
porcentaje_media int not null
);

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//permisos.csv"
INTO TABLE permisos
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

select * from permisos

drop table if exists hospital_estados
create table hospital_estados(
Estado varchar(10),
hospitales int,
foreign key (Estado) references estados(id)
);

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//hospital_estadoo.csv"
INTO TABLE hospital_estados
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

select * from hospital_estados

drop table if exists valores_zillow

create table valores_zillow(
Nomenclatura varchar(100),
fecha date,
valor decimal(10,2)
);

LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//zillow_values.csv"
INTO TABLE valores_zillow
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;


select * from valores_zillow

drop table if exists roi_estados

create table roi_estados(
	Estado varchar(10),
    fecha date,
    precio_propiedad int,
    renta int,
    tipo_propiedad int,
    año int,
    roi decimal(10,2),
    foreign key (Estado) references estados(id),
    foreign key (tipo_propiedad) references tipo_propiedades(id)
);


LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Roi_Estado.csv"
INTO TABLE roi_estados
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;

select * from Roi_Estados

drop table if exists valores_zri

create table valores_zri (
Region varchar(100),
Estado varchar(10),
metro varchar(200),
fecha date,
valor int not null,
foreign key (Estado) references estados(id)
);

select * from valores_zri
LOAD DATA INFILE "C://ProgramData//MySQL//MySQL Server 8.0//Uploads//data_Zri.csv"
INTO TABLE valores_zri 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' STARTING BY ''
IGNORE 1 LINES;
