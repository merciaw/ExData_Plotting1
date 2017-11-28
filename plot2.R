power <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE)
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power <- power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]
png(file="plot1.png", width=480, height=480)
hist(power$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()