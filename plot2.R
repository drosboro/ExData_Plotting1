# loaddata.R contains the code for loading the relevant data into memory.
source("loaddata.R")

png("plot2.png", width=480, height=480, units="px")
with(data, plot(Timestamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))
dev.off()