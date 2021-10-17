#*********************************************************************# #                       ESTADISTICA DESCRIPTIVA                       #
#*********************************************************************#

####                  EJERCICIOS CLASE TEORICA                  ####

#limpiamos el ambiente de trabajo
ls()
rm(list=ls())
ls()

#seteamos nuestro directorio de trabajo
setwd("F:/eli/Curso R_Paraguay/Clase_miercoles/Ejercicios")

#importamos la tabla que vamos a utilizar
library(readr)
cuica <- read_delim("Cuicas.csv", ";", escape_double = FALSE, 
                    trim_ws = TRUE)
View(cuica)

#le damos el formtao correcto a cada una de nuestras variables
cuica$ambiente <- as.factor(cuica$ambiente)
cuica$anio <- as.factor(cuica$anio)
cuica$estacion <- as.factor(cuica$estacion)
cuica$ncuicas <- as.integer(cuica$ncuicas)

####Medidas de posicion####

#media para toda la muestra
mean(cuica$ncuicas, na.rm = TRUE)
round(mean(cuica$ncuicas, na.rm = TRUE))

#Media para un conjunto recortado 
round(mean(cuica$ncuicas, na.rm = TRUE, trim = 0.10))
round(mean(cuica$ncuicas, na.rm = TRUE, trim = 0.25))

#Media para cada ambiente 
library(tidyverse)
f1 <- filter(cuica, ambiente=="yerba")
round(mean(f1$ncuicas,na.rm = TRUE))

f2 <- filter(cuica, ambiente=="forestal")
round(mean(f2$ncuicas,na.rm = TRUE))

f3 <- filter(cuica, ambiente=="areanat")
round(mean(f3$ncuicas,na.rm = TRUE))

#Media ponderada con datos bibliograficos
mpond <- ((6*10)+(15*25)+(7*20)+(12*18))/(10+25+20+18)
round(mpond)

#Mediana
median(cuica$ncuicas)

#Moda
#calculo manual de las frecuencias
frecuencias <- data.frame(table(cuica$ncuicas))
moda <- frecuencias[which.max(frecuencias$Freq),1]
moda

#calculo con el comando mfv de la libreria modeest
library(modeest)
mfv(cuica$ncuicas)

#Cuantiles: cuartiles, deciles y percentiles
round(quantile(cuica$ncuicas, prob=seq(0, 1, 1/4)))
round(quantile(cuica$ncuicas, prob=seq(0, 1, length = 11)))
round(quantile(cuica$ncuicas,prob=seq(0, 1, length = 101)))

####Medidas de dispersión####
#Rangos y valores mínimos y máximos
min(cuica$ncuicas)
max(cuica$ncuicas)
range(cuica$ncuicas)

#Varianza
round(var(cuica$ncuicas))
round(sqrt((var(cuica$ncuicas))))

#Desvío estandar
round(sd(cuica$ncuicas))

#Error estandar: calculo manual y con la libreria plotrix
round(sd(cuica$ncuicas)/sqrt(length(cuica$ncuicas)))

library(plotrix)
round(std.error(cuica$ncuicas))

#Coeficiente de variación
sd(cuica$ncuicas)/mean(cuica$ncuicas)

#Asimetria 
library(psych)
skew(cuica$ncuicas)
skew(cuica$ncuicas)/sqrt(6/30) 

#Curtosis o apuntamiento
kurtosi(cuica$ncuicas)
kurtosi(cuica$ncuicas)/sqrt(6/30) 

#Covarianza
cuica$dist_agua_m <- as.numeric(cuica$dist_agua_m)
cov(cuica$ncuicas, cuica$dist_agua_m)



