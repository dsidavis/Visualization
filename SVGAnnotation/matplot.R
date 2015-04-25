library(SVGAnnotation)
library(XML)

load("housingFrequencies.rda")

labels = rownames(housingFrequencies)

doc = xmlParse("housingMatplot.svg")

highlightMatplot(doc, NULL, 8, ids = paste0("series", seq(along = labels)))

series = getMatplotSeries(doc)

invisible(mapply(addToolTips,
                 series, sprintf("%s %d", labels, rowSums(housingFrequencies)),
                MoreArgs = list(addArea = FALSE)))

#XXX Not quite working. Doesn't recognize C and groups it with B.
if(TRUE) {
 radioShowHide(doc, labels = labels, within = NA, checkboxCallback = "toggle")
     # Should be hidden.
if(FALSE) 
 invisible(mapply(function(node, id)
                addAttributes(node, id = id), series, sprintf("series%d", seq(along = series))))
}

saveXML(doc, "live_matplot.svg")

