## Introduction to R sample program 1
## file: introR01.R
## Adapted from Venables, W.N., Smith, D.M. and Team, R.C., 2018. An Introduction to R, Version 3.5.1 (2018-07-02)

# Generate two pseudo-random normal vectors of x- and y-coordinates.
# Note that the assignment operator "<-" and "=".  The former is the old operator 
# and considered more general and backward compatible. The latter is more friendly to 
# new users from  other statistical programs (e.g. SPSS, Stata)
#
# rnorm() is a function to generate normally distributed random numbers. The argument 
# within the () indicates number of observations.

x <-rnorm(50) 
y = rnorm(x)

# Plot the points in the plane 

plot(x, y)

# Plot better, using the ggplot2 package 

install.packages("ggplot2")
library(ggplot2)
qplot(x,y)

# Plot better better with ggplot2

ggplot(,aes(x,y)) +theme_bw()+geom_point()

# Check on R objects in the R workspace

ls()

# Remove objects

rm(x, y)
