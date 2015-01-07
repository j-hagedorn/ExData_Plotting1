# Plot 3

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
  png(filename = "C:\\Users\\Josh\\Documents\\GitHub\\ExData_Plotting1\\plot3.png",
      width = 480, height = 480)
  
  with(pwr, {
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  graphics.off()