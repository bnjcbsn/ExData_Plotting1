## By Ben Jacobson, March 2015
## import and modify data
## dataset source: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## see readme.md for more information

## instructions
## ensure the text file is in the working directory
## the resulting image will be placed in the working directory

hpc0<-read.csv("household_power_consumption.txt", nrows=5, sep=";")
classes<-sapply(hpc0, class)
hpc<-read.csv("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes, na.strings="?")

## append date and time fields
hpc$dtm<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Date0<-as.Date(hpc$Date, "%d/%m/%Y")

## subset for plots
hpc1<-hpc[hpc$Date0==as.Date("2007-02-01")|hpc$Date0==as.Date("2007-02-02"),]

## plot 2 line of hourly data
png(file="plot2.png",width=480,height=480, type="cairo-png")
plot(hpc1$dtm, hpc1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()