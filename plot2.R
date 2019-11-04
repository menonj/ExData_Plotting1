plot2 <- function () {
  data <- read.table('./household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE)
  feb2007<-subset(data,data$Date=='1/2/2007' | data$Date=='2/2/2007') 
  png('./plot2.png')
  stamps<-strptime(paste(feb2007$Date,feb2007$Time),format='%d/%m/%Y %H:%M:%S')
  feb20072<-cbind(feb2007,stamps)
  plot(feb20072$Global_active_power ~ feb20072$stamps, type='l',ylab='Global Active Power (kilowatts)',xlab='')
  dev.off()
}