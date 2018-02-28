# Load multiple packages
# Install easypackages
# Load packages to be used with one line libraries("package1", "package2")
#
# Alternative: 
# mypackages=c("egg","grid","gtable","gridExtra","ggplot2")
# libraries(mypackages)

install.packages("easypackages")
library(easypackages)
libraries("egg","grid","gtable","gridExtra","ggplot2")

p1 <- qplot(mpg, wt, data = mtcars, colour = cyl) +ggtitle("heat dotplot")
p2 <- qplot(mpg, data = mtcars) + ggtitle("barplot")
p3 <- qplot(mpg, data = mtcars, geom = "factor dotplot")
p4 <-
  p1 + facet_wrap( ~ carb, nrow = 1) + theme(legend.position = "none") +
  ggtitle("facetted plot")


grid.arrange(p1, p2, nrow = 1)


g2 <- ggplotGrob(p2)
g3 <- ggplotGrob(p3)
g <- rbind(g2, g3, size = "first")
g$widths <- unit.pmax(g2$widths, g3$widths)
grid.newpage()
grid.draw(g)
q1 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point() + ggtitle("factor dotplot") + theme(legend.position="bottom")
q2 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point() + facet_wrap(~ cyl, ncol = 2, scales = "free") +
  guides(colour = "none") +
  theme()

ggarrange(q1, q2, widths = 1:2)
grid.arrange(
  p1,
  p2,
  q1,
  nrow = 1,
  top = textGrob("Different chart types", gp=gpar(fontface="bold")),
  bottom = textGrob(
    "Adapted from Baptiste Auguie 2017",
    gp = gpar(fontface = 3, fontsize = 9),
    hjust = 1,
    x = 1
  )
)
