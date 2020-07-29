library("data.table")

## Reading the data
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?"
)

functionDT <- function(x) {
    as.POSIXct(paste(x[1], x[2]), format = "%d/%m/%Y %H:%M:%S")
}

## Making a POSIXct date capable of being filtered and graphed by time of day
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
## Converting the Date to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02"), ]
## Convert columns to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Opening device
png("plot3.png", width=480, height=480)

## Plotting to the device
plot(x = data$dateTime, y = data$Sub_metering_1, xlab="", type = "l",
     ylab="Energy sub meteriing"
)
lines(data$dateTime, data$Sub_metering_2, col = "red")
lines(data$dateTime, data$Sub_metering_3, col = "blue")
## Adding a legend
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,lty=c(1, 1), lwd=c(1, 1)
)
## Closing the device
dev.off()