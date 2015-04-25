library(rCharts)


load("../shinyHousePrices/housing.rda")

map <- Leaflet$new()
map$setView(c(37.8717, -122.27), zoom = 8)
countyCoords =
    list(Sonoma = c(38.288, -122.4589),
         Napa = c(38.3047, -122.2989),
         Alameda = c(37.7561, -122.2744),
         "Contra Costa" = c(37.9300, -121.9500),
         "San Mateo" = c(37.5542, -122.3131),
         "Marin" = c(38.0400, -122.7400),
         "San Francisco" = c(37.7833, -122.4167),
         Solano = c(38.270, -121.9400),
         "Santa Clara" = c(37.3600, -121.9700))

invisible(mapply(function(id, coords, pricePerSqft)
                   map$marker(coords, bindPopup = sprintf("<p>%s: price/square foott = %d</p>", id, pricePerSqft)),
                 names(countyCoords), countyCoords,
                 as.integer(by(housing, housing$county, function(d) median(d$price/d$bsqft, na.rm = TRUE)))))

#map$print("chart7") # for generate the file
print(map)   # need to explicitly print it in case we source() this file.
