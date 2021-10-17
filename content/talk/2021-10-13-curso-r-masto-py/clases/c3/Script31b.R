#*********************************************************************# #                       ESTADISTICA DESCRIPTIVA                       #
#*********************************************************************#

####          EJERCICIOS CLASE PRACTICA: cuica de agua            ####

#limpiamos el ambiente de trabajo
ls()
rm(list=ls())
ls()

#seteamos nuestro directorio de trabajo
setwd("F:/eli/Curso R_Paraguay/Clase_miercoles/Ejercicios")

#importamos la tabla que vamos a utilizar
library(readr)
datos <- read_delim("Ejercicio_6.csv", ";", escape_double = FALSE, 
                    trim_ws = TRUE)
View(datos)

#le damos el formtao correcto a cada una de nuestras variables
datos$peso_gr <- as.numeric(datos$peso_gr)
datos$lcorporal <- as.numeric(datos$lcorporal)
datos$ambiente <- as.factor(datos$ambiente)
####Medidas de posicion####

#media para toda la muestra
mean(datos$peso_gr, na.rm = TRUE)
mean(datos$peso_gr, na.rm = TRUE)
#Media para un conjunto recortado 
mean(datos$peso_gr, na.rm = TRUE, trim = 0.10)


#Media para cada ambiente 
f1 <- filter(datos, ambiente=="yerba")
mean(f1$peso_gr,na.rm = TRUE)

f2 <- filter(datos, ambiente=="forestal")
mean(f2$peso_gr,na.rm = TRUE)

f3 <- filter(datos, ambiente=="areanat")
mean(f3$peso_gr,na.rm = TRUE)

#Mediana
median(datos$peso_gr)

#Moda
#calculo manual de las frecuencias
frecuencias <- data.frame(table(datos$peso_gr))
moda <- frecuencias[which.max(frecuencias$Freq),1]
moda

#calculo con el comando mfv de la libreria modeest
library(modeest)
mfv(datos$peso_gr)

#Cuantiles: cuartiles, deciles y percentiles
quantile(datos$peso_gr, prob=seq(0, 1, 1/4))
quantile(datos$peso_gr, prob=seq(0, 1, length = 11))
quantile(datos$peso_gr,prob=seq(0, 1, length = 101))

####Medidas de dispersión####
#Rangos y valores mínimos y máximos
min(datos$peso_gr)
max(datos$peso_gr)
range(datos$peso_gr)

#Varianza
var(datos$peso_gr)
sqrt((var(datos$peso_gr)))

#Desvío estandar
sd(datos$peso_gr)

#Error estandar: calculo manual y con la libreria plotrix
sd(datos$peso_gr)/sqrt(length(datos$peso_gr))

library(plotrix)
std.error(datos$peso_gr)

#Coeficiente de variación
sd(datos$peso_gr)/mean(datos$peso_gr)

#Asimetria 
library(psych)
skew(datos$peso_gr)
skew(datos$peso_gr)/sqrt(6/30) 

#Curtosis o apuntamiento
kurtosi(datos$peso_gr)
kurtosi(datos$peso_gr)/sqrt(6/30) 

#Covarianza

cov(datos$peso_gr, datos$lcorporal)

####    EJERCICIOS CLASE PRACTICA: virus Nipah en murciélagos    ####

#limpiamos el ambiente de trabajo
ls()
rm(list=ls())
ls()

#seteamos nuestro directorio de trabajo
setwd("F:/eli/Curso R_Paraguay/Clase_miercoles/Ejercicios")

#importamos la tabla que vamos a utilizar
library(readr)
data <- read_delim("Ejercicio_7.csv", ";", escape_double = FALSE, 
                    trim_ws = TRUE)
View(data)
data
length(data)

#Asimetria 
library(psych)
data$prev_nipah <- as.numeric(data$prev_nipah)
skew(data$prev_nipah)
skew(data$prev_nipah)/sqrt(6/18) 

#Curtosis o apuntamiento
kurtosi(data$prev_nipah)
kurtosi(data$prev_nipah)/sqrt(6/18) 

#Media 
mean(data$prev_nipah)

#mediana
median(data$prev_nipah)

#Coeficiente de variacion 
sd(data$prev_nipah)/mean(data$prev_nipah)

#Seroprevalencia media en cada area natural 
colnames(data)

data$ambiente <- as.factor(data$ambiente)
class(data$ambiente)
levels(data$ambiente)

library(tidyverse)
f1 <- filter (data, ambiente == "areanat1")

f2 <- filter (data, ambiente == "areanat2")

#Moda
library(modeest)
mfv(data$prev_nipah)
