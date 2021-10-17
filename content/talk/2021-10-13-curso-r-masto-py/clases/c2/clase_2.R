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
# • ¿Cómo armar mi tabla de datos?
# • Tidyverse
# • Importar datos a R
# • Operador pipe (`%>%`)
# • tidyr
# • dplyr
#
# ---------------------------------------------------------------------------- #

# ¿Cómo armar mi tabla de datos? --------------------------------------------- #

# Características principales de un conjunto de datos ordenado:
# - Cada variable es una columna
# - Cada observación es una linea
# - Cada valor está en una celda diferente

# Descripción de datos:
# - Utilice las hojas de datos de su editor (ex. excel) para almacenar 
#   información sobre su tabla.
# - En la primera hoja (hoja 1) dejamos nuestra tabla y en las demás 
#   (normalmente la hoja 2, pero si es necesario usamos otras) incluimos 
#   información sobre nuestra tabla, como a qué se refieren los datos, 
#   descripción de cada variable, alguna observación importante y alguna fecha 
#   de edición de esta tabla.

# Tidyverse ------------------------------------------------------------------ #
### <https://www.tidyverse.org/>

# El tidyverse es una colección obstinada de 📦 **R** diseñados para la ciencia 
# de datos. Todos los paquetes comparten una filosofía de diseño, una gramática 
# y estructuras de datos subyacentes.

# Tidyverse es una colección de 📦 R 
# - [readr](https://readr.tidyverse.org/) - importación de datos
# - [tibble](https://tibble.tidyverse.org/) - formato de data.frame mejorado
# - [tidyr](https://tidyr.tidyverse.org/), [dplyr](https://dplyr.tidyverse.org/)  
#   manipulación de datos 
# - [ggplot2](https://ggplot2.tidyverse.org/) - visualizando de datos
# - [purrr](https://purrr.tidyverse.org/) - programación avanzada
# - [forcats](https://forcats.tidyverse.org/) - trabajando con factores
# - [stringr](https://stringr.tidyverse.org/) - trabajando con cadena de carac-
#   teres

# > El creador de **Tidyverse** es Hadley Wickham y hoy en día muchas personas 
#   han contribuido a su expansión.

#  Instale y cargue el paquete **Tidyverse** en su computadora:
install.packages("tidyverse")
library(tidyverse)

# Importar datos a R --------------------------------------------------------- #

# Para su alivio, **no es necesario producir su tabla en R** (como lo hemos 
# hecho hasta ahora). Es posible construir la tabla en Excel y luego importar 
# los datos (de HD a nuestra memoria RAM).

# La función de importación dependerá del formato en el que se guardó nuestra 
# tabla (.txt, .csv, .xls, .xlsx).

# Working directory
# - Recuerde que el directorio de trabajo es una 📁 donde R lee y guarda 
#    archivos.
# - Deje todos los archivos de su proyecto guardados en esta misma carpeta, esto
#   facilitará su trabajo.
# - Deberá decirle a R dónde están los archivos en los que va a trabajar;
#   Para eso usamos la función "setwd()" con la "dirección" de nuestra carpeta.
# - Ejemplo:
setwd("C:/Users/mmfav/introduccionalR/clase_2/data")

## !!
## - Tenga en cuenta que la dirección aquí se indica con barras invertidas (`/`), 
##   a diferencia de lo que usan algunos sistemas operativos (`\`). 
##   Por ejemplo:
##   - C:\Users\mmfav\introduccionalR\clase_2\data
##   - C:/Users/mmfav/introduccionalR/clase_2/data

## Importar datos a R
# > El 📦 `readr` se usa para importar archivos de texto, como *.txt* o *.csv* 
#   a R. 
# > Importa los archivos de texto como **tibbles**.

# Funciones principales de `readr`:
# - `read_csv()`; `read_csv2`: para archivos separados por comas. 
# - `read_tsv()`: para archivos separados por tabulaciones.
# - `read_delim()`: para archivos separados por un delimitador genérico. 
#    El argumento delim `=` indica qué carácter separa cada columna del archivo 
#    de texto.
# - `read_table()`: para archivos de texto tabulares con columnas separadas por 
#    espacios.
# - `read_fwf()`: para archivos compactos que deben tener el ancho de cada 
#    columna especificado.
# - `read_log()`: para archivos de registro estándar.

# Importar `.csv`
# - Como ejemplo, usaremos la base de datos que proporcionamos en el repositorio
#   `datos.csv`.
# - La función para leer los datos es: `read_csv2(file = "archivo.csv")`.
datos_csv <- read_csv2(file = "datos.csv", # archivo en formato .csv
                       show_col_types = FALSE)
