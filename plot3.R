# Leer el dato y seleccionar las filas de interes
dato <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
datoset <- dato[dato$Date == "1/2/2007" | dato$Date == "2/2/2007", ]

# Construir el plot
library(lubridate) # dmy_hms
library(tidyr) # Unite
datoset[, "Sub_metering_1"] <- as.numeric(as.character(datoset[, "Sub_metering_1"]))
datoset[, "Sub_metering_2"] <- as.numeric(as.character(datoset[, "Sub_metering_2"]))
datoset[, "Sub_metering_3"] <- as.numeric(as.character(datoset[, "Sub_metering_3"]))
datoset <- unite(datoset, Fecha, c(1:2), sep=" ", remove = TRUE)
datoset[, "Fecha"] <- dmy_hms(datoset$Fecha)

# Guardar el plot en un archivo .png
png(filename = "plot3.png", height = 480, width = 480)
with(datoset, plot(Fecha, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(datoset, lines(Fecha, Sub_metering_2, col="red"))
with(datoset, lines(Fecha, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()