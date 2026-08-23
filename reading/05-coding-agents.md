# 🤖 What a coding agent actually is

You are going to spend a semester working with a coding agent. It is worth an hour to
understand what one is, because the marketing and the mechanism are very different things.

Hadley Wickham has been writing the clearest available explanation of this, aimed at data
scientists rather than at software engineers. His examples are in R. Read them anyway —
the ideas transfer completely, and the pedagogy is excellent.

## Assigned

Read these two, in order, during the first week:

- [What is an agent?](https://tidydesign.substack.com/p/what-is-an-agent) — an agent is a
  language model in a loop, calling tools and deciding the next step from the last result.
  Note the distinction between tools that *read* the world and tools that *change* it.
- [A coding agent is six functions in a trenchcoat](https://tidydesign.substack.com/p/a-coding-agent-is-six-functions-in)
  — the whole apparatus, demystified. Once you can name the six functions, the thing stops
  being magic and starts being software you can reason about.

Read this one before we discuss autonomy, later in the module:

- [Auto mode knows it's dangerous (and does it anyway)](https://tidydesign.substack.com/p/auto-mode-knows-its-dangerous-and)

## Why we stay in plan mode

We work in **plan mode** for this entire module: the agent proposes, you approve, then it
runs. We do not turn on autonomous modes until later in the course, and when we do it will
be a deliberate step rather than a default.

The reason is not that autonomy is forbidden or frightening. It is that an agent that
edits files and runs code while you watch a progress bar teaches you nothing about
whether its work is right. You cannot audit what you did not see proposed.

## Optional, and worth it

- [Your LLM can't math (and that's ok)](https://tidydesign.substack.com/p/your-llm-cant-math-and-thats-ok) —
  directly relevant to why we verify numbers rather than trusting them.
- [Help! My coding agent can run code](https://tidydesign.substack.com/p/help-my-coding-agent-can-run-code) —
  what it means that this thing has a shell.
- [y code when ai?](https://tidydesign.substack.com/p/y-code-when-ai) — a talk on why
  learning to code still matters. Read this one before our in-class unplugged session.

## To discuss in class

- What is the difference between a *conversation* with a model and an *agent*?
- Which of your agent's tools can change the state of your computer? How would you know?
- The agent proposes a plan. What in that plan are you actually able to evaluate, and what
  are you taking on faith? Be honest about the second category.
