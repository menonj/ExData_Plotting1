plot4 <- function() {
  data <- read.table('./household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE)
  feb2007<-subset(data,data$Date=='1/2/2007' | data$Date=='2/2/2007') 
  png('./plot4.png')
  stamps<-strptime(paste(feb2007$Date,feb2007$Time),format='%d/%m/%Y %H:%M:%S')
  feb20072<-cbind(feb2007,stamps)
  par(mfrow=c(2,2))
  plot(feb20072$Global_active_power ~ feb20072$stamps, type='l',ylab='Global Active Power',xlab='')
  plot(feb20072$Voltage ~ feb20072$stamps, type='l',ylab='Voltage',xlab='datetime')
  plot(feb20072$Sub_metering_1 ~ feb20072$stamps, type='l',ylab='Energy sub metering',xlab='')
  lines(feb2007$Sub_metering_2 ~ feb20072$stamps, col='red') 
  lines(feb2007$Sub_metering_3 ~ feb20072$stamps, col='blue')
  legend('topright',legend = c('Sub_metering1','Sub_metering2','Sub_metering3'),col=c('black','red','blue'),lty=1:1:1)
  plot(feb20072$Global_reactive_power ~ feb20072$stamps, type='l',ylab='Global_reactive_power',xlab='datetime')
  dev.off()
}