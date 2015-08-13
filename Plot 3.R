## Change working directory
setwd("/Users/Asher/DataScience/EDA")

## URL of the relevant data
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## Download zip file
download.file(fileURL, destfile = "household_power_consumption.zip", method = "curl")

## Read table
powerConsumption <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"), header = T, sep = ";")

## Take only data from 2007-02-01 and 2007-02-02
powerConsumption2 <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"),]

## Converting to Date/Time classes
powerConsumption2$DateTime <- paste(powerConsumption2$Date, powerConsumption2$Time)
powerConsumption2$DateTime <- strptime(powerConsumption2$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Plotting line graph
png("plot3.png",width=480,height=480)
plot(powerConsumption2$DateTime, as.numeric(as.character(powerConsumption2$Sub_metering_1)), type="l", xlab = "", ylab="Energy sub metering", col="black")
points(powerConsumption2$DateTime, as.numeric(as.character(powerConsumption2$Sub_metering_2)), type="l", col="red")
points(powerConsumption2$DateTime, as.numeric(as.character(powerConsumption2$Sub_metering_3)), type="l", col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
