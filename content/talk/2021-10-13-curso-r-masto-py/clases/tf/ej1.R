
## --------------------------------------------------------------------------- #
## Ejercicios finales del curso 
## "Introducción al análisis de datos mastozoológicos en R"
## 16/10/2021 19:00h
## --------------------------------------------------------------------------- #

## --------------------------------------------------------------------------- #

# Ejercicio 1 --
# Los inventarios de biodiversidad contienen información importante sobre la 
# riqueza de especies, la estructura y composición de la comunidad y son el 
# primer paso para desarrollar cualquier estrategia de conservación y mitigación.
# Basado en el dataset "MAMÍFEROS DEL ATLÁNTICO" - un conjunto de datos
# abierto con información sobre mamíferos medianos y grandes en el 
# Bosque Atlántico de Brasil, Paraguay y Argentina-, realizarás las siguientes 
# actividades:

# 1. Importe el conjunto de datos para su entorno R. Los datos se encuentran en 
#    el siguiente enlace:
#    https://raw.githubusercontent.com/souzayuri/Yuri-AtlanticMammals/master/Data/ATLANTIC_MAMMAL_MID_LARGE%20_assemblages_and_sites.csv

# Tips:
# - Tidyverse tiene una función para esto! 
# - Es posible importar directamente del enlace con esta función. 
datos <- read_csv("https://raw.githubusercontent.com/souzayuri/Yuri-AtlanticMammals/master/Data/ATLANTIC_MAMMAL_MID_LARGE%20_assemblages_and_sites.csv")
datos

# 2. De las áreas que fueron muestreadas, ¿Cuántos individuos se muestrearon en 
#    áreas protegidas y cuántas en áreas no protegidas?

# Tips:
# - columna: "Protect_area"
# - Cada linea corresponde a un individuo
# - Puede utilizar la función "table()"
datos$Protect_area %>% table()

# 3. Para encontrar el género menos y lo más común en áreas protegidas y en áreas no 
#    protegidas, debe ejecutar los siguientes códigos: 

# Para áreas protegidas
datos %>%
  filter(Protect_area == "yes") %>%
  count(Genus_on_paper)

# Para áreas no protegidas
datos %>%
  filter(Protect_area == "no") %>%
  count(Genus_on_paper)

# a. ¿Qué hace la función "%>%"?
# b. ¿Qué hace la función "filter()"?
# c. ¿Qué hace la función "count()"
# d. Utilice la función "arrange()" para poner los datos en orden descendente. 
#    ¿Cuál es el género más común en áreas de conservación y áreas no conservadas?
datos %>%
  filter(Protect_area == "yes") %>%
  count(Genus_on_paper) %>% 
  arrange(desc(n))

datos %>%
  filter(Protect_area == "no") %>%
  count(Genus_on_paper) %>% 
  arrange(desc(n))

# 4. Calcule la media y la mediana de la variable "precipitación" presente en 
#    la tabla. Presentar los valores acompañados de la desviación estándar y los
#    cuartiles 1 (25%) y 4 (75%).

# Tips: 
# - Columna "Annual_rainfall"
# - No olvide verificar si R está asignando la clase correcta a las columnas/variables. 
#   Por ejemplo, ¿la variable "Annual_rainfall" es numérica? Si no es así, 
#   recuerde que la conversión es posible: 
#   as.numeric(); as.character(); as.factor()....
# - Si el resultado aparece como NA, significa que faltan datos, entonces tendrá
#   que lidiar con eso. Puede eliminarlos de la tabla  - drop.na(objeto) - o usar 
#   el comando na.rm = TRUE en las funciónes mean(), median(), sd() y quantile(). 

datos$Annual_rainfall %>% mean(na.rm = TRUE)
datos$Annual_rainfall %>% median(na.rm = TRUE)
datos$Annual_rainfall %>% sd(na.rm = TRUE)
datos$Annual_rainfall %>% quantile(na.rm = TRUE)

