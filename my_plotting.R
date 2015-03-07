## By Ben Jacobson, March 2015
## import and modify data

hpc0<-read.csv("household_power_consumption.txt", nrows=5, sep=";")
classes<-sapply(hpc0, class)
hpc<-read.csv("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes, na.strings="?")

## append date and time fields
hpc$dtm<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$dte<-as.POSIXct(hpc$Date, format="%d/%m/%Y")
hpc$tm<-as.POSIXct(hpc$Time, format="%H:%M:%S")
hpc$Date0<-as.Date(hpc$Date, "%d/%m/%Y")
hpc$wd<-(format(hpc$Date0, "%a"))

## subset for plots
hpc1<-hpc[hpc$Date0==as.Date("2007-02-01")|hpc$Date0==as.Date("2007-02-02"),]

##plot1 hist
png(file="myplot1.png",width=480,height=480)
hist(hpc1$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()

## plot 2 line of hourly data
png(file="myplot2.png",width=480,height=480)
plot(hpc1$dtm, hpc1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

## plot 3
## credit to http://www.statmethods.net/graphs/line.html
png(file="myplot3.png",width=480,height=480)
yrange<-range(hpc1$Sub_metering_1)
xrange<-range(hpc1$dtm)
plot(xrange, yrange, type="n", ylab="Energy sub metering", xlab="", ylim=yrange, xlim=xrange)
lines(hpc1$dtm, hpc1$Sub_metering_1, type="l", col=1)
lines(hpc1$dtm, hpc1$Sub_metering_2, type="l", col=2)
lines(hpc1$dtm, hpc1$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1), col=c("black", "red", "blue"))
dev.off()

##strptime(hpc[1,2], "%H:%M:%S")
