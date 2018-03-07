# Using leaflet and ESRI map library to create web map
# Package: ggmap, leaflet
# Geocode: Google Maps
preload("ggmap")
preload("leaflet")
geocode("School of Economic, Political and Policy Sciences")
eppsgeo=geocode("School of Economic, Political and Policy Sciences")
l <- leaflet() %>% setView(eppsgeo$lon, eppsgeo$lat, zoom=14)

esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  l <- l %>% addProviderTiles(provider, group = provider)
}


findmeat <- paste(sep = "<br/>",
                 "<b><a href='http://epps.utdallas.edu' target='_blank'>School of Economic, </a></b>",
                 "<b><a href='http://epps.utdallas.edu' target='_blank'>Political and Policy Sciences</a></b>",
                 "<b><a href='http://www.utdallas.edu' target='_blank'>University of Texsa at Dallas</a></b>",
                 "800 West Campbell Road, GR31",
                 "Richardson TX 75080"
)

l %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = TRUE)) %>%
  # addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
  #           position = "bottomleft") %>%
  addMarkers(l, lng=-96.7478284, lat=32.9887987, popup=findmeat)  %>%
  #  addMarkers(l, lng=eppsgeo$lon, lat=eppsgeo$lat, popup="School of Economic, Political and Policy Sciences, University of Texas at Dallas")  %>%
  addMarkers(l, lng=114.15769, lat=22.28552, popup="Hong Kong")  %>%
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })
                        }")