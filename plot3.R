#plot3
library(sqldf)

powerConsumptionFileName <- "household_power_consumption.txt"
pc <- read.csv.sql(powerConsumptionFileName, sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ";")
names(pc) <- c("date", "time", "activePower", "reactivePower", "voltage", "intensity", "subMetering1", "subMetering2", "subMetering3")

png("plot3.png")
sm1 <- pc[,7]
sm2 <- pc[,8]
sm3 <- pc[,9]
x <- as.POSIXct(paste(pc$date, pc$time), format="%d/%m/%Y %H:%M:%S")

par(mar = c(4, 6, 2, 2))
plot(x, sm1, type = "n", ylab = "Energy sub metering", xlab = "")
points(x, sm1, type="l", col = "black")
points(x, sm2, type="l", col = "red")
points(x, sm3, type="l", col = "blue")
legend("topright", c(1, 2, 3), col = c("black", "red", "blue"), lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
