# Stock prices from Google, Microsoft and Yahoo
load("../googleVis/ldf.rda")

# Get the data from the start of the most recent time series to now.
start = max(with(ldf, by(ldf, company, function(x) min(x$Date[ !is.na(x$price)]))))
class(start) =  "Date"

ldf.all = ldf[ldf$Date >= start, ]


library(rCharts)
ldf.all$Date_str = as.character(ldf.all$Date)
m1 <- mPlot(x = "Date_str", y = c("microsoft", "yahoo", "google"), type = "Line", data = ldf)
