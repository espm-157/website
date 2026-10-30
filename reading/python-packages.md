# 📦 Python packages

Most of the code we run comes from **packages**: libraries such as `pandas`, `duckdb` and
`langchain-openai` that other people wrote and published. A package must be installed in the
Python environment that runs your notebook before `import` can find it. If it is not, the
import stops with an error such as:

```
ModuleNotFoundError: No module named 'langchain_openai'
```

The DataHub image comes with the packages that most of the course needs, but no image can
include every package every project uses. Module 3 needs a few that the image lacks, so each
project lists what it needs in a file, and we install from that file.

## requirements.txt

The simplest such file is `requirements.txt`, with one package name on each line. The Module 3
template includes one, which begins:

```text
pandas
duckdb
pydantic
langchain-openai
python-dotenv
```

A line can also ask for a version, for example `pandas>=2.2` for version 2.2 or later, or
`duckdb==1.4.1` for exactly one version. Pinning versions makes an analysis easier to
reproduce, and it can also make the file harder to install alongside other packages.

## Installing from a notebook

The first cell of the Module 3 notebook installs everything in the file:

```python
%pip install -q -r requirements.txt
```

`-r` tells pip to read package names from the file, and `-q` keeps the output short. The `%`
at the start makes this a **magic command**, which Jupyter runs instead of passing it to
Python. `%pip` installs into the same environment as the notebook's kernel, the Python process
that runs your cells (see [the .env file page](env-file.md#kernel-restart)). Writing `!pip`
instead runs whichever `pip` the system finds first, which is not always the one your kernel
uses.

Run the cell each time you start a new DataHub server. When the packages are already installed,
it checks them and finishes in a few seconds.

The cell may print "you may need to restart the kernel to use updated packages". A package that
was already imported keeps its old version in memory until the kernel restarts. If you ran the
install cell first, nothing was imported yet and you can carry on. If the install upgraded a
package you had already imported, restart the kernel and run the cells again from the top.

## Installing from a terminal

The same install works from a terminal in VS Code (**Terminal → New Terminal**), run from the
folder that holds `requirements.txt`:

```bash
pip install -r requirements.txt
```

In a terminal there is no `%`, because you are talking to the shell instead of to Jupyter. Make
sure the terminal's `python` is the one your notebook uses: `which python` in the terminal should
match `import sys; sys.executable` in the notebook.

## Adding a package

When you or your coding agent install a new package, add it to `requirements.txt` in the same
commit as the code that uses it. Otherwise the notebook runs on your server and fails for
everyone else, including the person grading it. Agents often install packages from a terminal
without saying so, so check `requirements.txt` when you review their changes.

## Other dependency files

Python projects describe their dependencies in a few other formats.

- **`pyproject.toml`** is the current standard for a Python project. It lists the
  dependencies under `[project]`, together with the project's name and the Python versions
  it supports. This website's own repository uses one, which begins:

  ```toml
  [project]
  name = "website"
  requires-python = ">=3.11"
  dependencies = [
      "ibis-framework[duckdb]>=10.8.0",
      "pandas>=2.3.1",
      "plotnine>=0.15.0",
  ]
  ```

  `pip install .` in the project folder installs the project and its dependencies.

- **Lock files** such as `uv.lock` record the exact version of every package, including the
  packages that your packages depend on, so that every installation is identical.
  [uv](https://docs.astral.sh/uv/) reads `pyproject.toml` and writes `uv.lock`, and `uv sync`
  installs exactly what the lock file lists.

- **`environment.yml`** lists packages for [conda](https://docs.conda.io/), which can also
  install software that is not Python, such as the geospatial libraries GDAL and PROJ. Images such as
  DataHub's are often built from files like this one.

- The [Python Packaging User Guide](https://packaging.python.org/en/latest/guides/writing-pyproject-toml/)
  describes `pyproject.toml` in full, and the
  [pip documentation](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
  describes `requirements.txt`.
