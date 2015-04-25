load("../shinyHousePrices/housing.rda")

# prepare the data. We'll just look at Marin.
marin = subset(housing, county == "Marin County", drop = TRUE)
marin$city = droplevels(marin$city)


library(lattice)
xyplot(price/1000 ~ bsqft, marin, groups = city, auto.key = list(space = "right", column = 1, cex.text = .4), xlab = "Building Square Feet", ylab = "Price ($1000)")

library(ggplot2)
p = ggplot(marin, aes(bsqft/1000, price, color = city)) + geom_point() + labs(x = "Building Square Feet", y = "Price ($1000)")

#
library(ggvis)
p = layer_points(ggvis(marin, ~ bsqft, ~ price/1000, fill = ~ city))
p = add_tooltip(p, function(d) paste(d$city, d$br, d$year, sep = ", "))
p


# the function we pass to add_tooltip is only passed the columns in the plot!!
# So we need to get a key variable passed in and then use this to subset the non-local variable marin
# to get the additional columns. Mmmmmm.
# Note the := when defining key.
marin$id = 1:nrow(marin)
p = layer_points(ggvis(marin), ~ bsqft, ~ price/1000, fill = ~ city, key := ~id)
p = add_tooltip(p, function(d) { with(marin[d$id, ], paste(d$id, city, br, year, lsqft, sep = ", "))})
p

# What about the outlier with a price of $15 million.
# Lot square feet
#
# 8 acres.
# Lucas valley road.
# Lookup address on zillow. Could do it via the API from our Web Scraping 
