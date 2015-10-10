DF <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")) ## read in text file into an R dataframe
DF$Date <- as.date(DF$Date, format = "%d/%m/%Y") ## change class of Date column to date  
DF$timetemp <- paste(DF$Date, DF$Time) ## paste contents of Date and Time column in a new column
DF$Time <- strptime(DF$timetemp, format = "%Y-%m-%d %H:%M:%S") ## convert the content of the above column into class "POSIXlt"
DF <- DF[DF$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ] ## filters dataframe for the data corresponding to the required 2 days

## create a histogram for the Global_active_power variable with required annotations format:
hist(DF$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, file = "plot1.png", width = 480, height = 480) ## copy plot to png file
dev.off() ## close the PNG device