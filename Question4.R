## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Looking at data

print(head(NEI))

##subset coal and combustion data

Combustion <- grepl(pattern = "combust", x = SCC$SCC.Level.One, ignore.case=TRUE)
Coal <- grepl(pattern = "coal", x = SCC$SCC.Level.Four, ignore.case=TRUE) 
combustioncoal <- (Combustion & Coal)
combustionSCC <- SCC[combustioncoal,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

## Creating the plot

png(filename = "plot4.png",width = 480, height = 480,units = "px",)

library(ggplot2)

g <- ggplot(data = combustionNEI, aes(factor(year), Emissions/10^5)) +
  geom_bar(stat = "identity",fill = "blue", width = 0.75) +
  theme_grey(base_size = 14,base_family = "") +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions - US 1999-2008"))

print(g)

dev.off()