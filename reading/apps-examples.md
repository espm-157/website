# 🧭 Frameworks and examples

Every app on this page is built from the three layers described in
[HTML, CSS and JavaScript](apps-web-basics.md). Each library adds to one or more of these layers.

| Layer | What libraries add | Examples |
|---|---|---|
| JavaScript | data, charts and maps drawn into an HTML element | DuckDB-WASM, Observable Plot, D3, MapLibre, deck.gl |
| CSS | colors, fonts and layouts that adapt to the screen | Pico CSS, Bootstrap, Tailwind CSS |
| HTML | new elements such as tabs, drawers and dialogs, defined with JavaScript | Web Awesome |
| All three | components written together and compiled into plain files | Svelte, React, Vue, Observable Framework |

The starter app uses plain HTML and CSS and two JavaScript libraries: DuckDB-WASM reads the data
and Observable Plot draws the chart. This page tours the major libraries for each layer through
apps that people actually use, grouped by the themes of Modules 1 to 3. Use it to find an app
worth imitating, and then find out how that app was built.

## Reading an app

Every client-side app can be read in the same way. Open the app, then open the browser's
developer tools.

- The **network tab** lists every file the app loads: its scripts, its data files, and its map
  tiles. Reload the page with the tab open to see which data an app reads, how large they are,
  and whether it queries a server or reads static files.
- The **elements** or **inspector** tab shows the HTML of the page and the CSS rules applied to
  each element. Most apps have a `<div>` or `<canvas>` element into which a chart or map library
  draws.
- The **sources** or **debugger** tab shows the JavaScript libraries. A file named `maplibre-gl.js` or
  `duckdb-wasm` tells you a lot about how the app works.
- The **device toolbar** (the phone icon in Chrome and Firefox) shows the app at the width of a
  phone. Try it on every app below, including your own.
- Many of these apps are open source. Look for a link to the code and the license. An app whose
  code you may reuse, under a license you understand, is the best kind of example.

Ask your coding agent to explain what it finds, the same way you asked it to explain an unfamiliar
`ibis` expression in Module 1.

## Charts

