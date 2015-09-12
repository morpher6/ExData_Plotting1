# load data from txt file (this takes a while)
if( !exists("powercon_df") )
  powercon_df <- read.csv(file="data/household_power_consumption.txt", header = TRUE, sep = ";", dec=".", stringsAsFactors=FALSE,na.strings=c("NA","NaN", " ","?"), colClasses = c("character","character",rep("numeric",7)))

# create subset as we only need data from 2007-02-01 to 2007-02-02
powercon_subset_df <- powercon_df[powercon_df$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)

# create histogram
hist(powercon_subset_df$Global_active_power, cex.lab=0.75, cex.axis=0.75, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# close png device
dev.off()