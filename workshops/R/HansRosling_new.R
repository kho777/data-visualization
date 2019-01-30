my_packages <- c("tidyverse", "png","gifski", "gapminder", "ggplot2","gganimate")
install.packages(my_packages, repos = "http://cran.rstudio.com")
library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)
library(png)

data("gapminder")
# Basic scatter plot object

mapping <- aes(x =gdpPercap, y = lifeExp, 
               size = pop, color = continent,
               frame = year) 

# Note: manual color choices.

ggplot(gapminder, mapping = mapping) +
  geom_point() +
  theme_linedraw() + 
  scale_x_log10()+
  scale_color_manual(values=c("purple","green","red","light blue","cyan"))+
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  geom_text(aes(label=ifelse((gapminder$country == "China"), "China", ifelse(gapminder$country=="United States", "United States", ""))),vjust=0,nudge_y = 1,size=6) +
  transition_time(year) +
  ease_aes('linear')

## Exercise
# 1. Check the variables in gapminder
# 2. Change the variable gdpPercap to size and pop to x
