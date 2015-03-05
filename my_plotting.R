##
## import and modify data

hpc<-read.csv("household_power_consumption.txt", nrows=5, sep=";")
classes<-sapply(hpc, class)
hpc<-read.csv("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes, na.strings="?")

names(hpc)[1]<-"dte"

hpc$dte<-as.Date(hpc$dte, "%d/%m/%Y")
hpc1<-hpc[hpc$dte==as.Date("2007-02-01")|hpc$dte==as.Date("2007-02-02"),]

##plot1 hist
png(file="mygraphic.png",width=480,height=480)
hist(hpc1$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()

## plot 2 line of hourly data

