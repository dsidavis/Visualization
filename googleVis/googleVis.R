library("googleVis")

# http://finance.yahoo.com/q/hp?s=GOOG+Historical+Prices
data = lapply(c(google = "google.csv", yahoo = "yahoo.csv", microsoft = "microsoft.csv"), read.csv, stringsAsFactors = FALSE)

data = lapply(data, function(x) { x$Date = as.Date(x$Date, "%Y-%m-%d"); x})

#max(sapply(data, function(x) min(x$Date)))
n = max(sapply(data, nrow))
close = lapply(data, function(d, n) c( d$Close, rep(NA, n - nrow(d))), n)

df = as.data.frame(close)
df$Date = data[[ which.max(sapply(data, nrow)) ]] $Date
df = as.data.frame(df)[, c(4, 1:3)] 
plot( gvisLineChart(df) )



#
ldf = data.frame(Date = rep(df$Date, 3),
                 price = unlist(df[, c("microsoft", "google", "yahoo")]),
                 company = rep(c("microsoft", "google", "yahoo"), each = nrow(df)))

plot( gvisAnnotatedTimeLine(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px")))


obj = gvisAnnotatedTimeLine(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px", gvis.listener.jscode = "alert('got event');"))
plot(obj)

print(obj, file = "eg.html")


obj = gvisAnnotationChart(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px", gvis.listener.jscode = c(rangechange = "alert('got event');")))
print(obj, file = "eg.html")


# Many available options.
# https://developers.google.com/chart/interactive/docs/gallery/annotatedtimeline#Configuration_Options

# How do we set the dimensions?
plot( gvisAnnotatedTimeLine(ldf, "Date", "price", "company", options = list(width = "1000px" , height = "600px")))

#   known dates with events
# Annotation variable
#  annotationvar
#   has to be a column in the data frame - to match the dates.
# So we give the name of the variable, not the annotations themselves.
#

plot( gvisAnnotatedTimeLine(ldf, "Date", "price", "company", annotationvar = "ann",  options = list(width = "1000px" , height = "600px", displayAnnotations = TRUE)))
#XXX Issue with size of the display now.

#
#   add general JS events
jscode <- "window.open('http://en.wikipedia.org/wiki/'
                  + data.getValue(chart.getSelection()[0].row,0)); "
#gvis.listener.jscode=jscode
options=list(gvis.listener.jscode = jscode)
plot(obj)


################
if(FALSE) {
 library(googleVis)
 demo(WorldBank)
}


###################
if(FALSE) {
fargo <- read.csv("fargoTemps2014.csv", colClasses = c("Date", "integer", "integer"))
mychart <- gvisLineChart(fargo, options=list(gvis.editor="Edit this chart", width=1000, height=600))
plot(mychart)
}
