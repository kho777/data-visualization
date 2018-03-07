# Using leaflet and ESRI map library to create web map
# Package: ggmap, leaflet
# Geocode: Google Maps
preload("ggmap")
preload("leaflet")
geocode("School of Economic, Political and Policy Sciences")
eppsgeo=geocode("School of Economic, Political and Policy Sciences")
eppsmap <- leaflet() %>% setView(eppsgeo$lon, eppsgeo$lat, zoom=14)

esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  eppsmap <- eppsmap %>% addProviderTiles(provider, group = provider)
}


findmeat <- paste(sep = "<br/>",
                 "<b><a href='http://epps.utdallas.edu' target='_blank'>School of Economic, </a></b>",
                 "<b><a href='http://epps.utdallas.edu' target='_blank'>Political and Policy Sciences</a></b>",
                 "<b><a href='http://www.utdallas.edu' target='_blank'>University of Texsa at Dallas</a></b>",
                 "800 West Campbell Road, GR31",
                 "Richardson TX 75080"
)

eppsmap %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = TRUE)) %>%
  # addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
  #           position = "bottomleft") %>%
  addMarkers(eppsmap, lng=-eppsgeo$lon, lat=eppsgeo$lat, popup=findmeat)  %>%
  #  addMarkers(eppsmap, lng=eppsgeo$lon, lat=eppsgeo$lat, popup="School of Economic, Political and Policy Sciences, University of Texas at Dallas")  %>%
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })
                        }")