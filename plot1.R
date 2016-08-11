# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
names(data)
str(data)

# Make Date and Time as POSIXct-format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# filter out the two days in february (01. and 02. feb 2007)
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") ,]

# Create the file device
png("plot1.png", width=480, height=480, units = "px")

# plot:
hist(as.numeric(sub(",",".",data$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main="Global active power")

dev.off ()
