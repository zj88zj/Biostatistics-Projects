###### Exploratory Data Analysis ######

names(dataFP) #column names
summary(dataFP) #basic descriptive statistics
table(dataFP$LOS) #frequency of Length of stay
length(table(dataFP$LOS))
hist(dataFP$LOS) #distributions of LOS

##Correlationship among Variables##
cor(dataFP)

##Correlation Matrix with P-value##
install.packages("Hmisc")
library("Hmisc")
rcorr(as.matrix(dataFP))

##Displays for Correlation Matrices##
install.packages("corrplot")
library(corrplot)
corrplot(cor(dataFP), type="upper", tl.srt=45, tl.col="black", tl.cex = 0.5)



###### Kaplan-Meier Survival Curves ######

library(survival)

##Survival Models##
plot(survfit(Surv(log(1+LOS),1-LAMA)~1,data=dataFP))
plot(survfit(Surv(log(1+LOS),1-LAMA)~DIED,data=dataFP))

##Log Rank Test##
survdiff(Surv(log(1+LOS),1-LAMA)~AGE,data=dataFP)



###### ANOVA and Linear Regression ######

linearMod <- lm(LOS ~ ., data =dataFP)
linearMod2 <- lm(log(1+LOS) ~ ., data =dataFP)
summary(aov(LOS ~ ., data=dataFP))
summary(linearMod2)
AIC(linearMod2)
BIC(linearMod2)

##Residual Plots and QQplots##
plot(linearMod2, las = 1)



###### Cox Proportional-Hazards Model ######

coxMod <- coxph(Surv(log(1+LOS), 1-LAMA) ~ ., data=dataFP)
print(coxMod)
summary(coxMod)
plot(cox.zph(coxMod))



###### Weibull Regression Model ######

library(survival)
weiMod <- survreg(Surv(log(2+LOS), 1-LAMA) ~ ., data=dataFP, dist="weibull")
summary(weiMod)
library(eha)
weiMod2<- weibreg(Surv(log(2+LOS), 1-LAMA)~ ., data=dataFP)
summary(weiMod2)
plot(weiMod2)



###### Variable Selection ######

##Subset Selection##
library(leaps)
sel.full=regsubsets(log(1+LOS) ~ ., data=dataFP)
summary(sel.full)
library(ggvis)
rsq <- as.data.frame(summary(sel.full)$rsq)
names(rsq) <- "R2"
rsq %>% 
  ggvis(x=~ c(1:nrow(rsq)), y=~R2 ) %>%
  layer_points(fill= ~ R2 ) %>%
  add_axis("y", title="R2") %>% 
  add_axis("x", title="Number of variables")

##Forward & Backward Stepwise Selection##
sel.f = regsubsets(log(1+LOS) ~ ., data=dataFP,nvmax=20, method ="forward")
sel.b = regsubsets(log(1+LOS) ~ ., data=dataFP,nvmax=20, method ="backward")
summary(sel.f)
coef(sel.full ,8)
coef(sel.f ,8)
coef(sel.b ,8)

##LASSO for Variable Selection##
LOS <-dataFP$LOS
lasso<-lars(x=as.matrix(dataFP), y=log(1+LOS), type='lasso', trace=FALSE, normalize=TRUE, intercept=TRUE)#define a lasso object
plot(lasso)
round(coef(lasso),2)
predict.lars(object=lasso, s=0.85, mode='fraction', type='coefficients')
absum<- sum(abs(summary(linearMod2)$coeff[-1,1]))
t<-apply(abs(coef(lasso)),1,sum)
s<-t/absum
plot(s, coef(lasso)[,2],xlab='shinkage factor s', ylab='coefficient', axes=TRUE)#lasso plot
lines(s,coef(lasso)[,4])
lines(s,coef(lasso)[,5])
lines(s,coef(lasso)[,6])
...


###### Randomness Check ######

library(snpar)
x<-dataFP$LAMA
runs.test(x)
library(randtests)
runs.test(x)#Wald-Wolfowitz Runs Test
