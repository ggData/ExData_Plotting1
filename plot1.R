
## ----setup---------------------------------------------------------------
library("lubridate")


## ----Load_file-----------------------------------------------------------
# Assumes data file is in a local folder called 'data'
DF <- read.csv("./data/household_power_consumption.txt", 
               sep=";",
               na.strings="?")

# Select the data for Feb 1-2, 2007
DF <- DF[DF$Date == "1/2/2007" | DF$Date == "2/2/2007",]

# Use lubridate to convert to a datetime object
DF$Date <- dmy(DF$Date)
DF$Time <- hms(DF$Time)
DF$Datetime <- DF$Date + DF$Time


## ----plot1_base----------------------------------------------------------
with(DF,
     hist(Global_active_power,
          xlab="Global Active Power (kilowatts)",
          main="Global Active Power",
          col="red"))

# Send plot to PNG file
dev.copy(png, width=480, height=480, file = "plot1.png")

# Disconnect from graphics device
dev.off()


