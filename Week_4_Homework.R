library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

survyes %>% 
  filter(weight > 30 & weight < 60)

biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  summarise(max_weight = max(weight)) 

biggest_critters %>% arrange(-max_weight)

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(-(n))

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(plot_id) %>% 
  tally() %>% 
  arrange(-(n))

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(year) %>% 
  tally() %>% 
  arrange(-(n))

surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id,sex) %>% 
  mutate(avg_weight = mean (weight)) %>% 
  select(species_id, sex, weight, avg_weight)
surveys_avg_weight

above_average <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)
surveys_avg_weight
