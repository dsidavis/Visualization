library(XML)
library(SVGAnnotation)

doc = xmlParse("scatterPlot.svg")
addToolTips(doc, LETTERS[1:10])
saveXML(doc, "live_scatterplot.svg")

