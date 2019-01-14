<html>
<body>
<h2>Prediction of Length of Stay (LOS) from Patients Data in Sweden</h2>
<h2><a href="https://www.dropbox.com/s/8xp9aj4kydhgcmi/Report.pdf?dl=0">>>Report Link <<</a></h2>

<h2>Keywords:</h2>
<p>Exploratory Data Analysis, Correlation, Survival Models, Log Rank Test, ANOVA, Linear Regression, Cox Proportional-Hazards Model, Weibull Regression Model, Variable Selection, Forward and Backward Stepwise, LASSO, Wald-Wolfowitz Runs Test, Data Visialzation.</p>

<h2>Packages:</h2>
<p>Hmisc, corrplot, survival, flexsurv, eha, graphics, grDevices, leaps, ggvis, lars, snpar, randtests, methods, stats, utils, datasets.</p>

<h2>Summary:</h2>
<p>Database contains the data of all patients hospitalized with depression in Sweden from 2008 to 2013. Variables:
<img width="756" alt="screen shot 2019-01-14 at 11 56 53 am" src="https://user-images.githubusercontent.com/32077985/51143959-d77e2f00-181d-11e9-8038-00c45ed20ef5.png"></p>
<p>We are interested in predicting the distribution of Length of Stay (LOS) as a function of demographics, disease variables and comorbidities. However, many of these patients left the hospital against medical advice (LAMA) so the observe value could be consider as a lower bound of the true LOS.</p>

<h2>Main Tasks:</h2>
<p><ol>
<li> Explore the dataset for interesting patterns and relationships among the variables.</li>
<li> Make assumption and find appropriate models.</li>
<li> Find the most important factors that determine the length of stay. Compare a parametric model with a non-parametric model and show the differences. Compare Proportional Hazard vs Weibull models. Use variable selection models.</li>
<li> Check the randomness of patients who left against medical advice.</li></ol></p>
</body>
</html>
