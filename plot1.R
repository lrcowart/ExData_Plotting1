# This file creates the first plot for Exploratory Data Analysis project 1.
# It assumes that household_power_consumption.txt is in the working directory.

# We read only the relevant subset of the data.
# Power data for 1 February 2007 begins at row 66638,
# and power data for 2 February 2007 ends at row 69517.
# This is a total of 2880 rows with 66637 rows skipped.
# A second read.table call pulls the column names.

power_data <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, na.strings = "?", header=FALSE, nrows=2880, skip=66637)
colnames(power_data) <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=FALSE, nrows=1)

# Finally, we create the histogram of Global Active Power, save to png, and close.

hist(power_data$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

