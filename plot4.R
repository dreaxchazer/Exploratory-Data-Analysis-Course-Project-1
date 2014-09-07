data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_subset = data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data_subset$Date = as.Date(data_subset$Date, format="%d/%m/%Y")
data_subset$dateTime = as.POSIXct(paste(data_subset$Date, data_subset$Time))

par(mfrow=c(2,2))

plot(data_subset$dateTime, data_subset$Global_active_power, type="l", xlab = "", ylab="Global Active Power")
plot(data_subset$dateTime, data_subset$Voltage, type="l", xlab = "datetime", ylab="Voltage")
with(data_subset, {
	plot(data_subset$dateTime, data_subset$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
	lines(data_subset$dateTime, data_subset$Sub_metering_2, col="Red")
	lines(data_subset$dateTime, data_subset$Sub_metering_3, col="Blue")
})
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), box.lty=0)
plot(data_subset$dateTime, data_subset$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")

par(mfrow=c(1,1))

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()