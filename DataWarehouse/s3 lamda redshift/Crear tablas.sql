create table valores_zillow(
id_valores	varchar(50),
nomeclatura	varchar(50),	
fecha	varchar(50),	
valor	varchar(50))

select * from valores_zillow;

***************************************

create table Housing_macroeconomic_factors(
Date	varchar(50),	
house_price_index	varchar(50),	
population	varchar(50),	
gdp	varchar(50),	
mortgage_rate	varchar(50),	
employment_rate varchar(50),
ppi_res	varchar(50),
m3	varchar(50),
cci	varchar(50),	
delinquency_rate	varchar(50),	
hcai	varchar(50))

select * from Housing_macroeconomic_factors;

******************************************************

create table pobreza_estados(
id_estado   varchar(50),
estado   varchar(50),	
fecha   varchar(50),	
personas_en_riesgo   varchar(50),	
porcentaje_riesgo_pobreza   varchar(50))

select * from pobreza_estados;

******************************************************

create table pib_estados(
id_estado   varchar(50),	
fecha   varchar(50),	
pib_anual   varchar(50),	
variabilidad_pib   varchar(50),	
estado   varchar(50))


select * from pib_estados;

******************************************************

create table tasa_desempleo(
id_estado   varchar(50),	
anio   varchar(50),	
mes   varchar(50),	
tasa_desempleo   varchar(50),	
estado   varchar(50))


select * from tasa_desempleo;
******************************************************

create table roi_estado(
estado   varchar(50),	
fecha   varchar(50),
precio   varchar(50),	
valor_renta   varchar(50),	
tipo_propiedad   varchar(50),	
anio   varchar(50),	
valor_roi   varchar(50))

select * from roi_estado;

******************************************************

create table pibestadovivienda(
estado   varchar(50),	
fecha   varchar(50),	
tipo_propiedad   varchar(50),	
valor_pib   varchar(50),	
anio   varchar(50),	
trimestre   varchar(50), 	
resumen_pib   varchar(50))

select * from pibestadovivienda;

******************************************************

create table tipo_propiedades(
id   varchar(50),
tipo_propiedad   varchar(50)
)


select * from tipo_propiedades;

******************************************************

create table annual_macroeconomic_factors(
date   varchar(50),	
house_price_index   varchar(50),	
stock_price_index   varchar(50),	
consumer_price_index   varchar(50),	
population   varchar(50),	
unemployment_rate   varchar(50),	
real_gdp   varchar(50),	
mortgage_rate   varchar(50),	
real_disposable_income   varchar(50))


select * from annual_macroeconomic_factors;

******************************************************

create table annual_macroeconomic_factors(
date   varchar(50),	
house_price_index   varchar(50),	
stock_price_index   varchar(50),	
consumer_price_index   varchar(50),	
population   varchar(50),	
unemployment_rate   varchar(50),	
real_gdp   varchar(50),	
mortgage_rate   varchar(50),	
real_disposable_income   varchar(50))


select * from annual_macroeconomic_factors;
******************************************************

create table diaspromedio(
estado   varchar(50),	
fecha   varchar(50),	
promedio_dias   varchar(50))

select * from diaspromedio;
******************************************************

create table permisos(
fecha   varchar(50),	
media_mensual_permiso   varchar(50))

select * from permisos;
******************************************************

create table Estado_desempleo(
ID_Estado   varchar(50),	
Fecha   varchar(50),	
Año   varchar(50),	
Mes   varchar(50),	
Tipo_Propiedad   varchar(50),	
Precio   varchar(50),	
Tasa_Desempleo   varchar(50),	
Clasificacion   varchar(50))


select * from Estado_desempleo;
