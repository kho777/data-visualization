/* Introduction to Stata Graphics  */
/* file: StataGraphics01.do */
/* Adapted from Ben Jann. 2018. Customizing Stata graphs made easy part 1 & 2. Stata Journal. 2018. 18:3, 18:4  */
/* Use Happy Planet Index Data from https://happyplanetindex.org */
/* Course: Data Visualization, 2019 Spring


/* Set Github repository to fetch data from the web */

webuse set "https://raw.githubusercontent.com/kho777/data-visualization/master/data"
webuse "hpi2016dataonly"

/* Create a linearized GDP per Capita */
gen lgdp=log(GDPcapitaPPP)

/* Create multiple variables for plots of Happy Planet Index using Region */
/* Note the label statements to clean and shorten the variable labels for legend */
separate HappyPlanetIndex, by(Region) shortlabel

lab var HappyPlanetIndex1 "Americas"
lab var HappyPlanetIndex2 "Asia Pacific"
lab var HappyPlanetIndex3 "Europe"
lab var HappyPlanetIndex4 "Middle East and North Africa"
lab var HappyPlanetIndex5 "Post-communist"
lab var HappyPlanetIndex6 "Sub Saharan Africa"


set scheme s2color
scatter HappyPlanetIndex? lgdp
scatter HappyPlanetIndex? lgdp, scheme(plotplain)
scatter HappyPlanetIndex? lgdp, scheme(burd)
scatter HappyPlanetIndex? lgdp, scheme(burd7)

/* Export graph to different file formats (default is Stata graph format .gph) */
/* Vector 
/* graph export "filename.svg", as(svg) */

