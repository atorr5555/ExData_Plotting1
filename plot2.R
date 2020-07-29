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
## Convert column to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

## Opening device
png("plot2.png", width=480, height=480)

## Plotting to the PNG file
plot(x = data$dateTime, y = data$Global_active_power, xlab="", type = "l",
     ylab="Global Active Power (kilowatts)"
)

## Close the device
dev.off()