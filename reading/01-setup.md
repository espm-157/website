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
- [Set up two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication/configuring-two-factor-authentication).
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
- [Available models](https://nrp.ai/documentation/userdocs/ai/llm-managed/)
- [Fair use policy](https://nrp.ai/documentation/userdocs/ai/llm-managed/fair-use) — read
  this. You share this infrastructure with researchers across the country.

Register your own account rather than using a shared class credential. You are a user of
this platform, not a guest on someone else's login.

## 4. Editor and coding agent

Instructions for the editor and the coding agent extension will be posted here before
Session 2, along with how to point the agent at your NRP token.

- [Kilo Code documentation](https://kilocode.ai/docs)

We configure the model through the extension's settings panel. You should not need to
edit configuration files or set environment variables to get started.

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
- [ ] Open the editor and see the coding agent panel
- [ ] Sign in to GitHub from the editor
- [ ] Clone a repository, make a commit, and push it

If any of these fails, come to Session 2 anyway and bring the error message.
