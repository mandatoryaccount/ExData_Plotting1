#Read data from txt file
> hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Load useful libraries
> library(tidyr)
> library(readr)
> library(dplyr)

#Format date to make it searchable
> plot1 <- hpc %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"))

#Select specified dates
> plot1 <- plot1 %>% filter(Date == c("2007-02-01", "2007-02-02"))

#combine date and time to make line plot continuous
> time <- paste(plot1$Date, plot1$Time)

#Format combined date/time character vector to POS__ class
> test <- strptime(time, format = "%Y-%m-%d %H:%M:%S")

#Prepare data frames for plots in spaces [1, 2] and[2, 2]
> plot42 <- hpc %>% select(Date, Voltage, Global_reactive_power)

#make column values numeric
> plot42 <- plot42 %>% mutate(Date = as.Date(Date, format = "%d/%m/%Y"), Voltage = as.numeric(Voltage), Global_reactive_power = as.numeric(Global_reactive_power))

#filter dates
> plot42 <- plot42 %>% filter(Date == c("2007-02-01", "2007-02-02"))

#combine continuous date column with other column values
> plot4_2 <- data.frame(cbind(test, plot42))


#create top right graph
> plot(plot4_2$test, plot4_2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")


#create lower right graph
> plot(plot4_2$test, plot4_2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")


#Open png "device" with 2x2 partition 
> png(file = "plot4.png", width = 480, height = 480)
> par(mfrow = c(2,2))

#plot top left graph
> plot(plot2$test, plot2$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

#plot top right graph
> plot(plot4_2$test, plot4_2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#plot lower left graph with legend border removed
> plot(plot3$test, plot3$Sub_metering_2, type = "l", ylab = "Energy sub metering", col = "red", xlab = " ", ylim = c(0, 40)
+ )
> lines(plot3$test, plot3$Sub_metering_3, type = "l", col = "blue") +
+ lines(plot3$test, plot3$Sub_metering_1, type = "l", col = "black")
integer(0)
> legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8, bty = "n")

#plot lower right graph
> plot(plot4_2$test, plot4_2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
> dev.off()



