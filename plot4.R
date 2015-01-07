# Plot 4

# Code for reading the data so that the plot can be fully reproduced. 

library(dplyr)
library(lubridate)

pwr <- read.table("C:\\Users\\Josh\\Documents\\GitHub\\Beachbox\\coursera_datascience\\ExploratoryDataAnalysis\\data\\household_power_consumption.txt",
                  header = T, sep = ";", na.strings = "?")

# Change date/time to POSIXct format
pwr$Date <- as.character(pwr$Date)
pwr$Date <- dmy(pwr$Date)

pwr$DateTime <- paste(pwr$Date, pwr$Time)
pwr$DateTime <- ymd_hms(pwr$DateTime)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
pwr <- 
  pwr %>%
  tbl_df %>%
  filter(Date > "2007-01-31" & Date <= "2007-02-02")

# Create plot  

  # Code that creates the PNG 
  png(filename = "C:\\Users\\Josh\\Documents\\GitHub\\ExData_Plotting1\\plot4.png",
      width = 480, height = 480)
  
  par(mfrow=c(2,2))
  # upper left
  plot(pwr$DateTime, pwr$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power")
  # upper right
  plot(pwr$DateTime, pwr$Voltage, type="l",
       xlab="datetime", ylab="Voltage")
  # lower left
  plot(pwr$DateTime, pwr$Sub_metering_1, type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(pwr$DateTime, pwr$Sub_metering_2, col="red")
  lines(pwr$DateTime, pwr$Sub_metering_3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1,
         box.lwd=0)
  # lower right
  plot(pwr$DateTime, pwr$Global_reactive_power, type="n",
       xlab="datetime", ylab="Global_reactive_power")
  lines(pwr$DateTime, pwr$Global_reactive_power)

  graphics.off()