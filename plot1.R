#plot 1
library(sqldf)

powerConsumptionFileName <- "household_power_consumption.txt"
pc <- read.csv.sql(powerConsumptionFileName, sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ";")
names(pc) <- c("date", "time", "activePower", "reactivePower", "voltage", "intensity", "subMetering1", "subMetering2", "subMetering3")

png("plot1.png")
par(mar = c(5, 5, 3, 1), cex = 0.7)
hist(pc$activePower, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()





