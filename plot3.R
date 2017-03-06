##read data
filename <- "household_power_consumption.txt"
data <- read.table (filename, 
                    header = TRUE, 
                    sep = ";", 
                    colClasses = c("character", "character", rep("numeric", 7)), 
                    na.strings = "?")

##Change class from character to date and time
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

##Subset the data we need (from 2007-02-01 to 2007-02-02)
subdata <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

##Create png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

##Change the language as my default setting is not English
Sys.setlocale("LC_ALL", "English")

##Plot the data
with(subdata, plot(Time, Sub_metering_1, 
                   type = "l", 
                   xlab = "", 
                   ylab = "Energy sub metering"))

with(subdata, lines(Time, Sub_metering_2, 
                     type = "l", 
                     col = "red"))

with(subdata, lines(Time, Sub_metering_3, 
                     type = "l", 
                     col = "blue"))

legend("topright", 
       lty = 1, 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Close png file
dev.off()
