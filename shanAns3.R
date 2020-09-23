#find out the partial correlation
#partial correlation means when you feel that your two continuous variables are correlated with each other and any of them 
#also correlated with other continuous variable. 
# find partial correlation to get influence free relation between those two variables.
#load the data.
df<-sat.act
# remove all NA values from dataset by using NA.omit()
df<-na.omit(df)
#now you can use partial.r() function under psych package to get the result 
partial.r(df[5:6])
#To get better summarized result use pcor.test() method under 'ppcor' package
install.packages('ppcor')
library(ppcor)
#Here your controlling variable is Education. which is defined as z
pcor.test(x=df$SATV,y=df$SATQ,z=df$education,method = 'pearson')
#run the code get the interpretation herewith