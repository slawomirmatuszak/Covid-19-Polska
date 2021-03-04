library(tidyverse)
library(lubridate)
library(scales)
library(tidyverse)
library(lubridate)
library(scales)

dane <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/locations.csv")

dane2 <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations-by-manufacturer.csv")

dane3 <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv")

szczepienia <- dane3 %>% 
  filter(!is.na(total_vaccinations)) %>% 
  group_by(location) %>% 
  filter(date == max(date),
         !location %in% c("World", "European Union")) %>% 
  left_join(dane, by="location")


a <- szczepienia %>% 
  group_by(vaccines) %>% 
  summarise(total = sum(total_vaccinations))

firmy <- a %>% 
  mutate(producent = case_when(vaccines == "EpiVacCorona, Sputnik V" ~ "Rosja",
                               vaccines == "Moderna, Oxford/AstraZeneca, Pfizer/BioNTech, Sinopharm/Beijing, Sputnik V" ~ "Zachód, Chiny, Rosja",
                               vaccines == "Oxford/AstraZeneca, Pfizer/BioNTech, Sinopharm/Beijing, Sinopharm/Wuhan, Sputnik V" ~ "Zachód, Chiny, Rosja",
                               vaccines == "Oxford/AstraZeneca, Pfizer/BioNTech, Sinopharm/Beijing, Sputnik V" ~ "Zachód, Chiny, Rosja",
                               vaccines == "Oxford/AstraZeneca, Pfizer/BioNTech, Sputnik V" ~ "Zachód, Rosja",
                               vaccines == "Oxford/AstraZeneca, Sinopharm/Beijing" ~ "Zachód, Chiny",
                               vaccines == "Oxford/AstraZeneca, Sinopharm/Beijing, Sputnik V" ~ "Zachód, Chiny, Rosja",
                               vaccines == "Oxford/AstraZeneca, Sinopharm/Beijing" ~ "Zachód, Chiny",
                               vaccines == "Oxford/AstraZeneca, Sinovac" ~ "Zachód, Chiny",
                               vaccines == "Oxford/AstraZeneca, Sputnik V" ~ "Zachód, Rosja",
                               vaccines == "Pfizer/BioNTech, Sinopharm/Beijing" ~ "Zachód, Chiny",
                               vaccines == "Pfizer/BioNTech, Sinovac" ~ "Chiny",
                               vaccines == "Oxford/AstraZeneca, Sinopharm/Beijing, Sputnik V" ~ "Zachód, Chiny, Rosja",
                               vaccines == "Oxford/AstraZeneca, Sinovac" ~ "Zachód, Chiny",
                               vaccines == "Oxford/AstraZeneca, Sputnik V" ~ "Zachód, Rosja",
                               vaccines == "Pfizer/BioNTech, Sinopharm/Beijing" ~ "Zachód, Chiny",
                               vaccines == "Sinopharm/Beijing" ~ "Chiny",
                               vaccines == "Sinopharm/Beijing, Sinopharm/Wuhan, Sinovac" ~ "Chiny",
                               vaccines == "Pfizer/BioNTech, Sinovac" ~ "Zachód, Chiny",
                               vaccines == "Sinovac" ~ "Chiny",
                               vaccines == "Sputnik V" ~ "Rosja",
                               TRUE ~ "Zachód")) %>% 
  group_by(producent) %>% 
  summarise(dozy = sum(total))

ggplot(firmy, aes(reorder(producent, dozy), dozy))+
  geom_col(fill = "steelblue")+
  scale_y_continuous(labels = comma, limits = c(0,2e8))+
  labs(x = "producent",
       y = "ilość doz")+
  coord_flip()+
  theme_bw()
ggsave("./wykresy/Zachod.CN.RU.png", units = "in", width = 8, height = 5)
