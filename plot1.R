# loaddata.R contains the code for loading the relevant data into memory.
source("loaddata.R")

png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()