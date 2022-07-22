rm(list=ls())

setwd("L:/Code/yang/figures")

library(dplyr)
library(ggplot2)
library(readxl)

t2 <- read_excel("L:/Data/Highmark/yang/utilization_densityplots/Aqueduct_table2_20220103.xlsx")
t3 <- read_excel("L:/Data/Highmark/yang/utilization_densityplots/Aqueduct_table3_20220103.xlsx")

# gtt
gtt <- t2[12:32,]
gtt <- gtt %>%
  select(gtt_week = `...1`, `Pre-COVID`, COVID) %>%
  mutate(`Pre-COVID` = as.numeric(gsub(",", "", sub(" *\\(.*", "", `Pre-COVID`))),
         COVID = as.numeric(gsub(",", "", sub(" *\\(.*", "", COVID))),
         gtt_week = as.numeric(gtt_week))

gtt_pre <- data.frame(gtt_week = rep(gtt$gtt_week, gtt$`Pre-COVID`), cohort = "Pre-COVID")
gtt_covid <- data.frame(gtt_week = rep(gtt$gtt_week, gtt$`COVID`), cohort = "COVID")
gtt_all <- rbind(gtt_pre, gtt_covid)

ggplot(data = gtt_all, aes(x = gtt_week)) + 
  geom_density(aes(fill = cohort, colour = cohort), adjust = 3, alpha = 0.5) + 
  labs(title = "Timing of GTT", x = "Weeks Gestation", 
       caption = "Note: Only births with GTT week between 10 and 30 are included.") + 
  theme(legend.title = element_blank(),
        plot.caption = element_text(hjust = 0))

# ffs
ffs <- t2[50:64,]
ffs <- ffs %>%
  select(ffs_week = `...1`, `Pre-COVID`, COVID) %>%
  mutate(`Pre-COVID` = as.numeric(gsub(",", "", sub(" *\\(.*", "", `Pre-COVID`))),
         COVID = as.numeric(gsub(",", "", sub(" *\\(.*", "", COVID))),
         ffs_week = as.numeric(ffs_week))

ffs_pre <- data.frame(ffs_week = rep(ffs$ffs_week, ffs$`Pre-COVID`), cohort = "Pre-COVID")
ffs_covid <- data.frame(ffs_week = rep(ffs$ffs_week, ffs$`COVID`), cohort = "COVID")
ffs_all <- rbind(ffs_pre, ffs_covid)

ggplot(data = ffs_all, aes(x = ffs_week)) + 
  geom_density(aes(fill = cohort, colour = cohort), adjust = 3, alpha = 0.5) + 
  labs(title = "Timing of FFS", x = "Weeks Gestation",
       caption = "Note: Only births with FFS week between 14 and 28 are included.") + 
  theme(legend.title = element_blank(),
        plot.caption = element_text(hjust = 0))

# first ultrasound
fus <- t3[27:49,]
fus <- fus %>%
  select(fus_week = `...1`, `Pre-COVID` = `Pre-COVID, GA 5weeks by March 10`, 
         COVID = `COVID, GA 5weeks by March 10`) %>%
  mutate(`Pre-COVID` = as.numeric(gsub(",", "", sub(" *\\(.*", "", `Pre-COVID`))),
         COVID = as.numeric(gsub(",", "", sub(" *\\(.*", "", COVID))),
         fus_week = as.numeric(fus_week))

fus_pre <- data.frame(fus_week = rep(fus$fus_week, fus$`Pre-COVID`), cohort = "Pre-COVID")
fus_covid <- data.frame(fus_week = rep(fus$fus_week, fus$`COVID`), cohort = "COVID")
fus_all <- rbind(fus_pre, fus_covid)

ggplot(data = fus_all, aes(x = fus_week)) + 
  geom_density(aes(fill = cohort, colour = cohort), adjust = 3, alpha = 0.5) + 
  labs(title = "Timing of first ultrasound", x = "Weeks Gestation",
       caption = "Note: Only births with week of first ultrasound between 2 and 24 were included.") + 
  theme(legend.title = element_blank(),
        plot.caption = element_text(hjust = 0))

