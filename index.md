---
title       : Developing Data Products - Pitch Presentation
subtitle    : Shiny App - Volume of timber
author      : PJ
job         : Student @ Coursera
logo        : cherry tree in blossom.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight     # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>
em {
  font-style: italic
}
strong {
  font-weight: bold;
}
</style>

## Shiny App

**Finding volume of timber produced by black cherry tree**
<hr color=black></hr>

The logo shows a cherry tree in blossom. I would prefer and advise you not to cut this tree for timber, please.

The application auto-generates prediction on volume of timber for the keyed in values of height and girth.

It also draws three scatter plots of volume versus each of height, girth and the approximate model, $$Volume = {c*Height*Girth^2}$$  

Details of the data and its analysis follows next.

---

## Details/Summary of the dataset
<hr color=black></hr>

*trees* is one of the dataset in the *datasets* library. It provides measurements of the girth, height and volume of timber in 31 felled black cherry trees.  
*trees* data frame has 31 observations on 3 variables.  
*[,1] Girth* numeric Tree diameter in inches  
*[,2] Height* numeric Height in ft  
*[,3] Volume* numeric Volume of timber in cubic ft  
Note that *Girth* is the diameter of the tree (in inches) measured at 4 ft 6 in above the ground.


```r
summary(trees)
```

```
##      Girth           Height       Volume     
##  Min.   : 8.30   Min.   :63   Min.   :10.20  
##  1st Qu.:11.05   1st Qu.:72   1st Qu.:19.40  
##  Median :12.90   Median :76   Median :24.20  
##  Mean   :13.25   Mean   :76   Mean   :30.17  
##  3rd Qu.:15.25   3rd Qu.:80   3rd Qu.:37.30  
##  Max.   :20.60   Max.   :87   Max.   :77.00
```

---

## Plotting the dataset
<hr color=black></hr>

```r
par(mfrow = c(1, 3))
with(trees, plot(Height, Volume, xlab ='Height (ft)', ylab ='Volume (cu. ft)', 
                 main ='Volume vs Height'))
with(trees, plot(Girth, Volume, xlab ='Girth (in)', ylab ='Volume (cu. ft)', 
                 main ='Volume vs Girth'))
with(trees, plot(Height * Girth^2, Volume, main ='Volume vs Approximate Model'))
```

![plot of chunk scplot](assets/fig/scplot-1.png) 

---

## Fitting a linear model after logarithmic transformation of data
<hr color=black></hr>


```r
summary(lm(log(Volume) ~ log(Height) + log(Girth), data = trees))
```

```
## 
## Call:
## lm(formula = log(Volume) ~ log(Height) + log(Girth), data = trees)
## 
## Residuals:
##       Min        1Q    Median        3Q       Max 
## -0.168561 -0.048488  0.002431  0.063637  0.129223 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -6.63162    0.79979  -8.292 5.06e-09 ***
## log(Height)  1.11712    0.20444   5.464 7.81e-06 ***
## log(Girth)   1.98265    0.07501  26.432  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.08139 on 28 degrees of freedom
## Multiple R-squared:  0.9777,	Adjusted R-squared:  0.9761 
## F-statistic: 613.2 on 2 and 28 DF,  p-value: < 2.2e-16
```

---

## Bibliography
<hr color=black></hr>

The following resources were used to get data and some R code:

**Source**  

Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976). *The Minitab Student Handbook*. Duxbury Press.

**References**  

Atkinson, A. C. (1985). *Plots, Transformations and Regression*. Oxford University Press.

"*Cherry tree in blossom.png*" image was downloaded from <http://www.itp.efuller.net/images/_09fall/bs_091228_0.png>.
