raw_data <- read.csv2("household_power_consumption.txt")
raw_data$Date <- strptime(as.character(raw_data$Date), "%d/%m/%Y")
selected_date_data <- raw_data[which(raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02"),]
selected_date_data$DateTime <- as.POSIXct(paste(selected_date_data$Date, selected_date_data$Time), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2))
plot(selected_date_data$DateTime, selected_date_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power(kilowatts)" )

plot(selected_date_data$DateTime, selected_date_data$Voltage, 
     type = "l", 
     xlab = "datatime", 
     ylab = "Voltage" )

plot(selected_date_data$DateTime, selected_date_data$Sub_metering_1, 
     type = "n", 
     xlab = "", 
     ylab = "Energy sub metering")
points(selected_date_data$DateTime, selected_date_data$Sub_metering_1, type = "l")
points(selected_date_data$DateTime, selected_date_data$Sub_metering_2, col = "red", type = "l")
points(selected_date_data$DateTime, selected_date_data$Sub_metering_3, col = "blue", type = "l")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

plot(selected_date_data$DateTime, selected_date_data$Global_reactive_power, 
     type = "l", 
     xlab = "datatime", 
     ylab = "Global_reactive_power" )

dev.copy(png, file = "plot4.png")
dev.off()