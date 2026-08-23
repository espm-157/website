# 📈 Visualization basics

Courses involving computer programming frequently start with control structures and data
structures. Extensive education research has underscored the value in starting with
visualization instead. Visualization offers 'early wins', producing something compelling
and often fun. Like many of our skills, we will continue to refine and extend our
knowledge of data visualization throughout the course. Mastery comes through repetition.

## The Grammar of Graphics

We use [`plotnine`](https://plotnine.org), which implements the
[Grammar of Graphics](https://www.amazon.com/dp/0387245448) in python. This approach
provides a powerful _abstraction_ around data visualization concepts. The theory has been
around for a long time, but became mainstream in data science through the work of Hadley
Wickham and the `ggplot2` implementation in R. Python libraries have adopted the idea more
recently, and it can now be found in `plotnine`, `altair`, and `seaborn`'s object
interface.

:::{note} Why `plotnine` and not `seaborn`
Choosing packages is an important but tricky question. Many academic courses dismiss the
issue, arguing that students who learn the fundamental principles can always pick up
whichever package is fashionable. There is some truth to this, but it ignores obvious
realities of the learning experience.

We choose `plotnine` specifically because it commits to the grammar. `seaborn` carries two
different interfaces — the newer object interface and the older function interface — and
they look nothing alike. That dual nature reliably confuses students, and it confuses
language models too, which will happily mix the two in a single answer. `plotnine` has one
way to do things, and it is the grammar-of-graphics way.
:::

## Mapping data to aesthetics

The fundamental principle of the grammar of graphics is that it expresses _mappings_ from
data to aesthetics of a graph: color, size, x and y position, and so on.

```python
import ibis
from plotnine import ggplot, aes, geom_line, labs

con = ibis.duckdb.connect()
co2 = con.read_csv("data/co2.csv")
co2.head().to_pandas()
```

This dataset is in "long" form: a `decimal_date` column, a `name` column identifying which
series a row belongs to, and a `value` column. The categorical values in `name` can be
mapped to color:

```python
(
    ggplot(co2.to_pandas(), aes(x="decimal_date", y="value", color="name"))
    + geom_line()
    + labs(x="Year", y="CO2 (ppm)")
)
```

Read that as three statements: the data and which columns map to which aesthetics
(`aes`), the geometry used to draw them (`geom_line`), and the labels. Layers combine
with `+`.

## Contrast with asserting appearance directly

Older plotting engines such as `matplotlib`, and the original `seaborn` function
interface, do not reflect these principles. The equivalent there looks like this:

```python
# the older style, which we avoid
import seaborn as sns
wide = co2.pivot_wider(names_from="name", values_from="value").to_pandas()
sns.lineplot(wide, x="decimal_date", y="co2", color="blue")
sns.lineplot(wide, x="decimal_date", y="smooth", color="red")
```

Here `x` and `y` still refer to columns, but `color` is asserted manually. The
relationship between color and data structure is not captured. To change the color scheme
you must update each assertion by hand. This is harder to generalize and more error-prone.

Note also that while this is slightly more concise for a single line, it becomes rapidly
more verbose as series are added, repeating parts that did not need repeating. Add a third
series and you add a third near-identical call. In the grammar version, a third series
requires no code change at all — it is already in the data.

## Tidy data

That last point is worth dwelling on. The grammar version works because the data is
*tidy*: each column is a variable, each row is an observation. The series identity lives
in a column, so the grammar can map it to an aesthetic.

This is sometimes called 'long' form, and more formally Cobb's Third Normal Form. It takes
getting used to, and frequently requires some transformation to achieve, since many
wild-caught datasets do not follow the practice — especially older and smaller ones.
`pivot_longer()` and `pivot_wider()` are how you move between shapes.

Notice that the grammar and tidy data reinforce each other. A well-designed plotting
abstraction pushes you toward a well-organized data structure, and a well-organized data
structure makes the plot a one-liner. That is what a good abstraction does: it makes the
right thing easy and the wrong thing awkward.

## Defaults are an argument too

The grammar version also gets a default color palette informed by visualization research,
rather than whatever colors you happened to name. `"blue"` and `"red"` are choices you
made without evidence. Good defaults are a real feature — you should override them
deliberately, not by accident.

## Reference

- [plotnine documentation](https://plotnine.org)
- [plotnine gallery](https://plotnine.org/gallery/) — find a chart that looks like what
  you want, then read its code
- [The Grammar of Graphics](https://www.amazon.com/dp/0387245448), Wilkinson
