library(googleVis)

load("ldf.rda")

# Documentation:
#  https://developers.google.com/chart/interactive/docs/gallery/annotationchart

#obj = gvisAnnotationChart(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px", gvis.listener.jscode = c(rangechange = "alert('got event');")))


obj = gvisAnnotationChart(ldf, "Date", "price", "company",
                           options = list(width = 1000 , height = 600,
                                          gvis.listener.jscode = c(rangechange = "function(ev) { alert('got event: ' +  ev['start'] +  ' ' + event['end']); return(true);}")))
print(obj, file = "eg1.html")

plot(obj)

# In the event
# call getVisibleChartRange() on the chart object to get the start and end or get it from the event itself.

