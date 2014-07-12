# plot4.R
# Coursera Course Project 1
# this file creates an overview of power consumption for two days (feb 1st and 2nd 2007)
# it contains four sub graphics displaying global active power, sub metering, and voltage

# read the data
setwd("/Users/clewis/development/ExData_Plotting1")
rawdata <- read.csv("household_power_consumption.txt", sep=";", na.strings= "?", header = TRUE)

# create subsets of data for each day in the plot
data1 <- subset(rawdata, rawdata$Date == '1/2/2007')
data2 <- subset(rawdata, rawdata$Date == '2/2/2007')

# combine the subsets into one
data <- rbind(data1, data2)

# create a new field that has both date and time
data$Date_Time <- paste(data$Date, data$Time, sep =" ")
# convert to actual date type
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

# create the plot as a .png file
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(data, {
  #plot 1 global active power
  plot(data$Date_Time, data$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
  
  #plot 2 voltage
  plot(data$Date_Time, data$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
  
  #plot 3 sub metering
  plot(data$Date_Time, data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
  lines(data$Date_Time, data$Sub_metering_1, type="l", lwd=1.5, col="black") 
  lines(data$Date_Time, data$Sub_metering_2, type="l", lwd=1.5, col="red") 
  lines(data$Date_Time, data$Sub_metering_3, type="l", lwd=1.5, col="blue") 
  legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #plot 4 global active power
  plot(data$Date_Time, data$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()