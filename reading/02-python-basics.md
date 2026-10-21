# 🐍 Python basics

In this course you will read code that a model wrote and decide whether it does what it
claims. You do not need to memorize a library to do that, but you do need to know what
each piece of the code means.

This page is a short vocabulary list. It is not a full tutorial.

## Imports

```python
import ibis
from plotnine import ggplot, aes, geom_line
```

`import ibis` makes the name `ibis` available. `from ... import ...` brings specific names
directly into your namespace.

When a model's code fails with `NameError`, an import is usually missing. When two pieces
of code disagree about what `read_csv` means, two different libraries both define it.

## Assignment

```python
co2 = ibis.read_csv("co2.csv")
```

The name `co2` now refers to that object. Assignment attaches a label to an object; it does
not copy the object or compute anything.

Analyses often go wrong when a script reassigns the same name to different things, so that
by line 60 nobody knows what `df` contains. Give each object a name that says what it is.

## The dot operator

The `.` means "look inside this object."

```python
co2.filter(...)     # call the filter method belonging to co2
co2.year            # access the column named year
```

The object to the left of the dot determines what can appear to the right. `ibis` tables
have a `.filter()` method and a plain number does not. An `AttributeError` means the object
was not the type the code assumed, and that wrong assumption is usually the real bug.

## Method chaining

```python
result = (
    co2
    .filter(co2.year >= 1990)
    .select("year", "average")
    .order_by("year")
)
```

Each method returns a new table, so the next method can act on it. Read the chain from top
to bottom: start with `co2`, keep rows from 1990 onward, keep two columns, and sort.

The outer parentheses let the chain span several lines. We put each step on its own line
so that we can read and check the steps one at a time.

## Lazy evaluation

`ibis` does not do the work when you write the chain. It builds a description of the work
and runs it only when you ask for results.

```python
result               # in interactive mode, shows a preview
result.to_pandas()   # executes the query and returns the whole result in memory
```

Lazy evaluation lets `ibis` query a file far larger than your session's memory. It passes
the filtering and grouping to DuckDB, which streams through the file and returns only the
answer. Calling `to_pandas()` pulls data into memory, so before you call it, check how much
data you are about to pull.

## Table verbs

Nearly everything in this course combines six or seven table operations: `filter`,
`select`, `mutate`, `group_by`, `agg` and `order_by`. The vocabulary is small and
consistent. The next page, [single table verbs](03-ibis-verbs.md), covers it in detail.

## Silent errors

`ibis.read_csv(...).filter(...).select(...)` is not hard to write, because the package is
designed so that the syntax is easy. The harder part is everything the syntax does not
tell you:

- `.filter(_.stressor == "CO2 - combustion - air")` runs without error and quietly excludes
  cement, lime and peat emissions.
- `.agg(total=_.value.sum())` runs without error and quietly adds kilograms to kilotonnes.
- Reading one file from a dataset of twelve files produces a clean chart of one twelfth of
  the record.

None of these raise an error. Code with correct syntax still needs to be checked against
what the data and the question require.

## Reference

- [Ibis: getting started](https://ibis-project.org/tutorials/getting_started)
- [Ibis API reference](https://ibis-project.org/reference/)
- [Official Python tutorial](https://docs.python.org/3/tutorial/)
