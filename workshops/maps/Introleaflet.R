## R Leaflet sample program 
## file: Introleaflet.R
## Create an interactive map for web using ESRI Leaflet
## 
# Package:  leaflet, htmlwidgets, tidyverse

install.packages("htmlwidgets")
install.packages("leaflet")
install.packages("tidyverse")
library(htmlwidgets)
library(leaflet)
library(tidyverse)

# Get EPPS geocode information (i.e. lon, lat) from online geocoder websites.
# For example: https://www.mapdevelopers.com/geocode_tool.php

# Create object using leaflet setting the view at EPPS geo location)
eppsmap <- leaflet() %>% setView(-96.7478372, 32.9886268, zoom=14)

# Create object to acquire map data from ESRI
esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  eppsmap <- eppsmap %>% addProviderTiles(provider, group = provider)
}

findmeat <- paste(sep = "<br/>",
                  "<b><a href='http://karl-ho.github.io' target='_blank'>Karl Ho </a></b>",
                  "<b><a href='http://epps.utdallas.edu' target='_blank'>School of Economic, </a></b>",
                  "<b><a href='http://epps.utdallas.edu' target='_blank'>Political and Policy Sciences</a></b>",
                  "<b><a href='http://www.utdallas.edu' target='_blank'>University of Texsa at Dallas</a></b>",
                  "800 West Campbell Road, GR31",
                  "Richardson TX 75080"
)

# Use htmlwidget::onRender function to  add custom behavior to the leaflet map using native Javascript.

eppsmap %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = TRUE)) %>%
  # addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
  #           position = "bottomleft") %>%
  addMarkers(eppsmap, lng=-96.7478372, lat=32.9886268, popup=findmeat)  %>%
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })
                        }")
