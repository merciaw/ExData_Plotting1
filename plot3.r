power <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE)
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power <- power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]

power$Day <- wday(power$Date)
power$Day[power$Day==5] <- "Thu"
power$Day[power$Day==6] <- "Fri"
power$Day[power$Day==7] <- "Sat"
power$DateTime <- with(power, as.POSIXct(paste(as.Date(Date, format="%Y-%m-%d"), Time)))

png(file="plot3.png", width=480, height=480)

plot(power$DateTime,power$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="",col="black")
points(power$DateTime,power$Sub_metering_2, type="l", ylab="Energy sub metering",xlab="",col="red")
points(power$DateTime,power$Sub_metering_3, type="l", ylab="Energy sub metering",xlab="",col="blue")


legend("topright",col=c("black","red","blue"),lwd=1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()