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
