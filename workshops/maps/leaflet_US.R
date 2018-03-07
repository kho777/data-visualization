# Use the maps and leaflet packages to create color maps
# Package: maps - draw geographical maps
# Package: leaflet - Javascript Leaflet library for creating interactive map for web

preload("maps")
preload("leaflet")
mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)
