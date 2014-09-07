data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_subset = data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data_subset$Date = as.Date(data_subset$Date, format="%d/%m/%Y")
data_subset$dateTime = as.POSIXct(paste(data_subset$Date, data_subset$Time))

plot(data_subset$dateTime, data_subset$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()