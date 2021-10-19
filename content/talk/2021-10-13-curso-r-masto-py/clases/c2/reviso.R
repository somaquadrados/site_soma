# ---------------------------------------------------------------------------- #
# Introducción al análisis de datos biológicos con R - Clase 1
#
# Marília Melo Favalesso
# mariliabioufpr@gmail.com
# github.com/mmfava
#
# 13/10/2021
# ---------------------------------------------------------------------------- #
#
# Contenido de hoy:
# • Objetos y atribuciones
# • Clases 
# • Tipos de objetos
# • Funciones
#
# ---------------------------------------------------------------------------- #

# Objetos y atribuciones ----------------------------------------------------- #

# Los objetos son variables capazes de almacenar cualquier valor 
# o estructura de datos.

# Guardamos el valor '6' en 'objeto' con '<-'
objeto <- 6 # asignar "6" a "objeto"
objeto # verificar el valor en "objeto" (mirar console 🡣) 

# El símbolo = se puede utilizar en lugar de <- pero no se recomienda.
objeto2 = 7
objeto2

# Las declaraciónes pueden ser echas una en cada línea...
j <- 14
y <- 24
a <- 25
b <- 69

# ...o las dos al mismo tiempo (separados por ";").
j <- 14; y <- 24; a <- 25; b <- 69


# podemos usar el ";" para asignar y para llamar a nuestro objeto 
# y ver su contenido:
j <- 14; j

# Otros ejemplos de creación de objetos:

# Numeros:
b <- 24
b

c <- 69
c

# Characteres:
d <- "e"
d

e <- "d"
d

# Podemos almacenar el valor de un objeto k dentro de un objeto w:
k <- 10
w <- k
w

# Podemos usar objetos para realizar operaciones matemáticas...
a + y / j

# ... y podemos asignar esta operación matemática a un nuevo objeto.
k <- a + y / j
k

# ¡¡Tenga en cuenta que cada objeto solo puede almacenar una estructura 
#   a la vez (un número o una secuencia de valores)!!
a <- 5
a

bien <- 25

a <- bien
a

a <- 325662566
a

# Reglas para nombrar objetos:
# • Pueden estar formados por letras, números, "_" y "."
# • No se puede empezar con un número y/o un punto
# • No puede contener espacios
# • Evitar el uso de acentos
# • Evitar el uso de nombres de funciones como: 
#     > sum, diff, df, var, pt, data, C, etc
# • La R distingue entre mayúsculas y minúsculas, por lo que:
obj <- 1
Obj <- 2
OBJ <- 3

obj; Obj; OBJ

# Permitido
a <- 5
a1 <- 5
obj <- 10
mi_obj <- 15
mi.obj <-15

# No permitido
1a <- 1
a 1 <- 5
_obj <-15
mi-obj <- 15

# Gestionar el lugar de trabajo
# Enumere los objetos creados con la función ls():
ls()

# Para eliminar objetos con rm():
rm(a) # uno
ls()

rm(b, c) # >1
ls()

# !! obs: La pestaña "Environmental" de RStudio muestra los objetos creados
#         hasta ahora en la sesión actual (🡥). 

# Clases --------------------------------------------------------------------  #
# Los objetos tienen tres características:
a <- 1
# 1. Nombre que le damos al objeto (= a)
# 2. Contenido en sí del objeto (= 1)
# 3. Atributo del objeto: 
#    3.1 Clase: naturaleza del elementos (1 = numerico)
#    3.2 Estructura: Cómo están organizados los elementos (a = vector)
str(a) # str muestra el número de dimensiones y la clase de un objeto
# La clase de un objeto es muy importante en R! Es a partir de él que las 
# funciones y los operadores pueden saber exactamente qué hacer con un objeto.

# Por ejemplo, es posible sumar dos objetos numéricos,...
a <- 1
b <- 2

a + b

# ... pero no podemos sumar dos caracteres:
c <- "c"
d <- "!"

c + d

# > !!R verificó la naturaleza de "c" y "d" y las identificó como no numéricas.

# Objetos atómicos ----------------------------------------------------------- #

# R tiene 5 clases básicas de objetos, también llamados objetos atómicos:

# 1 - numeric: Números reales, punto flotante (enteros o decimales).
num <- 1.50

# 2 - integer: Números enteros.
#    • Los números en R generalmente se tratan como objetos 'numeric' 
#      (números reales de doble precisión). Incluso los integer. Para que 
#      un entero se trate como un objeto entero, debe usar la letra L después1
#      del número:
num_int <- 1L

