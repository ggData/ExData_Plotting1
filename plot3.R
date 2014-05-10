
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


## ----plot3_base----------------------------------------------------------
# Create graph with three series
with(DF,
     plot(Datetime, 
          Sub_metering_1,
          xlab="",
          ylab="Energy sub metering",
          type="s"))
with(DF,
     lines(Datetime, Sub_metering_2,col="red"))
with(DF,
     lines(Datetime, Sub_metering_3,col="blue"))

legend("topright",
       col=c("black","red","blue"),
       lty="solid",
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))

# Save to PNG file
dev.copy(png, width=480, height=480, file = "plot3.png")

# Disconnect from graphics device
dev.off()


