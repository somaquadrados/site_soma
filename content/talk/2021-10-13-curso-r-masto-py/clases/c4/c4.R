library(tidyverse)
install.packages("MASS")
library(MASS)

# Estructura:
# 1. Datos

# Dataset 1
head(iris)
class(iris)
colnames(iris)
unique(iris$Species)

iris_tb <- as_tibble(iris)
iris_tb

# Dataset 2
head(crabs)
crabs_tb <- as_tibble(crabs)
colnames(crabs_tb)

# 2. Esteticas
p <- ggplot(data = iris_tb)
p <- p + aes(x = Petal.Length, y = Petal.Width, color = Species) 
p

p2 <- ggplot(data = crabs_tb, 
             aes(x = Petal.Length, 
                 y = Petal.Width, 
                 color = Species) )

# 3. Geoms o capas
p <- p + aes(x = Petal.Length, y = Petal.Width, color = Species) + 
  geom_point()

# También es posible hacer todo de una marena mas sensilla
ggplot(data = iris_tb, aes(x = Petal.Length, # var eje X
                           y = Petal.Width,  # var eje Y
                           color = Species)) + # color per specie
  geom_point() # grafico de tipo puntos

# IC
ggplot(data = iris_tb, aes(x = Petal.Length, # var eje X
                           y = Petal.Width,  # var eje Y
                           color = Species)) + # color per specie
  geom_point() + # grafico de tipo puntos
  geom_smooth()

# 4. Facetas

# wrap
ggplot(data = iris_tb, aes(x = Petal.Length, # var eje X
                           y = Petal.Width,  # var eje Y
                           color = Species)) + # color per specie
  geom_point() +
  facet_wrap(~Species)

# grid
ggplot(data = iris_tb, aes(x = Petal.Length, # var eje X
                           y = Petal.Width,  # var eje Y
                           color = Species)) + # color per specie
  geom_point() +
  facet_grid(~Species)

# 5. Etiquetas, titulos
# 6. Temas

dados <- tibble(id = rep(1:7, each = 4),
                x = rep(c(1, 2, 3, 2), 7),) %>%
  mutate(
    y = c(1, 0, 1, 2) + id,
    id = factor(id)
  )

etiquetas <- tibble(
  x = 2.3, y = 1:7 + 0.6, label = c(
    "Dados", "Estéticas", "Geometrias", "Facetas", 
    "Estatísticas", "Coordenadas", "Temas"
  )
)
camadas <- ggplot(dados, aes(x, y)) +
  geom_polygon(aes(group = id, fill = id), alpha = 0.95) +
  geom_text(aes(x, y, label = label), data = etiquetas,
            size = 6, angle = 15, col = "gray30", fontface = "bold") +
  theme_void() +
  theme(legend.position = "none")
camadas

colors()


