data = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
data_subset = data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data_subset$Date = as.Date(data_subset$Date, format="%d/%m/%Y")

hist(data_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()