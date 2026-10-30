# 🔑 API keys in a .env file

The notebooks in this module call services that need a key: Laya, and optionally the language
models on the National Research Platform. A key works like a password, so it must never appear
in a notebook or in a commit. We keep keys in a file named `.env` in the project folder, and
Python reads them from there as **environment variables**.

## The .env file

A `.env` file is a plain text file with one `NAME=value` pair on each line. To create it in
VS Code:

1. Open your module repository as the workspace folder (**File → Open Folder**), so that
   `esa.ipynb` is at the top level of the Explorer.
2. In the Explorer, click **New File** and name it `.env`, with the leading dot and no other
   extension. It belongs in the same folder as `esa.ipynb`.
3. Copy these lines into the file:

```bash
LAYA_URL=https://laya.carlboettiger.info
LAYA_API_KEY=XXXXXXXXXXXXXXXX
NRP_TOKEN=XXXXXXXXXXXXXXXX
```

4. **Replace each `XXXXXXXXXXXXXXXX` with your own key**, and save the file. The X's are
   placeholders, not keys. If you leave them in, every request fails with an authentication
   error (`401 Unauthorized`). The next section says where each key comes from. Keep the
   `LAYA_URL` line as it is.

Write each value as it is, with no quotes and no spaces around the `=`.

The template's `.gitignore` file already lists `.env`, so git does not commit it. Open the
**Source Control** panel after you save: `.env` should not appear among the changes. If it does,
add a line `.env` to `.gitignore` before you commit anything.

## Variables

- `LAYA_URL` is the address of the Laya server that we host for the course. It is the same for
  everyone, so you copy it as written.
- `LAYA_API_KEY` is the course key for Laya, which we share on the course Zulip.
- `NRP_TOKEN` is optional. You need it only if you want to call a regular language model from
  your notebook, for example for structured extraction. The
  [structured extraction example](extraction-example.ipynb) and the **Setup** cell of the module
  template show how the notebook uses it to connect to `deepseek-v4-flash` and `qwen3-embedding`.

Your NRP token is the same one you entered in Kilo Code during
[setup](01-setup.md#id-3-nrp-account-and-api-token). If you no longer have it, generate a new one
at [nrp.ai/llmtoken](https://nrp.ai/llmtoken). When the page asks you to sign in, choose
**University of California, Berkeley** as your identity provider. Do not sign in with ORCID.

The template's Setup cell reads both `NRP_TOKEN` and `LAYA_API_KEY`. If one of them is missing
from `.env`, that cell stops with a `KeyError` naming the variable.

## Kernel restart

A notebook does not run its code inside VS Code itself. It sends each cell to a separate Python
process called the **kernel**, which holds every variable you have created and every module you
have imported. The kernel receives its environment variables once, when it starts. VS Code reads
the `.env` file at the top of the workspace folder and passes its variables to each new kernel
that it starts.

A kernel that was already running when you created or edited `.env` therefore does not see the
change. To load the variables, restart the kernel: click **Restart** in the toolbar at the top of
the notebook, or run **Jupyter: Restart Kernel** from the Command Palette. A restart ends the old
Python process and starts a new one, so every variable in memory is lost and you need to run the
cells again from the top. Your code and the outputs saved in the notebook are not affected.

## Checks

After the restart, run this in a cell. Each line should print `True`.

```python
import os
print("LAYA_URL" in os.environ)
print("LAYA_API_KEY" in os.environ)
print("NRP_TOKEN" in os.environ)
```

Do not print the values themselves. A printed key is saved in the notebook's output and is
committed with it.

If a line prints `False` after a restart, check that `.env` is at the top of the folder you
opened in VS Code and that the name is spelled correctly. You can also load the file from the
notebook itself, as the [Laya example](laya-example.ipynb) does, with the `python-dotenv`
package:

```python
from dotenv import load_dotenv
load_dotenv()
```

Your coding agent can read every file in the workspace, including `.env`. Do not ask it to show
or copy your keys, and do not paste a key into a prompt.
