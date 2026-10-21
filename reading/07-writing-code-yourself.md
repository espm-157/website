# ✍️ Unplugged coding session

**This is an in-class activity at the end of Module 1. Please close the agent panel.**

In this session you write the code yourself, without a coding agent, a chat window, or any
autocomplete beyond what the editor provides on its own. You may and should use the
documentation, since professionals read documentation constantly.

The session is not graded. It lets you measure what you can do on your own.

## Motivation

By now you have watched a model mislabel three columns, load one file out of twelve, pick
a variable by string match, and reach for a library that could not hold the data. You have
had to check its work. It is reasonable to ask whether you could have done the work
yourself, and how long it would have taken.

We also want to test a common claim, which is that these tools are hard to use and that a
model is what makes them accessible. That claim is partly true for badly designed tools.
For well-designed tools it is mostly false, and we want you to find that out for
yourself.

## Activity

Work on your own from the documentation, in a fresh notebook.

**Part A. Six verbs**

Allow 20 minutes for this part. Using the Mauna Loa CO2 record you already know:

1. Read it with `ibis`
2. Keep observations from 1990 onward
3. Keep the date and the average concentration
4. Compute the annual mean
5. Sort by year
6. Plot it

The six steps use six verbs in roughly six lines. Time yourself.

**Part B. Explanation**

Allow 10 minutes for this part. Under each line, write a sentence that explains what the
step accomplishes in the analysis and why it is there. Describe the purpose of the step
instead of the meaning of the syntax.

**Part C. Deliberate errors**

Allow 15 minutes for this part. Introduce each of the following errors one at a time, and
record the error message or the wrong answer:

1. Misspell a column name
2. Filter on a column that is a string when you thought it was a number
3. Sum a column that contains sentinel values
4. Chain `.select()` before `.filter()` in a way that removes a column the filter needs

Which of these raise an error, and which quietly give you a wrong number? Errors of the
second kind are the main subject of this module.

## Debrief

- How long did Part A actually take?
- What did you have to look up? Was it hard to find?
- Which of the four errors failed loudly, and which failed silently?
- Compare your code with the agent-written code from earlier in the module. Which errors
  would you have caught by reading the code, and which only by running it?

## Summary

`ibis.read_csv(...).filter(...).select(...)` is not difficult to write. It uses six verbs
with a dot between each, in an order you can read aloud. Most of you will finish Part A
faster than you expected.

The difficult part is choosing the right column, filter and units, and deciding whether
the answer is right. That difficulty is the same whether a model typed the code or you
did, and it is where your judgment matters.

For this reason we do not drill syntax. For the same reason, pasting an assignment into a
model and telling it "go" does not produce good work, because the judgment still has to
come from you.

## Preparation

Before this session, read [y code when ai?](https://tidydesign.substack.com/p/y-code-when-ai)
by Hadley Wickham.
