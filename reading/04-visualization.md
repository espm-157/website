# 📈 Visualization basics

Programming courses often start with control structures and data structures. Education
research has shown the value of starting with visualization instead, because it gives
students early results that are compelling and often fun. We will keep refining our
visualization skills throughout the course, and much of that improvement comes through
repetition.

## The Grammar of Graphics

We use [`plotnine`](https://plotnine.org), which implements the
[Grammar of Graphics](https://www.amazon.com/dp/0387245448) in Python. The grammar
provides a powerful _abstraction_ for data visualization. The theory is decades old, and
it became mainstream in data science through Hadley Wickham's `ggplot2` package for R.
Python libraries adopted the idea more recently, and it now appears in `plotnine`,
`altair` and the `seaborn` object interface.

:::{note} Choice of plotnine
Choosing packages is an important and difficult question. Many academic courses set it
aside on the grounds that students who learn the fundamental principles can pick up
whichever package is popular later. That argument has some truth to it, but it ignores
how students actually learn.

We chose `plotnine` because it follows the grammar consistently. `seaborn` has two
interfaces, the newer object interface and the older function interface, and they look
very different from each other. Students often confuse the two, and so do language
models, which will mix both interfaces in a single answer. `plotnine` has a single
interface built on the grammar of graphics.
:::

## Mapping data to aesthetics

The central principle of the grammar of graphics is that a plot expresses _mappings_ from
data to aesthetics such as color, size and x and y position.

```python
import ibis
from plotnine import ggplot, aes, geom_line, labs

con = ibis.duckdb.connect()
co2 = con.read_csv("data/co2.csv")
co2.head().to_pandas()
```

This dataset is in long form. It has a `decimal_date` column, a `name` column that
identifies which series each row belongs to, and a `value` column. We can map the
categorical values in `name` to color:

```python
(
    ggplot(co2.to_pandas(), aes(x="decimal_date", y="value", color="name"))
    + geom_line()
    + labs(x="Year", y="CO2 (ppm)")
)
```

The plot has three parts: the data and its mapping of columns to aesthetics (`aes`), the
geometry that draws them (`geom_line`), and the labels. We combine the layers with `+`.

## Manual styling

Older plotting engines such as `matplotlib`, and the original `seaborn` function
interface, do not follow these principles. The equivalent plot in that style looks like
this:

```python
# the older style, which we avoid
import seaborn as sns
wide = co2.pivot_wider(names_from="name", values_from="value").to_pandas()
sns.lineplot(wide, x="decimal_date", y="average", color="blue")
sns.lineplot(wide, x="decimal_date", y="deseasonalized", color="red")
```

Here `x` and `y` still refer to columns, but each color is set by hand. The code does not
record any relationship between color and the structure of the data, so changing the
color scheme means editing every call. This approach is harder to generalize and more
prone to error.

The manual version is slightly shorter for a single line, but it grows quickly as we add
series. A third series needs a third, nearly identical call. In the grammar version, a
third series needs no new code because it is already in the data.

## Tidy data

The grammar version works because the data are *tidy*: each column is a variable and
each row is an observation. The identity of each series is stored in a column, so the
grammar can map it to an aesthetic.

This layout is sometimes called long form, and more formally Codd's third normal form. It
takes some getting used to, and it often requires a transformation, because many datasets
in the wild do not follow it. Older and smaller datasets are especially likely to use a
wide layout. `pivot_longer()` and `pivot_wider()` convert between the two shapes.

The grammar and tidy data reinforce each other. A well-designed plotting abstraction
encourages a well-organized data structure, and a well-organized data structure turns
the plot into a single line of code. A good abstraction makes the correct approach easy
and the incorrect approach awkward.

## Default palettes

The grammar version also uses a default color palette informed by visualization research.
In the manual version, `"blue"` and `"red"` were chosen without any evidence. Good defaults
are a real feature of a package, and when we override them we should do so on purpose.

## Reference

- [plotnine documentation](https://plotnine.org)
- [plotnine gallery](https://plotnine.org/gallery/). Find a chart that looks like the one
  you want, then read its code.
- [The Grammar of Graphics](https://www.amazon.com/dp/0387245448), Wilkinson
