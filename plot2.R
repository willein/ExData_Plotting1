#Read table

power <- read.table("household_power_consumption/household_power_consumption.txt", sep = ";", h=T)

#Change file

datetime <- paste(power$Date, power$Time)
datetime <-as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
power <- cbind(datetime, power[,-(1:2)])
power <- subset(power, datetime >= as.POSIXct("2007-02-01 00:00:00 PST") & datetime <= as.POSIXct("2007-02-02 23:59:59 PST"))
power$Global_active_power = as.numeric(as.character(power$Global_active_power))



#Plotting

png("plot2.png", width = 480, height = 480)
plot(power$Global_active_power ~ power$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
