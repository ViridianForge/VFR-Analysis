
#Zoo Library for rollapply
library(zoo)

#Load the College Cost Dataset
#College Costs obtained from:  http://nces.ed.gov/programs/digest/d13/tables/dt13_330.10.asp
#Minimum Wage Adjusted to 2013 dollars obtained from: http://money.cnn.com/interactive/economy/minimum-wage-since-1938/
#In order to place the minimum wage in a school-year context
#The average of the involved years' minimum wages was taken.
minimumWageData <- read.csv('/home/mansellw/Projects/CollegeCosts/MinimumWageIn2013Dollars1963On.csv', header=TRUE, na.string="NA", stringsAsFactors = FALSE)
collegeCostData <- read.csv('/home/mansellw/Projects/CollegeCosts/CollegeCostsIn2013Dollars1963On.csv', header=TRUE, na.string="NA", stringsAsFactors = FALSE)

#Calculate School Year Adjusted Minimum Wages
min.Wage.School.Year.Adjusted <- rollapply(minimumWageData$Adjusted.Minimum.Wage, 2, mean)

pub.4Year.As.Hours <- collegeCostData$Public.4.Year / min.Wage.School.Year.Adjusted
pub.2Year.As.Hours <- collegeCostData$Public.2.Year / min.Wage.School.Year.Adjusted
priv.4Year.As.Hours <- collegeCostData$Private.4.Year / min.Wage.School.Year.Adjusted
priv.2Year.As.Hours <- collegeCostData$Private.2.Year / min.Wage.School.Year.Adjusted

#Lines to Add to the Charts for Perspective
#working 20 Hours / Week -- 1040 Hours
#Working 40 Hours / Week -- 2080 Hours

#Credit Hour Guidlines Review from: https://www.rit.edu/academicaffairs/academicprogrammgmnt/related-curriculum-topics/credit-hour-guidance
#Average Hours / Week for a Full time Student -- 1080 Hours
#Full Time Student + Part Time Job -- 2140
#Full Time Student + Full Time Job -- 3160

cPal <- c('darkgreen','orangered','blue','red','black','darkmagenta')


svg("/home/mansellw/Projects/CollegeCosts/CollegeCosts.svg", width=16,height=9)

#Chart 1 -- Cost in Hours v. Years for 4 Year Colleges
#Public 4 Year Schools on First Line -- Blue
plot(pub.2Year.As.Hours,
     xaxs="i", yaxs="i",
     xlim=c(1,50),ylim=c(0,6000),
     type="s", col=cPal[1],
     las=1,
     main="Average Cost of Undergraduate Tuition, Room, Board, and Fees",
     xaxt="n",
     xlab="End of Academic School Year", ylab="Hours of Minimum Wage Labor")
#Average Private 4 Year Schools for Second Line -- Red
lines(pub.4Year.As.Hours,col=cPal[2],type = "s")
lines(priv.2Year.As.Hours,col=cPal[3],type = "s")
lines(priv.4Year.As.Hours,col=cPal[4],type = "s")
#Non-profit Private 4 Year Schools for Third Line -- Green
#lines(fourYearCollegeCosts$Hours.MinWage.for.Priv.Non.Profit.4.Year,col="green",type = "l")
#For-Profit Private 4 Year Schools for Fourth Line -- Black
#lines(fourYearCollegeCosts$Hours.MinWage.for.Priv.For.Profit.4.Year,col="black",type = "l")
#Add a line to represent Part-Time Employment
abline(h=1040,col=cPal[5], lty=2)
#And one for Full-Time Employment
abline(h=2080,col=cPal[6], lty=2)

#Construct School Year Labels and Grab the 2-Digit Component at the End
numSchoolYear <- as.character(1964:2013)
strSchoolYear <- substr(numSchoolYear,nchar(numSchoolYear)-1,nchar(numSchoolYear))

#Label the X Axis by the Ending School Year
axis(1, at=1:length(collegeCostData$School.Year), labels=strSchoolYear)

#Add the Legend
legend("topleft",ncol=3,legend = c("Public 2-Year", "Public 4-Year", "Private 2-Year", "Private 4-Year", "Working 20 Hrs/Wk", "Working 40 Hrs/Wk"), fill = cPal)

dev.off()