# ✍️ Unplugged: writing it yourself

**In-class activity, end of Module 1. Close the agent panel.**

For this session you write the code. No coding agent, no chat window, no autocomplete
beyond what the editor does on its own. Docs are allowed and encouraged — professionals
read documentation constantly.

This is not a test and it is not nostalgia. It is a measurement you take on yourself.

## Why we are doing this

By now you have watched a model mislabel three columns, load one file out of twelve, pick
a variable by string match, and reach for a library that could not hold the data. You have
had to check its work. A reasonable question at this point is whether you could have done
the work yourself, and what it would have cost you.

There is a second reason. There is a story going around that these tools are hard to use
and that a model is what makes them accessible. For badly designed tools that is partly
true. For well-designed ones it is mostly not, and you should find that out first-hand
rather than take our word for it.

## The activity

Work from the documentation, on your own, in a fresh notebook.

**Part A — the six verbs (20 minutes)**

Using the Mauna Loa CO2 record you already know:

1. Read it with `ibis`
2. Keep observations from 1990 onward
3. Keep the date and the average concentration
4. Compute the annual mean
5. Sort by year
6. Plot it

Six steps, six verbs, roughly six lines. Time yourself.

**Part B — say what you did (10 minutes)**

Write a sentence under each line explaining what it does and why it is there. Not what the
syntax means — what the *step* accomplishes in the analysis.

**Part C — break it on purpose (15 minutes)**

Now introduce each of these, one at a time, and record the error message or the wrong
answer:

1. Misspell a column name
2. Filter on a column that is a string when you thought it was a number
3. Sum a column that contains sentinel values
4. Chain `.select()` before `.filter()` in a way that removes a column the filter needs

Which of these raise an error, and which quietly give you a wrong number? That second
category is the entire subject of this module.

## Debrief

- How long did Part A actually take?
- What did you have to look up? Was looking it up hard?
- Which of the four breakages failed loudly, and which failed silently?
- Compare against the agent-written code from earlier in the module. Which errors would
  you have caught by reading, and which only by running?

## The point

`ibis.read_csv(...).filter(...).select(...)` is not difficult. Six verbs, a dot between
each, in an order you can read aloud. Most of you will get through Part A faster than you
expected.

What is difficult is knowing which column, which filter, which units, and whether the
answer is right — and that difficulty is identical whether a model typed it or you did.
The tool was never the hard part. The judgment was.

That is why we do not drill syntax, and equally why an assignment pasted into a model and
sent off with "go" does not produce good work. The effort moved somewhere; it did not
disappear.

## Before this session

Read [y code when ai?](https://tidydesign.substack.com/p/y-code-when-ai) by Hadley Wickham.
