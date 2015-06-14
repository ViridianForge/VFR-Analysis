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
