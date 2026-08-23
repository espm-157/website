# 🐍 Python, the parts you actually need

You will not memorize a library. You will read code that a model wrote and decide whether
it does what it claims. That requires knowing what the pieces mean.

This is short on purpose. It is the vocabulary, not a tutorial.

## Imports

```python
import ibis
from plotnine import ggplot, aes, geom_line
```

`import ibis` makes the name `ibis` available. `from ... import ...` pulls specific names
directly into your namespace.

When a model's code fails with `NameError`, an import is usually missing. When two pieces
of code disagree about what `read_csv` means, two different libraries both define it.

## Assignment

```python
co2 = ibis.read_csv("co2.csv")
```

The name `co2` now refers to that object. Assignment is not a copy and not a computation —
it is a label.

A common way analyses go wrong: reassigning the same name to different things as a script
goes on, so that by line 60 nobody knows what `df` contains. Give things names that say
what they are.

## The dot

The `.` means "look inside this thing."

```python
co2.filter(...)     # call the filter method belonging to co2
co2.year            # access the column named year
```

Everything to the left of the dot determines what is legal to the right. `ibis` tables
have `.filter()`; a plain number does not. When you see `AttributeError`, the object was
not the type the code assumed — which is usually the actual bug, not a typo.

## Method chaining

```python
result = (
    co2
    .filter(co2.year >= 1990)
    .select("year", "average")
    .order_by("year")
)
```

Each method returns a new table, so the next method can act on it. Read a chain top to
bottom: start with `co2`, keep rows from 1990 on, keep two columns, sort.

The outer parentheses let you break the chain across lines. Put each step on its own line.
A chain you can read line by line is a chain you can check line by line.

## Lazy evaluation

`ibis` does not do the work when you write the chain. It builds a description of the work
and runs it when you ask for results.

```python
result          # in interactive mode, shows a preview
result.to_pandas()   # actually executes, returns the whole thing in memory
```

This is why `ibis` can query a file far larger than your session's memory: it pushes the
filtering and grouping down to DuckDB, which streams the file and returns only the answer.
`to_pandas()` is the moment you pull data into memory, so it is the moment to ask how much
data you are about to pull.

## The verbs

Nearly everything in this course is a combination of six or seven table operations —
`filter`, `select`, `mutate`, `group_by`, `agg`, `order_by`. That vocabulary is small,
consistent, and worth learning once; the next page,
[single table verbs](03-ibis-verbs.md), works through it properly.

## Easy to remember, easy to get wrong

`ibis.read_csv(...).filter(...).select(...)` is not hard to write. That is the point of a
well-designed package — the syntax is not the obstacle.

What is hard is everything the syntax does not tell you:

- `.filter(_.stressor == "CO2 - combustion - air")` runs perfectly and quietly excludes
  cement, lime, and peat emissions.
- `.agg(total=_.value.sum())` runs perfectly and quietly adds kilograms to kilotonnes.
- Reading one file when the dataset is twelve files produces a clean chart of a twelfth of
  the record.

None of those raise an error. Correct syntax is the beginning of the work, not the end of
it.

## Reference

- [Ibis: getting started](https://ibis-project.org/tutorials/getting_started)
- [Ibis API reference](https://ibis-project.org/reference/)
- [Python tutorial, official docs](https://docs.python.org/3/tutorial/)