# 3 - logical: booleano (True/False).
#    • Los valores logical (o booleanos) son TRUE (verdaderos) o FALSE (falsos). 
#      También se aceptan T o F
logtf <- TRUE
ff <- T
gg <- TRUE
ff == gg 

hh <- F
ii <- FALSE
hh == ii

# * == : operador matemático "exactamente igual a ..."

# 4 - character: una cadena de caracteres, comúnmente utilizada para 
#     representar palabras, frases o texto.
#     • Las expresiones de tipo 'character' deben aparecer entre comillas 
#       simples o dobles:
ca <- "holla!"

# 5 - complex: Un número con partes reales e imaginarias.
com <- 1.5 + 2i

dd <- 1
class(dd) # no interpretado como integer

ee <- 1L
class(ee) # interpretado como integer

# --

# Conversión

# • Es posible intentar forzar a un vector a tener una clase específica:
a <- 1
a
class(a) 

as.character(a)

a1 <- as.character(a)
a1
class(a1) # como un character

a2 <- as.integer(a)
a2
class(a2) # como un entero

a3 <- as.numeric(a)
a3
class(a3) # como un doble

a4 <- as.logical(a)
a4
class(a4) # como un booleano

# --

# Tipos de objetos ----------------------------------------------------------- # 

# • El tipo del objeto está relacionado con la clase y la estructura/organización.
# • Pueden estar formados por elementos de la misma clase o de clases diferentes.
# • Pueden tener de una hasta n dimensiones.
# • Tenemos cinco estructuras:
#   - Vector
#   - Matrix
#   - Array
#   - List
#   - Data.frame

# ----

# •• Vetores •• 
# (elementos de misma clase)

# • Colección unidimensional de valores.
# • Almacena datos de una misma clase.
# • La forma más sencilla de crear un vector es enumerar los valroes separados 
#   por comas (,) dentro de un 'c()':

area <- c("urb", "rur", "urb", "rur", "urb", "rur")
area

temperatura <- c(20, 23, 18, 20, 14, 17)
temperatura

# --

# Coerción
# • No es posible mezclar datos de dos clases en un vector.
# • Si lo intenta, R exhibirá el comportamiento conocido como coerción.

aa <- c(1, 2, 3, 4, "a")
aa
class(aa)

bb <- c(1L, 2L, 3.50, 4.1)
class(bb)

# orden de dominio: 
# DOMINANTE character > numeric > integer > logical RECESIVO

# --

# •• Factor •• 
# (elementos de misma clase)

# • Colección unidimensional de valores.
# • Almacena datos de la clase character.
# • El factor representa medidas de una variable cualitativa, 
#   que puede ser nominal u ordinal.

estacion <- c("verano", "verano", "primavera", "primavera", 
              "primavera", "otono", "invierno",  "invierno")

temporada <- factor(x = estacion, 
                    levels = c("verano", "primavera", "otono", "invierno"))
temporada
levels(temporada)

# > Internamente, R almacena los factores como interger
#   Mire en el "environment" como es el objeto "temporada" (🡥).

# --

# Crear un factor:
# • Factor nominal: variables nominales.
genero <- factor(x = c("Lonomia", "Megalopyge", "Automeris", "Hylesia", 
                       "Megalopyge", "Automeris", "Hylesia", "Lonomia", 
                       "Hylesia", "Megalopyge"),
                 levels = c("Lonomia", "Megalopyge", "Hylesia", "Automeris"))
genero # los datos
levels(genero) # los factores en "genero"

# • Factor ordinal: variable ordinal.
#   !! usamos em parametro "ordered = TRUE". 
mes <- factor(x = c("Janeiro", "Janeiro", "Fevereiro", "Fevereiro", "Março", "Março"),
              levels = c("Janeiro", "Fevereiro", "Março"), ordered = TRUE)
mes # los datos
levels(mes) # los meses ordenados

# --

# Convertir a factor
# as.factor().

# Vector de caracteres.
letras <- c("a", "c", "b", "d", "c", "a", "b", "d", "c")
letras

factor(letras, levels = c("a", "b", "c", "d"))

# Convierta el objeto en factor.
letras2 <- as.factor(letras)
letras2

# --

# •• Matrix •• 
# (elementos de misma clase)
#
# Colección bidimensional de valores:
#   • líneas (por ejemplo, unidades de muestreo)
#   • columnas (variables cuantitativas o cualitativas, por ejemplo: horario, 
#     tubo de ensayo, ubicación)
# Almacena datos de una única clase.

