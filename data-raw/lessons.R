library(yaml)
library(jsonlite)
library(magrittr)
library(tidyverse)
library(lubridate)


first_day <- "2019-08-28" %>% as_date()
first_friday <- "2019-08-30"%>% as_date()
wday(first_day, label=TRUE)

all_weds <- first_day + weeks(0:15)
all_friday <- first_friday + weeks(0:15)
dates <- sort(c(all_weds, all_friday)) 


dates <- dates[dates < as_date("2019-12-01")]
dates <- dates[dates != as_date("2019-11-29")]
dates <- dates[dates != as_date("2019-09-06")]


lessons <- read_yaml("data/lessons.yml") %>%
  toJSON() %>% 
  fromJSON(simplifyVector = TRUE, flatten = TRUE) %>%
  getElement("lessons") %>%
  as_tibble() %>% mutate_all(as.character)

lessons$date <- lubridate::as_date(lessons$date)

lessons <- lessons %>% mutate(date = date+4)
              


lessons$date[!is.na(lessons$date)] <- dates

lessons %>% write_csv("data/lessons.csv")
list(lessons=lessons) %>% toJSON() %>% write_yaml("data/lessons.yml")

length(dates)
sum(!is.na(lessons$date))


