# 🛰 Environmental justice

In this module we work with spatial vector and raster data to test whether the legacy of
redlining is still visible in the vegetation of American cities today. From this module on,
Kilo Code runs in **code mode**, which lets the agent edit files and run code.

### Learning goals

- read and manipulate spatial vector data at scale
- discover and stream satellite imagery from a public catalog
- compute a vegetation index from remote sensing bands and summarize it by neighborhood
- make interactive maps that a reader can explore
- understand how structural racism shapes urban ecology

## Background

In 2020, [Christopher Schell](https://directory.tacoma.uw.edu/employee/cjschell) and
colleagues published a review in *Science*,
[The ecological and evolutionary consequences of systemic racism in urban environments](https://doi.org/10.1126/science.aay4497).
They show that systemic racism and classism shape ecological and evolutionary processes in
cities. The University of Washington
[press release](https://www.washington.edu/news/2020/08/13/systemic-racism-has-consequences-for-all-life-in-cities/)
is a good short introduction.

In the 1930s the federal Home Owners' Loan Corporation (HOLC) graded the neighborhoods of
more than 200 US cities from A ("best") to D ("hazardous"). The grades were written in the
neutral language of real estate appraisal, but surveyors recorded the race and ethnicity of
each neighborhood's residents, and the neighborhoods graded D were overwhelmingly those of
Black, immigrant and working-class families. Lenders then used the maps to steer mortgage
credit away from those neighborhoods, a practice now called redlining.

Disinvestment lasted for decades after the maps were drawn. Street trees and parks take
decades to grow and maintain, so the vegetation we measure today still records where that
investment did and did not happen. Figure 2 of Schell et al. shows that the Normalized
Difference Vegetation Index (NDVI), a satellite measure of green vegetation, tracks the
historical HOLC grade. We reproduce that pattern for several cities and ask whether it holds
across the country or only in particular places.

## Data

- **[Mapping Inequality](https://dsl.richmond.edu/panorama/redlining/)** (vector data)
  provides the digitized HOLC maps. Please read the introduction on that site before class.
- **[Sentinel-2](https://planetarycomputer.microsoft.com/dataset/sentinel-2-l2a)** (raster
  data) provides 10 m satellite imagery, which we find through a
  [STAC](https://stacspec.org/en) catalog.

## Tools

Spatial data come in two basic types. **Vector** data describe points, lines and polygons,
such as the boundary of each HOLC neighborhood. **Raster** data are grids of pixels, such as
a satellite image in which each pixel records reflectance in several wavelength bands.

Both types of data are now large enough that downloading whole files is slow or impossible.
The tools in this module are **cloud native**: data are stored in formats that let a program
read only the part it needs, over an ordinary web connection, without downloading the rest.

- **[DuckDB spatial](https://duckdb.org/docs/stable/core_extensions/spatial/overview)**
  through `ibis` handles the vector data. We use the same table verbs as in Module 1, plus
  spatial operations such as intersections and areas.
- **Cloud-optimized GeoTIFFs (COGs)** store the Sentinel-2 imagery. A COG is an ordinary
  GeoTIFF whose internal tiles and lower-resolution overviews let a program request only the
  pixels inside one city at the resolution it needs.
- **[STAC](https://stacspec.org/en)** (SpatioTemporal Asset Catalog) is a standard way to
  describe imagery, so that we can search for scenes by location, date and cloud cover.
- **`odc.stac` and `rioxarray`** load the imagery lazily as arrays, in the same way that
  `ibis` loads tables lazily.
- **[leafmap](https://leafmap.org/)** draws interactive maps on top of
  [MapLibre](https://maplibre.org/maplibre-gl-js/docs/).

## Further reading

The [Cloud-Native Geospatial Forum](https://cloudnativegeo.org/blog/) publishes clear
introductions to these ideas.

- [Why does cloud-native geospatial matter to GIS professionals?](https://cloudnativegeo.org/blog/2025/02/why-does-cloud-native-geospatial-matter-to-gis-professionals/)
  explains what cloud native means and why it changes how we work with spatial data.
- The [Cloud-Optimized Geospatial Formats Guide](https://guide.cloudnativegeo.org/overview.html)
  surveys the formats, and its
  [chapter on COGs](https://guide.cloudnativegeo.org/cloud-optimized-geotiffs/intro.html)
  covers tiling, overviews and range requests.
- [Where is COG for vector?](https://cloudnativegeo.org/blog/2023/10/where-is-cog-for-vector/)
  explains why vector data needed different formats, such as
  [GeoParquet](https://guide.cloudnativegeo.org/geoparquet/).
- [Analysis-ready data in practice from a cloud-native perspective](https://cloudnativegeo.org/blog/2024/06/analysis-ready-data-in-practice-from-a-cloud-native-perspective/)
  discusses what makes satellite data ready for analysis.

## Template

<a href="https://github.com/espm-157/spatial-python-template"><i class="i-simpleicons github"></i> spatial template</a>
