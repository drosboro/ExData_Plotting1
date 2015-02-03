# loaddata.R contains the code for loading the relevant data into memory.
source("loaddata.R")

png("plot3.png", width=480, height=480, units="px")
with(data, plot(Timestamp, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data, lines(Timestamp, Sub_metering_2, type="l", col="Red"))
with(data, lines(Timestamp, Sub_metering_3, type="l", col="Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()