# 🖨️ Notebooks as PDF reports

A notebook is the source of an analysis, but readers often want a PDF they can open
anywhere, print or attach. This page shows how to turn a notebook into a PDF on DataHub and
how to control what the PDF shows. Your Kilo Code agent runs the commands for you: each step
gives a prompt to paste into the Kilo Code chat. Read what the agent proposes before you
approve it, and open the PDF after each step to check the result.

## Before you export

The PDF shows the outputs that are **saved in the notebook**. Exporting does not re-run your
code. Before exporting, restart the kernel, run every cell from the top, and save the notebook
(**Restart** and then **Run All** in VS Code). A PDF made from a notebook with stale or
missing outputs shows stale or missing results.

## Quarto and Typst

[Quarto](https://quarto.org/docs/computations/python.html) is already installed on DataHub,
and it includes [Typst](https://typst.app/docs/), a modern typesetting system. Together they
make a PDF with no other software. Ask Kilo Code:

```text
Render esa.ipynb to PDF by running `quarto render esa.ipynb --to typst` in the
terminal, from the folder that holds the notebook. Do not install any software.
```

Quarto writes `esa.pdf` next to the notebook, usually in a few seconds. To read it, right-click
`esa.pdf` in the VS Code Explorer and choose **Download**, then open it on your computer. Code,
tables, printed output, figures and math all appear in the PDF. If the notebook does not set a
title, Quarto uses its first heading.

## Front matter

Settings for the PDF go in a **raw cell** at the very top of the notebook, written in YAML
between two `---` lines. In VS Code, add a cell above the first one and change its type to
**Raw** with the cell-type picker at the bottom right of the cell. Then paste these lines and
put in your own title and name:

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

Render the PDF again after any change. With a title in the front matter, delete the notebook's
own top heading, or the title appears twice. Emoji in headings appear as empty boxes, because
the PDF fonts do not include them. The `include-in-header` line is explained under
[line wrapping](#line-wrapping).

## Hiding code

A report for readers who do not read Python can show the results and leave out the code.
Quarto controls this for the whole notebook in the front matter, and for one cell with
comment lines that start with `#|` at the top of that cell.

- `echo: false` under `execute:` in the front matter hides all code and keeps all output.
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
Comment lines are ordinary Python comments, so the notebook runs as before. Kilo Code can add
these lines for you:

```text
In esa.ipynb, add Quarto `#| echo: false` cell options to hide the code of every
cell except the cells that define the schema, and `#| include: false` to the
import cell. Then render the PDF again with `quarto render esa.ipynb --to typst`.
```

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
reformats a notebook so that most lines fit in 88 characters. Ask Kilo Code:

```text
Some code lines in esa.ipynb are longer than 88 characters. Install ruff with
`pip install ruff`, run `ruff format esa.ipynb`, and then list any lines that are
still too long and suggest how to break them.
```

Ruff does not split long strings such as URLs or regular expressions, so check what remains.
Wide tables cause the same problem as long lines. Show the columns a reader needs, for
example `df[["species", "year", "climate"]]`, and pandas shortens long text in each cell.

## Other PDF formats

Quarto with Typst covers a course report. Other tools are worth the extra setup when you want
a different look and feel for the PDF:

- the **layout of a journal or preprint server**, such as AGU, Copernicus or EarthArXiv, with
  its abstract, affiliations, key points and data availability statement;
- the **classic LaTeX look**, which many scientific documents use;
- the **look of the notebook itself**, with `In [1]:` prompts as in Jupyter.

The menus in VS Code (**Export** in the notebook's `...` menu) and JupyterLab (**File → Save
and Export Notebook As → PDF**) also need software that DataHub does not include, and they fail
with `xelatex not found on PATH` until it is installed.
[More PDF formats](pdf-formats.md) describes each of these tools, what to install, and a
gallery of journal templates.
