
# Original population data is segregated by sex
# we need to aggregate the data by sex and also by range of age

library(vroom)
library(dplyr)

uk_population <- vroom("https://raw.githubusercontent.com/sgarciapuga/R/master/uk_covid/uk_popupation.csv")


uk_pop_agregated <- uk_population %>% 
  group_by(nation) %>% 
  transmute("0-4" = sum(across(c(m_19_0:m_19_4, f_19_0:f_19_4))),
            "5-9" = sum(across(c(m_19_5:m_19_9, f_19_5:f_19_9))),				
            "10-14" = sum(across(c(m_19_10:m_19_14, f_19_10:f_19_14))),
            "15-19" = sum(across(c(m_19_15:m_19_19, f_19_15:f_19_19))),
            "20-24" = sum(across(c(m_19_20:m_19_24, f_19_20:f_19_24))),
            "25-29" = sum(across(c(m_19_25:m_19_29, f_19_25:f_19_29))),
            "30-34" = sum(across(c(m_19_30:m_19_34, f_19_30:f_19_34))),
            "35-39" = sum(across(c(m_19_35:m_19_39, f_19_35:f_19_39))),
            "40-44" = sum(across(c(m_19_40:m_19_44, f_19_40:f_19_44))),
            "45-49" = sum(across(c(m_19_45:m_19_49, f_19_45:f_19_49))),
            "50-54" = sum(across(c(m_19_50:m_19_54, f_19_50:f_19_54))),
            "55-59" = sum(across(c(m_19_55:m_19_59, f_19_55:f_19_59))),
            "60-64" = sum(across(c(m_19_60:m_19_64, f_19_60:f_19_64))),
            "65-69" = sum(across(c(m_19_65:m_19_69, f_19_65:f_19_69))),
            "70-74" = sum(across(c(m_19_70:m_19_74, f_19_70:f_19_74))),
            "75-79" = sum(across(c(m_19_75:m_19_79, f_19_75:f_19_79))),
            "80-84" = sum(across(c(m_19_80:m_19_84, f_19_84:f_19_84))),
            "85-89" = sum(across(c(m_19_85:m_19_89, f_19_85:f_19_89))),
            "90+"=  sum(across(c(m_19_60:m_19_90, f_19_60:f_19_90))))

write.csv(uk_pop_agregated, "uk_population_range_age.csv", row.names = FALSE)
