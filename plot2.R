## Before running the following code, you should unzip the .txt dataset named household_power_consumption 
## to your current working directory


## Check whether the required raw data set has been unzipped in the working directory

if(!file.exists("household_power_consumption.txt")) {
    stop("can not find the dataset")
}

## Read the data from the dates 2007-02-01 and 2007-02-02

vname <- read.table("household_power_consumption.txt", row.names = NULL, nrows = 1, sep = ";", stringsAsFactors = F)
vname <- as.character(vname)
DT <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, row.names = NULL, col.names = vname, stringsAsFactors = F)

## Create a new character variable named Date_time and convert it to class "POSIXlt"

DT <- transform(DT, Date_time = paste(DT$Date, DT$Time, sep = " "), stringsAsFactors = F)
DT$Date_time <- strptime(DT$Date_time, "%d/%m/%Y %H:%M:%S")

## Set the magnified value of plotting text and margin size

opar <- par(no.readonly = T)
par(cex = .8, mar = c(4, 5, 3, 1))

## Make a plot appear on screen device

with(DT, plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Save the plot into a .png format

dev.copy(png, file = "plot2.png")
par(opar)
dev.off()