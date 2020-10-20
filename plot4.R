# Leer el dato y seleccionar las filas de interes
dato <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
datoset <- dato[dato$Date == "1/2/2007" | dato$Date == "2/2/2007", ]

# Construir el plot
library(lubridate) # dmy_hms
library(tidyr) # Unite
datoset[, "Global_active_power"] <- as.numeric(as.character(datoset[, "Global_active_power"]))
datoset[, "Global_reactive_power"] <- as.numeric(as.character(datoset[, "Global_reactive_power"]))
datoset[, "Voltage"] <- as.numeric(as.character(datoset[, "Voltage"]))
datoset[, "Sub_metering_1"] <- as.numeric(as.character(datoset[, "Sub_metering_1"]))
datoset[, "Sub_metering_2"] <- as.numeric(as.character(datoset[, "Sub_metering_2"]))
datoset[, "Sub_metering_3"] <- as.numeric(as.character(datoset[, "Sub_metering_3"]))
datoset <- unite(datoset, Fecha, c(1:2), sep=" ", remove = TRUE)
datoset[, "Fecha"] <- dmy_hms(datoset$Fecha)

# Guardar el plot en un archivo .png
png(filename = "plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))
#Grafica (1,1)
with(datoset, plot(Fecha, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))
#Grafica (1,2)
with(datoset, plot(Fecha, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))
# Grafica (2,1)
with(datoset, plot(Fecha, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(datoset, lines(Fecha, Sub_metering_2, col="red"))
with(datoset, lines(Fecha, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#Grafica (2,2)
with(datoset, plot(Fecha, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))
dev.off()
