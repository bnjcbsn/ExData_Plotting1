hpc<-read.csv("household_power_consumption.txt", nrows=5, sep=";")
classes<-sapply(hpc, class)
hpc<-read.csv("household_power_consumption.txt", sep=";", header = TRUE, colClasses = classes, na.strings="?")
hist(hpc$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power", xlim=6)
