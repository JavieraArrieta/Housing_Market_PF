# <h1 align="center">**`House Market`**

<p align="center">
<img src="https://images.pexels.com/photos/1546168/pexels-photo-1546168.jpeg?cs=srgb&dl=pexels-david-mcbee-1546168.jpg&fm=jpg" 

</br>

A lo largo de los últimos años, especialmente desde el 2008 hasta la fecha, el mercado inmobiliario mundial, y más concretamente el estadounidense, ha sufrido grandes subidas y bajadas, no solo generando un impacto en esa industria, sino que también con consecuencias económicas de todo tipo.  

En este proyecto haremos un estudio del mercado de viviendas de los Estados Unidos con el **OBJETIVO** de:


> Analizar si la sector inmobiliaria de USA se encuentra entrando en un período recesivo y así determinar si es una buena estrategia invertir o no. 

> Definir que zona y/o zonas de los Estados Unidos tiene mejores oportunidades de  inversión en el sector inmobiliario, independientemente de la situación económica que pueda llegar a estar sucediendo. 

</br>

## Diagrama de GANTT

<p align="center">
<img src="image\Calendario.PNG">

</br>

## Indicadores de gestion por Estado:

* **Precio-Alquiler**:<br>
 Indicador de relación en tiempo desde la adquisición del inmueble hasta el punto de equilibrio:   
    * Menor tiempo más viable.
 <br>

**Elaboracion:**
1. Se va a realizar el análisis del tiempo promedio del país (Estados Unidos) en el que una vivienda recupera su inversión de adquisición a través de su renta o alquiler.
2. Por Estado (EE.UU) se va a realizar el mismo análisis de tal manera que se va a observar a lo largo del tiempo que estados generan un tiempo de retorno de inversión más bajo.
3. la forma de medición es un semáforo a través del cual se van a establecer unos rangos de tiempo en cada luz del semáforo clasificándolos como Malo, Normal y Bueno.

KPI= % de estados con PA dentro del semaforo

<p align="center">
<img src="image\precio_alquiler.PNG">


</br>

* **PIB-Precio vivienda**:<br>
 Indicador de variación entre los precios de los inmuebles por tipo y el crecimiento economico.
  <br>

**Elaboracion:**
1. Se va a realizar por estado (Estados Unidos) un análisis de la variación del PIB clasificando los estados en:
    * Crecimiento
    * Crecimiento Inercial
    * Decrecimiento

2. Luego de eso se va a determinar la relación de la variación del PIB (depende de cada categoría) con el KPI de Precio-Alquiler alojando dos subcategorías para cada una:
    * % de estados arriba o igual al promedio.
    * % de estados por debajo del promedio.

3. A cada clasificación inicial de categorías del PIB se le va a incluir una clasificación del KPI Precio-Alquiler de las zonas que correspondan a las 3 categorías iniciales.

KPI= % de estados por clasificación y su distribución correspondiente con kPI PA

<p align="center">
<img src="image\PBI_precio.PNG">

 </br>

* **Días Venta-Precio**:<br>
 Indicador que mide el comportamiento del tiempo de venta de un inmueble respecto al precio de los mismos.
 <br>

**Elaboracion:**
1. Se va a realizar un promedio general a nivel país por estado
(Estados Unidos) y por tipo de propiedad respecto al número de días que demora una propiedad en ser vendida
2. Luego se definirán unos rangos de tiempos óptimos con respecto al tiempo de venta de un inmueble
3. la forma de medición es un semáforo a través del cual se van a establecer unos rangos de tiempo en cada luz del semáforo clasificándolos como Malo, Normal y Bueno.

KPI= % de estados con tiempo de días venta dentro del semaforo

<p align="center">
<img src="image\dias_venta_precio.PNG">

 </br>

* **Tasa de desempleo - Precio**:<br>
 Indicador que mide el comportamiento del precio de las viviendas respecto a la tasa de desempleo mensual de cada estado.
 <br>

 **Elaboracion:**
 1. Se va a realizar un primer análisis de la tasa de desempleo clasificando en 3 categorías: 
    * Buena
    * Normal
    * Critico
