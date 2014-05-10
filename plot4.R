
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


## ----plot4_base----------------------------------------------------------
# Create graph with four series
par(mfrow = c(2,2))

# draw panel 1: Histogram of Global Active Power
with(DF,
     plot(Datetime, 
          Global_active_power,
          xlab="",
          ylab="Global Active Power",
          type="s")
     )

# draw panel 2: Time series of Voltage
with(DF,
     plot(Datetime, 
          Voltage,
          xlab="datetime",
          ylab="Voltage",
          type="s")
     )

# draw panel 3: Three time series of sub meters
with(DF,
     plot(Datetime, 
          Sub_metering_1,
          xlab="",
          ylab="Energy sub metering",
          type="s")
     )
with(DF,
     lines(Datetime, 
           Sub_metering_2,
           col="red")
     )
with(DF,
     lines(Datetime, 
           Sub_metering_3,
           col="blue")
     )
legend("topright",
       col=c("black","red","blue"),
       bty="n",
       lty="solid",
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3")
       )

# draw panel 4: Time series of global reactive power
with(DF,
     plot(Datetime, 
          Global_reactive_power,
          xlab="datetime",
          ylab="Global Reactive Power",
          type="s")
     )

# Save to PNG file
dev.copy(png, width=480, height=480, file = "plot4.png")

# Disconnect from graphics device
dev.off()


