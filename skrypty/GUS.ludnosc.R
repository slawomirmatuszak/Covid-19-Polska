library(bdl)
library(tidyverse)
library(lubridate)

# GUS ludnosc -------------------------------------------------------------

ludnosc.powiat <- get_data_by_variable("60641", unitLevel = "5", year = 2019)
ludnosc.powiat <- ludnosc.powiat %>%
  mutate(teryt = paste0(str_sub(id, 3,4), (str_sub(id, 8,9)))) %>%
  select(KTS.powiat=id, teryt,ludnosc=val)

ludnosc.wojewodztwo <- get_data_by_variable("60641", unitLevel = "2", year = 2019)
ludnosc.wojewodztwo <- ludnosc.wojewodztwo %>%
  mutate(teryt = paste0(str_sub(id, 3,4))) %>%
  select(KTS.wojewodztwo=id, teryt,ludnosc=val)

save(ludnosc.powiat, ludnosc.wojewodztwo, file="./dane/ludnosc.polska.GUS.Rda")