# 5. Grafiquemos los 10 géneros más frecuentes del data base para Paraguay:
datos %>%
  filter(Country == "Paraguay") %>% 
  count(Genus_on_paper) %>%
  arrange(desc(n)) %>%
  slice(1:10L) %>% 
  ggplot(aes(x = Genus_on_paper, y = n)) + 
  geom_bar(stat="identity", fill="steelblue")

# a. ¿Qué hace las funciónes "filter()", "count()", "arrange()", "slice()" y
#     "ggplot()"?
# b. ¿Qué hace la función "geom_bar"? ¿Y el comando "stat = 'identity'"?

## --------------------------------------------------------------------------- #

# Ejercicio 2 --
# Los datos presentados provienen de un estudio de un año sobre mamiferos 
# atropellados en una ruta nacional del Paraguay, pavimentada y con tráfico 
# moderado. En las cercanías se encuentran ambientes boscosos, tierras abiertas, 
# incluyendo pastos, prados y barbecho. Se identificó a cada animal encontrado 
#  y se registró su ubicación geográfica en coordenadas. Se tomaron las muestras 
#  de los datos cada estación. En cada punto se registró presencia de vegetación 
# ("VEG"), la longitud de cursos de agua en las cercanías ("AGUA") y la distancia al 
# parque nacional ("PARQUE_KM"), entre otras (no se incluyen en la base de datos). 
# En particular se desea conocer si el número de vertebrados atropellados
# ("N") se encuentra relacionado con estas variables; no se tienen evidencias 
# de que haya interacción entre las mismas. Hay 6 puntos de muestreo en total.

# 1. Reproduzcamos nuestra tabla de datos en R.

# Puntos de muestreo:
puntos <- rep(c(1:6), times = 4)
puntos 

# Estación del año:
estacion <- rep(c("verano", "Otoño", "Invierno", "Primavera"), each = 6)
estacion 

# ausencia = 0 e presencia = 1 de vegetación:
veg <- rep(c(0, 1), times = 12) %>% as.factor()
veg 

# km hasta fuente de agua:
agua <- rep(c(10, 8, 6, 4, 2, 1), times = 4)
agua 

# km hasta el parque:
parque <- rep (c(20, 15, 10, 8, 6, 2), times = 4)
parque 

# Individuos atropellados:
N <- c(60, 58, 59, 56, 47, 46, 
       61, 56, 60, 59, 57, 58,
       40, 39, 50, 45, 40, 38,
       68, 65, 62, 60, 58, 52) 

# La tabla:
atrop <- tibble(puntos, estacion, veg, agua, parque, N)
atrop 

# a. ¿Qué tipo de objetos es "puntos", "estacion", "veg", "agua" y "parque"? 
# b. ¿Qué tipo de objetos es "atrop"?
# c. ¿Qué hace la función "rep"? ¿Y cuál es la diferencia entre usar "times" y 
#     "each"?
# d. ¿Qué hace la función "c"?

# 2. ¿En qué época del año (estación) hay más atropellamentos? Responda la pregunta 
#     basándose en un gráfico de su preferencia.

# 3. Cree un diagrama de dispersión entre el "agua" y la "N". Pídale a R que 
#    coloree los puntos del gráfico de acuerdo con la presencia o ausencia de 
#    vegetación. ¿Puedes observar algún patrón de relación entre las variables?
ggplot(atrop, aes(x = agua, y = N, color = veg)) + 
  geom_point(size = 6) 

# 4. Cree un diagrama de dispersión entre el "parque" y la "N". Pídale a R que 
#    coloree los puntos del gráfico de acuerdo con la presencia o ausencia de 
#    vegetación. ¿Puedes observar algún patrón de relación entre las variables?
ggplot(atrop, aes(x = parque, y = N, color = veg)) + 
  geom_point(size = 6) 

# 5. Haga las mismas gráficas que las de las preguntas 3 y 4, pero en lugar de 
#    colorear los puntos en función de la vegetación, hágalo en función de la 
#    estación del año.
ggplot(atrop, aes(x = parque, y = N, color = estacion)) + 
  geom_point(size = 6) 

# 6. Calcule la frecuencia de animales atropelladas cerca de áreas con y 
#    sin vegetación.

## --------------------------------------------------------------------------- #

