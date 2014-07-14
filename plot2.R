# plot2.R
# Coursera Course Project 1
# this file creates a plot of global active power consumption for two days (feb 1st and 2nd 2007)

# read the data
setwd("/Users/clewis/development/ExData_Plotting1")
rawdata <- read.csv("household_power_consumption.txt", sep=";", na.strings= "?", header = TRUE)

# combine the subsets into one
data <- rbind(subset(rawdata, rawdata$Date == '1/2/2007'), subset(rawdata, rawdata$Date == '2/2/2007'))

# create a new field that has both date and time
data$Date_Time <- paste(data$Date, data$Time, sep =" ")
# convert to actual date type
data$Date_Time <- strptime(data$Date_Time, format="%d/%m/%Y %H:%M:%S")

# create the plot as a .png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Date_Time, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()