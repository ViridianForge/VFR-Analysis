library(maps)

setwd('/home/mansellw/Projects/VFR-Analysis/LivingCosts')

stateData <- read.csv('./State FMR Dataset - State Averaged.csv',header=TRUE)

#Target Groups.  1 Person - 1 Bedroom.  2 People - 2 Bedroom.
#Target Breakdowns - Average Income Case, Full-Time Income Case

#This data is in Percentages.
OnePOneBA <- as.numeric(sub('%','',stateData[["fmr1A1"]]))
OnePOneBF <- as.numeric(sub('%','',stateData[["fmr1F1"]]))
TwoPTwoBA <- as.numeric(sub('%','',stateData[["fmr2A2"]]))
TwoPTwoBF <- as.numeric(sub('%','',stateData[["fmr2F2"]]))

#Generate the Color Labellings for the Maps
OnePOneBACol <- as.character(cut(OnePOneBA,c(0,30,50,75,100,1000),labels=c("green","yellow","orange","red","purple")))
OnePOneBFCol <- as.character(cut(OnePOneBF,c(0,30,50,75,100,1000),labels=c("green","yellow","orange","red","purple")))
TwoPTwoBACol <- as.character(cut(TwoPTwoBA,c(0,30,50,75,100,1000),labels=c("green","yellow","orange","red","purple")))
TwoPTwoBFCol <- as.character(cut(TwoPTwoBF,c(0,30,50,75,100,1000),labels=c("green","yellow","orange","red","purple")))

OnePOneBAMap <- map("state",fill=1, col=OnePOneBACol)
OnePOneBFMap <- map("state",fill=1, col=OnePOneBFCol)
TwoPTwoBAMap <- map("state",fill=1, col=TwoPTwoBACol)
TwoPTwoBFMap <- map("state",fill=1, col=TwoPTwoBFCol)