library(data.table)
library(lubridate)

dataset<-fread('dataset.csv')
### Plot1
png('Plot1.png',width = 480, height = 480, units='px')
with(dataset,
     hist(Global_active_power,
          col='red',
          main='Global Active Power',
          xlab='Global Active Power (kilowatts)',
          ylab='Frequency'))

dev.off()