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

#Select Sub_metering columns and make obsevations numeric
> plot3 <- plot1 %>% select(Sub_metering_1, Sub_metering_2, Sub_metering_3)

> plot3 <- plot3 %>% mutate(Sub_metering_1 = as.numeric(Sub_metering_1))
> plot3 <- plot3 %>% mutate(Sub_metering_2 = as.numeric(Sub_metering_2))
> plot3 <- plot3 %>% mutate(Sub_metering_3 = as.numeric(Sub_metering_3))

#make data frame with extended time column
> plot3 <- data.frame(cbind(test, plot3))

> png(file = "plot3.png", width = 480, height = 480)
> plot(plot3$test, plot3$Sub_metering_2, type = "l", ylab = "Energy sub metering", col = "red", xlab = " ", ylim = c(0, 40))
> lines(plot3$test, plot3$Sub_metering_1, type = "l", col = "black")
> lines(plot3$test, plot3$Sub_metering_3, type = "l", col = "blue")
> legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8)
> dev.off()