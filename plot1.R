library("data.table")

## Reading the data
data <- data.table::fread(input = "household_power_consumption.txt"
                          , na.strings="?"
)

## Converting the Date to Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## We will only be using data from the dates 2007-02-01 and 2007-02-02
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02"), ]
## Convert column to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

## Open the device
png("plot1.png", width=480, height=480)

## Plot to the PNG file
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()