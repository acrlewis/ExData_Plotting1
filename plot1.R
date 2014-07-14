# plot1.R
# Coursera Course Project 1
# This creates a histogram of global active power consumption for 2/1/2007 and 2/2/2007

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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()