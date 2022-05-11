Etnies <- read.csv("~/Desktop/sc-est2019-alldata6.csv")

library(tidyverse)
library(dplyr)
library(tidyr)
library(reshape)


Etnies  = rename(Etnies, c( ORIGIN='origin', RACE='race', AGE= 'age', NAME= "state", POPESTIMATE2010="year_2010", POPESTIMATE2011= "year_2011", POPESTIMATE2012="year_2012", POPESTIMATE2013= "year_2013", POPESTIMATE2014="year_2014", POPESTIMATE2015="year_2015", POPESTIMATE2016="year_2016", POPESTIMATE2017="year_2017", POPESTIMATE2018="year_2018", POPESTIMATE2019="year_2019"))
etnies <- Etnies%>%select("state", "origin", "race", "year_2015", "year_2016", "year_2017", "year_2018", "year_2019")
etnies <- etnies%>%group_by(state, origin, race)%>%summarise(total_2015 = sum(year_2015), total_2016 = sum(year_2016), total_2017 = sum(year_2017), total_2018 = sum(year_2018), total_2019 = sum(year_2019))
etnies <- etnies%>% rename(c(total_2015= "2015", total_2016 = "2016", total_2017= "2017", total_2018= "2018", total_2019 = "2019"))
#write.csv(etnies, "etnies_dataset.csv")