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

## subset for plots
hpc1<-hpc[hpc$Date0==as.Date("2007-02-01")|hpc$Date0==as.Date("2007-02-02"),]

##plot1 hist
png(file="mygraphic.png",width=480,height=480)
hist(hpc1$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()

## plot 2 line of hourly data

strptime(hpc[1,2], "%H:%M:%S")
