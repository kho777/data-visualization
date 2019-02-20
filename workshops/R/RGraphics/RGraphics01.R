## Introduction to R Graphics sample program 1
## file: RGraphics01.R
## Adapted from Paul Murrell. 2018. R Graphics, second edition. CRC Press
## Use sample dataset from datasets package
## Start from simple plotting
## Examples adapted from Paul Murrell *R Graphics*

plot(pressure)
text(150, 600, 
     "Pressure (mm Hg)\nversus\nTemperature (Celsius)")

## Create x, y1 and y2 for plotting

x <- c(0.5, 2, 4, 8, 12, 16)
y1 <- c(1, 1.3, 1.9, 3.4, 3.9, 4.8)
y2 <- c(4, .8, .5, .45, .4, .3)


## Set up new plot window
plot.new()

## Specify plot size

plot.window(range(x), c(0,6))

## Simple lines
## Note adding lines and points on one another

lines(x, y1)
lines(x, y2)
points(x, y1, pch=16, cex=2)
points(x, y2, pch=21, bg="white", cex=2)

## Then axes
## Note the clockwise order start from 

axis(1, at=seq(0, 16, 4))
axis(2, at=seq(0, 6, 2))
axis(4, at=seq(0, 6, 2))


## Add text
## The bty setting controls the type of box that the box() function draws. 
## The value can be "n", which means that no box is drawn, 
## or it can be one of "o", "l", "7", "c", "u", or "]"
## "u" 

box(bty="u") ## Try different bty values to redraw the chart

mtext("Travel Time (s)", side=1, line=2, cex=0.8,family="Palatino") ## Try specifying font at every text statements
mtext("Responses per Travel", side=2, line=2, las=0, cex=0.8)
mtext("Responses per Second", side=4, line=2, las=0, cex=0.8)
text(4, 5, "Bird 131")

## Histogram

# Random data
Y <- rnorm(50)
# Make sure no Y exceed [-3.5, 3.5]
Y[Y < -3.5 | Y > 3.5] <- NA
x <- seq(-3.5, 3.5, .1). # What is x?
dn <- dnorm(x) # What is dnorm?
hist(Y, breaks=seq(-3.5, 3.5), ylim=c(0, 0.5), 
     col="gray80", freq=FALSE)
lines(x, dnorm(x), lwd=2)



## Boxplot

boxplot(len ~ dose, data = ToothGrowth,
        boxwex = 0.25, at = 1:3 - 0.2,
        subset= supp == "VC", col="white",
        xlab="",
        ylab="tooth length", ylim=c(0,35))
mtext("Vitamin C dose (mg)", side=1, line=2.5, cex=0.8)
boxplot(len ~ dose, data = ToothGrowth, add = TRUE,
        boxwex = 0.25, at = 1:3 + 0.2,
        
        subset= supp == "OJ")
legend(1.5, 9, c("Ascorbic acid", "Orange juice"), 
       fill = c("white", "gray"), 
       bty="n")



## Pie chart

pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
     names(pie.sales) <- c("Blueberry", "Cherry",
         "Apple", "Boston Cream", "Other", "Vanilla")
     pie(pie.sales, col = gray(seq(0.3,1.0,length=6))) 
