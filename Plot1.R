##loading relevant subset of data 
##Subset from the dates 2007-02-01 and 2007-02-02
    ##Note: This code assumes the .txt data file is in the working directory
library(data.table)
DT <- fread(
    "sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt",
    na.strings = c("?", ""))

##Creating plot in screen graphics on Mac
hist(DT$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col = "red", 
     ylim = c(0,1200))

##Saving plot to a png file
dev.copy(png, file = "plot1.png")
dev.off()
