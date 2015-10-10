DF <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")) ## read in text file into an R dataframe
DF$Date <- as.Date(DF$Date, format = "%d/%m/%Y") ## change class of Date column to date  
DF$timetemp <- paste(DF$Date, DF$Time) ## paste contents of Date and Time column in a new column
DF$Time <- strptime(DF$timetemp, format = "%Y-%m-%d %H:%M:%S") ## convert the content of the above column into class "POSIXlt"
DF <- DF[DF$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ] ## filters dataframe for the data corresponding to the required 2 days

## create a lineplot for the Global_active_power variable with required annotations format:
par(mfcol = c(2,2))
with(DF,{ 
  plot(Time, Global_active_power, type="l", xlab = "",ylab = "Global Active Power")
  plot(Time, Sub_metering_1, col = "black", type="l", xlab ="", ylab = "Energy sub metering")
    lines(Time, Sub_metering_2, col = "red")
    lines( Time, Sub_metering_3, col = "blue")
    legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.25)
  plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(Time, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.copy(png, file = "plot4.png", width = 480, height = 480) ## copy plot to png file
dev.off() ## close the PNG device