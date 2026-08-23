# 🧰 Setup

Everything on this page needs to be working before Session 2. It should take under an
hour. Bring your laptop and charger.

We link to official documentation rather than reproducing it, because these tools change
and their own docs stay current. If a link is stale or a step has changed, tell us on
Zulip and we will fix it here.

## 1. GitHub account

You need a personal GitHub account. Use one you are willing to keep — this is a
professional portfolio, and the repositories you build in this course are worth showing
to an employer.

- [Create an account](https://github.com/signup)
- Apply for the [GitHub Student Developer Pack](https://education.github.com/pack) with
  your `@berkeley.edu` address. It is free and unlocks tools you will use later.
- [Set up two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication).
  GitHub requires it, and you will be locked out mid-assignment if you put this off.

Post your username in the course Zulip so we can add you to the
[espm-157 organization](https://github.com/espm-157).

## 2. Berkeley DataHub

Our compute environment. Nothing to install.

- Log in at [nature.datahub.berkeley.edu](https://nature.datahub.berkeley.edu) with
  CalNet.
- [DataHub documentation](https://docs.datahub.berkeley.edu/)

Your session has a **memory limit**, and it is smaller than your laptop's. This is not an
inconvenience we are apologizing for — it is a real constraint that shapes how you write
code, and Part 3 of the climate module is built around it.

## 3. NRP account and API token

The [National Research Platform](https://nrp.ai) hosts the open-weight language models we
use. It is free for academic use, run by a consortium of universities rather than a
commercial provider.

- [Register for an account](https://nrp.ai/documentation/userdocs/start/getting-started/)
- Generate a token at [nrp.ai/llmtoken](https://nrp.ai/llmtoken)
- [Available models](https://nrp.ai/documentation/userdocs/ai/llm-managed/models/)
- [Fair use policy](https://nrp.ai/documentation/userdocs/ai/llm-managed/fair-use) — read
  this. You share this infrastructure with researchers across the country.

Register your own account rather than using a shared class credential. You are a user of
this platform, not a guest on someone else's login.

Keep your token somewhere you can find it again. Treat it like a password: it is tied to
your account, and anyone who has it can spend your quota.

## 4. Kilo Code

[Kilo Code](https://kilo.ai/docs) is the coding agent extension we use, installed in your
editor.

- [Installing Kilo Code](https://kilo.ai/docs/getting-started/installing)

### Point it at NRP

NRP speaks the OpenAI Chat Completions API, so Kilo Code talks to it as a custom provider.
Everything is configured in the settings panel — you do not need a terminal or an
environment variable.

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

4. Choose **`deepseek-v4-flash`** as your model. This is our default for the course, for
   both writing code and for the API work in Module 4.

Notice what just happened. You gave the extension a base URL, a key, and a model name, and
it works — because these are all the *same* API. Point those three fields somewhere else
and everything downstream is unchanged. That portability is a property of open
infrastructure, and it is worth noticing that closed systems generally do not offer it.

:::{tip} This is where we start, not where we end
NRP adds and retires models as the open-weight frontier moves, and `deepseek-v4-flash` is
currently listed under evaluation rather than general support. Expect the default to change
during the semester — that is the normal condition of this field, not a failure of
planning. If it is retired or misbehaves, `gpt-oss` and `qwen3` are stable alternatives:
change the model name in the same dialog and carry on. Tell us on Zulip so we can update
this page.
:::

### Set it to plan mode

Kilo Code has several modes. We use **plan** mode for this module.

- [Using modes](https://kilo.ai/docs/basic-usage/using-modes)

Plan mode has read-only access to your project, plus the ability to write plan files under
`.kilo/plans/`. It can read your code and your data and propose what to do; it cannot
rewrite your notebook while you watch. `code` and `debug` modes have full write access.
We will get there later in the course, deliberately.

That restriction is the whole point, and it is enforced by the mode rather than by your
vigilance. You do not need to change any other settings: in plan mode there is nothing
dangerous to approve, because the tools that change things are not available. When we move
to `code` mode in a later module, approval settings become worth a conversation — and we
will have it then, rather than teaching you to click through prompts now.

## 5. GitHub authentication in your editor

You will sign in to GitHub **from inside the editor**, using GitHub's device
authorization flow.

- [About GitHub device flow](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#device-flow)

This is deliberate, and worth understanding rather than clicking through.

Your editor holds this credential in a way your coding agent cannot read. That means
**the agent cannot push to GitHub on your behalf.** Committing and pushing your work is
something you do, every time. It is the one step in this course we are not automating,
because a record of your work that you did not create is not a record of your work.

## Checklist

Before Session 2 you should be able to:

- [ ] Log in to GitHub with 2FA enabled
- [ ] Start a server on nature.datahub.berkeley.edu
- [ ] Generate an NRP token
- [ ] Configure Kilo Code with the NRP custom provider and `deepseek-v4-flash`
- [ ] Confirm Kilo Code is in **plan** mode
- [ ] Sign in to GitHub from the editor
- [ ] Clone a repository, make a commit, and push it

If any of these fails, come to Session 2 anyway and bring the error message.
