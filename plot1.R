# Plot 1

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
  png(filename = "C:\\Users\\Josh\\Documents\\GitHub\\ExData_Plotting1\\plot1.png",
      width = 480, height = 480)
  
  hist(pwr$Global_active_power,
       col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  
  graphics.off()


  
  