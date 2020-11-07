raw_data <- read.csv2("household_power_consumption.txt")
raw_data$Date <- strptime(as.character(raw_data$Date), "%d/%m/%Y")
selected_date_data <- raw_data[which(raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02"),]
gap <- as.numeric(selected_date_data$Global_active_power)
no_na_gap <- gap[!is.na(gap)]

par(mfrow = c(1,1), mar = c(5,4,2,1))
hist(no_na_gap, col= "red", breaks = 20, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()