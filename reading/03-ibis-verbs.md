# 🗄 Single table verbs with `ibis`

We use the `ibis` package to manipulate tabular data. It provides a small, consistent
vocabulary that works the same way on a file of a thousand rows and a file of forty
million rows.

### Learning goals

- establish a connection with `duckdb.connect()`
- use `head()` and `to_pandas()` to preview large data
- use `select()`, `distinct()`, and `filter()` to explore data

## Getting started

To use `ibis` we also choose a backend, and we always use the `duckdb` backend. We choose
it by creating a connection. You can treat this code as boilerplate.

```python
import ibis
from ibis import _
import ibis.selectors as s

con = ibis.duckdb.connect()
```

Two of these imports are shorthand that you will see often: `_` is the table placeholder,
so we do not have to write `ibis._`, and `s` refers to the selectors.

## Reading data

```python
co2 = con.read_csv("data/co2.csv")
```

`con.read_csv()` is similar to `pandas.read_csv()`, although its optional arguments have
different names and are less flexible.

One option matters right away, and that is how the file marks missing values. Older
datasets often use a negative sentinel such as `-99` or `-9.99` to mean "no measurement,"
because early software had no concept of a missing value. Modern conventions use `NULL` or
`NA`. When a file uses a sentinel you must declare it, or the sentinel values will be
treated as real measurements:

```python
tbl = con.read_csv(url, nullstr="NA")
```

Undeclared sentinel values are one of the most common reasons a plot ends up wrong.

## Lazy evaluation

Take a look at the table:

```python
co2
```

The output does not look like a table of values. `ibis` is designed for large data, and
an important part of that design is **lazy evaluation**. Downloading a large file takes
time, and loading one into memory all at once can exceed the available RAM and crash the
kernel. Instead, `ibis` inspects the data over the connection, often without downloading
it, and reports the name and data type of each column. That information is usually what
we need first.

To see rows, use `head()`:

```python
co2.head()
```

This result is still lazy, and you get a plan of execution instead of data. Use
`to_pandas()` to run it:

```python
co2.head().to_pandas()
```

Now you see the data. Everything before `to_pandas()` describes work, and `to_pandas()` is
the step that brings data into memory. Before calling it, check how much data you are
about to pull.

## `select()` and `distinct()`

`select()` takes one or more *columns*. `distinct()` returns unique rows.

```python
(co2
 .select("name")
 .distinct()
 .to_pandas()
)
```

Both verbs take a table as input and return a table as output. Because every verb takes
and returns the same kind of object, we can chain verbs together.

The wrapping parentheses let the chain break across lines with one step per line, which
makes each step easier to read and check.

## `filter()`

`filter()` takes a subset of *rows*:

```python
(co2
 .filter(_.name == "average")
 .head()
 .to_pandas()
)
```

Filtering takes a little more thought than selecting, because to find rows you must say
*which column* to look in.

### Column references

To tell Python that we mean the column called `name`, we write `_.name`. This is
shorthand for `co2.name`, where `_` stands for the current table in the chain.

Extracting a column with `.` is itself shorthand for the bracket form, `co2["name"]`. When
a column name is the same as a table method, you must use brackets. We still prefer the
dot because it is shorter and allows tab completion of column names, which helps avoid
typos. `select()` accepts either form: `co2.select(_.name)` also works, and although it
looks a little more cryptic it matches the syntax of the other verbs.

### Comparisons

`==` tests equality. It is different from `=`, which assigns a value:

```python
a = 1      # assignment
a == 1     # comparison, returns True
```

Other operators include `>`, `>=` and `!=` (not equal). The full list is easy to look up
when you need it.

## Other verbs

| verb | what it does |
|---|---|
| `.filter()` | keep some rows |
| `.select()` | keep some columns |
| `.distinct()` | drop duplicate rows |
| `.mutate()` | add or change a column |
| `.group_by()` | define groups |
| `.agg()` | summarize within groups |
| `.order_by()` | sort |

Grouped summaries combine two of these verbs:

```python
(co2
 .group_by("name")
 .agg(mean_value=_.value.mean(), n=_.count())
 .to_pandas()
)
```

These verbs cover most of what you need in this course. The same seven operations appear
in SQL and in `dplyr`, and under different names in `pandas`, so what you learn here
carries over to those tools.

## Abstraction

`ibis` does not do the computation itself. It translates your chain into SQL and passes it
to DuckDB, which streams through the file and returns only the result. You could write
that SQL yourself, but the abstraction gives us three advantages:

- **The same code works on a different engine.** If you point `ibis` at a different
  backend, your chain stays the same.
- **The same code works at a different scale.** A chain that summarizes a thousand rows
  also summarizes forty million rows without modification, because the data never has to
  fit in memory.
- **The vocabulary is small and consistent.** Seven verbs combine to cover most tasks,
  where other tools need hundreds of special-case functions.

The third advantage matters most. A good abstraction gives us a smaller and more
consistent set of ideas, and those ideas let us reason about a larger problem.

## Next steps

Explore a dataset with `select()`, `distinct()` and `filter()` before you write anything
more complicated. Understanding what is in the table is a large part of any analysis.

## Reference

- [Ibis: getting started](https://ibis-project.org/tutorials/getting_started)
- [Ibis API reference](https://ibis-project.org/reference/)