datos_csv

# !!
# El mensaje devuelto por la función indica qué clase se asignó a cada columna. 
# Tenga en cuenta que el argumento "file =" representa la ruta al archivo. 
# Si el archivo que se va a leer no está en el directorio de trabajo de su 
# sesión, debe especificar la ruta al archivo.

# Importar `.txt`
#  - Como ejemplo, usaremos la base de datos que proporcionamos en el 
#    repositorio `datos.txt`
# - La función para leer los datos es: 
#   `read_delim(file = "archivo.txt", delim = "\t")`.
datos_txt <- read_delim(file = "datos.txt", # archivo
                        delim = "\t") # tipo de delimitación
datos_txt

# Exportar datos (`write_`)
# - Para la mayoría de las funciones `read_`, existe una función `write_` 
#   correspondiente. 
# - Estas funciones sirven para guardar bases en un formato de archivo 
#   específico. 
# - Debe especificar el objeto a exportar y el nombre del archivo con la 
#   extensión.

# archivo .csv
write.csv2(x = objeto, path = "nombre_tabla.csv")

# como un .txt
write_delim(x = objeto, path = "nombre_tabla.txt", delim = "\t")

# Importar `.xlsx`
# - ¿Qué pasa si mis datos se guardan como un archivo **excel**?
# - El 📦 `readxl` se usa para importar archivos de excel, como *.xslx* o *.xls*
#   a **R**. 
              
# - Instalar:
install.packages("readxl")

# - Cargar el paquete:
  library(readxl)

# - `readxl` transforma archivos de excel en **tibbles**.
# - Para abrir nuestro archivo (datos.xlsx): `read_xlsx("archivo.xlsx")`
datos_xlsx <- read_xlsx("datos.xlsx")
datos_xlsx

# Tibble --------------------------------------------------------------------- #
# - Un tibble, o `tbl_df`, es una reinvención moderna del `data.frame`
# - Es un formato requerido para usar funciones **tidyverse**.
# - Las variables pueden ser de tipo *numérico (int, dbl)*, *carácter (chr)*, 
#   *lógicas (lgl)* y *factor (fctr)*
    
# Convertir `data.frame` en `tibble`: 
class(datos_xlsx)
as_tibble(datos_xlsx)

# Operador pipe (`%>%`) ------------------------------------------------------ #
# - El 📦 `magrittr` ofrece un perador que hace que su código sea más legible: 
#   el pipe (`%>%`).
# - La idea del operador pipe (`%>%`) es bastante simple: use el valor resultante 
#   de la expresión de la izquierda como primer argumento de la función de la 
#   derecha.

# **Por ejemplo**:
# 1. suma el vector 'x' y luego obtén la √ (sqrt):
x <- 1:10

# Sin el pipe:
sqrt(sum(x)) 

# Con el pipe:
x %>% sum() %>% sqrt()

# Tidyr ---------------------------------------------------------------------- #
# - El objetivo del 📦 `tidyr` es ayudarte a crear datos ordenados.
# - Los datos ordenados son datos donde:
#    - Cada columna es variable.
#    - Cada fila es una observación.
#    - Cada celda es un valor único.
# - Tidyr data describe una forma estándar de almacenar datos que se utiliza 
#   siempre que sea posible en **tidyverse**. Si se asegura de que sus datos 
#   estén ordenados, pasará menos tiempo luchando con las herramientas y más 
#   tiempo trabajando en su análisis.
  
# - Estas son sus principales funciones:
separate() # separar los caracteres en varias columnas
unite() # unir datos de varias columnas en una
drop_na() #eliminar líneas con NA
replace_na() # reemplazar valores NA
pivot_wider() # pasa valores de filas a columnas
pivot_longer() # pasa valores de columnas a filas

# Para ver todas las funciones del paquete, consulte la *cheatsheets*: 
# <https://github.com/rstudio/cheatsheets/blob/master/data-import.pdf>
  
# **separate()**
# - Muchas veces, una sola variable de columna capturará múltiples variables, 
#   o incluso partes de una variable que simplemente no le importa.
# - La función `separate()` separa dos o más variables que están concatenadas 
#   en la misma columna.
# - La sintaxis de la función es:
datos %>%
  separate(
      col = columna_vieja,
      into = c("nueva_columna_1", "nueva_columna_2"),
      sep = c("_") # cómo se separan las variables en la columna (ej. ".", "_")
    )

