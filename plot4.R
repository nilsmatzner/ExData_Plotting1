############################################################
## Programming Assignment 1 for Exploratory Data Analysis ##
## Submission of Nils Matzner                             ##
##                                                        ##
############################################################

library(data.table)
library(lubridate)

## Reading data. Working fine with full loading and subsetting afterwards.
f <- "~/R/coursera/household_power_consumption.txt"
colclasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
dat <- as.data.table(read.table(f, header = TRUE, sep = ";", colClasses = colclasses, na.strings = "?"))
dat <- dat[ dat$Date %in% c("1/2/2007", "2/2/2007") , ]
DateTimex <- paste(dat$Date, dat$Time, sep = " ")
dat[, DateTime := dmy_hms(DateTimex) ]

#### Plot 4 ####

png("plot4.png")
par(mfcol = c(2,2))

## Taken from Plot 2
with(dat, plot(x = DateTime, y = Global_active_power, type = "l", 
               xlab = "", ylab = "Global Active Power (kilowatts)"), xaxt = "n") #axis c("Thu", "Fri", "Sat")

## Taken form Plot 3
plot(x = dat$DateTime, y = dat$Sub_metering_1 , type = "n", xlab = "", ylab = "Energy sub metering")   #c("Thu", "Fri", "Sat")
lines(x = dat$DateTime, y = dat$Sub_metering_1, col = "black")
lines(x = dat$DateTime, y = dat$Sub_metering_2, col = "red")
lines(x = dat$DateTime, y = dat$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, bty = "n", box.col = NA, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ) 

## Two new plots
with(dat, plot(x = DateTime, y = Voltage, xlab = "datetime", type = "l"))
with(dat, plot(x = DateTime, y = Global_reactive_power, xlab = "datetime",  type = "l" ))
dev.off()
