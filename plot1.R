# Read the household_power_consumption file
power_data <- read.csv2("household_power_consumption.txt")
# Convert Date column from string to Date object so that we can filter out data
power_data$Date2 <- as.Date(power_data$Date, "%d/%m/%Y")
# Get the subset of data of our interest
sub_data <- subset(power_data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))
sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))

# plot the histogram
hist(sub_data$Global_active_power, 
     breaks=12,
     xlim = c(0, 6),
     col="red", 
     xlab="Global Active Power (killowatts)", 
     ylab="Frequency",
     main="Global Active Power")

dev.copy(png,'plot1.png', height=480, width = 480)
dev.off()
