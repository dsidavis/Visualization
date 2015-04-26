# Rearrange the information
target = unlist(lapply(g, function(x) if(length(x)) x else NA))
src = unlist(mapply(function(id, x) rep(id, max(1, length(x))), names(g), g))

stopifnot(length(target) == length(src))

all = na.omit(unique(c(target, src)))

d = data.frame(src = factor(src, levels = all), target = factor(target, levels = all))

m = do.call(cbind, lapply(d, as.integer))
library(MASS)
parcoord(m)
