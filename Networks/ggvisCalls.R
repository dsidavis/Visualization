source("utilFuns.R")

library(ggvis)
g = getFunctionNetwork("ggvis")

# Which functions call which others
# Two  columns and lines from the left function to those on the right that it calls the right function


