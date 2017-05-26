# Read the household_power_consumption file
power_data <- read.csv2("household_power_consumption.txt")

# Convert Date column from string to Date object so that we can filter out data
power_data$Date2 <- as.Date(power_data$Date, "%d/%m/%Y")
sub_data <- subset(power_data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

sub_data$Date2 <- as.POSIXct(paste(sub_data$Date, sub_data$Time), format="%d/%m/%Y %H:%M:%S")
sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))

# plot the chart
plot(sub_data$Date2, sub_data$Global_active_power, type="l")

dev.copy(png,'plot2.png', height=480, width = 480)
dev.off()
