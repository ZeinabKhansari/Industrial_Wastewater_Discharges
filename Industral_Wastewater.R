################################################################################
# Capstone Project
# Author: Zeinab Khansari
# Dataset: Industrial wastewater discharges
# Date: October 2021
# ##############################################################################

library(lubridate)
library(EnvStats)
library(tidyr)
library(pillar)
library(stringi)
library(readr)
library(tidyverse)
library(purrr)
library(plyr)
library(tibble)
library(rlang)
library(readxl)
library(anytime)
library(ggplot2)
library(devtools)
library(ggpubr)
library(reshape2)
library(dplyr)
library(Hmisc)


options(stringAsFactors=FALSE, warnings=FALSE)

setwd("/Users/zeinabkhansari/Desktop/Capstone")
d1 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2004.xls")
d2 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2005.xls")
d3 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2006.xls") 
d4 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2007.xls")
d5 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2008.xls") 
d6 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2009.xls")  
d7 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2010.xls")
d8 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2011.xls")
d9 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2012.xls")
d10 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2013.xlsx")
d11 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2014.xlsx")
d12 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2015.xlsx")
d13 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2016.xlsx")
d14 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2017.xlsx")
d15 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2018.xlsx")
d16 <- read_excel("/Users/zeinabkhansari/Desktop/Capstone/MISA_2019.xlsx")


d1 <- d1[,-16]

d9$DAY <- "01"
d9$Date <- as.Date(with(d9, paste(YEAR, MONTH, DAY,sep="-")), "%Y-%m-%d")


names(d1)

names(d2)
names(d3)

colnames(d3)[5] <- "Date"
colnames(d3)[1] <- "Sector"

names(d4)
names(d5)
names(d6)
names(d7)
names(d8)

colnames(d8)[1] <- "Sector" 
colnames(d8)[2] <- "Works Name"
colnames(d8)[3] <- "Company Code" 
colnames(d8)[4] <- "Municipality"
colnames(d8)[5] <- "Date"
colnames(d8)[6] <- "Control Point ID"
colnames(d8)[7] <- "Control Point Name"
colnames(d8)[8] <- "Parameter Name"
colnames(d8)[9] <- "Parameter Reported As"
colnames(d8)[10] <- "Result Structure"
colnames(d8)[11] <- "Component Type" 
colnames(d8)[12] <- "Frequency" 
colnames(d8)[13] <- "Value"
colnames(d8)[14] <- "Unit of Measure"
colnames(d8)[15] <- "Regulation" 
d8 <- d8[,c(1, 2, 3, 4, 5, 7, 6, 8, 9, 12, 10, 11, 13, 14, 15)]


names(d9)

colnames(d9)[1] <- "Sector"
colnames(d9)[2] <- "Works Name"
colnames(d9)[3] <- "Company Code" 
colnames(d9)[4] <- "Municipality" 
colnames(d9)[7] <- "Control Point ID"
colnames(d9)[8] <- "Control Point Name"
colnames(d9)[9] <- "Parameter Name"
colnames(d9)[10] <- "Parameter Reported As"
colnames(d9)[11] <- "Result Structure"
colnames(d9)[12] <- "Component Type"
colnames(d9)[15] <- "Unit of Measure"

d9 <- d9[, -c(5, 6, 17)]
d9 <- d9[, c(1, 2, 3, 4, 15, 6, 5, 7, 8, 11, 9, 10, 12, 13, 14)]

colnames(d9)[10] <- "Frequency"
colnames(d9)[13] <- "Value"  
colnames(d9)[15] <- "Regulation" 

names(d10)

colnames(d10)[1] <- "Sector"
colnames(d10)[5] <- "Date"

names(d11)

colnames(d11)[5] <- "Date"
colnames(d11)[1] <- "Sector"

names(d12)

colnames(d12)[5] <- "Date"
colnames(d12)[1] <- "Sector"

names(d13)

colnames(d13)[5] <- "Date"
colnames(d13)[1] <- "Sector"

names(d14)
names(d15)
names(d16)

