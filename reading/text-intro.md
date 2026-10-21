# 📜 Text as data

In this module we treat a large body of legal documents as data. We ask whether the US
government names climate change as a reason when it lists a species as endangered, and we
compare our answer with a study that read the same kind of documents by hand.

### Learning goals

- turn documents into paragraphs and paragraphs into tables
- use regular expressions, and recognize when a pattern that runs is still wrong
- use classifiers that return probabilities, and check them against your own labels
- search text by meaning with embeddings in DuckDB
- use retrieval-augmented generation with every claim traced to a source
- extract structured records from text with a schema
- judge when a model is wrong, and choose the right tool for each step
- understand how climate change enters US endangered species law

## Background

In 2019, Delach et al. published
[Agency plans are inadequate to conserve US endangered species under climate change](https://doi.org/10.1038/s41558-019-0620-8)
in *Nature Climate Change*. They read the official documents for all 459 animals listed as
endangered under the Endangered Species Act (ESA). Climate change was named as a threat for
64% of those species, but management actions to address it were planned for only 18%. Their
per-species codings are [openly published](https://doi.org/10.17605/OSF.IO/R9UCA).

Under section 4 of the ESA, a species is listed because of one or more of five factors,
including the destruction of its habitat, overuse, disease or predation, inadequate
regulation, and "other natural or manmade factors." The decision must rest "solely on the
basis of the best scientific and commercial data available." Each final listing decision is
published as a rule in the [Federal Register](https://www.federalregister.gov/). The rule
lays out the evidence, responds to public and peer-review comments, and states the agency's
conclusion. These rules can be challenged in court, and they are written with that in mind.

We read thirty years of these rules with code. The hard part of the module is deciding what
counts as an answer: a rule that mentions climate change once in passing is different from
one in which the agency finds that climate change threatens the species.

## Data

- **[Federal Register API](https://www.federalregister.gov/developers/documentation/api/v1)**
  provides the full text of every listing rule, with no key required.
- **[Delach et al. (2019) data](https://doi.org/10.17605/OSF.IO/R9UCA)** provides the
  per-species codings to compare against.

## Tools

The module introduces five ways to work with text. Part of the assignment is to decide which
one fits each step and to say why.

- **Regular expressions** match exact patterns in text. They are fast, transparent and
  completely literal.
- **Decision models** answer typed questions about a text with probabilities instead of
  generated prose. We use [Laya](https://huggingface.co/convaiinnovations/laya), an
  open-weight decision model that runs on the National Research Platform.
- **Embeddings** turn each passage into a vector of numbers placed so that passages with
  similar meaning are close together. We store them in DuckDB and search them by meaning.
- **Retrieval-augmented generation (RAG)** retrieves the passages most relevant to a
  question and asks a language model to answer from those passages only, citing each one.
- **Structured extraction** asks a language model to fill in a schema that we define, with
  one record per document.

The language model is `deepseek-v4-flash` and the embedding model is `qwen3-embedding`, both
served by the [National Research Platform](https://nrp.ai/documentation/userdocs/ai/llm-managed/).
This is the same API you configured in Kilo Code during Module 1.

## Further reading

### Decision models

A decision model takes a text and a set of typed questions and returns a probability for
each possible answer in a single step. It is much faster than a language model, and its
probabilities can be checked against labels we trust.

- The [Laya model card](https://huggingface.co/convaiinnovations/laya) describes the model,
  how it was trained and how well it is calibrated.
- The [Laya documentation](https://nandhakishorm.github.io/laya/) covers installation and
  the Python interface.
- Laya follows the interface of Jev, a commercial decision model. The
  [Jev documentation](https://docs.typesafe.ai) explains the three question types
  ([choice, noul and score](https://docs.typesafe.ai/primitives)) and
  [how to read confidence values](https://docs.typesafe.ai/confidence).

### Structured extraction

Any standard language model can be asked to return data in a fixed format instead of
prose. We describe the record we want as a schema, and the model returns one record per
document that matches it. The schema makes the output easy to check and to load into a
table.

- [Structured outputs](https://python.langchain.com/docs/concepts/structured_outputs/) in the
  LangChain documentation explains the idea and the interface we use.
- [Pydantic](https://docs.pydantic.dev/) is the Python library we use to define schemas.
- [JSON Schema](https://json-schema.org/understanding-json-schema/about) is the standard
  format underneath most structured outputs.
- The [vLLM structured outputs guide](https://docs.vllm.ai/en/latest/features/structured_outputs.html)
  describes how an open-weight model server constrains a model's output to match a schema.

## Template

<a href="https://github.com/espm-157/text-template"><i class="i-simpleicons github"></i> text template</a>
