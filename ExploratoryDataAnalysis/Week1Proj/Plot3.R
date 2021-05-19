library(data.table)
library(lubridate)

dataset<-fread('dataset.csv')
dataset$datetime<-ymd_hms(paste(dataset$Date,dataset$Time))

png('Plot3.png',width = 480, height = 480, units='px')

plot(dataset$datetime,dataset$Sub_metering_1,
     type='n',
     xlab='',
     ylab='Energy sub metering')
lines(dataset$datetime,dataset$Sub_metering_1,col='black')
lines(dataset$datetime,dataset$Sub_metering_2,col='red')
lines(dataset$datetime,dataset$Sub_metering_3,col='blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

dev.off()