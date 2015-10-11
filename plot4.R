# This file creates the fourth plot for Exploratory Data Analysis project 1.
# It assumes that household_power_consumption.txt is in the working directory.

# We read only the relevant subset of the data.
# Power data for 1 February 2007 begins at row 66638,
# and power data for 2 February 2007 ends at row 69517.
# This is a total of 2880 rows with 66637 rows skipped.
# A second read.table call pulls the column names.

power_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?", header=FALSE, nrows=2880, skip=66637)
colnames(power_data) <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=FALSE, nrows=1)

# We set up the parameter to fill upper left, lower left, upper right, lower right.
# Adjusting the size of the margins will also help.
par(mfcol=c(2,2))
par(mar=c(4,4,0.5,1))

# First the global active power plot, very similar to plot 2.
# The only difference is the Y axis label:
power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
raw_date_time <- paste(power_data$Date, power_data$Time)
date_time <- strptime(raw_date_time, format="%Y-%M-%d %H:%M:%S")
plot(date_time, power_data$Global_active_power, xlab="", ylab="Global Active Power", cex.lab=0.5, cex.axis = 0.6, type="l")

# Next the energy sub metering, identical to plot 3:
plot(date_time, power_data$Sub_metering_1, xlab="", ylab="Energy sub metering", cex.lab=0.5, cex.axis = 0.6, type="l")
lines(date_time, power_data$Sub_metering_2, col="red")
lines(date_time, power_data$Sub_metering_3, col="blue")
legend("top", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty="n", cex=0.3)

# Third, a new graph of voltage by date:
plot(date_time, power_data$Voltage, xlab="datetime", ylab="Voltage", cex.lab=0.5, cex.axis = 0.6, type="l")

# Fourth, a new graph of reactive power by date:
plot(date_time, power_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", cex.lab=0.5, cex.axis = 0.6, type="l")

# Finally, we output to a PNG and close out.
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()