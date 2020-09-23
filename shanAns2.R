#Here is the solution of Question 2
#split the dataset with respect to the column
# to do so use split() function under psych package
library(Hmisc)
library(psych)
df<-sat.act
#before splitting the dataset have a look onto the structure of the dataset
str(df)
#all features are numeric 
#make the gender feature as a factor
df$gender<-as.factor(df$gender)
#now look at the structure of the dataset
str(df)
#Let's split now
splitdata<-split(df,df$gender)
#Run the command to visualize the splitted datasets
splitdata$'1'
splitdata$'2'
#remove all null values from those datasets
splitdata$'1'<-na.omit(splitdata$'1')
splitdata$'2'<-na.omit(splitdata$'2')
#To make more improvise datasets change the columns names for those splitted data and assign the column name 'Male' for gender column of splitdata1.
# for second dataset it is female
names(splitdata$'1')[names(splitdata$'1')=='gender']<-'Male'
names(splitdata$'2')[names(splitdata$'2')=='gender']<-'Female'
#transform those splitted data into matrix format
splitdata$'1'<-as.matrix(splitdata$'1')
splitdata$'2'<-as.matrix(splitdata$'2')
part1<-splitdata$'1'
part2<-splitdata$'2'
#now use rcorr() function to see the significance of correlation coefficient
rcorr(x=part1[,2:6])
#visualize the pairplot
p1<-as.data.frame(part1)
p1<-na.omit(p1)
pairs.panels(p1[,1:6])
rcorr(x=part2[,2:6])
p2<-as.data.frame(part2)
p2<-na.omit(p2)
#visualize it
pairs.panels(p2[,1:6])
#answer for part 2.1
#Find correlation for first splitted data
# transform p1 and p2 into numeric
p1$SATV<-as.numeric(p1$SATV)
p1$SATQ<-as.numeric(p1$SATQ)
p2$SATV<-as.numeric(p2$SATV)
p2$SATQ<-as.numeric(p2$SATQ)
#find correlation

r1<-cor(p1$SATV,p1$SATQ)
r2<-cor(p2$SATV,p2$SATQ)
# test the diffrence between r1 and r2
# to do it first see no of observations for first splitted data
nrow(p1)
# it gives n=245
nrow(p2)
# it gives n=442
# now perform the test by using paired.r()
paired.r(r1,r2,n=245,n2=442)

# end the code 