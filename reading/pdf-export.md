# 🖨️ Notebooks as PDF reports

A notebook is the source of an analysis, but readers often want a PDF they can open
anywhere, print or attach. This page shows how to turn a notebook into a PDF on DataHub,
how to control what the PDF shows, and how to format the same notebook as a journal
article. Each step can be handed to your Kilo Code agent, and the
[last section](#agent) gives prompts to start from.

## Before you export

Every tool on this page prints the outputs that are **saved in the notebook**. None of them
re-run your code. Before exporting, restart the kernel, run every cell from the top, and save
the notebook (**Restart** and then **Run All** in VS Code). A PDF made from a notebook with
stale or missing outputs shows stale or missing results.

## Quarto and Typst

[Quarto](https://quarto.org/docs/computations/python.html) is already installed on DataHub,
and it includes [Typst](https://typst.app/docs/), a modern typesetting system. Together they
make a PDF with no other software. From a terminal in the folder that holds the notebook:

```bash
quarto render esa.ipynb --to typst
```

This writes `esa.pdf` next to the notebook, usually in a few seconds. Code, tables, printed
output, figures and math all appear in the PDF. If the notebook does not set a title, Quarto
uses its first heading.

Other routes need extra software, which [a later section](#other-routes) describes. We
recommend Quarto with Typst for reports in this course.

## Front matter

Settings for the PDF go in a **raw cell** at the very top of the notebook, written in YAML
between two `---` lines. In VS Code, add a cell above the first one and change its type to
**Raw** with the cell-type picker at the bottom right of the cell.

```yaml
---
title: "Climate change in ESA listing rules"
author: "Your Name"
date: today
syntax-highlighting: github
format:
  typst:
    papersize: us-letter
    margin:
      x: 1in
      y: 1in
    include-in-header:
      text: |
        #show block: set par(justify: false)
execute:
  echo: true
---
```

With a title in the front matter, delete the notebook's own top heading, or the title appears
twice. Emoji in headings appear as empty boxes, because the PDF fonts do not include them.
The `include-in-header` line is explained under [line wrapping](#line-wrapping).

## Hiding code

A report for readers who do not read Python can show the results and leave out the code.
Quarto controls this for the whole notebook in the front matter, and for one cell with
comment lines that start with `#|` at the top of that cell.

- `echo: false` under `execute:` in the front matter hides all code and keeps all output.
  The same setting works once from the command line:
  `quarto render esa.ipynb --to typst -M echo:false`.
- `#| echo: false` as the first line of a cell hides that cell's code and keeps its output.
- `#| include: false` hides both the code and the output, which suits a cell of imports or
  setup.
- A figure can have a caption, and a label to refer to it in the text:

```python
#| echo: false
#| label: fig-share
#| fig-cap: Share of listing rules that name climate change.
fig, ax = plt.subplots(figsize=(5, 3))
ax.plot(df["year"], df["share"], marker="o")
plt.show()
```

The text can then refer to the figure as `@fig-share`, which becomes "Figure 1" in the PDF.
Comment lines are ordinary Python comments, so the notebook runs as before.

## Code highlighting

Quarto colors code by its syntax. `syntax-highlighting` in the front matter picks the colors:
`github` is light and readable, and `none` turns color off for a plain black-and-white
printout. Quarto's [code highlighting guide](https://quarto.org/docs/output-formats/html-code.html#highlighting)
lists the other styles, such as `arrow-light`, `a11y-light` and `printing`. Earlier versions of
Quarto called this setting `highlight-style`.

(line-wrapping)=
## Line wrapping

Code on a page has a fixed width of about 90 characters. Typst wraps longer lines of code and
printed output, but the wrapped part starts at the left margin and loses its indentation.
Typst also justifies paragraphs, and in a long line of highlighted code that stretches or
squeezes the spaces, so that indentation no longer lines up. The `#show block` line in the
front matter above turns justification off for code blocks and leaves it on for your text.

Short lines read best on screen and on paper. [Ruff](https://docs.astral.sh/ruff/formatter/)
reformats a notebook so that most lines fit in 88 characters:

```bash
pip install ruff
ruff format esa.ipynb
```

Ruff does not split long strings such as URLs or regular expressions, so check what remains.
Wide tables cause the same problem as long lines. Show the columns a reader needs, for
example `df[["species", "year", "climate"]]`, and pandas shortens long text in each cell.

(other-routes)=
## Other routes and their software

The menus in VS Code (**Export** in the notebook's `...` menu) and JupyterLab (**File → Save
and Export Notebook As → PDF**) call
[nbconvert](https://nbconvert.readthedocs.io/en/latest/usage.html), which needs LaTeX. DataHub
does not include LaTeX, so these menus fail with `xelatex not found on PATH` until you install
it. We tested each route on the course image.

| Route | Extra software | Notes |
|---|---|---|
| `quarto render esa.ipynb --to typst` | none | recommended |
| `quarto render esa.ipynb --to pdf` | TinyTeX | LaTeX look; long code runs off the page unless you add `fvextra` |
| `jupyter nbconvert --to pdf esa.ipynb` and the export menus | TinyTeX and the `titling` package | classic Jupyter look with `In [1]:` prompts; wraps code |
| `jupyter nbconvert --to webpdf esa.ipynb` | Chromium, about 280 MB | looks like the notebook on screen; cuts off long code lines |

`nbconvert` hides all code with `--no-input`, and sets the title and author with
`--LatexPreprocessor.title="..."` and `--LatexPreprocessor.author_names="..."`. Without them
the title is the file name.

### Installing TinyTeX

[TinyTeX](https://yihui.org/tinytex/) is a small LaTeX distribution that installs into your
home directory, so it stays on DataHub between sessions. It takes about 470 MB. In a terminal:

```bash
quarto install tinytex --no-prompt
~/.TinyTeX/bin/x86_64-linux/tlmgr update --self
~/.TinyTeX/bin/x86_64-linux/tlmgr install titling
mkdir -p ~/.local/bin
~/.TinyTeX/bin/x86_64-linux/tlmgr option sys_bin ~/.local/bin
~/.TinyTeX/bin/x86_64-linux/tlmgr path add
```

The last two lines link `xelatex` and the other LaTeX programs into `~/.local/bin`, a folder
that DataHub already searches, so that nbconvert and the export menus can find them.
`tlmgr update --self` is needed once, before the first `tlmgr install`. When a later export
stops with an error such as ``File `something.sty' not found``, install the missing package
with `tlmgr install` in the same way.

For `quarto render --to pdf`, these front matter lines make long lines of code wrap:

```yaml
format:
  pdf:
    include-in-header:
      text: |
        \usepackage{fvextra}
        \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
```

### Installing Chromium

The `webpdf` route prints the notebook with a headless web browser. The Python library that
drives the browser is installed, and the browser itself installs into your home directory:

```bash
playwright install --only-shell chromium
```

## Journal article formats

Journals each have their own layout, with an abstract, author affiliations, key points and a
data availability statement. [MyST](https://mystmd.org/guide), the Jupyter project's
publishing system, exports a notebook in the layout of a particular journal or preprint
server from one set of front matter. This course website is built with MyST.

### Setup

Install MyST in a terminal, and link the Typst program that comes with Quarto into
`~/.local/bin` so that MyST can find it:

```bash
pip install mystmd
ln -s /usr/lib/rstudio-server/bin/quarto/bin/tools/x86_64/typst ~/.local/bin/typst
```

Then run `myst init` once in your repository. It writes a `myst.yml` file and offers to start
a preview server, which you can decline. MyST writes intermediate files to `_build/`, so add
`_build/` to your `.gitignore`.

### Front matter and exports

MyST reads front matter from the **first Markdown cell** of the notebook. Quarto reads it from a
raw cell, so use one tool or the other for a given notebook. The `exports` list names each
format, template and output file:

```yaml
---
title: Climate change in ESA listing rules
authors:
  - name: Your Name
    affiliations:
      - UC Berkeley
affiliations:
  - id: UC Berkeley
    institution: University of California, Berkeley
license: CC-BY-4.0
abstract: |
  We count listing rules that name climate change as a threat.
exports:
  - format: typst
    template: lapreprint-typst
    output: exports/esa.pdf
---
```

Build every export with:

```bash
myst build --typst
```

`myst build --pdf` builds the LaTeX templates instead, which need TinyTeX as above.

### Hiding code in MyST

MyST hides code with cell **tags**, which can be written as a `#|` line at the top of a cell:

- `#| tags: [remove-input]` hides the code and keeps the output.
- `#| tags: [remove-cell]` hides both.
- `#| label: fig-share` and `#| caption: ...` give a figure a label and a caption.

MyST does not understand Quarto's `#| echo: false`, and the reverse is also true.

### Templates

`myst templates list --typst` and `myst templates list --pdf` list the available templates.
They include the LaPreprint preprint layout (`lapreprint-typst` and `lapreprint`), journals
in our field such as AGU (`agu2019`), Copernicus journals of the EGU (`egu_copernicus`),
Frontiers (`frontiers`) and Springer (`springer`), and the EarthArXiv preprint server
(`eartharxiv`). The [MyST exports guide](https://mystmd.org/guide/documents-exports) and the
[template gallery](https://github.com/myst-templates) describe each one.

A journal template can require fields that a plain report lacks. For example, `agu2019` asks
for a journal name and key points:

```yaml
parts:
  keypoints: |
    - Listing rules name climate change more often after 2005.
  data_availability: |
    Listing rules are from the Federal Register API.
exports:
  - format: pdf
    template: agu2019
    journal_name: Geophysical Research Letters
    output: exports/esa-agu.pdf
```

MyST prints a ⛔️ line for each missing field. Templates are maintained separately and some lag
behind new versions of Typst and LaTeX. In our tests `lapreprint-typst` built cleanly,
`ieee-typst` failed with the current version of Typst, and `agu2019` produced a PDF while
reporting LaTeX errors on tables. Check every page of the result.

(agent)=
## Working with your agent

Your Kilo Code agent can do each step on this page. Ask for one change at a time and look at
the PDF after each one. Some prompts to start from:

- "Render `esa.ipynb` to PDF with `quarto render --to typst`. Add a raw front matter cell with
  my name, the title and today's date."
- "Hide the code in every cell of the PDF except the cells that define the schema. Use Quarto
  `#|` cell options."
- "Some code lines run past 88 characters. Reformat the notebook with `ruff format` and break
  any remaining long lines by hand."
- "Export this notebook in the AGU journal layout with MyST, and tell me which required fields
  are missing."

An agent may install software, such as TinyTeX or Chromium, to get an export to work. Read
what it ran, and prefer the Typst route that needs nothing extra. The notebook stays the
source of the report, so make every change in the notebook and render the PDF again.
