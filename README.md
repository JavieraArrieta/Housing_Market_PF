# <h1 align="center">**`House Market`**

<p align="center">
<img src="https://images.pexels.com/photos/1546168/pexels-photo-1546168.jpeg?cs=srgb&dl=pexels-david-mcbee-1546168.jpg&fm=jpg" 

</br>

A lo largo de los últimos años, especialmente desde el 2008 hasta la fecha, el mercado inmobiliario mundial, y más concretamente el estadounidense, ha sufrido grandes subidas y bajadas, no solo generando un impacto en esa industria, sino que también con consecuencias económicas de todo tipo.  

En este proyecto haremos un estudio del mercado de viviendas de los Estados Unidos con el **OBJETIVO** de:


> Analizar si la sector inmobiliaria de USA se encuentra entrando en un período recesivo y así determinar si es una buena estrategia invertir o no. 

> Definir que zona y/o zonas de los Estados Unidos tiene mejores oportunidades de  inversión en el sector inmobiliario, independientemente de la situación económica que pueda llegar a estar sucediendo. 

</br>

## Diagrama de GANTT: Calendario de tareas para las proximas semanas.

<p align="center">
<img src="image\Calendario.PNG">

</br>

## Definimos los siguientes KPI's:

* **Estabilidad**: <br>
Indicador de comportamiento economico en tiempos de recesion. <br>
    * Crecimiento
    * Baja Volatilidad

</br>

* **Precio-Alquiler**:<br>
 Indicador de relación en tiempo desde la adquisición del inmueble hasta el punto de equilibrio:   
    * Menor tiempo más viable

</br>

* **Inflación-Precio vivienda**:<br>
 Indicador de variación entre los precios de los inmuebles por tipo y la inflación. Le otorgamos la siguiente valoración:<br>
    * PIB < 0: La economía esta en decrecimiento.
    * PIB entre 0 y 2: La economia esta estable.
    * PIB > 

 </br>

* **Días Venta-Precio**:<br>
 Indicador que mide el comportamiento del tiempo de venta de un inmueble respecto al precio de los mismos.

 </br>

* **Tasa de desempleo - Precio**:<br>
 Indicador que mide el comportamiento del precio de las viviendas respecto a la tasa de desempleo mensual de cada estado. Clasificamos la tasa de desempleo como:<br>
    * Buena: Por debajo del 4%
    * Normal: Entre el 4 y 6%
    * Crítico: Por arriba del 6%<br>

    Elegimos este intervalo de 4 a 6% ya que son los porcentajes que ronda la tasa de desempleo natural(pleno empleo) de EEUU desde 2010 a 2019.



## Análisis exploratorio y proceso de ETL

 → [Aqui](https://github.com/JavieraArrieta/Housing_Market_PF/tree/main/EDA_ETL) podemos encontrar los Jupyter Notebooks de todos los análisis organizados por KPI.

<p align="center">
<img src="image\falta">

→ [Aqui](https://docs.google.com/document/d/1k6_ju5h5JnX9tpsCHpDMFRyVfoBeusBb-SSGBPxcrdI/edit) esta la documentación detallada de todo el proceso.

## Diccionario de Datos

→ [Aqui](pdf) estan las definiciones de las variables de todas las tablas usadas.


## Modelo Relacional

<p align="center">
<img src="image\falta">

[Documentacion DW]()

## Presentaciones

KPI's y Definiciones: Trazamos objetivos y determinamos a través de la información la calidad del dato. → [Semana 1](https://github.com/JavieraArrieta/Housing_Market_PF/blob/main/Presentaciones%20y%20Documentacion/Presentaci%C3%B3n1.pdf) <br>


Data Engineer: ETL completo y su automatización. Construcción DW y creación del modelo relacional. Documentación. → [Semana 2]()