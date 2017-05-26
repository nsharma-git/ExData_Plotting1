# Read the household_power_consumption file
power_data <- read.csv2("household_power_consumption.txt")

# Convert Date column from string to Date object so that we can filter out data
power_data$Date2 <- as.Date(power_data$Date, "%d/%m/%Y")
sub_data <- subset(power_data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

sub_data$Date2 <- as.POSIXct(paste(sub_data$Date, sub_data$Time), format="%d/%m/%Y %H:%M:%S")
sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))

# plot the chart
figure <- par(mfrow=c(2, 2))
plot(sub_data$Date2, as.numeric(as.character(sub_data$Global_active_power)), type="l", ylab = "Global Active Power", xlab = "")

plot(sub_data$Date2, as.numeric(as.character(sub_data$Voltage)), type="l", ylab = "Voltage", xlab = "datetime")

plot(sub_data$Date2, as.numeric(as.character(sub_data$Sub_metering_1)), col="black", type="l", ylab="Energy sub metering", xlab = "")
lines(sub_data$Date2, as.numeric(as.character(sub_data$Sub_metering_2)), col="red")
lines(sub_data$Date2, as.numeric(as.character(sub_data$Sub_metering_3)), col="blue")
legend("topright", colnames(sub_data)[7:9], lty=c(1,1), col=c("black", "red", "blue"), y.intersp = 1, bty="n")

plot(sub_data$Date2, as.numeric(as.character(sub_data$Global_reactive_power)), type="l", ylab = "Global_reactive_power", xlab = "datetime")

par(figure)
dev.copy(png,'plot4.png', height=480, width = 480)
dev.off()
