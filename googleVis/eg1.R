library(googleVis)

load("ldf.rda")

# Documentation:
#  https://developers.google.com/chart/interactive/docs/gallery/annotationchart

#obj = gvisAnnotationChart(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px", gvis.listener.jscode = c(rangechange = "alert('got event');")))


obj = gvisAnnotationChart(ldf, "Date", "price", "company",
                           options = list(width = 1000 , height = 600,
                                          gvis.listener.jscode = c(rangechange = "function(ev) { alert('got event: ' +  ev); }")))
print(obj, file = "eg1.html")


