# This file creates the third plot for Exploratory Data Analysis project 1.
# It assumes that household_power_consumption.txt is in the working directory.

# We read only the relevant subset of the data.
# Power data for 1 February 2007 begins at row 66638,
# and power data for 2 February 2007 ends at row 69517.
# This is a total of 2880 rows with 66637 rows skipped.
# A second read.table call pulls the column names.

power_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?", header=FALSE, nrows=2880, skip=66637)
colnames(power_data) <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=FALSE, nrows=1)

# Now we combine the date and time for this plot.

power_data$Date <- as.Date(power_data$Date, format="%d/%m/%Y")
raw_date_time <- paste(power_data$Date, power_data$Time)
date_time <- strptime(raw_date_time, format="%Y-%M-%d %H:%M:%S")

# Now we layer the three line graphs of the energy sub metering, and add a legend:

plot(date_time, power_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(date_time, power_data$Sub_metering_2, col="red")
lines(date_time, power_data$Sub_metering_3, col="blue")
legend("top", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty="n", cex=0.5)

# Finally, we save to png and close out.

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()