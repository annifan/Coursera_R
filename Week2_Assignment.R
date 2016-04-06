getwd()
test<-read.table("Desktop/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
newdate<-test[test$Date %in% c("1/2/2007","2/2/2007"),]
newtime<-strptime(paste(newdate$Date, newdate$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
final<- cbind(newtime, newdate)
#plot 1
hist(final$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
#plot 2
plot(final$newtime, final$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
#plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(final$newtime, final$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(final$newtime, final$Sub_metering_2, col=columnlines[2])
lines(final$newtime, final$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
#plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(final$newtime, final$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(final$newtime, final$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(final$newtime, final$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(final$newtime, final$Sub_metering_2, type="l", col="red")
lines(final$newtime, final$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(final$newtime, final$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