# Puede construir matrices en R por combinación de dos vectores: 
# rbind() y cbind().
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)

# • Combinar vectores por línea - rbind().
vr <- rbind(v1, v2)
vr
# Combinamos los vectores verticalmente, 
# uno debajo del otro

# • Combinar vectores por columna - cbind().
vr <- cbind(v1, v2)
vr
# Combinamos los vectores horizontalmente, 
# uno al lado del otro.

# Otro modo:
# Disposición de elementos de un vector: matrix().
ma <- 1:12
ma

# • Por las lineas:
m <- matrix(data = ma, nrow = 4, ncol = 3, byrow = TRUE)
m

# • Por las colunmas: 
m <- matrix(data = ma, nrow = 4, ncol = 3, byrow = FALSE)
m

# ----

# •• Array •• 
# (elementos de misma clase)

# • Tiene n dimensiones - "varias matrices emparejadas".
# • Tiene filas, columnas y dimensiones (arrays).
# • Almacena datos de una única clase

# --

# Construir un array en R: array().
vc <- 1:8 # datos
ar <- array(data = vc, dim = c(2, 2, 2)) # array
ar

# ---- 

# •• Data frame ••
# (elementos de diferentes clases)

# • Colección bidimensional de valores:
#   - líneas (unidades de muestreo)
#   - columnas (variables cuantitativas o cualitativas, por ejemplo: horario, 
#     tubo de ensayo, ubicación)
# • Almacena datos de ≠ clases.

# --

# Cómo construir un data frame en R: data.frame().

# Vamos a crear 4 vectores
area <- c("urb", "rur", "urb", "rur", "urb", "rur")
mes <- c(1, 1, 2, 2, 3, 3)
presencia <- c(T, T, F, F, T, T)
temperatura <- c(20.1, 21.2, 22.2, 23.8, 22.9, 23)
area; mes; presencia; temperatura

# Unamos los vetores en un dataframe. 
# Observe que cada vector se convierte en una columna.
dtf <- data.frame(area, mes, presencia, temperatura)
dtf

# ---- 

# •• List ••
# (elementos de diferentes clases)

# • Colección unidimensional de objetos.
# • Almacena datos de ≠ tipos (vectors, arrays, data frame, lists).
# • Es un vector especial que acepta objetos como elementos.

#   > Muchas funciones que usamos para analizar datos en R tienen listas como salida

# --

## crea una lista en r: list().
lis <- list(rbind(c(3,6), c(4,5)), 
            sample(1:100, 5), 
            as.factor(c(2, 6, 9)))
lis

# Manejo de datos ------------------------------------------------------------ #

# - Los objetos son conjuntos *indexados* - Esto nos permite acceder a cada 
#   elemento de manera individual.
# - Comprender la indexación es fundamental para manipular datos en **R**.
# - Usamos corchetes (`[]`) para acceder a la posición de los elementos de un 
#   objeto: [Linea, Columna, Dimension].

# La indexación es como una etiquetas, y desde estas etiquetas es posible 
# reconocer y seleccionar los elementos del objeto. 

# En R usamos corchetes para acceder a la posición del elemento que nos interesa
# y la cantidad de elementos presentes en los corchetes dependerá de la cantidad 
# de dimensiones que tendremos en nuestros objetos.

# •• Indexación ••
  
# ~~ Gestión de datos unidimensionales `[L]` ~~

# Vector:
ve <- c(11, 12, 13, 14, 15, 16)
ve

# - Seleccionar elementos:

# Seleccionar el elemento 3
ve[3]

# Seleccionar los elementos entre 2 y 4
ve[2:4]
 
# Seleccionar los elementos 1 y 5
ve[c(1, 5)]

# - Quitar elementos

# Elemento 1
ve[-1]

# Elementos 2 y 5
ve[-c(2, 5)]

# Elementos entre 1 y 3
ve[-1:-3]

# ~~ Gestión de datos bidimensionales `[L,C]` ~~

# Matrix
ma <- matrix(data = (c(1:25)), nrow = 5, ncol = 5, byrow = TRUE) # crear una matriz
ma

# - Seleccionar elementos

# Usamos la indexación para seleccionar filas y columnas de nuestra tabla.
ma[1, 2] # seleccionar el valor de la línea uno y la segunda columna.
ma[3, 3] # seleccionar el valor de la línea tres y la tercera columna.

# > Es posible seleccionar más de una fila y columna al mismo tiempo.
ma[3:4, c(3, 5)] # seleccione las lineas 3 y 4 y las columnas 3 y 5
ma[c(1,5), 3:5] # seleccione las lineas 1 y 5 y las columnas entre 3 - 5