2. Se va a revisar la variación de los precios de manera positiva o negativa dependiendo de cada escenario por estados y tipos de vivienda para ver si es negativa o positiva la relación.
3. Se va a medir a través de un semáforo el porcentaje de estados participantes en cada clasificación de las 3 categorías para posteriormente analizar su variación con los precios.

KPI= % de estados participantes en cada categoría

<p align="center">
<img src="image\desempleo precio.PNG">

</br>

* **Estabilidad**:<br>
Indicador de comportamiento economico en tiempos de recesion. <br>
    * Crecimiento
    * Baja Volatilidad
<br>

**Elaboracion:**
1. Se va a determinar la variación del sector inmobiliario a través de una serie de tiempo con respecto a 3 eventos: 
    * Crisis punto com 
    * Atentado 9-11 
    * Crisis subprime
2. Por Estado (EE.UU) se va a analizar el comportamiento del
sector inmobiliario y otras variables macro respecto a la
variación de las mismas durante los eventos:
    * PIB
    * Riesgo Pobreza
    * Alquiler
    * Precio Viviendas
3. Se va a realizar un promedio ponderado dependiendo de la relación y variación de las variables con respecto al precio de las viviendas para ver que Estados respondieron a un crecimiento y una baja volatilidad.
4. Luego de evidenciar el análisis del promedio ponderado, los
5 estados con menor variación negativa y menor volatilidad
(Sujeto a cambios) conformarán según este kpi las mejores
opciones y zonas a nivel de riesgo para invertir.

KPI= % de estados con menor variación negativa

<p align="center">
<img src="image\escalabilidad.PNG">

</br>


## Análisis exploratorio y proceso de ETL

 → [Aqui](https://github.com/JavieraArrieta/Housing_Market_PF/tree/main/EDA_ETL) podemos encontrar los Jupyter Notebooks de todos los análisis organizados por KPI.

<p align="center">
<img src="image\etl.PNG">

→ [Aqui](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Normalizaci%C3%B3n%2C%20transformaci%C3%B3n%20y%20limpieza%20de%20datos.pdf) esta la documentación detallada de todo el proceso.

## Diccionario de Datos

→ [Aqui](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Diccionario%20de%20datos.pdf) estan las definiciones de las variables de todas las tablas usadas.


## Modelo Relacional

<p align="center">
<img src="image\ModeloRelacional.jpeg">

[Documentacion DW](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Documentaci%C3%B3nDataWareHouse.pdf)

[Archivos usados para el DW](https://github.com/JavieraArrieta/Housing_Market_PF/tree/main/DataWarehouse)

## Predicciones del modelo
[Pagina Web: Modelo ML](https://javieraarrieta-housi-ml-streamlitmodelomacroinmobiliario-7o1yd9.streamlit.app/)

[Dashboard KPI Estados](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Dashboard%20KPIs.pbix)

## AWS Redshift
[Pipeline ETL para cargar datos de forma incremental desde Amazon S3 a Amazon Redshift mediante una función Lambda.](https://github.com/JavieraArrieta/Housing_Market_PF/tree/main/DataWarehouse/s3%20lamda%20redshift)

<p align="center">
<img src="DataWarehouse\s3 lamda redshift\etl2.png">


## Presentaciones

KPI's y Definiciones: Trazamos objetivos y determinamos a través de la información la calidad del dato. → [Semana 1](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Presentaci%C3%B3n1.pdf) <br>


Data Engineer: ETL completo y su automatización. Construcción DW y creación del modelo relacional. Documentación. → [Semana 2](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Presentaci%C3%B3n%202.pdf)

Data Analytics/Data Science: Inclusión KPI´s en visualización (Dashboard) Modelo ML y su evaluación. Estructuración, presentación y
análisis para la propuesta de inversión.  → [Semana 3](Falta)

Presentacion Final  → [Semana 4](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Presentaci%C3%B3n%20Final.pdf)

