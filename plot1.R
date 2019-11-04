plot1<-function() {
  
  data <- read.table('./household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE)
  feb2007<-subset(data,data$Date=='1/2/2007' | data$Date=='2/2/2007') 
  png('./plot1.png')
  hist(as.numeric(feb2007$Global_active_power), col='red', xaxt='n',breaks=11,main='Global Active Power',xlab='Global Active Power')
  axis(1, at=seq(0,6, by=2))
  dev.off()
}