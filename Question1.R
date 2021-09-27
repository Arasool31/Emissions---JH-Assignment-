## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at data

print(head(NEI))

## Summing up data for Emissions per year

aggdata <- aggregate(Emissions ~ year , data = NEI, FUN = sum)


png("plot1.png",width=480,height=480,units="px",bg="transparent")


barplot(
  aggdata$Emissions, 
  names.arg = aggdata$year,
  col = "blue",
  xlab = "Year",
  ylab = "PM2.5 Emissions",
  main = "Total PM2.5 Emissions for All US Sources"
)

dev.off()