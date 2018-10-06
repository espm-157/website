
library(jsonlite)
library(yaml)
library(dplyr)
library(purrr)
#lessons <- read_yaml("data/lessons.yml")
json <- fromJSON(toJSON(lessons))[[1]]
df <- map_dfc(json, as.character)
df2 <- map_dfc(df, dplyr::na_if, "NULL")

# readr::write_tsv(df2, "data/lessons.tsv")

write_json(df2, "data/lessons.json", pretty=TRUE)
