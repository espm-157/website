# 🗄 Single table verbs with `ibis`

We use the `ibis` package for manipulating tabular data. It gives us a small, consistent
vocabulary that works the same way on a file of a thousand rows and a file of forty
million.

### Learning goals

- establish a connection with `duckdb.connect()`
- use `head()` and `to_pandas()` to preview large data
- use `select()`, `distinct()`, and `filter()` to explore data

## Getting started

To use `ibis` we also select a backend. We will always use the `duckdb` backend. We select
one by creating a "connection". The details are not important; treat this as boilerplate.

```python
import ibis
from ibis import _
import ibis.selectors as s

con = ibis.duckdb.connect()
```

Two of those imports are shorthand you will see constantly: the table placeholder `_`
instead of writing `ibis._`, and the selectors as `s`.

## Reading data

```python
co2 = con.read_csv("data/co2.csv")
```

`con.read_csv()` is similar to `pandas.read_csv()`, though the optional arguments have
different names and are less flexible.

One option matters immediately: how missing values are indicated. Older datasets often use
a negative sentinel such as `-99` or `-9.99` to mean "no measurement" — a convention that
reflects limitations of early software, which had no concept of "missing". Modern
conventions use `NULL` or `NA`. When a file uses the older convention you must say so, or
those numbers will be treated as real measurements:

```python
tbl = con.read_csv(url, nullstr="NA")
```

This is not a footnote. It is one of the most common ways a plot ends up wrong.

## Lazy evaluation

Take a look at the table:

```python
co2
```

That does not look like a table of values. As you get used to `ibis` you come to
appreciate the display choice. `ibis` is designed for large data, and an important part of
that is **lazy evaluation**. Downloading a large file takes time, and loading one into
memory all at once can exceed available RAM and crash the kernel. Instead `ibis` peeks at
the data over the connection — often without downloading it — and reports the name and
data type of each column. That is usually the most useful information anyway.

To see rows, use `head()`:

```python
co2.head()
```

Still lazy: you get a plan of execution rather than data. Force it to run with
`to_pandas()`:

```python
co2.head().to_pandas()
```

Now you see the data. The separation matters: everything before `to_pandas()` is a
description of work, and `to_pandas()` is the moment data enters memory. That is the
moment to ask how much data you are about to pull.

## `select()` and `distinct()`

`select()` takes one or more *columns*. `distinct()` returns unique rows.

```python
(co2
 .select("name")
 .distinct()
 .to_pandas()
)
```

Both share a pattern: they apply to a table and return a table. **Table in, table out.**
That design is deliberate — because every verb takes and returns the same kind of thing,
verbs stack.

Note the wrapping parentheses that let the chain break across lines, one step per line.
A chain you can read line by line is a chain you can check line by line.

## `filter()`

`filter()` takes a subset of *rows*:

```python
(co2
 .filter(_.name == "average")
 .head()
 .to_pandas()
)
```

This is harder than `select()`. To find rows you must say *which column* to look in.

### Column selection and the dot

For python to know we mean the column called `name`, we write `_.name`. This is shorthand
for `co2.name` — the `_` is a placeholder for "the current table" in the chain.

Extracting a column with `.` is itself shorthand for the bracket form, `co2["name"]`. When
a column name collides with a table method you must fall back on brackets. So why use the
dot? It is shorter, and it allows tab completion of column names, which helps you avoid
typos. `select()` accepts either: `co2.select(_.name)` works too, looks slightly more
cryptic, and matches the syntax of the other verbs.

### Comparisons

`==` tests equality, and is not the same as `=`, which assigns:

```python
a = 1      # assignment
a == 1     # comparison, returns True
```

Other operators include `>`, `>=`, `!=` (not equal), and so on. The point is simply that
comparisons are available; the syntax is easy to look up.

## The rest of the vocabulary

| verb | what it does |
|---|---|
| `.filter()` | keep some rows |
| `.select()` | keep some columns |
| `.distinct()` | drop duplicate rows |
| `.mutate()` | add or change a column |
| `.group_by()` | define groups |
| `.agg()` | summarize within groups |
| `.order_by()` | sort |

Grouped summaries combine two of them:

```python
(co2
 .group_by("name")
 .agg(mean_value=_.value.mean(), n=_.count())
 .to_pandas()
)
```

That is most of what you need. The same seven ideas appear in SQL, in `dplyr`, and under
different names in `pandas`. Learn them once.

## Why an abstraction

`ibis` does not do the computation itself. It translates your chain into SQL and hands it
to DuckDB, which streams the file and returns only the result. You could write that SQL
yourself. The abstraction buys you three things:

- **The same code works on a different engine.** Point `ibis` at a different backend and
  your chain is unchanged.
- **The same code works at a different scale.** The chain that summarizes a thousand rows
  summarizes forty million without modification, because the data never had to fit in
  memory.
- **The vocabulary is small and consistent.** Seven verbs compose, rather than hundreds of
  special-case functions.

That last point is the one to hold on to. A good abstraction is not a convenience layer
hiding something you should really understand. It is a smaller, more consistent set of
ideas that lets you reason about a bigger problem.

## Next steps

Explore a dataset with `select()`, `distinct()`, and `filter()` before you write anything
more complicated. Knowing what is in the table is not a preliminary to the analysis — it
is most of the analysis.

## Reference

- [Ibis: getting started](https://ibis-project.org/tutorials/getting_started)
- [Ibis API reference](https://ibis-project.org/reference/)
