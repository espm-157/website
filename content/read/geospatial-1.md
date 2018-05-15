---
title: "Geospatial Data & Visualization"
---


## Reading

Our geospatial module is meant only as an introduction to geospatial data, an already-rich area in R that is in mid-Renaissance right now, just as tabular data was in the past few years since the introduction of `dplyr` and the rest of `tidyverse`.  

GeoSpatial Textbook: **[Geocomputation with R](https://geocompr.robinlovelace.net)** (Lovelace, Nowosad, Muenchow)

- **[Chapter 1: Introduction](https://geocompr.robinlovelace.net/intro.html)**

### Basic Visualization tools

Also read over the following vignettes:

- Static maps: **[tmap Vignette](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html)**
- Interactive maps: **[mapview Vignette](https://r-spatial.github.io/mapview/articles/articles/mapview_01-basics.html)**


## Watch


### UPDATED

- DataCamp now has a more modern course from Zev Ross, **[Spatial Analysis in R with `sf` and `raster`](https://www.datacamp.com/courses/spatial-analysis-in-r-with-sf-and-raster)** that more closely aligns with the tools we will be using in this module (matching the Geocomputation reading above).  

- ~~Charlotte Wickham's DataCamp course, **[Working with Geospatial Data](https://www.datacamp.com/courses/working-with-geospatial-data-in-r)** doesn't cover the new/emerging spatial suite we will focus on, but still very relevant. Chapter 3, introducing the `raster` side of things, is (for the moment) the same one we will use. However, the `sf` package replaces the vector manipulation and mapping functions of `sp`, though many concepts carry over.  Least relevant are the older plotting strategies covered there, such as `ggmap`, where we will rely on newer `tmap`, `ggplot::geom_sf`, and `mapview` packages.~~


### References

- I highly recommend browsing the [excellent vignettes](https://cran.r-project.org/web/packages/sf/) of the `sf` package.  Vignettes are provided with most well-developed R packages and often provide the best and most up-to-date introduction to the package.

- Follow the [r-spatial blog & website](http://r-spatial.org/) for the latest news from the r-spatial community.  (Speaking of which, you can also follow the [Tidyverse website/blog](https://www.tidyverse.org/articles/) for updates from there.)  Most of the package developers involved in these projects are also active in the `#rstats` corner of Twitter.

