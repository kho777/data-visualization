# R Programming Workshop
# Library: ggplot2
# Boxplot

install.packages("gdata")
require(gdata)
hpi2016=read.csv("https://raw.githubusercontent.com/kho777/data-visualization/master/data/hpi2016dataonly.csv")

library(ggplot2)
theme_set(theme_classic())

# BoxPlot
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(varwidth=T, fill="plum") + 
  labs(title="Box plot", 
       subtitle="Happy Planet Index by Region, 2016",
       caption="Source: HPI",
       x="HPI",
       y="Region")

# Vertical X labels
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(varwidth=T, fill="plum") +
  theme(axis.text.x = element_text(angle=90, vjust=0.6,size=12)) +
  labs(title="Box plot", 
       subtitle="Happy Planet Index by Region, 2016",
       caption="Source: HPI",
       x="HPI",
       y="Region")

# Replace space in X labels with "\n"
levels(hpi2016$Region) <- gsub(" ", "\n", levels(hpi2016$Region))
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(varwidth=T, fill="plum") + 
  labs(title="Box plot", 
       subtitle="Happy Planet Index by Region, 2016",
       caption="Source: HPI",
       x="HPI",
       y="Region")

# Multiple colors, defining Region as factor
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(aes(fill=factor(Region))) + 
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")

# Drop the legend
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(aes(fill=factor(Region))) + 
 theme(legend.position="none")+
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")


# Title larger
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(aes(fill=factor(Region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")


# Title larger, centered
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(aes(fill=factor(Region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")

# Hi res=600
tiff('boxplot7res600.tiff', units="in", width=6, height=5, res=600, compression = 'lzw')
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(aes(fill=factor(Region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")
dev.off()

# Hi res=300
tiff('boxplot7res300.tiff', units="in", width=6, height=5, res=300, compression = 'lzw')
g <- ggplot(hpi2016, aes(Region, Happy.Planet.Index))
g + geom_boxplot(aes(fill=factor(Region))) + 
  theme(legend.position="none") +
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="HPI")
dev.off()


# Barchart with categories
# Simple counts
g <- ggplot(hpi2016, aes(Region))
g + geom_bar(aes(fill=Happy.Planet.Index), width = 0.5) + 
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="count")

# Barchart with categories
# Factor
g <- ggplot(hpi2016, aes(Region))
g + geom_bar(aes(fill=factor(Happy.Planet.Index)), width = 0.5) + 
  theme(plot.title = element_text(size=22,hjust = 0.5)) +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="count")

# Barchart with categories
# Factor with 10 categories
# Turn Happy.Planet.Index into 10-categories
# Repositioning legend
fhpi=cut(hpi2016$Happy.Planet.Index,c(10,20,30,40,50,60,70,80,90,100))
g <- ggplot(hpi2016, aes(Region))
g + geom_bar(aes(fill=sort(fhpi,decreasing=F)), width = 0.5) + 
  theme(plot.title = element_text(size=22,hjust = 0.5),legend.position="bottom") +
  labs(title="Happy Planet Index by Region, 2016", 
       subtitle="",
       caption="Source: HPI",
       x="Region",
       y="count",
       fill="Happy Planet Index")
  
