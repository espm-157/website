# 🧰 Setup

Everything on this page needs to work before Session 2. It should take less than an hour.
Bring your laptop and charger to class.

We link to the official documentation for each tool because these tools change often and
their own documentation stays current. If a link is stale or a step has changed, tell us on
Zulip and we will fix this page.

## 1. GitHub account

You need a personal GitHub account. Choose one you are willing to keep, because the
repositories you build in this course form a professional portfolio that you can show to
an employer.

- [Create an account](https://github.com/signup)
- Apply for the [GitHub Student Developer Pack](https://education.github.com/pack) with
  your `@berkeley.edu` address. It is free and includes tools we use later in the course.
- [Set up two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication).
  GitHub requires it, and if you put it off you may be locked out in the middle of an
  assignment.

Post your username in the course Zulip so we can add you to the
[espm-157 organization](https://github.com/espm-157).

## 2. Berkeley DataHub

DataHub is our compute environment, and it requires no installation.

- Log in at [nature.datahub.berkeley.edu](https://nature.datahub.berkeley.edu) with
  CalNet.
- [DataHub documentation](https://docs.datahub.berkeley.edu/)


## 3. NRP account and API token

The [National Research Platform](https://nrp.ai) hosts the open-weight language models we
use. It is run by a consortium of universities and is free for academic use.

- [Register for an account](https://nrp.ai/documentation/userdocs/start/getting-started/)
- Generate a token at [nrp.ai/llmtoken](https://nrp.ai/llmtoken)
- [Available models](https://nrp.ai/documentation/userdocs/ai/llm-managed/models/)
- [Fair use policy](https://nrp.ai/documentation/userdocs/ai/llm-managed/fair-use).
  Please read it, since you share this infrastructure with researchers across the country.

Register your own account instead of using a shared class credential. You are a user of
the platform in your own right.

Keep your token somewhere you can find it again and treat it like a password. It is tied
to your account, and anyone who has it can spend your quota.

## 4. Kilo Code

[Kilo Code](https://kilo.ai/docs) is the coding agent we use. It runs as an extension in
your editor.

- [Installing Kilo Code](https://kilo.ai/docs/getting-started/installing)

### NRP provider

NRP serves the OpenAI Chat Completions API, so Kilo Code connects to it as a custom
provider. All of the configuration happens in the settings panel, and you do not need a
terminal or an environment variable.

1. Open **Settings** (the gear icon) → **Providers**
2. Scroll to the bottom and choose **Custom provider**
3. Fill in the dialog:

   | Field | Value |
   |---|---|
   | Provider ID | `nrp` |
   | Display name | `NRP` |
   | Provider API | **OpenAI Compatible** |
   | Base URL | `https://ellm.nrp-nautilus.io/v1` |
   | API key | your NRP token |

4. Choose **`deepseek-v4-flash`** as your model. This is the course default, both for
   writing code and for the API work in Module 3.

The extension needs only a base URL, a key and a model name, because every provider in the
list serves the same API. If you change those three fields to point at another provider,
everything downstream stays the same. Open infrastructure gives us this portability, and
closed systems generally do not.

:::{tip} Default model
NRP adds and retires models as open-weight models improve, and `deepseek-v4-flash` is
currently listed as under evaluation. We expect the default to change during the semester.
If the model is retired or misbehaves, `gpt-oss` and `qwen3` are stable alternatives that
you can select in the same dialog. Please tell us on Zulip so we can update this page.
:::

### Ask mode

Kilo Code has several modes. We use **ask** mode for Module 1 and **code** mode from Module 2
onward.

- [Using modes](https://kilo.ai/docs/basic-usage/using-modes)

Ask mode has read-only access to your project: the agent can read your code and data and
suggest what to write, but you run the code yourself. Code mode has full write access, so
the agent can edit files and run code. We switch to code mode at the start of Module 2.

## 5. GitHub authentication in the editor

You will sign in to GitHub **from inside the editor** with GitHub's device authorization
flow.

- [About GitHub device flow](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#device-flow)

We set things up this way on purpose. Your editor stores this credential where your coding
agent cannot read it, so **the agent cannot push to GitHub on your behalf.** You commit and
push your own work every time. This is the one step in the course that we do not automate,
because the commit history is the record of your work and you should be the one who
creates it.

## Checklist

Before Session 2 you should be able to:

- [ ] Log in to GitHub with 2FA enabled
- [ ] Start a server on nature.datahub.berkeley.edu
- [ ] Generate an NRP token
- [ ] Configure Kilo Code with the NRP custom provider and `deepseek-v4-flash`
- [ ] Confirm Kilo Code is in **ask** mode
- [ ] Sign in to GitHub from the editor
- [ ] Clone a repository, make a commit, and push it

If any of these steps fails, come to Session 2 anyway and bring the error message.
