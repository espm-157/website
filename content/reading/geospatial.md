---
title: "Geospatial Reading - I"
---

You've probably noticed that our textbook doesn't have any section on geospatial data.  Most exsiting resources on geospatial data in R still cover the older `sp` library, including the classic [Applied Spatial Data Analysis in R](http://www.asdar-book.org/) (physical) textbook (by authors of `sp` and related packages, who are also authors of `sf`).  

The under-development version of an upcoming textbook, [Geocomputation with R](http://robinlovelace.net/geocompr/), aims to provide a more thorough treatment of the latest iteration on spatial data in R, including the `sf` package and tidyverse-style programming.  Please take a look over the [introduction](http://robinlovelace.net/geocompr/intro.html) for background on spatial data analysis we will be exploring in this unit. 


## Other resources

- I highly recommend browsing the [excellent vignettes](https://cran.r-project.org/web/packages/sf/) of the `sf` package.  Vignettes are provided with most well-developed R packages and often provide the best and most up-to-date introduction to the package.

- Follow the [r-spatial blog & website](http://r-spatial.org/) for the latest news from the r-spatial community.  (Speaking of which, you can also follow the [Tidyverse website/blog](https://www.tidyverse.org/articles/) for updates from there.)  Most of the package developers involved in these projects are also active in the `#rstats` corner of Twitter.

- Charlotte Wickham's Spatial course on DataCamp, based on older `sp` library
<https://www.datacamp.com/courses/working-with-geospatial-data-in-r>, but still very relevant.  The raster side of things is still the same, though the `sf` package replaces the vector manipulation and mapping functions of `sp`, and native `ggplot2` support for `sf` is preferable to the older work-arounds of `ggmaps`.  


### More from DataCamp

Unrelated to GeoSpatial data, a few instructors with lessons on DataCamp that I would highlight:

- https://www.datacamp.com/instructors/garrettgrolemund
- https://www.datacamp.com/instructors/drobinson
- https://www.datacamp.com/instructors/mine
- https://www.datacamp.com/instructors/hwickham