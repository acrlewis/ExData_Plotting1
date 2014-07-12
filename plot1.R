# this file creates a histogram of global active power consumption for two days (feb 1st and 2nd 2007)

# read the data
# assumes data file is in the working directory
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
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()