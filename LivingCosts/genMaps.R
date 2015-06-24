library(choroplethr)
library(ggplot2)

#Add in the State Conversion Function
source('C:\\Users\\mansellw\\Documents\\GitHub\\VFR-Analysis\\AdditionalLibraries\\R\\stateConversion.r')

#Author:  Wayne Manselle
#Date: 06/12/2015

#Script to Map Particular Aspects of Cost of Living Data

setwd('C:\\Users\\mansellw\\Documents\\GitHub\\VFR-Analysis\\LivingCosts\\')

stateLevelData <- read.csv('./State FMR Dataset - State Averaged.csv',header=TRUE)

#Convert Percentage Data into Numeric Data
#This data is in Percentages.
OnePOneBA <- as.numeric(sub('%','',stateLevelData[["fmr1A1"]]))
OnePOneBF <- as.numeric(sub('%','',stateLevelData[["fmr1F1"]]))
TwoPTwoBA <- as.numeric(sub('%','',stateLevelData[["fmr2A2"]]))
TwoPTwoBF <- as.numeric(sub('%','',stateLevelData[["fmr2F2"]]))

#Create Data Frames that are compatible with choroplethr.

avgOneBed <- data.frame(region=stateConversion(as.character(stateLevelData[["State"]]), 'all','lower'),value=OnePOneBA)
avgTwoBed <- data.frame(region=stateConversion(as.character(stateLevelData[["State"]]), 'all','lower'),value=TwoPTwoBA)
ftOneBed <- data.frame(region=stateConversion(as.character(stateLevelData[["State"]]), 'all','lower'),value=OnePOneBF)
ftTwoBed <- data.frame(region=stateConversion(as.character(stateLevelData[["State"]]), 'all','lower'),value=TwoPTwoBF)

#One Earner, One Bedroom Average Case
state_choropleth(avgOneBed, title="Cost of One Bedroom Apartment for an Average Time Minimum Wage Worker", legend="% of Monthly Income", num_colors=5)
state_choropleth(avgTwoBed, title="Cost of Two Bedroom Apartment for two Average Time Minimum Wage Workers", legend="% of Monthly Income", num_colors=5)
state_choropleth(ftOneBed, title="Cost of One Bedroom Apartment for a Full Time Minimum Wage Worker", legend="% of Monthly Income", num_colors=5)
state_choropleth(ftTwoBed, title="Cost of Two Bedroom Apartment for two Full Time Minimum Wage Workers", legend="% of Monthly Income", num_colors=5)



#One Earner, One Bedroom Full-Time Case
ftOneBed <- stateLevelData$fmr1F1

#Two Earners, Two Bedroom Average Case
avgTwoBed <- stateLevelData$fmr2A2

#Two Earners, Two Bedroom Full-Time Case
ftTwoBed <- stateLevelData$fmr2F2

map("state")

#State By State

#County By County