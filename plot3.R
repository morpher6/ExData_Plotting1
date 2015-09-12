# load data from txt file (this takes a while)
if( !exists("powercon_df") )
  powercon_df <- read.csv(file="data/household_power_consumption.txt", header = TRUE, sep = ";", dec=".", stringsAsFactors=FALSE,na.strings=c("NA","NaN", " ","?"), colClasses = c("character","character",rep("numeric",7)))

# create subset as we only need data from 2007-02-01 to 2007-02-02
powercon_subset_df <- powercon_df[powercon_df$Date %in% c("1/2/2007","2/2/2007") ,]

# my default LC_TIME is Slovenian 
# change to English to get perfect output :)
Sys.setlocale("LC_TIME", "English")

# convert first two columns (Date and Time)
datetime <- strptime(paste(powercon_subset_df$Date, powercon_subset_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

# create plot
par(mar = c(5,5,3,3))
plot(datetime,powercon_subset_df$Sub_metering_1, cex.lab=0.75, cex.axis=0.75, type="l",xlab="", ylab="Energy Sub Metering")
lines(datetime,powercon_subset_df$Sub_metering_2,col="red")
lines(datetime,powercon_subset_df$Sub_metering_3,col="blue")
legend("topright", lwd=0.5,  cex=0.7, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close png device
dev.off()