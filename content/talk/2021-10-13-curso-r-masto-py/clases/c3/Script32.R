ls()
rm(list=ls())

##cargamos una tabla
garrapas<-read.csv("C:/Na/vet/INMeT/Cursos/Minicurso Jornadas Paraguayas Mastozoología 2021/laqueva/tablasfrecuenciasDani.csv",header=T,sep=",",dec=".")

##calculamos la frecuencia absoluta
fa<-table(garrapas$ngarrapatas)
fa

#calculamos la frecuencia relativa
prop.table(fa)

#construimos una tabla de distribución de frecuencias
install.packages("fdth")
library(fdth)
freq.dist,table <- fdt(garrapas$ngarrapatas,start=0, end=18, h=1)
freq.dist,table

#graficamos un histograma
hist(garrapas$ngarrapatas,xlab="Número de garrapatas",ylab="Frecuencia",col="dark violet",breaks=20,
     main="Conteo de garrapatas en Nasua nasua",border = "green")


