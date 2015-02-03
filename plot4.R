# loaddata.R contains the code for loading the relevant data into memory.
source("loaddata.R")

png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2, 2))

# Top left graph
with(data, plot(Timestamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Top right graph
with(data, plot(Timestamp, Voltage, type="l", xlab="datetime"))

# Bottom left graph
with(data, plot(Timestamp, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(Timestamp, Sub_metering_2, type="l", col="Red"))
with(data, lines(Timestamp, Sub_metering_3, type="l", col="Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty="n")

# Bottom right graph
with(data, plot(Timestamp, Global_reactive_power, type="l", xlab="datetime"))

dev.off()