# Ejercicio 3 --
# El gobierno municipal de nuestra ciudad nos pidió que relevemos el ensamble de 
# reodores en el área periurbana. Para ello, utilizamos trampas de captura viva 
# cebadas con un cebo alimenticio. Elegimos 50 casas donde establecimos 10 trampas 
# que estuvieron activas durante 3 noches. Hicimos este muestreo en una época 
# seca y una lluviosa del año. Ademas registramos en cada casa la presencia de 
# animales de estima, de cria, acumulación de basura, de chatarra y calculamos 
# el porcentaje de cobertura arbóra y de herbaceas en los peridomicilios. 

# 1. Cree una base de datos con las variables mencionadas en el enunciado. 
#    Utilice el comando "runif" para generar valores aleatorios continuos para 
#    las variables de vegetacion. 
#    Ejemplo:
runif(20, # 20 valores
      min = 12, # el menor valor 
      max = 25) # el mayor valor

library(tidyverse)
casas <- rep(c(1:50), replace=F)
casas

estacion <- rep(c("seca", "lluviosa"), 25, replace=T)
estacion

cob_arborea <- runif(50, min=12.5, max=100)
cob_arborea

cob_herbacea<- runif(50, min=12.5, max=100)

basura <-sample(c(0, 1), 50, replace=T) %>% as.factor()

anim_estima<- sample(c(0, 1), 50, replace=T) %>% as.factor()

anim_cria <- sample(c(0, 1), 50, replace=T) %>% as.factor()

comensales<-sample(c(0:20), 50, replace=T)

silvestres <-sample(c(0:10), 50, replace=T)

data <- tibble(casas, estacion, comensales, silvestres, cob_arborea, cob_herbacea, basura, anim_cria, anim_estima)

# 2. Calcule los rangos de valores que toman las variables de cobertura arborea.
range(data$cob_arborea)
range(data$cob_herbacea)

# 3. Calcule la mediana para las variables de cobertura arborea
median(data$cob_arborea)
median(data$cob_herbacea)

# 4. Calcule la frecuencia de la presencia de basura, animales de cria y animales de estima. 
f.abs.bas <- table(data$basura)
f.abs.bas
prop.table(f.abs.bas)

f.abs.estima <- table(data$anim_estima)
f.abs.estima
prop.table(f.abs.estima)

f.abs.cria <- table(data$anim_cria)
f.abs.cria
prop.table(f.abs.cria)

# 5. Calcule la covarianza de las variables de vegetacion
cov(data$cob_arborea, data$cob_herbacea)
cor.test(data$cob_arborea, data$cob_herbacea)

# 6. Grafique la abundancia de roedores comensales y silvestres detectada para 
#    cada estacion. 

library(ggplot2)
s1 <- ggplot(data) + 
  geom_bar(aes(x=estacion, y=silvestres, fill= estacion), stat = "identity", width=0.2)+ 
  scale_y_continuous(breaks = c(0,40,80,120,160,200,240,280,320) ,limits=c(0,320))+
  scale_fill_manual(values=c("pink", "coral"))+
  ylab("N° de roedores silvestres capturados")+
  xlab("Estación del año")+
  ggtitle("Roedores periurbanos")+
  theme( plot.title=element_text(hjust=0.5, vjust=0.5,family='', face='bold', colour='black', size=12), legend.position = "none")


s2 <- ggplot(data) + 
  geom_bar(aes(x=estacion, y=comensales, fill= estacion), stat = "identity", width=0.2)+ 
  scale_y_continuous(breaks = c(0,40,80,120,160,200,240,280,320) ,limits=c(0,320))+
  scale_fill_manual(values=c("greenyellow", "green3"))+
  ylab("N° de roedores comensales capturados")+
  xlab("Estación del año")+
  ggtitle("Roedores periurbanos")+
  theme( plot.title=element_text(hjust=0.5, vjust=0.5,family='', face='bold', colour='black', size=12), legend.position = "none")

library(cowplot)
windows()
par(mfrow = c(2,1), mar = c(5,5,2,2))
plot_grid(s1,s2,nrow=1)


