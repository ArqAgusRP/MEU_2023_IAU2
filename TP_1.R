#Instrumentos de Análisis Urbanos II - TP1 

#Paso 1- instalar libreria

library(tidyverse)

library(readr)

# Paso 2- importar base de datos: Terrenos: Valor de Oferta que contiene el precio de oferta de venta de terrenos de la Ciudad, representado en puntos de valor del suelo correspondientes a cada parcela.

datos <- read_csv("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/secretaria-de-desarrollo-urbano/terrenos-valor-oferta/Terrenos-en-venta-2020.csv")

summary(datos)

# La base de datos muestra los precios de los terrenos en CABA durante el año 2020. Separa los terrenos por dirección, barrio y comuna y muestra los precios tanto de la propiedad como por m2 en pesos y dólares


# Pregunta a responder: ¿cuál es el promedio del precio del m2 en el barrio de Palermo? Cual es el precio promedio del m2 de una propiedad en Palermo?


# Paso 3- Filtrar datos. A los fines de visualizar los datos del barrio que nos interesa para el análisis, filtramos los datos para que nos muestre los datos del barrio de palermo y los montos en dólares

filtro_palermo <- filter(datos, BARRIO == "PALERMO")

precios_prop_usd <- select(filtro_palermo, DIRECCION, PRECIOUSD, DOLARM2, BARRIO)

summary(precios_prop_usd)


# Podemos observar que se redujo la cantidad de propiedades en estudio a 578 observaciones de las 10301 observaciones de la base original que incluye a todos los barrios

precios_prop_usd <- arrange(precios_prop_usd, PRECIOUSD)


# Calcular el precio promedio de las propiedades en dólares
precio_promedio_propiedades_usd <- mean(precios_prop_usd$PRECIOUSD)

print(precio_promedio_propiedades_usd)

precio_promedio_propiedades_m2_usd <- mean(precios_prop_usd$DOLARM2)

print(precio_promedio_propiedades_m2_usd)


#Podemos observar que el precio promedio de una propiedad = 1323477 USD y el precio promedio por m2= 4283.047 USD

  
