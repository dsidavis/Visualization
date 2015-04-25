library(XML)
tt = readHTMLTable("http://en.wikipedia.org/wiki/Timeline_of_Microsoft_Windows", which = 2, stringsAsFactors = FALSE)
ev.date = as.Date(tt$Date, "%d %B %Y")

ldf$ann = rep(as.character(NA), nrow(ldf))
i = match(ev.date, ldf$Date, 0)
ldf$ann[i] = tt[[2]][i != 0]

