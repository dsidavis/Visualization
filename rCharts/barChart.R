library(rCharts)
print(load("../shinyHousePrices/housing.rda"))

housingFrequencies = table(housing$county, housing$br)
d = data.frame( county = rep(rownames(housingFrequencies), ncol(housingFrequencies)),
                bedroom = factor(as.character( rep(colnames(housingFrequencies), each = nrow(housingFrequencies)))),
                counts = as.integer(housingFrequencies))

p <- nPlot(counts ~ county, group = "bedroom", data = d, type = "multiBarChart")
print(p)
p$print("chart3")

save(housingFrequencies, file = "../SVGAnnotation/housingFrequencies.rda")
# What about an alternative representation
#  dotplot/matplot in SVGAnnotation/housing.R



