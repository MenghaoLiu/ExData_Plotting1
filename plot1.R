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

## Set the magnified value of plotting text and margin size

opar <- par(no.readonly = T)
par(cex = .8, mar = c(5, 5, 4, .5))

## Make a plot appear on screen device by hist()

with(DT, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))

## Save the plot into a .png format

dev.copy(png, file = "plot1.png")
par(opar)
dev.off()