#  - Quitar elementos

ma[-2, -2] # menos la fila dos y la columna dos
ma[-2:-3, -c(1,5)] # menos las lineas 2 hasta 3 y las columnas 1 y 5


# !!
# - También podemos usar el nombre de las filas y columnas para manejar los 
#   datos: `[nombre_linea, nombre_columna]`.

# Nombrar lineas y columnas
rownames(ma) <- c("l1", "l2", "l3", "l4", "l5") # nombre en las lineas
colnames(ma) <- c("c1", "c2", "c3", "c4", "c5") # nombre en las columnas
ma # la tabla

# selecciona linea 2 y columna 3
ma["nomlin_2", "nomcol_3"] 

# !!
# Gestión de *data frame* `$`:
# - El operador `$` se utiliza para extraer elementos de una columna com nombre:
mb <- data.frame(ma)
class(mb)

mb$c1 # columna 1

mb$c4 # columna 4

# !!
# - agregar una nueva columna:
mb # antes
mb$ID <- 1:5 # agregar una columna llamada "ID" 
mb #despues

# •• Seleccionar elementos por condición •• 
# - Operadores relacionales con salidas** booleanas** (VERDADERO o FALSO). 
# - Comparación de objetos: A con B. 

A <- 6; B <- 28; C <- 6

A == B # A es igual a B?
A != B # A es distinto de B?
A > B # A es mayor que B?
A >= B # A menor o igual que?
A < B # A es menor que B?
A <= B # A es menor o igual que B?
A %in% B # A en B?
A | B %in% C # A o B in C?
A & B %in% C # A e B in C?

# ~~ Vectores ~~
ve <- c(10, 15, 30, 32, 50, 68, 70)
ve

# ¿Qué elementos tienen el valor = 30?
ve == 30 
  
# ¿Qué elementos tienen un valor superior a 30?
ve > 30

# ¿Qué elementos tienen el valor inferior a 50?
ve < 50
  
# ¿Qué elementos tienen valores mayores o iguales a 45?
ve >= 45

# - ¿Qué pasa si, en lugar de querer saber cuál valor coincide con la condición
#   y cuál no, quisiera seleccionar los valores relacionados con esa condición?
  
# Antes:
ve < 30

# Después:
ve[ve < 30]

# --

# ¿Qué valor/es es igual a 30?
ve[ve == 30]
  
# ¿Qué valor/es valen menos de 50?
ve[ve < 50]
  
# ¿ve esta inserido en el conjunto 32?
ve[ve %in% 32]

# ¿Qué valor/es es/son superior/es a 30?
ve[ve > 30]
  
# ¿Qué valor/es es/son mayores o iguales a 45?
ve[ve >= 45]
  
# ¿Qué valor/es es/son distintos de 10?
ve[ve != 10]

# ~~ matrix/data.frame ~~

ma <- matrix(c(1:12), nrow = 3)
ma

# ¿Qué elementos tienen los valores = 5 o 6?
ma == c(5, 6)

# ¿Qué elementos tienen el valor inferior a 8?
ma < 8

# - ¿Qué pasa si, en lugar de querer saber cuál valor coincide con la condición 
#   y cuál no, quisiera seleccionar los valores relacionados con esa condición?

# ¿La matriz tiene el valor 8?
ma[ma == 8]

# ¿La matriz contiene los valores 5, 7 y 15?
ma[ma == c(5, 7, 15)]

# ¿Está la matriz contenida en c(0, 2, 6, 18)?
ma[ma %in% c(0, 2, 6, 18)]

# ¿La matriz es diferente de 5?
ma[ma != 5]

# !
# - Podemos usar `$` y `selección por condición` para seleccionar solo las filas
#   de un **data.frame** que coinciden con una condición. 

# Data frame
a <- 1:4
b <- c("A", "B", "C", "D")
c <- c(T, T, F, F)
    
datos <- data.frame(a, b, c)
datos

# $ + seleccion por condición
datos[datos$a != 2,] 
datos[datos$b > "B",] 
datos[datos$c == T,] 

# - Todo lo que hemos hecho hasta ahora se puede hacer con characters.

# Vector de characters
l <- c("A", "B", "C", "d")
l

l < "C" # elementos < que C 
l == "B" # elementos igual que B
l[l > "B"] # Cual/es valor/es son mayores que B
l[l != "d"] # Cual/es valor/es son distintos de "d"

# Funciones ------------------------------------------------------------------ #

