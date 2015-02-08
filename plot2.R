# Read the data


data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                 colClasses=c("character", "character", rep("numeric",7)), na="?")

# change date format
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# filter 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)


# Create the plot
  
png("plot2.png", width=400, height=400)

plot(data$Time, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()

