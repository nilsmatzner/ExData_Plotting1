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

#### Plot 1 ####

png("plot1.png")
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()