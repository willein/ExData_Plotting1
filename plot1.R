#Read table

power <- read.table("household_power_consumption/household_power_consumption.txt", sep = ";", h=T)

#Change file

datetime <- paste(power$Date, power$Time)
datetime <- as.Date(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
power <- cbind(datetime, power[,-(1:2)])


#Subset and change

power <- subset(power, datetime >= as.Date("2007-02-01") & datetime <= as.Date("2007-02-02"))
power$Global_active_power = as.numeric(as.character(power$Global_active_power))

#Create graph

png("plot1.png", width = 480, height = 480)1
hist(power$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.off()
