# This code generates 4 plots in a figure
# 2007-02-01 and 2007-02-02. The result is stored in plot4.png

#get all data
data<-read.table("household_power_consumption.txt",
                 header=T,
                 sep=";",
                 na.strings="?",
                 stringsAsFactors=F)

#get necessary subset
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


#create new column that has date and time format together in adequate date format
data$DateTime<-paste(data$Date,data$Time) #new column
#transform to time
data$DateTime<-strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")

  
#save and do plot
png("plot4.png") #open device png default size is what we need

par(mfrow = c(2, 2))
with(data, {
  plot(DateTime, Global_active_power, 
       main = "",
       xlab="",
       ylab="Global Active Power",
       type="l")
  
  plot(DateTime, Voltage, 
       main = "",
       xlab="datetime",
       type="l")
  
  plot(data$DateTime,data[,7], 
       main="",
       xlab="",
       ylab="Energy sub metering",
       type="l",
       col="black")
  lines(data$DateTime,data[,8],col="red")
  lines(data$DateTime,data[,9],col="blue")
  legend("topright", 
         col = c("black","red", "blue"),
         legend = names(data[7:9]),
         lty=1,
         border="white")
  
  plot(DateTime,Global_reactive_power, 
       main = "",
       xlab="datetime",
       type="l")
})

dev.off() #close device png
