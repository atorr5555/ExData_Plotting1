## Downloading the data and unzip it
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./exdata_data_household_power_consumption.zip", method = "curl")
unzip(zipfile = "./exdata_data_household_power_consumption.zip")