d1$Date <- anydate(d1$Date)
d2$Date <- anydate(d2$Date)
d3$Date <- anydate(d3$Date)
d4$Date <- anydate(d4$Date)
d5$Date <- anydate(d5$Date)
d6$Date <- anydate(d6$Date)
d7$Date <- anydate(d7$Date)
d8$Date <- anydate(d8$Date)
d9$Date <- anydate(d9$Date)
d10$Date <- anydate(d10$Date)
d11$Date <- anydate(d11$Date)
d12$Date <- anydate(d12$Date)
d13$Date <- anydate(d13$Date)


d1$Value <- as.numeric(d1$Value)
d2$Value <- as.numeric(d2$Value)
d3$Value <- as.numeric(d3$Value)
d4$Value <- as.numeric(d4$Value)
d5$Value <- as.numeric(d5$Value)
d6$Value <- as.numeric(d6$Value)
d7$Value <- as.numeric(d7$Value)
d8$Value <- as.numeric(d8$Value)
d9$Value <- as.numeric(d9$Value)
d10$Value <- as.numeric(d10$Value)
d11$Value <- as.numeric(d11$Value)
d12$Value <- as.numeric(d12$Value)
d13$Value <- as.numeric(d13$Value)


dd <- bind_rows(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13)
sum(is.na(dd))

dd <- drop_na(dd)

tt <- bind_rows(d14, d15, d16)

unique(dd$`Parameter Name`)


dd_BOD <- as.data.frame(subset(dd, dd$`Parameter Name`=="BIOCHEMICAL OXYGEN DEMAND,  5 DAY,  TOTAL DEMAND" ))
dd_BOD <- subset(dd_BOD, dd_BOD$`Component Type`=="AVERAGE")
p1 <- ggplot(data=dd_BOD, aes(y=Value, x=Date)) + geom_point(alpha = 0.7, aes(color = Sector))+ theme_bw() +ylab("Biochemical Oxygen Demand (Kg/Day)") +xlab("Date")
show(p1)


dd_PHOS <- as.data.frame(subset(dd, dd$`Parameter Name`=="PHOSPHORUS,UNFILTERED TOTAL" ))
dd_PHOS <- subset(dd_PHOS, dd_PHOS$`Component Type`=="AVERAGE")
p2 <- ggplot(data=dd_PHOS, aes(y=Value, x=Date)) + geom_point(alpha = 0.6, aes(color = Sector))+ theme_bw() +ylab("Phosphorus (Kg/Day)") +xlab("Date")
show(p2)     

dd_LEAD <- as.data.frame(subset(dd, dd$`Parameter Name`=="LEAD,     UNFILTERED TOTAL"  ))
dd_LEAD <- subset(dd_LEAD, dd_LEAD$`Component Type`=="AVERAGE")
p3 <- ggplot(data=dd_LEAD, aes(y=Value, x=Date)) + geom_point(alpha = 0.6, aes(color = Sector))+ theme_bw() +ylab("Lead (Kg/Day)") +xlab("Date")
show(p3)   

dd_PHENOL <- as.data.frame(subset(dd, dd$`Parameter Name`=="PHENOL"  ))
dd_PHENOL <- subset(dd_PHENOL, dd_PHENOL$`Component Type`=="AVERAGE")
p4 <- ggplot(data=dd_PHENOL, aes(y=Value, x=Date)) + geom_point(alpha = 0.6, aes(color = Sector))+ theme_bw() +ylab("Phenol (Kg/Day)") +xlab("Date")
show(p4)  

dd_AVE <- subset(dd, dd$`Component Type`=="AVERAGE")
dd_Select <- subset(dd_AVE, dd_AVE$`Parameter Name`=="ZINC,  UNFILTERED TOTAL" | dd_AVE$`Parameter Name`=="ARSENIC,    UNFILTERED TOTAL"  | dd_AVE$`Parameter Name`=="FLUORIDE, UNFILTERED REACTIVE" )
p5 <- ggplot(data=dd_Select, aes(y= dd_Select$'Parameter Name', x= Value, color = Sector)) + geom_boxplot() +theme_bw() +ylab("Parameter Name") +xlab("Value")
show(p5)

outliers <- boxplot.stats(dd_AVE$Value)$out
dd_AVE <- dd_AVE[!dd_AVE$Value %in% outliers]


