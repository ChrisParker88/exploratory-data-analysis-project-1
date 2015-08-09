file <- "./data/household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data2 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data2$Global_active_power)
globalReactivePower <- as.numeric(data2$Global_reactive_power)
voltage <- as.numeric(data2$Voltage)

subMetering1 <- as.numeric(data2$Sub_metering_1)
subMetering2 <- as.numeric(data2$Sub_metering_2)
subMetering3 <- as.numeric(data2$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()