library(googleVis)
# Same as eg1.R but show the annotations.
load("ldf.rda")

# Documentation:
#  https://developers.google.com/chart/interactive/docs/gallery/annotationchart

#obj = gvisAnnotationChart(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px", gvis.listener.jscode = c(rangechange = "alert('got event');")))

source("getMSEvents.R")

# We had width = "1000px".  This caused the plot to be very narrow.
# The debugging tools in the browser identified this problem as unparseable.
obj = gvisAnnotatedTimeLine(ldf, "Date", "price", "company",  annotationvar = "ann", 
                             options = list(width = 1000 , height = 600, displayAnnotations = TRUE, annotationsWidth = 15))

#print(obj, file = "eg2.html")

plot(obj)


