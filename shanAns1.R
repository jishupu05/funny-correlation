#Answer for 1 
install.packages("psych")
library(psych)
install.packages("Hmisc")
library(Hmisc)
# To construct the confidence interval of pearson correlation coefficient we test corr.test() method
df<-sat.act
#to remove the NA value
df$SATQ<-ifelse(is.na(df$SATQ),ave(df$SATQ,FUN=function(x) mean(x,na.rm = TRUE)),df$SATQ)
cor.test(df$SATV,df$SATQ,alternative = 'two.sided',method = 'pearson',conf.level = 0.95)
cor.plot(df[5:6],cuts = 0.05,cex = 2)
