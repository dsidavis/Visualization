load("housingFrequencies.rda")


svg("housingMatplot.svg", width = 9)
library(RColorBrewer)
cols = brewer.pal(nrow(housingFrequencies), "Set1")
matplot(t(housingFrequencies), type = "l", col = cols, lty = 1, xlab = "Bedrooms", ylab = "Number of houses",
          main = "House sales by number of bedrooms and county")
legend("topright", legend = rownames(housingFrequencies), col = cols, lty = 1, lwd = 3)
dev.off()
