library("data.table")
library("datasets")

#download the dataset and put inside the folder
data <- read.table("household_power_consumption.txt", na.strings = "?",
                      sep = ";", header = TRUE, stringsAsFactors = FALSE)
data <- data[which(data$Date == '1/2/2007' | data$Date == '2/2/2007'),]

png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")
dev.off()