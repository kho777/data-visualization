install.packages("gapminder", repos = "https://cran.r-project.org")
library(gapminder)
summary(gapminder) # Summary of Gapminder dataset
str(gapminder) # Structure of dataset

gm=gapminder
head(gm)
summary(gm)
table(gm$country) # List values of country variable 


# Plot one variable 
hist(gm$lifeExp) # Histogram of variable lifeExp (Life expectancy)

# Plot two variables with logged version of x
plot(lifeExp ~ gdpPercap, gm, subset = year == 2007, log = "x", pch=16)
# Plot two variables with selected country
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "p")
# Try different plot types 
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "l")
# Different symbols
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "b", pch=18) 
# Add labels to axes
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "b", pch=18, xlab="Year", ylab="Life Expectancy") 
# Specify font
plot(lifeExp ~ year, gm, subset = country == "Cambodia", type = "b", pch=18, xlab="Year", ylab="Life Expectancy",family="Palatino") 

# More layered plots using ggplot2, with regression line
install.packages("ggplot2", repos ="https://cran.r-project.org")
library(ggplot2)
p <- ggplot(data = gm) 
p + geom_point(size=2) # What is the problem?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))  # Shows nothing. Why?
p + geom_point()
# Alternative
p <- ggplot(data=gm, aes(x=gdpPercap, y=lifeExp))
p + geom_point()
# Add some color grouping
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp, color=continent))
p + geom_point()

p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp, color=continent))
p + geom_point(pch=6)
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="lm") 
## geom_smooth methods:
# "auto", "lm", "glm", "gam", "loess" 
# Add a  line, dropped the color grouping, try other method
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="loess") 
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(pch=16) + geom_smooth(method="lm") + 
  scale_x_log10()
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "purple"))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10() # Why it is not purple?
#  How about now?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10()
# Add theme
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "purple", pch=20) +
  theme_bw() +
  geom_smooth(method = "loess") + scale_x_log10()

# Add title
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  theme_bw() + 
  ggtitle("Life Expectacy and GDP Per Capita (logged)") 

# Add title, labels and caption (located at bottom)
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  theme_bw() +
  labs(title="Life Expectacy and GDP Per Capita (logged)", 
       x="GDP Per Capita",y="Life Expectancy",caption="") 


# Why the title is not centered?
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  theme_bw() +
  labs(title="Life Expectacy and GDP Per Capita (logged)", 
       x="GDP Per Capita",y="Life Expectancy") + 
  theme(plot.title = element_text(hjust = 0.5))

# Set font
p <- ggplot(data = gm,
            mapping = aes(x = gdpPercap,
                          y = lifeExp)) 
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") + scale_x_log10() +
  theme_bw() +
  labs(title="Life Expectacy and GDP Per Capita (logged)", 
       x="GDP Per Capita",y="Life Expectancy") + 
  theme(plot.title = element_text(hjust = 0.5),
        text=element_text(size=16,family="Palatino"))
