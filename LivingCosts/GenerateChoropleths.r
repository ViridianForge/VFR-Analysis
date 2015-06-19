library(maps)

setwd('/home/mansellw/Projects/VFR-Analysis/LivingCosts')

stateData <- read.csv('./State FMR Dataset - State Averaged.csv',header=TRUE)

#Temporarily -- Need to remove Alaska and Hawaii from the datasets to make sure plots are correct.
stateData <- stateData[ -c(2,11) ]

#Target Groups.  1 Person - 1 Bedroom.  2 People - 2 Bedroom.
#Target Breakdowns - Average Income Case, Full-Time Income Case

#This data is in Percentages.
OnePOneBA <- as.numeric(sub('%','',stateData[["fmr1A1"]]))
OnePOneBF <- as.numeric(sub('%','',stateData[["fmr1F1"]]))
TwoPTwoBA <- as.numeric(sub('%','',stateData[["fmr2A2"]]))
TwoPTwoBF <- as.numeric(sub('%','',stateData[["fmr2F2"]]))

#Map Colors and Legend
class.Colors <- c("green","yellow","orange","red","purple")
leg.desc <- c("<30%","30-49.9%","50-74.9%","75-99.9%",">=100%")

#Generate the Color Labellings for the Maps
OnePOneBACol <- as.character(cut(OnePOneBA,c(0,30,50,75,100,1000),labels=class.Colors))
OnePOneBFCol <- as.character(cut(OnePOneBF,c(0,30,50,75,100,1000),labels=class.Colors))
TwoPTwoBACol <- as.character(cut(TwoPTwoBA,c(0,30,50,75,100,1000),labels=class.Colors))
TwoPTwoBFCol <- as.character(cut(TwoPTwoBF,c(0,30,50,75,100,1000),labels=class.Colors))

OnePOneBAMap <- map("state",fill=1, col=OnePOneBACol)
title("Income Encumberance of a Single Minimum Wage Worker renting the Average 1 Bedroom Apartment")
legend("bottomright", leg.desc, horiz = TRUE, fill = class.Colors)

OnePOneBFMap <- map("state",fill=1, col=OnePOneBFCol)
title("Income Encumberance of a Single Full-Time Minimum Wage Worker renting the Average 1 Bedroom Apartment")
legend("bottomright", leg.desc, horiz = TRUE, fill = class.Colors)

TwoPTwoBAMap <- map("state",fill=1, col=TwoPTwoBACol)
title("Income Encumberance of a Two Minimum Wage Workers renting the Average 2 Bedroom Apartment")
legend("bottomright", leg.desc, horiz = TRUE, fill = class.Colors)

TwoPTwoBFMap <- map("state",fill=1, col=TwoPTwoBFCol)
title("Income Encumberance of a Two Full-Time Minimum Wage Workers renting the Average 2 Bedroom Apartment")
legend("bottomright", leg.desc, horiz = TRUE, fill = class.Colors)