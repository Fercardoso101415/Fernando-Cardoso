######## Seleccionar base de datos: 

Estudiantes <- read.csv(file.choose(),header=TRUE,sep=";")
## file.choose() evita escribir la ruta del archivo, abre la ventana de bÃºsqueda
## header=TRUE indica que tiene encabezado
## sep=";" indica que el separador es ";", el separador habitual es ","
## ObservaciÃ³n: si fuera .txt : read.table(file.choose(),header=TRUE)

 
attach(Estudiantes) 
head(Estudiantes) # lectura de la sprimeras 6 filas incluido encabezado
names(Estudiantes) # nombre de las variables
str(Estudiantes) # Estructura de las variables (int, factor, ...)
help(str) # Ayuda
View(Estudiantes) # VisualizaciÃ³n como planilla de datos


######## AnÃ¡lisis univariado de los datos:

### Mjob (Mother's job): variable cualitativa
table(Estudiantes$Mjob) # permite tabular
table(Mjob)
table(Estudiantes$Fjob) # Fjob (Father's job)
View(table(Fjob))

prop.table(table(Estudiantes$Mjob)) # tabla de proporciones

# GrÃ¡fico de barras:
barplot(table(Estudiantes$Mjob)) 
help("barplot")
barplot(table(Estudiantes$Mjob),
        main = "Trabajo de la madre",
        xlab = "Mjob",
        ylab = "Frecuencias",
        col = 1:5)


# GrÃ¡fico de torta:
pie(table(Estudiantes$Mjob),col=1:5,main = "Trabajo de la madre")
help(pie)


### Variable edad (age)

table(cut(age,4)) # tabla de contingencia 
View(table(cut(age,4)))
prop.table(table(cut(age,4))) 

# Histograma:
hist(age)
table(age)
hist(G1)
help(hist)
