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

## Plotting histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(powerConsumption2$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