# Por ejemplo, 
# dividamos la columna "localidad" de la tabla "datos_xlsx" en "ciudad" 
# y "provincia".

# Antes:
datos_xlsx %>% head()

# Despues
datos_xlsx %>%
  separate(
    col = localidad, # la columna vieja
    into = c("ciudad", "provincia"), # las nuevas columnas
    sep = c(" - ") # modo de separación
  ) %>% 
  head() # otra función!!


# **unite()**
# - La operación `unite()` es lo opuesto a `separate()`.
# - La función `unite()` une dos variables que están en columnas diferentes.
# - Toma dos columnas (variables) y las convierte en una. Se usa ampliamente 
#   para ensamblar informes finales o tablas para análisis visual. 

# - La sintaxis de la función es:
datos %>%
    unite(
      col = nueva_columna, columnas_para_juntar,
      sep = c("_") # cómo se separan las variables en la columna (ej. ".", "_")
    )

# Por ejemplo, 
# unamos las columnas "zona" y "año".

# Antes:
datos_xlsx %>% head()

# Despues
datos_xlsx %>%
  unite(
    col = "zona_ano", "zona", "ano",
    sep = "_"
  )

# **replace_na()** y **drop_na()**:    
# - Cuando tenemos datos faltantes en nuestra tabla (NA), podemos reemplazar 
#   NA con nuevos valores con la función `replace_na()`,... 
datos %>%
  replace_na(list( # lista los datos NA
    columna_X = valor)) # valor que reemplazará el NA en la columna "x"
# ...o podemos eliminar las filas con valores faltantes con `drop_na()`.
datos %>%
  drop_na(columna)

# Por ejemplo, 
# podemos reemplazar las filas con el valor faltante en la columna 
# "var_respuesta" por cero (lineas 1, 6 y 20)...
datos_xlsx %>%
  replace_na(list(var_respuesta = 0))

# ...o podemos eliminar las líneas que tiene valores NA.
datos_xlsx %>%
  drop_na(var_respuesta)

# **pivot_longer()**
# - "Alarga" los datos, aumentando el número de filas y disminuyendo el número 
#   de columnas.
pivot_longer(
  cols = Columnas_para_pivotar,
  names_to = "nombre_nova_columna",
  values_to = "nombre_col_values"
  )
 
# **pivot_wider()**
# - Pasa los datos de columnas para filas, aumentando el número de columnas.
pivot_wider(
  names_from = columna_nombres, 
  values_from = columna_valores
  ) 

# Por ejemplo, 
# pasemos los años de la tabla "datos_csv" de las columnas a las filas. 
# Los valores los almacenaremos en una columna llamada 'value':
   
# Antes 
datos_csv

# Despues
datos_csv %>% 
  pivot_longer(
    cols = c('2001', '2002', '2003'),
    names_to = "año",
    values_to = "value"
    )

# ¿Qué pasa si quiero revertir la tabla a su formato original?

# Antes
datos_csv2 <- datos_csv %>% 
  pivot_longer(
    cols = c('2001', '2002', '2003'),
    names_to = "año",
    values_to = "value")

datos_csv2  
    
# Despues
datos_csv2 %>% 
  pivot_wider(
    names_from = año,
    values_from = value
  )

# dplyr ---------------------------------------------------------------------- #
# - El 📦 `dplyr` es lo paquete más útil para realizar la transformación de 
#   datos, combinando simplicidad y eficiencia de una manera elegante.
# - Los scripts **R** que hacen un uso inteligente de los verbos `dplyr` y las 
#   facilidades del operador `pipe` tienden a ser más legibles y organizados 
#   sin perder velocidad de ejecución.
  
# Las principales funciones de `dplyr` son:
select() # seleccionar columnas
arrange() # ordenar la base de datos
filter() # filtrar las lineas
mutate() # crear/modificar columnas
group_by() # agrupar la base de datos
summarise() # resume la base
relocate() # reordenar columnas
left_join(); right_join(); full_join() # juntar ≠ bases de datos. 


# **select()**
# - Usamos para seleccionar columnas.
# - Los argumentos son los nombres de las columnas que desea seleccionar.
datos %>% 
  select(nombre_col, nombre_col2)

# - Para eliminar columnas de la base, agregue un "menos" (`-`) antes de la 
#   selección.
datos %>%
  select(-nombre_col, -nombre_col2)

