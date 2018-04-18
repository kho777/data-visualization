# Create animated charts in R
# Packages: ggplot2, gganimate(dev)

# if (!require(devtools)) {
#  install.packages("devtools")
# }
# devtools::install_github("thomasp85/tweenr")
if (!require(devtools)) {
 install.packages("devtools")
}
devtools::install_github("dgrtwo/gganimate")
install.packages("animation")
install.packages("magick")
library(magick)
library(ggplot2)
library(animation)

devtools::install_github("dgrtwo/gganimate")
library(gganimate)

# Example: gapminder

# Gapminder data to create multivariate charts animated by year

img <- image_graph(res = 96)
datalist <- split(gapminder, gapminder$year)
out <- lapply(datalist, function(data){
  p <- ggplot(data, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
    scale_size("population", limits = range(gapminder$pop)) +
    scale_x_log10(limits = range(gapminder$gdpPercap)) +
    geom_point() + ylim(20, 90) + ggtitle(data$year) + theme_classic()
  print(p)
})
dev.off()
animation <- image_animate(img, fps = 2)
image_write(animation, "animation0.gif")



# Use World Happiness Report data
# http://worldhappiness.report/ed/2018/

# Import data from Github
preload("readxl")
url <- "https://github.com/kho777/data-visualization/blob/master/data/WHR2018Dataonly.xls?raw=true"
destfile <- "WHR2018Dataonly.xls"
curl::curl_download(url, destfile)
WHR=read_excel(destfile)



img1 <- image_graph(res = 96)
datalist <- split(WHR, WHR$year)
out <- lapply(datalist, function(data){
  p <- ggplot(data, aes(Healthy_life_expectancy_at_birth, Democratic_Quality, size = Log_GDP_per_capita, color = Region)) +
    scale_size("GDPPC", limits = range(WHR$Log_GDP_per_capita)) +
    scale_x_log10() +
    geom_point() + ggtitle(data$year) + theme_classic()+
    scale_color_brewer(palette = "Spectral")
  print(p)
})
dev.off()
animation <- image_animate(img1, fps = 2)
image_write(animation, "animation1.gif")