Chart libraries are JavaScript. Each one takes data and draws a chart into an element on the page,
usually as SVG, which is itself a kind of HTML that CSS can style. Observable Plot is one of several grammar-of-graphics libraries for the browser.
[Vega-Lite](https://vega.github.io/vega-lite/examples/) is the library underneath Python's
[Altair](https://altair-viz.github.io/gallery/index.html), so a chart you write in Altair in a
notebook can be exported as a Vega-Lite spec and embedded in a web page.
[D3](https://d3js.org/) is the lower-level library that Plot is built on, and most custom
newsroom graphics use it directly. [Apache ECharts](https://echarts.apache.org/examples/en/index.html)
and [Plotly.js](https://plotly.com/javascript/) are chart libraries with many ready-made chart
types and built-in zooming and tooltips.

These apps build on the climate data from Module 1.

- 🌡 The [Our World in Data CO₂ explorer](https://ourworldindata.org/explorers/co2) charts the
  same file the starter app reads, with menus for the measure, the countries and the time range,
  and a toggle between a chart, a map and a table. Its code, the
  [Grapher](https://github.com/owid/owid-grapher), is open source and written in TypeScript with
  React and D3.
- 🌡 [Show your stripes](https://showyourstripes.info/) reduces a temperature record to one
  stripe of color per year. The reader picks a country or region and the stripes redraw. It is a
  good example of a single, well-chosen chart with one control.
- 🌡 [Climate Reanalyzer](https://climatereanalyzer.org/clim/t2_daily/) draws daily global
  temperature with one line per year and highlights the current year against all earlier ones.
- 🌡 NOAA's [Climate at a Glance](https://www.ncei.noaa.gov/access/monitoring/climate-at-a-glance/global/time-series)
  lets a reader choose a region, a variable, a season and a base period, and draws the time series.

## Maps

Map libraries are JavaScript, together with a small CSS file for the zoom buttons and popups.
The map fills one `<div>` on the page and draws with the computer's graphics card. In Module 2 we
used MapLibre through leafmap, which writes this JavaScript for us. Writing MapLibre in JavaScript
directly opens up much more of it. The [MapLibre examples](https://maplibre.org/maplibre-gl-js/docs/examples/)
include a [globe](https://maplibre.org/maplibre-gl-js/docs/examples/display-a-globe-with-a-vector-map/),
[3D terrain](https://maplibre.org/maplibre-gl-js/docs/examples/3d-terrain/), and a
[cloud-optimized GeoTIFF](https://maplibre.org/maplibre-gl-js/docs/examples/add-a-cog-raster-source/)
read directly in the browser with the
[maplibre-cog-protocol](https://github.com/geomatico/maplibre-cog-protocol) plugin, so the COGs
from Module 2 can be shown on a static site with no tile server.
[PMTiles](https://docs.protomaps.com/pmtiles/) does the same for vector data: one file holds all
the tiles for a map, and the browser requests only the tiles it needs. You can drop a PMTiles file
on the [PMTiles viewer](https://pmtiles.io/) to inspect it.

Other map libraries are worth knowing. [deck.gl](https://deck.gl/examples) draws millions of
points, arcs and hexagons on the GPU, and can be layered on a MapLibre map.
[kepler.gl](https://kepler.gl/demo) is a complete map app built on deck.gl, into which you can
drop a CSV or GeoJSON file. [Leaflet](https://leafletjs.com/)
is older and simpler and does not use WebGL, and [OpenLayers](https://openlayers.org/en/latest/examples/)
has the widest support for map projections and GIS formats.

These apps build on the environmental justice theme of Module 2.

- 🛰 [Tree Equity Score](https://www.treeequityscore.org/map) scores every neighborhood in the US on
  tree canopy relative to income, race, age and heat. It asks the same question as Module 2 for
  the present day, and a reader can search for their own address.
- 🛰 The [NYC Street Tree Map](https://tree-map.nycgovparks.org/) shows every street tree in New
  York City, with its species and the ecosystem services it provides. It shows how far one city's
  open data can go.
- 🛰 The [Climate and Economic Justice Screening Tool](https://public-environmental-data-partners.github.io/j40-cejst-2/en/)
  was the federal map of disadvantaged communities. It was taken offline in January 2025, and
  [Public Environmental Data Partners](https://screening-tools.com/climate-economic-justice-screening-tool)
  now host a copy on GitHub Pages, the same service we use. Because the app is a set of static
  files, anyone with a copy of the files could put it back online.
- 🛰 The [Copernicus Browser](https://browser.dataspace.copernicus.eu/) shows Sentinel-2 imagery
  for any date and place, with band combinations and indices such as NDVI computed on the fly.
- 🛰 [STAC Browser](https://browser.moregeo.it/external/planetarycomputer.microsoft.com/api/stac/v1/)
  explores any STAC catalog. The link opens the Planetary Computer catalog we searched in
  Module 2. It is open source and built
  with Vue and OpenLayers.
- 🛰 The [Overture Maps explorer](https://explore.overturemaps.org/) shows buildings, places and
  roads for the whole world. It is built with React, MapLibre and PMTiles, and its
  [code](https://github.com/OvertureMaps/explore-site) is open source.
- 🌡 [Climate TRACE](https://climatetrace.org/explore) maps greenhouse gas emissions by country, sector
  and individual facility. [Probable Futures](https://probablefutures.org/maps) maps the days of
  extreme heat and drought expected at different levels of warming, and
  [Climate Central's coastal risk map](https://coastal.climatecentral.org/map/) shows land below
  projected sea level.
- 🌡 CarbonPlan's [forest carbon risk](https://carbonplan.org/research/forest-risks) and
  [downscaled climate projections](https://carbonplan.org/research/cmip6-downscaling)
  maps each come with a written explainer. Their map library,
  [@carbonplan/maps](https://github.com/carbonplan/maps), reads gridded climate data from Zarr
  files directly in the browser.
- The [Global Forest Watch map](https://www.globalforestwatch.org/map/), now part of Global Nature
  Watch, and
  [earth.nullschool.net](https://earth.nullschool.net/) show what a map can do with a time slider
  and with animation.

## Linked views and SQL in the browser

When a reader selects a range in one chart and every other chart filters to match, the charts
are linked. [Mosaic](https://idl.uw.edu/mosaic/examples/) links Observable Plot charts through
DuckDB-WASM, so each selection becomes a SQL query. Its
[ten million flights](https://idl.uw.edu/mosaic/examples/flights-10m.html) and
[Gaia star catalog](https://idl.uw.edu/mosaic/examples/gaia.html) examples filter millions of rows
as fast as the reader can drag. The [DuckDB shell](https://shell.duckdb.org/) runs DuckDB-WASM in
a browser tab, which is a quick way to test a query on a remote Parquet file before you put it in
your app.

[Observable Framework](https://github.com/observablehq/framework/tree/main/examples) builds a
whole data site from markdown pages with code in them, and adds a sidebar, a grid of cards and
dark mode. Its examples include a dashboard of the
[US electricity grid](https://observablehq.observablehq.cloud/framework-example-eia/) and a
[map of US dams](https://observablehq.observablehq.cloud/framework-example-us-dams/).

## Models and simulations

A model explorer runs a calculation in the browser every time a slider moves. JavaScript is fast
enough for most models from an ecology course, and these apps show how far the idea goes.

- 🌡 [En-ROADS](https://en-roads.climateinteractive.org/) is a global climate policy simulator.
  Each slider is a policy, such as a carbon price or a coal phase-out, and the projected warming
  updates as the reader moves it. It was built by Climate Interactive and the MIT Sloan School of
  Management, and is often played as a group game in classes. The model is compiled to WebAssembly with the open source
  [SDEverywhere](https://github.com/climateinteractive/SDEverywhere), so it runs entirely in the
  browser.
- 🛰 [Parable of the Polygons](https://ncase.me/polygons/) lets the reader play a model of
  residential segregation, in which a small preference among individuals produces strongly
  segregated neighborhoods. It pairs well with the history in Module 2.
- [Complexity Explorables](https://www.complexity-explorables.org/) has short interactive models
  from ecology and other fields, such as a
  [predator and prey model](https://www.complexity-explorables.org/explorables/lotka-martini/).
- Nicky Case's [What Happens Next?](https://ncase.me/covid-19/) and the Washington Post's
  [epidemic simulator](https://www.washingtonpost.com/graphics/2020/world/corona-simulator/) are
  two widely read model explorers from 2020. [Seeing Theory](https://seeing-theory.brown.edu/basic-probability/index.html)
  does the same for statistics.

## Text and search

The tools from Module 3 can also run in the browser, with one important limit: any API key in a
client-side app is public. An app can call the NRP language model only through a server that
holds the key. A static app can still search text by meaning if the paragraph embeddings are
computed ahead of time and saved to a file, and the reader's query is embedded in the browser by
[Transformers.js](https://huggingface.co/docs/transformers.js/index).

- 📜 [Climate Policy Radar](https://app.climatepolicyradar.org/) searches the text of climate laws
  and policies from every country, using machine learning to tag and find passages.
  [Climate Change Laws of the World](https://climate-laws.org/) is a related database. Both do for
  national laws roughly what Module 3 did for listing rules.
- 📜 [Embedding Atlas](https://apple.github.io/embedding-atlas/) draws a map of embeddings in which
  each point is a document or passage, with search, nearest neighbors and filters on the other
  columns. It works with Mosaic and can be embedded in a page or used from Python. See its
  [examples](https://apple.github.io/embedding-atlas/examples/). The older
  [Embedding Projector](https://projector.tensorflow.org/) does something similar.
- 📜 [Semantle](https://semantle.com/) is a word-guessing game in which the only clue is how close
  each guess is to the answer in embedding space. It is a "guess, then reveal" app built on the
  same idea as semantic search.
- [WebLLM Chat](https://chat.webllm.ai/) runs an open-weight language model entirely in the browser. The
  model download is large, often several gigabytes, which is a cost to weigh for any reader on a
  phone.

## Streamlit and Shiny galleries

The [Streamlit gallery](https://streamlit.io/gallery), the
[Shiny for Python gallery](https://shiny.posit.co/py/gallery/) and the
[Shiny for R gallery](https://shiny.posit.co/r/gallery/) collect hundreds of data apps, most with
a link to their source code. These apps run on a server. Free hosted apps are put to sleep when
nobody uses them, so the first visit can take a minute while the server wakes up, which is the
cost of server-side apps described in the [Module 4 introduction](apps-intro.md). Many of them
translate directly into a client-side app. The data file becomes a static CSV or Parquet file read
by DuckDB-WASM, each widget becomes an HTML input, and each chart becomes an Observable Plot or
Vega-Lite chart. These apps would translate well.

- 🌡 The [Seattle weather dashboard](https://demo-seattle-weather.streamlit.app/) shows summary
  numbers for one year at the top, then lets the reader compare temperature, precipitation and
  wind across chosen years. Its [source](https://github.com/streamlit/demo-seattle-weather) is a
  single short Python file with Altair charts, which are already Vega-Lite.
- 🌡 The [respiratory disease app](https://gallery.shinyapps.io/respiratory_disease_pyshiny/)
  maps fine particulate pollution and deaths from respiratory disease by country, with a slider
  for the year. It uses World Bank, OECD and Our World in Data files, and its
  [source](https://github.com/rstudio/shiny-gallery/tree/master/respiratory_disease_pyshiny) is in
  Shiny for Python.
- 🛰 The [Utah Lake water quality dashboard](https://gallery.shinyapps.io/lake-profile-dashboard/)
  maps monitoring sites. When the reader clicks a site, the app draws the profile of dissolved
  oxygen and temperature with depth for that site. The pattern of clicking a place on a map to
  fill a panel of charts fits almost any spatial dataset.
- 🛰 [Prettymapp](https://prettymapp.streamlit.app/) draws a poster-style map of streets, water and
  parks for any address, with a radius slider and color themes. A MapLibre version would restyle
  vector tiles instead of downloading OpenStreetMap data on a server.
- 📜 [Biodiversity in National Parks](https://abenedetti.shinyapps.io/bioNPS/) lists the species
  recorded in each US national park with their conservation status, as tables, charts and a map,
  and its [source](https://github.com/abenedetti/bioNPS/) is in R. An app from Module 3 could
  pair each listed species with the listing rules that discuss climate change.

The [Shiny for Python templates](https://shiny.posit.co/py/templates/) are worth browsing for
layout alone. The [restaurant tips dashboard](https://gallery.shinyapps.io/template-dashboard-tips1/)
shows a common arrangement of summary numbers in a row across the top, filters in a sidebar, and
cards that each hold one chart or table.

## Layout and components

The starter app uses plain HTML and a short stylesheet of its own. Layout and component libraries
replace that stylesheet, or add new HTML elements, so that menus, tabs, dialogs and grids look
consistent and rearrange themselves on a phone. They differ in which layer they work in.

- [Pico CSS](https://picocss.com/) is a stylesheet only. It styles plain HTML elements with no
  classes to learn, and includes dark mode. It is the smallest step up from the starter app.
- [Bootstrap](https://getbootstrap.com/docs/5.3/examples/) is mostly CSS, with a little JavaScript
  for menus that open and close. It provides a responsive grid, a navigation bar that collapses
  into a menu on a phone, and many other components. Its examples page has complete layouts for
  dashboards, sidebars and landing pages.
- [Tailwind CSS](https://tailwindcss.com/) is CSS applied through many small classes written in
  the HTML, such as `p-4` for padding. Coding agents write it fluently, but the resulting HTML is
  harder to read.
- [Web Awesome](https://webawesome.com/), the successor to [Shoelace](https://shoelace.style/),
  adds new HTML elements, such as `<wa-tab-group>` and `<wa-drawer>`, which are defined in
  JavaScript and styled with CSS. They work in a plain HTML page without a framework.

Larger apps use a JavaScript framework. A framework lets you write each part of the interface as
a component that holds its own HTML, CSS and JavaScript together, and it updates the page
whenever the app's state changes. A build step then compiles the components into ordinary HTML,
CSS and JavaScript files. [Svelte](https://svelte.dev/) is common in newsrooms, and
[LayerCake](https://layercake.graphics/) is a chart library for it. React powers the Our World in
Data Grapher and the Overture explorer above, and Vue powers STAC Browser.

Each of these libraries is a dependency that you must pin and test. Svelte, React, Tailwind and
Observable Framework also need a build step, which turns your source files into the files that
GitHub Pages serves, so the deploy workflow in the template would need a new step to run it.
Libraries such as Pico, Web Awesome and MapLibre can be loaded from a pinned URL with no build
step at all. Choose the smallest set of tools that does what your readers need.

The [Shiny layouts](https://shiny.posit.co/py/layouts/) page is a useful catalog of the standard
arrangements, such as a navigation bar, a sidebar, tabs and cards, each with a picture. The same
arrangements can be built with any of the libraries above.

A few habits make an app work on a phone whatever library you choose:

- Put controls above the chart on a narrow screen and beside it on a wide one, or in a drawer that
  slides over a full-screen map.
- Make every control large enough to tap, and reachable with the keyboard.
- Test with the device toolbar, and then on a real phone.

## Scrolling stories

Some apps are read from top to bottom, with the chart or map changing as the reader scrolls.
[Scrollama](https://github.com/russellsamora/scrollama) is a small library that tells your code
which paragraph is on screen. Bloomberg's
[What's really warming the world?](https://www.bloomberg.com/graphics/2015-whats-warming-the-world/)
adds one possible cause of warming at a time, from the sun to volcanoes to greenhouse gases, and
compares each one with the observed temperature record.
