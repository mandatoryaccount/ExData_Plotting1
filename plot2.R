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

#Make Global active power numeric
> plot1 <- plot1 %>% mutate(Global_active_power = as.numeric(Global_active_power))

#combine date and time to make line plot continuous
> time <- paste(plot1$Date, plot1$Time)

#Format combined date/time character vector to POS__ class
> test <- strptime(time, format = "%Y-%m-%d %H:%M:%S")

#make data frame with extended time column
> plot2 <- data.frame(cbind(test, plot1)


#Open png file; set pixel dimensions; plot histogram; close device to save.
> png(file = "plot2.png", width = 480, height = 480)
> plot(plot2$test, plot2$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
> dev.off()

