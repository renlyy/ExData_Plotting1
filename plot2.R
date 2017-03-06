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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

##Change the language as my default setting is not English
Sys.setlocale("LC_ALL", "English")

##Plot the data
plot(subdata$Time, subdata$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

##Close png file
dev.off()