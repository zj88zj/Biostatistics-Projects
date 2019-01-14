# Biostatistics-Projects
Prediction of Length of Stay (LOS) from Patients Data in Sweden


Keywords: 
Exploratory Data Analysis, Correlation, Survival Models, Log Rank Test, ANOVA, Linear Regression, Cox Proportional-Hazards Model, Weibull Regression Model, Variable Selection, Forward and Backward Stepwise, LASSO, Data Visialzation.

Packages: 
Hmisc, corrplot, survival, flexsurv, eha, graphics, grDevices, leaps, ggvis, lars, methods, stats, utils, datasets.


Database contains the data of all patients hospitalized with depression in Sweden from 2008 to 2013. The variables are:
"YEAR","AGE","RACE","FEMALE","LOS","NCHRONIC","DIED","ALCOHOL","ANEMDEF","ARTH","BLDLOSS","CHF","CHRNLUNG","COAG","DEPRESS","DRUG","HTN","LIVER","OBESE","RENLFAIL","LAMA","ULCER","VALVE","WGHTLOSS"

We are interested in predicting the distribution of Length of Stay (LOS) as a function of demographics, disease variables and comorbidities. However, many of these patients left the hospital against medical advice (LAMA) so the observe value could be consider as a lower bound of the true LOS.


Main Tasks:
1. Explore the dataset for interesting patterns and relationships among the variables.
2. Make assumption and find appropriate models.
3. Find the most important factors that determine the length of stay.
Compare a parametric model with a non-parametric model and show the
differences. Compare Proportional Hazard vs Weibull models. Use variable selection models.
4. Check the randomness of patients who left against medical advice.

