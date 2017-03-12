###     IMPORTANT: Respective PNG submissions will show Timeseries plots 
###     with the X-axis in German formatted days e.g. "Thur" = "Do" 
###     due to the fact that the example PNG files being generated on a 
###     German computer Windows version.

#Lazy version of setting the Working Drive, appologies.
getwd()
setwd("C:/Users/Porter/Documents/R Source/Exploratory")
getwd()

#Read the dataset and subset for specified dates.
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
selectData <- subset(data, data$Date >= as.Date("2007-02-01") & data$Date < as.Date("2007-02-03"))

#Export required graph to a PNG file with resolution 480x480
png("plot2.png",width = 480, height = 480)
plot(selectData$DateTime,as.numeric(selectData$Global_active_power), 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
dev.off()