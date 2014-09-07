data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_subset = data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data_subset$Date = as.Date(data_subset$Date, format="%d/%m/%Y")
data_subset$dateTime = as.POSIXct(paste(data_subset$Date, data_subset$Time))

with(data_subset, {
	plot(data_subset$dateTime, data_subset$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
	lines(data_subset$dateTime, data_subset$Sub_metering_2, col="Red")
	lines(data_subset$dateTime, data_subset$Sub_metering_3, col="Blue")
})
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), cex=1.2)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()