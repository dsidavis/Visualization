library(rCharts)
data(economics, package = "ggplot2")
econ <- transform(economics, date = as.character(date))
m1 <- mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
m1$set(pointSize = 0, lineWidth = 1)
m1$print("chart2")



# df from googleVis.R - stock prices
df$Date_str = as.character(df$Date)
m1 <- mPlot(x = "Date_str", y = c("microsoft", "yahoo", "google"), type = "Line", data = df)


