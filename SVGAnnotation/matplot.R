library(SVGAnnotation)
library(XML)

load("housingFrequencies.rda")

labels = rownames(housingFrequencies)

doc = xmlParse("housingMatplot.svg")

highlightMatplot(doc, NULL, 8)

series = getMatplotSeries(doc)

invisible(mapply(addToolTips,
                 series, sprintf("%s %d", labels, rowSums(housingFrequencies)),
                MoreArgs = list(addArea = FALSE)))

#XXX Not quite working. Doesn't recognize C and groups it with B.
if(FALSE) {
radioShowHide(doc, labels = labels, within = NA)
# Should be hidden.
invisible(mapply(function(node, id)
                addAttributes(node, id = id), series, sprintf("series%d", seq(along = series))))
}
saveXML(doc, "live_matplot.svg")

