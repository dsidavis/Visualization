### Infant Health
load(url("http://www.stat.berkeley.edu/users/nolan/data/KaiserBabies.rda"))

hist(infants$bwt , freq = FALSE, 
     xlab = "Birth Weight (oz)", 
     main = "Male Babies, Oakland Kaiser 1960s")

hist(infants$bwt , freq = FALSE, breaks = 30,
     xlab = "Birth Weight (oz)", 
     main = "Male Babies, Oakland Kaiser 1960s")

hist(infants$bwt , freq = FALSE, 
     breaks = c(55, 70, 80, 90, seq(95,150, by = 5),
                160, 170, 180),
     xlab = "Birth Weight (oz)", main="")


plot(density(infants$bwt, bw = 1), 
     xlab = "Birth Weight (oz)", 
     main = "Male Babies")

boxplot(infants$bwt, 
        xlab="Birth Weight (oz)")

plot(table(infants$parity), 
     type ="h", lwd = 4, 
     ylab ="Proportion", col="darkgrey")

barplot(table(infants$parity)) 

tParity = table(infants$parity)

dotchart(x = as.numeric(tParity), 
         labels = names(tParity),
         xlab = "Parity", 
         pch = 19, bg= "darkgrey") 
    
library(vioplot)
vioplot(infants$bwt)

sinfants = subset(infants, smoke != "Unknown" & ed != "Unknown")
levels(sinfants$ed) = c("No HS", "Some HS", "High School", "Trade",
                        "Some College","College", "Unknown")
levels(sinfants$smoke) = c("Never", "Now", "Until", "Once", "Unknown")
with(sinfants, mosaicplot(table(droplevels(ed), 
                                droplevels(smoke)),
                          main = ""))


tableEdSmoke = with(sinfants, table(droplevels(ed), 
                                    droplevels(smoke)))

tableSmokeEd = with(sinfants, table(droplevels(smoke), 
                                    droplevels(ed)))
barplot(tableEdSmoke)
barplot(tableEdSmoke, beside = TRUE)
barplot(tableSmokeEd, beside = TRUE)

matplot(x = 1:6, y = tableEdSmoke, type ="l",
        lwd = 3, axes = FALSE, xlab = "", ylab = "Count")
axis(1, labels = c("No HS", "Some HS", "HS", "Trade",
                   "Some College","College"),
     at = 1:6)
axis(2)


######## SF Housing

load(url("http://www.stat.berkeley.edu/users/nolan/data/smallHousing.rda"))

boxplot(shousing$price ~ shousing$city, las = 2)

citymedian = tapply(shousing$price, shousing$city, median, na.rm=TRUE)
cityOrder = order(citymedian)
shousing$cityO = factor(shousing$city, 
                        levels = levels(shousing$city)[cityOrder], 
                        ordered = TRUE)
boxplot(shousing$price ~ shousing$cityO, las = 2)

shousing$ppsf = shousing$price/shousing$bsqft

plot(ppsf ~ shousing$bsqft, 
     pch=19, cex = 0.2,      
     subset = shousing$city == "Berkeley",
     main="Berkeley",             
     xlab="Area (ft^2)",          
     ylab = "Price/ft^2")         


pdf("smoothScatterSFHousing.pdf", width = 8, height = 5)

with(shousing, smoothScatter(ppsf ~ bsqft, 
              ylim = c(0, 1250), xlim = c(400, 6000),
              xlab="Area (ft^2)", ylab = "Price/ft^2"))

h.obj = with(shousing, loess(ppsf ~ bsqft))

h.obj.pr = predict(h.obj, 
                   newdata = data.frame( bsqft = 700:6000))
lines(x = 700:6000, y = h.obj.pr, col = "#4daf4a", lwd = 2)

library(lattice)
xyplot(ppsf ~ log(bsqft)| city, data = shousing, group = br,
       ylim = c(0, 1500),)

library(ggplot2)
p = ggplot(shousing)

p + geom_point(aes(x = bsqft, y = ppsf, color = factor(br))) +
  scale_x_continuous(trans = "log") +
  scale_y_continuous(limits = c(0, 1500)) +
  facet_wrap(~ city) 

p = ggplot(shousing, aes(factor(city), ppsf)) 
p + geom_violin(trim = FALSE) +
  scale_y_continuous(limits = c(0, 2000))

library("RColorBrewer")
library("plotrix")


############ CIA Factbook

load(url("http://www.stat.berkeley.edu/users/nolan/data/factbook.rda"))

pairs(fbDF)

myColors = brewer.pal(9, "YlOrRd")[c(9, 7, 6, 4, 2, 1)]
          
fbDF$cutLE = cut(fbDF$lifeExpect, 
              breaks = c(48, 55, 60, 65, 70, 75, 90))
popOrder = order(fbDF$pop, decreasing = TRUE)             
fbDF  = fbDF[popOrder, ] 
                        

                       
plot(x = fbDF$gini, y = fbDF$im, type = "n",
              log = "y",
              xlab = "Gini Index", 
              ylab = "Infant Mortality Rate (log scale)", 
              main = "World Trends" )             
            
symbols(x = fbDF$gini, y = fbDF$imRates, 
        bg = myColors[fbDF$cutLE], add = TRUE, 
        circles = pmax(sqrt(fbDF$pop)/8000, 0.2), 
        inches = FALSE)
                         
lifeLabels = c("< 55", "55 - 65", "65 - 70", 
              "70-75", "75 - 80", ">85"
                            
legend("bottomright", title = "Life Expectancy",  
        legend = lifeLabels, 
        bty = "n", fill = myColors)          
          



fbDF$popS = pmax(sqrt(fbDF$pop)/8000, 1)


p = ggplot(fbDF)

p +  
  geom_point(aes(x = gini, y = imRates, 
                 color = cutLE, size = popS)) + 
  scale_y_continuous(trans = "log",
                     name = "Infant Mortality Rate (log scale)") +
  scale_x_continuous(name = "Gini Index") +
  scale_color_manual(values = myColors,
                     name = "Life Expectancy") +
  scale_size(name = "Population") +
  ggtitle("World Trends")


