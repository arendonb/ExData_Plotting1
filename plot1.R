# Leer el dato y seleccionar las filas de interes
dato <- read.csv("household_power_consumption.txt", sep = ";")
datoset <- dato[dato$Date == "1/2/2007" | dato$Date == "2/2/2007", ]

# Construir el plot
datoset[, "Global_active_power"] <- as.numeric(as.character(datoset[, "Global_active_power"]))

# Guardar el plot en un archivo .png
png(filename = "plot1.png", height = 480, width = 480)
hist(datoset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()