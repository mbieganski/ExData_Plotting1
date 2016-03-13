#plot2
library(sqldf)

powerConsumptionFileName <- "household_power_consumption.txt"
pc <- read.csv.sql(powerConsumptionFileName, sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ";")
names(pc) <- c("date", "time", "activePower", "reactivePower", "voltage", "intensity", "subMetering1", "subMetering2", "subMetering3")

png("plot2.png")
par(mar = c(5, 5, 3, 1))
x <- as.POSIXct(paste(pc$date, pc$time), format="%d/%m/%Y %H:%M:%S")
plot(x, pc$activePower, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
