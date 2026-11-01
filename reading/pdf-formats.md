# 📰 More PDF formats

[Notebooks as PDF reports](pdf-export.md) shows the simplest way to make a PDF from a notebook,
with Quarto and Typst, and how to hide code, highlight it and keep lines short. Start there.
This page covers the tools that give a PDF a different look, such as a journal's layout, and
the software each one needs. As before, each step is a prompt for your Kilo Code agent, which
runs the commands in a terminal for you. Read what the agent proposes before you approve it.

## Tools and their software

We tested each tool on the DataHub image. Only the first needs no extra software.

| Tool | Look of the PDF | Extra software |
|---|---|---|
| Quarto with Typst | clean report | none |
| Quarto with LaTeX | classic LaTeX article | TinyTeX |
| nbconvert, and the **Export** menus in VS Code and JupyterLab | Jupyter notebook with `In [1]:` prompts, in LaTeX | TinyTeX and one more LaTeX package |
| nbconvert WebPDF | the notebook as it looks in a web browser | Chromium |
| MyST | the layout of a journal or preprint server | MyST, and TinyTeX for some templates |

Software you install goes into your home directory, so it stays on DataHub between sessions,
but it takes space: about 470 MB for TinyTeX and 280 MB for Chromium.

(tinytex)=
## LaTeX with TinyTeX

