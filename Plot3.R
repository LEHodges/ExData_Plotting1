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
#creating basic plot
with(DT, plot(DatewithTime,Sub_metering_1,
              col = "black",
              type = "l",
              ylab = "Energy sub metering",
              xlab = ""
              ))
#adding legend in top right corner
legend("topright", pch = "", lwd = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#adding additional data lines to plot
lines(DT$DatewithTime,DT$Sub_metering_2, col = "blue")
lines(DT$DatewithTime,DT$Sub_metering_3, col = "red")

##Saving plot to a png file
dev.copy(png, file = "plot3.png")
dev.off()
