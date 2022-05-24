guns <- read.csv("~/Desktop/nics-firearm-background-checks.csv")
poblation <- read.csv("~/Desktop/nst-est2020-alldata.csv")

library(tidyverse)
library(dplyr)
library(tidyr)
library(reshape)


poblation <- select(poblation, NAME, starts_with("POPESTIMATE"))
poblation = rename(poblation, c( NAME= "state", POPESTIMATE2010="2010", POPESTIMATE2011= "2011", POPESTIMATE2012="2012", POPESTIMATE2013= "2013", POPESTIMATE2014="2014", POPESTIMATE2015="2015", POPESTIMATE2016="2016", POPESTIMATE2017="2017", POPESTIMATE2018="2018", POPESTIMATE2019="2019", POPESTIMATE2020="2020"))
poblation <- poblation%>%select("state", "2015", "2016", "2017", "2018", "2019", "2020")
poblation <- poblation%>%gather("2015", "2016", "2017", "2018", "2019", "2020", key='year', value="poblation")
poblation <- poblation%>%filter(state !="United States")%>%filter(state!="Northeast Region")%>%filter(state !="South Region")%>%filter(state!="West Region")%>%filter(state!="Midwest Region")
#write.csv(poblation, "Poblation_dataset.csv")
View(poblation)

guns <- guns%>%separate(month, sep="-", into=c("year", "month"))
guns <- guns %>%  select(state, year, totals) %>% group_by(state, year) %>% summarise(sum = sum(totals))
guns <- guns%>%filter(year >2014 & year < 2021)
guns = rename(guns, c( sum= "total of guns"))
guns <- guns%>%filter(state!="Guam")%>%filter(state!="Mariana Islands")%>%filter(state!="Virgin Islands")

GUNS <- merge(x = guns, y = poblation, by = c("state", "year"))
GUNS <- GUNS%>%mutate(ratio = `total of guns`/poblation)
#write.csv(GUNS, "GunsOwnerShip_dataset.csv")
