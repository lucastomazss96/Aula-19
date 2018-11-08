> pacotes <- c("forecast","dplyr","vars","urca","pwt8.0")
> install.packages(pacotes)
> suppressMessages(require(forecast))
> suppressMessages(require(dplyr))
> suppressMessages(require(vars))
> suppressMessages(require(urca))
> suppressMessages(require(pwt8.0))
> data("pwt8.0")
> View(pwt8.0)
> br1 <- subset(pwt8.0, country=="Brazil", select = c("rgdpna","emp","xr","ctfp","hc"))
> br <- data.frame()
> 
>     for (i in 1:62) {
    +       for (j in 1:5) {
      +         br[i,j] <- br1[i+1,j]/br1[i,j]
      +       }
    +     }
> br <- br[1:61,]
> colnames(br) <-  c("PIB","Emprego","Cambio","PTF","KHumano")
> BR <- br[45:61,1:5]
> Pib <- ts(br$PIB, start = 1950, frequency = 1)
> Emprego <- ts(br$Emprego, start = 1950, frequency = 1)
> Cambio <- ts(br$Cambio, start = 1950, frequency = 1)
> PTF <- ts(br$PTF, start = 1950, frequency = 1)
> KHumano <- ts(br$KHumano, start = 1950, frequency = 1)
> Brasil <- cbind(BR$PIB,BR$Emprego,BR$Cambio,BR$PTF,BR$KHumano)
> Anos <- seq(from=1994, to=2011, by=1)
> BRA <- ts(Brasil, start = 1994, frequency = 1)
> plot(BRA,main="Variação do PIB, Emprego, Câmbio, PTF, Capital Humano no Brasil",type="o", col=c("Blue","Black","Red","Green","Purple"), plot.type="single")
> grid(lty = "dotted",col = "lightgray")
> correlacao <- cor(BR)
> View(correlacao)
> plot(BR$PIB,BR$Emprego)
> plot(BR$PIB,BR$Cambio)
> plot(BR$PIB,BR$PTF)
> plot(BR$PIB,BR$KHumano)
> modelobra = vars::VAR(y = BR, p = 1, type = "const")
> summary(modelobra)

VAR Estimation Results:
  ========================= 
  Endogenous variables: PIB, Emprego, Cambio, PTF, KHumano 
Deterministic variables: const 
Sample size: 16 
Log Likelihood: 215.378 
Roots of the characteristic polynomial:
  1.023 0.6404 0.478 0.478   0.2
Call:
  vars::VAR(y = BR, p = 1, type = "const")


Estimation results for equation PIB: 
  ==================================== 
  PIB = PIB.l1 + Emprego.l1 + Cambio.l1 + PTF.l1 + KHumano.l1 + const 

Estimate Std. Error t value Pr(>|t|)  
PIB.l1     -0.563667   0.385765  -1.461   0.1747  
Emprego.l1  0.015131   0.422603   0.036   0.9721  
Cambio.l1  -0.005757   0.035598  -0.162   0.8747  
PTF.l1      0.089305   0.113970   0.784   0.4514  
KHumano.l1 -2.541080   1.234757  -2.058   0.0666 .
const       4.092272   1.356909   3.016   0.0130 *
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1


Residual standard error: 0.02125 on 10 degrees of freedom
Multiple R-Squared: 0.4316,	Adjusted R-squared: 0.1474 
F-statistic: 1.519 on 5 and 10 DF,  p-value: 0.268 


Estimation results for equation Emprego: 
  ======================================== 
  Emprego = PIB.l1 + Emprego.l1 + Cambio.l1 + PTF.l1 + KHumano.l1 + const 

Estimate Std. Error t value Pr(>|t|)  
PIB.l1     -0.15879    0.32498  -0.489   0.6356  
Emprego.l1 -0.24021    0.35601  -0.675   0.5151  
Cambio.l1   0.01071    0.02999   0.357   0.7283  
PTF.l1     -0.17100    0.09601  -1.781   0.1052  
KHumano.l1 -1.62909    1.04018  -1.566   0.1484  
const       3.23918    1.14309   2.834   0.0177 *
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1


Residual standard error: 0.0179 on 10 degrees of freedom
Multiple R-Squared: 0.4495,	Adjusted R-squared: 0.1742 
F-statistic: 1.633 on 5 and 10 DF,  p-value: 0.238 


