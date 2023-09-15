#----- initializing -----#
library(tidyverse)
library(dplyr)
library(readxl)
library(here)

# Municipality Code
citycode <- 
  readxl::read_excel(
    here::here("data/rawdata/municipal_code.xls"),  
    sheet = 1,
    skip = 1,
    col_names = 
      c("citycode",     
        "prefecture", 
        "city", 
        "prefecture_kana",
        "city_kana"
        )
    ) %>% 
  dplyr::select(
    citycode, 
    prefecture, 
    city
    ) %>% 
  dplyr::filter(
    !is.na(city)
    )

readr::write_excel_csv(
  citycode, 
  here::here("data/citycode.csv")
  )