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

#### Plot 3 ####

png("plot3.png")
with(dat, {plot(x = DateTime, y = Sub_metering_1 , type = "n", xlab = "", ylab = "Energy sub metering") 
      lines(x = DateTime, y = Sub_metering_1, col = "black")
      lines(x = DateTime, y = Sub_metering_2, col = "red")
      lines(x = DateTime, y = Sub_metering_3, col = "blue")})
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()     