[TinyTeX](https://yihui.org/tinytex/) is a small LaTeX distribution. Quarto can install it, but
the version it installs needs two extra steps before the VS Code and JupyterLab export menus
can use it. These are the exact commands we tested, so give them to Kilo Code as they are:

```text
Install TinyTeX for my user by running these commands in the terminal, one at a
time, and stop if any of them fails:

quarto install tinytex --no-prompt
~/.TinyTeX/bin/x86_64-linux/tlmgr update --self
~/.TinyTeX/bin/x86_64-linux/tlmgr install titling
mkdir -p ~/.local/bin
~/.TinyTeX/bin/x86_64-linux/tlmgr option sys_bin ~/.local/bin
~/.TinyTeX/bin/x86_64-linux/tlmgr path add

Then check that `which xelatex` prints a path in ~/.local/bin.
```

The last two commands link the LaTeX programs into `~/.local/bin`, a folder where DataHub
already looks for programs. When a later export stops with an error such as
``File `something.sty' not found``, ask Kilo Code to install the missing LaTeX package with
`tlmgr install`.

### Quarto with LaTeX

With TinyTeX installed, Quarto makes a LaTeX PDF from the same notebook and front matter, using
`--to pdf` in place of `--to typst`. LaTeX does not wrap long lines of code unless you add these
lines to the front matter under `format:`. Long lines of printed output still run off the page.

```yaml
format:
  pdf:
    include-in-header:
      text: |
        \usepackage{fvextra}
        \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
```

```text
Render esa.ipynb to PDF with LaTeX by running
`quarto render esa.ipynb --to pdf` in the terminal.
```

### nbconvert and the export menus

[nbconvert](https://nbconvert.readthedocs.io/en/latest/usage.html) is Jupyter's own converter,
and the export menus in VS Code and JupyterLab call it. Once TinyTeX is installed the menus
work. nbconvert ignores Quarto's front matter, and it uses the file name as the title unless
you give it one:

```text
Convert esa.ipynb to PDF by running this in the terminal:
jupyter nbconvert --to pdf esa.ipynb --LatexPreprocessor.title="Climate change in ESA listing rules" --LatexPreprocessor.author_names="Your Name"
Add --no-input to leave out all code.
```

## WebPDF with Chromium

nbconvert can also print the notebook with a web browser, so the PDF looks like the notebook on
screen. Long lines of code are cut off at the right edge instead of wrapping.

```text
Install a headless Chromium browser for my user with
`playwright install --only-shell chromium`, then run
`jupyter nbconvert --to webpdf esa.ipynb` in the terminal.
```

## Journal article formats

Journals each have their own layout, with an abstract, author affiliations, key points and a
data availability statement. [MyST](https://mystmd.org/guide), the Jupyter project's
publishing system, exports a notebook in the layout of a particular journal or preprint
server from one set of front matter. This course website is built with MyST.

### Template gallery

Each card shows the first page of a template. Click a card for the template's source and an
example. The name under each picture is what goes in the front matter.

::::{grid} 1 2 3 3

:::{card} LaPreprint
:link: https://github.com/myst-templates/lapreprint-typst
![LaPreprint template](https://raw.githubusercontent.com/myst-templates/lapreprint-typst/main/examples/pixels/files/screenshot.png)
`lapreprint-typst` uses Typst and needs no TinyTeX.
:::

:::{card} AGU journals
:link: https://github.com/myst-templates/agu2019
![AGU template](https://raw.githubusercontent.com/myst-templates/agu2019/main/thumbnail.png)
`agu2019` uses LaTeX.
:::

:::{card} Copernicus journals of the EGU
:link: https://github.com/myst-templates/egu_copernicus
![EGU Copernicus template](https://raw.githubusercontent.com/myst-templates/egu_copernicus/main/thumbnail.png)
`egu_copernicus` uses LaTeX.
:::

:::{card} EarthArXiv preprints
:link: https://github.com/myst-templates/eartharxiv
![EarthArXiv template](https://raw.githubusercontent.com/myst-templates/eartharxiv/main/thumbnail.png)
`eartharxiv` uses LaTeX.
:::

:::{card} Frontiers journals
:link: https://github.com/myst-templates/frontiers
![Frontiers template](https://raw.githubusercontent.com/myst-templates/frontiers/main/thumbnail.png)
`frontiers` uses LaTeX.
:::

:::{card} Springer journals
:link: https://github.com/myst-templates/springer
![Springer template](https://raw.githubusercontent.com/myst-templates/springer/main/thumbnail.png)
`springer` uses LaTeX.
:::

:::{card} Computers and Geosciences
:link: https://github.com/myst-templates/cageo
![Computers and Geosciences template](https://raw.githubusercontent.com/myst-templates/cageo/main/thumbnail.png)
`cageo` uses LaTeX.
:::

:::{card} arXiv in two columns
:link: https://github.com/myst-templates/arxiv_two_column
![arXiv two-column template](https://raw.githubusercontent.com/myst-templates/arxiv_two_column/main/thumbnail.png)
`arxiv_two_column` uses LaTeX.
:::

:::{card} Plain LaTeX
:link: https://github.com/myst-templates/plain_latex
![Plain LaTeX template](https://raw.githubusercontent.com/myst-templates/plain_latex/main/thumbnail.png)
`plain_latex` uses LaTeX.
:::

::::

Templates that use LaTeX need [TinyTeX](#tinytex). The
[MyST exports guide](https://mystmd.org/guide/documents-exports) explains the options, and
Kilo Code can list every template with `myst templates list --pdf`.

### Setup

MyST needs to be installed once, and it needs to find the Typst program that comes with Quarto:

```text
Set up MyST in this repository. Run `pip install mystmd`, then link Quarto's Typst
with `ln -s /usr/lib/rstudio-server/bin/quarto/bin/tools/x86_64/typst ~/.local/bin/typst`.
Run `myst init` and answer no when it offers to start a server. Add `_build/` to
.gitignore.
```

### Front matter and exports

MyST reads front matter from the **first Markdown cell** of the notebook, not from a raw cell
as Quarto does, so use one tool or the other for a given notebook. The `exports` list names
each format, template and output file:

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

```text
Build the PDF exports in the front matter of esa.ipynb by running
`myst build --typst` in the terminal (or `myst build --pdf` for LaTeX templates),
and tell me about any ⛔️ lines in the output.
```

### Hiding code in MyST

MyST hides code with cell **tags**, which can be written as a `#|` line at the top of a cell:

- `#| tags: [remove-input]` hides the code and keeps the output.
- `#| tags: [remove-cell]` hides both.
- `#| label: fig-share` and `#| caption: ...` give a figure a label and a caption.

MyST does not understand Quarto's `#| echo: false`, and Quarto does not understand MyST's tags.

### Required fields

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
