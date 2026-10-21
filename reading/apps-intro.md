# 🤖 Applications

In Modules 1 to 3 we answered questions in notebooks. A notebook works for the person who
runs it. An application lets anyone with a link ask their own version of the question, for
example by choosing a country, a city, a species or a threshold and watching the answer
change. In this module each team takes an analysis from an earlier module and turns it into
an interactive application that a reader outside the class could use.

### Learning goals

- design reactive interfaces with controls, state and updates
- decide where code runs, in the reader's browser or on a server, and what each costs
- manage dependencies and pin their versions
- test an application in a real browser with continuous integration
- deploy continuously to GitHub Pages
- choose open source licenses for code and for data
- build layouts that work on a phone and are accessible

## Background

The analyses in this course reproduce published results, but most readers of those results
will never run a notebook. Interactive applications are now a common way that scientists,
agencies and journalists share data with the public. The
[Mapping Inequality](https://dsl.richmond.edu/panorama/redlining/) site from Module 2 is one
example: it lets anyone explore the HOLC maps for their own city.

In past years this module used [Streamlit](https://streamlit.io/), a Python framework that
re-runs a script on a server every time a reader touches a control. That design needs a
server that is always running, which someone has to host, maintain and pay for. This year we
build applications that run entirely in the reader's browser. GitHub Pages serves the files
and the browser does the computing, so there is no server to maintain and the application
keeps working for as long as the files are online.

## Tools

The browser tools mirror the ones we already use in notebooks.

| In the notebooks | In the browser |
|---|---|
| `ibis` on DuckDB | [DuckDB-WASM](https://duckdb.org/docs/api/wasm/overview), the same SQL on the same files |
| `plotnine` | [Observable Plot](https://observablehq.com/plot/), the same grammar of graphics |
| `leafmap.maplibregl` | [MapLibre GL JS](https://maplibre.org/maplibre-gl-js/docs/), the library underneath leafmap |

The applications are written in JavaScript. Your coding agent writes JavaScript as well as
Python, so your job is the same as in earlier modules: decide what the application should
do, check that it does it, and explain your choices. The browser's developer tools, in
particular the console and the network tab, show errors and the data the application loads.

Because the application is now ours to ship, this module also covers the parts that earlier
templates set up for us:

- **Dependencies:** every library and its exact version, so that the application still works
  next year.
- **Continuous integration:** automated tests that load the application in a real browser on
  every push.
- **Licenses:** the terms under which others may reuse your code and your data. See
  [choosealicense.com](https://choosealicense.com/) for an introduction.

## Further reading

- [GitHub Pages documentation](https://docs.github.com/en/pages)
- [DuckDB-WASM overview](https://duckdb.org/docs/api/wasm/overview)
- [Observable Plot documentation](https://observablehq.com/plot/)
- [MapLibre GL JS examples](https://maplibre.org/maplibre-gl-js/docs/examples/)

## Template

<a href="https://github.com/espm-157/app-template"><i class="i-simpleicons github"></i> app template</a>

The template includes a small [starter app](https://espm-157.github.io/app-template/) that reads the
CO₂ data from Module 1, offers two menus and a slider, and draws a line chart. Each team replaces it
with its own app.
