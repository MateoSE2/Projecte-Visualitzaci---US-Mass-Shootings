library(tidyverse)
library(dplyr)
library(tidyr)


NEWShootings <- read.csv("~/Desktop/NEWShootings.csv") #Aquest dataset se li ha canviat les sigles del estat pel nom sencer en pyhton
NEWShootings <- NEWShootings%>%separate(date, sep="-", into=c("year", "month", "day"))
Poblation_dataset <- read.csv("~/Desktop/Projecte VD/Datasets Filtrados/Poblation_dataset.csv")

Deads <- NEWShootings%>%group_by(year, state)%>%summarise(total_deads= n())
Deads_dataset <- merge(x = Deads, y = Poblation_dataset, by = c("state", "year"))%>%select(state, year, total_deads, poblation)
Deads_dataset <- Deads_dataset%>%mutate(ratio_deads = `total_deads`/poblation)
#write.csv(Deads_dataset, "Deads_dataset.csv")