# !!
# - También disponemos de otras funciones auxiliares:
#   - `starts_with()`: para columnas que comienzan con texto estándar
#   - `ends_with()`: para columnas que terminan con texto estándar
#   - `contiene()`: para columnas que contienen texto estándar

# Por ejemplo,
# Seleccionemos las columnas "localidad" y "año" de la tabla "datos_xlsx".
datos_xlsx %>%
  select(localidad, ano)

# Seleccione todos los datos excepto "ID" y "temperatura".
datos_xlsx %>% 
  select(-ID, -temperatura)

# **arrange()**
# - Para ordenar líneas. 
# - Los argumentos son las columnas por las que queremos ordenar las filas.
datos %>% 
  arrange(columna_x)

# - También podemos ordenar en orden descendente usando la función `desc()`
datos %>% 
  arrange(desc(columna_x))

# ¡Y ordena más de una columna al mismo tiempo!
datos %>% 
  arrange(columna_y, desc(columna_x))

# Por ejemplo,
# ordenamos las líneas base en orden ascendente de "response_var".

# Antes
datos_xlsx 

# Después
datos_xlsx %>%
    arrange(ano, desc(var_respuesta))

# **filter()**
# - Para filtrar valores de una columna base, usamos la función `filter()`.
datos %>% 
  filter(columna < value)

# Por ejemplo, 
# podemos seleccionar datos con una "var_respuesta" superior a 50.
datos_xlsx %>%
  filter(var_respuesta > 50)
# También podemos usar el filtro con caracteres.
datos_xlsx %>%
  filter(zona %in% "urbano")

# **mutate()**
# - Para modificar una columna existente o crear una nueva. 
# - Aplicaremos una función.
# - La regla es que el resultado de la operación devuelve un vector con una 
#   longitud igual al número de filas en la base.
datos_xlsx %>%
  mutate(columna = columna + función)
# - También puede crear/modificar tantas columnas como desee dentro de la misma 
#   mutación.
datos_xlsx %>%
  mutate(columna = columna+función, nueva_columna = columna/valor)

# Por ejemplo, 
# digamos que descubrió un error en su tabla. Agregaste uno individuo más en la
# columna "var_respuesta" y ahora necesitas quitar ese valor.
datos_xlsx %>%
  mutate(var_respuesta = var_respuesta - 1)

# **summarize()**
# - Es la técnica de resumir un conjunto de datos utilizando alguna métrica de 
#   interés. 
# - Media, mediana, varianza, frecuencia, proporción, por ejemplo, son tipos de 
#   resumen que aportan información diferente sobre una variable.
datos %>%
  summarize(función(columna))
# - No vamos a explorar esta función aquí, ya que tendremos una clase solo sobre
#   estadística descriptiva en **R**.
datos_xlsx %>%
  summarize(media = mean(temperatura), na.rm = TRUE)

# **relocate()**
# - Para reubicar columnas.
# - De forma predeterminada, coloca una o más columnas al comienzo de la base.
datos %>%
  relocate(columna5, columna4) # Coloque las columnas 5 y 4 al principio de la tabla.
# - Podemos usar los argumentos `.after =` y `.before =` para realizar cambios más complejos.
datos %>%
  relocate(columna2, .after = columna4) # Poner la columna 2 después de la columna 4
# - Poner la columna 2 antes de la columna 4
datos %>%
  relocate(columna2, .before = columna4)

# Ejemplo,
datos_txt %>%
  relocate(ID, .after = value)

# **rename()**
# - Cambia los nombres de variables individuales (columnas) usando la sintaxis 
#   `nuevo_nombre = viejo_nombre`.
datos %>%
  rename(columna_x = columna.x)

# - Por ejemplo, vamos cambiar el nombre de la columna "localidad" por 
#   "municipalidad".

# Antes
datos_xlsx %>%
    names()

# Después 
datos_xlsx %>%
  rename(municipalidad = localidad) %>%
  names()

# **left_join()**, **right_join()** y **full_join()**
# - Lo usamos para unir dos tablas en una.

# Une la tabla 'datos' a la tabla 'datos2' por 'columna_x'

# Mantiene los elementos de la tabla 'datos' y excluye elementos adicionales de
# 'datos2'.
datos %>%
  left_join(datos2, 
            by = "columna_x")

# Mantiene los elementos de la tabla 'datos2' y excluye elementos adicionales de 'datos'.
datos %>%
  right_join(datos2, 
             by = "columna_x")

# Mantiene los valores de las dos tablas.
datos %>%
  full_join(datos2, by = "columna_x")

## ¡¡Fin de clase!!

