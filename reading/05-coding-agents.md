# 🤖 Coding agents

You will spend the semester working with a coding agent, so it is worth an hour to
understand what one is. How an agent works is quite different from how it is marketed.

Hadley Wickham has written the clearest available explanation, aimed at data scientists
instead of software engineers. His examples are in R, but the ideas apply equally to
Python, and the explanations are excellent teaching material.

## Assigned readings

Read these two posts, in order, during the first week:

- [What is an agent?](https://tidydesign.substack.com/p/what-is-an-agent) An agent is a
  language model running in a loop, calling tools and choosing each next step from the
  previous result. Note the distinction between tools that *read* the world and tools
  that *change* it.
- [A coding agent is six functions in a trenchcoat](https://tidydesign.substack.com/p/a-coding-agent-is-six-functions-in)
  This post walks through the whole apparatus. Once you can name the six functions, you
  can reason about the agent as ordinary software.

Read this post before we discuss autonomy later in the module:

- [Auto mode knows it's dangerous (and does it anyway)](https://tidydesign.substack.com/p/auto-mode-knows-its-dangerous-and)

## Ask mode

We work in **ask mode** for this entire module. Ask mode has read-only access to your
project: the agent can read your code and data and suggest what to write, but you type or
paste the code and run it yourself. We move to **code mode**, which lets the agent edit
files and run code, at the start of Module 2.

Autonomy is neither forbidden nor frightening. We avoid it for now because watching an
agent edit files and run code behind a progress bar tells you nothing about whether its
work is right. You can only audit work that you have read before it runs.

## Optional readings

- [Your LLM can't math (and that's ok)](https://tidydesign.substack.com/p/your-llm-cant-math-and-thats-ok)
  explains why we verify the numbers a model gives us.
- [Help! My coding agent can run code](https://tidydesign.substack.com/p/help-my-coding-agent-can-run-code)
  discusses what it means that the agent has access to a shell.
- [y code when ai?](https://tidydesign.substack.com/p/y-code-when-ai) is a talk on why
  learning to code still matters. Read it before our in-class unplugged session.

## Discussion questions

- What is the difference between a *conversation* with a model and an *agent*?
- Which of your agent's tools can change the state of your computer? How would you know?
- When the agent suggests code, which parts of it can you actually evaluate, and which
  parts are you taking on faith? Be honest about the second category.
