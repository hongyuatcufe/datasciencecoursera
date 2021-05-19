library(data.table)
library(lubridate)

dataset<-fread('dataset.csv')
dataset$datetime<-ymd_hms(paste(dataset$Date,dataset$Time))

png('Plot2.png',width = 480, height = 480, units='px')
plot(dataset$datetime,dataset$Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power (kilowatt)')
dev.off()
