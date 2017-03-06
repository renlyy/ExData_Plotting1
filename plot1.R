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
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#Plot histogram of Global Active Power
hist(subdata$Global_active_power,
     col = "#ff2600",
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

#Close png file
dev.off()