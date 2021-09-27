## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at data

print(head(NEI))


##subset Baltimore city data

baltimoreNEI <- NEI[NEI$fips == "24510", ]


## Summing up data for Emissions per year

aggdatabaltimore <- aggregate(Emissions ~ year , data = baltimoreNEI, FUN = sum)


png("plot2.png",width=480,height=480,units="px",bg="transparent")


barplot(
  aggdatabaltimore$Emissions, 
  names.arg = aggdatabaltimore$year,
  col = "blue",
  xlab = "Year",
  ylab = "PM2.5 Emissions",
  main = "Total PM2.5 Emissions for All US Sources"
)

dev.off()