# • Mientras que los objetos son nombres que contienen valores, las funciones 
#   son nombres que contienen un código R.
# • La idea básica de una función es encapsular un código que se pueda invocar 
#   en cualquier momento en R.

# • Usamos algunas funciones hasta ahora: 
#   c(), rep(), data.frame(), class(), otros.

## --

##  •• Argumentos •• 

# • Las funciones toman argumentos.
# • Los argumentos son los valores u objetos que ponemos entre paréntesis y 
#   que las funciones necesitan un par funcional (calculando un resultado).
# • Por ejemplo, la función class() necesita recibir un objeto para investigar 
#   la clase y devolverlo:
a <- 3
class(a) # En este caso, "a" es el argumento que incluimos en la función class().

# • Para las funciones que toman más de un argumento, tenemos que separar los argumentos con comas.
# • Por ejemplo, cuando usamos la concatenación (c()) para crear un vector:
ve <- c(1, 2, 3, 4)
ve

# • !! Importante: Observe cómo debe ser la entrada de valores para que funcione 
#                  la función.
class(1, 2, 3, 4)
class(ve)

# • Los argumentos de las funciónes también tienen nombre, que pueden o no ser 
#   usando en la función. Por ejemplo a función rep().

rep(x, # x: valores que se repetirán.
    times = 1, # vector de valor entero que da el número de veces que se repite cada elemento.
    length.out = NA, # O comprimento desejado do vetor de saída.
    each = 1) # Cada elemento de x é repetido todas as vezes.

## También podemos usar la función sin incluir los nombres de los argumentos:

# Con nombre:
rep(x = 1:3, 
    times = 2,
    length.out = NA, 
    each = 1)

# Sin los nombres:
rep(1:3, 
    2,
    NA, 
    1)

# ----

# Paquetes ------------------------------------------------------------------- #

# • Las funciones provienen de dos fuentes:
#   - Paquetes R estándar que se cargan siempre que trabajamos con el lenguaje
#   - Paquetes que instalamos y cargamos por comandos.
# • Básicamente, un paquete es una convención para organizar y estandarizar la 
#   distribución de funciones R.

# La principal motivación de crear un paquete R es de organizar y compartir 
# funciones de nuevos métodos y/o implementaciones creadas y que son útiles 
# para otras personas.
# En general, descargamos paquetes de dos fuentes: CRAN y GitHub.

## ----

## •• Instalación ••

## CRAN:
# • Para instalar paquetes desde CRAN usamos el comando 
#   install.packages("nombre_paquete").
install.packages("ggplot2") # • Para instalar el paquete "ggplot2"
                            # * Tenga en cuenta que el nombre del paquete 
                            #   siempre debe ir entre comillas para la 
                            #   instalación.
# Compruebe si el paquete se ha instalado:
library()
# * abre una nueva pestaña en R escrita "Paquetes R disponibles".

## GitHub:
# • Para instalar paquetes de Github, usamos el paquete devtools: 
#   install_github("direccion/nombre_paquete").
# • Para hacer esto, necesitaremos la dirección y el nombre del paquete 
#   de un repositorio de GitHub (https://github.com/tidyverse/dplyr)

install.packages("devtools") # Instalar el paquete 'devtools'

library(devtools) # Cargar el paquete para su uso

# Incluir la dirección de descarga del paquete do 
# github en install_github("repo/nombre_paquete"):
install_github("tidyverse/dplyr")

## • !! Importante:
## - Solo instalamos los paquetes una vez.
## - Los paquetes se descargan a través de la internet.
## - El nombre del paquete debe estar entre comillas ("paquete_nombre"), 
##   independientemente de si lo vamos a descargar de CRAN o GitHub.
## - Para cargar paquetes en R usamos la función library(paquete_nombre):
library(dplyr) # En este caso no es necesario incluir comillas.
library(ggplot2)
## - Cargamos paquetes para usar sus funciones.

## ----

## •• Actualización ••

# Los paquetes no se actualizan solos.
# Es necesario actualizarlos de vez en cuando.
# ¡Es un proceso que lleva tiempo!
update.packages(ask = FALSE)

## ----

## •• Help! (ayuda) ••

# El "help" de R es muy útil cuando necesitamos ayuda para comprender una función.
help("sum")
# es necesario encerrar el nombre de 
# la función entre comillas.
?sum

## ----

## •• Citación ••
citation() # Como citar la R
citation("ggplot2") # Como citar los paquetes

# ------------------------ •• Fin de clase •• -------------------------------- #





