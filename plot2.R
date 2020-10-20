# Leer el dato y seleccionar las filas de interes
dato <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
datoset <- dato[dato$Date == "1/2/2007" | dato$Date == "2/2/2007", 1:3]

# Construir el plot
library(lubridate) # dmy_hms
library(tidyr) # Unite
datoset[, "Global_active_power"] <- as.numeric(as.character(datoset[, "Global_active_power"]))
datoset <- unite(datoset, Fecha, c(1:2), sep=" ", remove = TRUE)
datoset[, "Fecha"] <- dmy_hms(datoset$Fecha)

# Guardar el plot en un archivo .png
png(filename = "plot2.png", height = 480, width = 480)
with(datoset, plot(Fecha, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()