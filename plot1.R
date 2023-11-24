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

#Open png file; set pixel dimensions; plot histogram; close device to save.
> png(file = "plot1.png", width = 480, height = 480)
> hist(plot1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
> dev.off()

