##loading relevant subset of data 
##Subset from the dates 2007-02-01 and 2007-02-02
##Note: This code assumes the .txt data file is in the working directory
library(data.table)
DT <- fread(
    "sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt",
    na.strings = c("?", ""))

#Create new column combining Date and Time, setting as POSIXct type
DT$DatewithTime <- as.POSIXct(paste(DT$Date, DT$Time), format = "%d/%m/%Y %H:%M:%S")

##Creating plot in screen graphics on Mac
with(DT, plot(DatewithTime, Global_active_power,
              type = "l",
              ylab = "Global Active Power (kilowatts)",
              xlab = ""))

##Saving plot to a png file
dev.copy(png, file = "plot2.png")
dev.off()
