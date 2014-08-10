library("data.table")
library("datasets")

#download the dataset and put inside the folder
data <- read.table("household_power_consumption.txt", na.strings = "?",
                      sep = ";", header = TRUE, stringsAsFactors = FALSE)
data <- data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

data$DateTime <- paste(data$Date, data$Time, sep = " ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, units = "px", bg ="transparent")

plot(x = data$DateTime, y = data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()