Estimation results for equation Cambio: 
  ======================================= 
  Cambio = PIB.l1 + Emprego.l1 + Cambio.l1 + PTF.l1 + KHumano.l1 + const 

Estimate Std. Error t value Pr(>|t|)
PIB.l1      -0.10417    3.26616  -0.032    0.975
Emprego.l1  -1.21426    3.57806  -0.339    0.741
Cambio.l1   -0.08355    0.30139  -0.277    0.787
PTF.l1      -0.78145    0.96495  -0.810    0.437
KHumano.l1  18.27391   10.45434   1.748    0.111
const      -15.27473   11.48857  -1.330    0.213


Residual standard error: 0.1799 on 10 degrees of freedom
Multiple R-Squared: 0.3752,	Adjusted R-squared: 0.06285 
F-statistic: 1.201 on 5 and 10 DF,  p-value: 0.3751 


Estimation results for equation PTF: 
  ==================================== 
  PTF = PIB.l1 + Emprego.l1 + Cambio.l1 + PTF.l1 + KHumano.l1 + const 

Estimate Std. Error t value Pr(>|t|)  
PIB.l1     -0.007768   0.921998  -0.008   0.9934  
Emprego.l1  1.431042   1.010044   1.417   0.1869  
Cambio.l1   0.125467   0.085080   1.475   0.1711  
PTF.l1      0.598241   0.272394   2.196   0.0528 .
KHumano.l1 -4.448608   2.951133  -1.507   0.1626  
const       3.314949   3.243084   1.022   0.3308  
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1


Residual standard error: 0.05079 on 10 degrees of freedom
Multiple R-Squared: 0.5437,	Adjusted R-squared: 0.3155 
F-statistic: 2.383 on 5 and 10 DF,  p-value: 0.1137 


Estimation results for equation KHumano: 
  ======================================== 
  KHumano = PIB.l1 + Emprego.l1 + Cambio.l1 + PTF.l1 + KHumano.l1 + const 

Estimate Std. Error t value Pr(>|t|)    
PIB.l1     -0.015497   0.049910  -0.310 0.762557    
Emprego.l1 -0.040905   0.054676  -0.748 0.471611    
Cambio.l1   0.006852   0.004606   1.488 0.167680    
PTF.l1      0.005080   0.014745   0.345 0.737597    
KHumano.l1  0.870707   0.159752   5.450 0.000281 ***
  const       0.175318   0.175557   0.999 0.341519    
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1


Residual standard error: 0.002749 on 10 degrees of freedom
Multiple R-Squared: 0.8721,	Adjusted R-squared: 0.8081 
F-statistic: 13.64 on 5 and 10 DF,  p-value: 0.0003392 



Covariance matrix of residuals:
  PIB    Emprego     Cambio        PTF    KHumano
PIB      4.516e-04  2.314e-04 -2.543e-03  2.996e-04 -1.106e-05
Emprego  2.314e-04  3.205e-04 -1.805e-03 -2.789e-04 -9.648e-06
Cambio  -2.543e-03 -1.805e-03  3.237e-02  1.543e-04  9.662e-06
PTF      2.996e-04 -2.789e-04  1.543e-04  2.580e-03  1.698e-05
KHumano -1.106e-05 -9.648e-06  9.662e-06  1.698e-05  7.560e-06

Correlation matrix of residuals:
  PIB Emprego   Cambio      PTF  KHumano
PIB      1.0000  0.6082 -0.66496  0.27756 -0.18928
Emprego  0.6082  1.0000 -0.56050 -0.30673 -0.19602
Cambio  -0.6650 -0.5605  1.00000  0.01688  0.01953
PTF      0.2776 -0.3067  0.01688  1.00000  0.12157
KHumano -0.1893 -0.1960  0.01953  0.12157  1.00000


> impulso <- irf(modelobra, n.ahead = 10, cumulative = T)
> plot(impulso)
Hit <Return> to see next plot: previsao2 <- predict(modelobra,10)
Hit <Return> to see next plot: fanchart(previsao2)
> write.csv(pwt8.0, file="c:/Econometria/pwt8.0.csv")
> write.csv(correlacao, file="c:/Econometria/correlacao.csv")