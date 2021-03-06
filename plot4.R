library("data.table")
library("datasets")

#download the dataset and put inside the folder
data <- read.table("household_power_consumption.txt", na.strings = "?",
                      sep = ";", header = TRUE, stringsAsFactors = FALSE)
data <- data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

data$DateTime <- paste(data$Date, data$Time, sep = " ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2,2))

plot(data$DateTime, data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(data, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " "))
with(data, lines(DateTime, Sub_metering_2, col = "red"))
with(data, lines(DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty = 1, cex = 0.8, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()