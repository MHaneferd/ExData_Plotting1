# Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Make Date and Time as POSIXct-format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# filter out the two days in february (01. and 02. feb 2007)
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") ,]

# Get in Time object into new datetime variable
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# I need to change the codepage to English (Otherwize the weekdays will be in Norwegian on my plot-output)
Sys.setlocale(category = "LC_ALL", locale = "english")

# Create the file device
png("plot2.png", width=480, height=480, units = "px")

# plot:
with( data, plot(DateTime, as.numeric(sub(",",".",Global_active_power)), type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Copy the plot to .png file:
dev.off ()
