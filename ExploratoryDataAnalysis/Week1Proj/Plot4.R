library(data.table)
library(lubridate)

dataset<-fread('dataset.csv')
dataset$datetime<-ymd_hms(paste(dataset$Date,dataset$Time))

png('Plot4.png',width = 480, height = 480, units='px')

par(mfrow=c(2,2))
# top left plot
plot(dataset$datetime,dataset$Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power')

# top right plot
plot(dataset$datetime,dataset$Voltage,
     type='l',
     xlab='datetime',
     ylab='Voltage')

# bottom left plot
plot(dataset$datetime,dataset$Sub_metering_1,
     type='n',
     xlab='',
     ylab='Energy sub metering')
lines(dataset$datetime,dataset$Sub_metering_1,col='black')
lines(dataset$datetime,dataset$Sub_metering_2,col='red')
lines(dataset$datetime,dataset$Sub_metering_3,col='blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

# bottom right plot
plot(dataset$datetime,dataset$Global_reactive_power,
     type='l',
     xlab='datetime',
     ylab='Global_reactive_power')

dev.off()