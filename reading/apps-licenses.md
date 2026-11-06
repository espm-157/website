# ⚖️ Open source licenses

Code, text and figures are protected by copyright from the moment they are written. A public
repository on GitHub lets anyone read your code, but it does not let them reuse it. Without a
license, others have
[no permission to copy, change or share your work](https://choosealicense.com/no-permission/).
A license is the statement in which the copyright holder grants those permissions, usually on
some conditions. The [Open Source Initiative](https://opensource.org/osd) maintains the
definition of open source and the [list of licenses](https://opensource.org/licenses) that meet it.

## Permissive and copyleft licenses

Open source licenses fall into two broad classes.

**Permissive licenses**, such as [MIT](https://choosealicense.com/licenses/mit/), BSD and
[Apache 2.0](https://choosealicense.com/licenses/apache-2.0/), let anyone reuse the code for any
purpose, including in closed-source and commercial software. The main condition is that copies
keep the original copyright notice and license. Apache 2.0 also grants rights to any patents
the contributors hold.

**Copyleft licenses**, such as the [GNU GPL](https://choosealicense.com/licenses/gpl-3.0/), also
allow any use, but anyone who distributes a modified version, or a larger program that includes
the code, must release it under the same license with its source code. The
[AGPL](https://choosealicense.com/licenses/agpl-3.0/) extends this condition to software that
users reach over a network. The Free Software Foundation explains the idea in
[What is copyleft?](https://www.gnu.org/licenses/copyleft.html). Weaker copyleft licenses, such
as the LGPL and the Mozilla Public License, apply the condition only to the library or file
itself.

Permissive licenses maximize reuse. Copyleft licenses ensure that improvements stay open.
[choosealicense.com](https://choosealicense.com/), maintained by GitHub, compares the common
choices in plain language.

## Stating a license

By convention, a project states its license in a plain-text file named `LICENSE` at the top of
the repository. The file holds the full text of the license, with the year and the names of the
copyright holders filled in. GitHub recognizes the standard licenses, shows the license on the
repository page, and offers a template when you
[add a license file](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository).
Package metadata and individual source files name the license with a short
[SPDX identifier](https://spdx.org/licenses/), such as `MIT` or `GPL-3.0-or-later`. Say in the
README which license covers what, especially when code and data are licensed differently.

## Data and other content

Software licenses are written for code. Text, figures and data usually use a
[Creative Commons license](https://creativecommons.org/share-your-work/cclicenses/). CC BY
requires credit, CC BY-SA adds a copyleft condition, CC BY-NC forbids commercial use, and CC0
gives up all rights. This course website, for example, uses MIT for its code and CC BY for its
text.

The data from our modules show the range:

- Our World in Data releases its [CO₂ data](https://github.com/owid/co2-data) under CC BY, and
  notes that data it republishes from other sources keep their original licenses.
- [Mapping Inequality](https://dsl.richmond.edu/panorama/redlining/data) releases its spatial
  data under [CC BY-NC](https://creativecommons.org/licenses/by-nc/4.0/), so it may be used in a
  class project but not in a commercial product.
- Works of the US federal government, such as the rules in the Federal Register, are
  [not protected by copyright](https://www.usa.gov/government-copyright).
- OpenStreetMap, the source of most free basemaps, uses the share-alike
  [Open Database License](https://opendatacommons.org/licenses/odbl/) and requires the credit
  "© OpenStreetMap contributors" on every map, as its
  [copyright page](https://www.openstreetmap.org/copyright) explains.

## Key considerations

- **Code you reuse.** If you copy GPL code into your app and publish the app, the app must be
  released under the GPL. If you use MIT or Apache code, keep its copyright notice. Code
  from Stack Overflow is [CC BY-SA](https://stackoverflow.com/help/licensing). Check the license
  of every library and snippet before you depend on it.
- **Compatibility.** Permissive code can be included in a copyleft project, but copyleft code
  cannot be included in a permissive one. The GNU
  [license list](https://www.gnu.org/licenses/license-list.html) and
  [GPL FAQ](https://www.gnu.org/licenses/gpl-faq.html) say which licenses can be combined.
- **Data terms.** Your app republishes any data that it serves from your repository. Make sure
  each data license allows that, and give the credit it requires in the app itself.
- **Coding agents.** Code written by a coding agent can reproduce code from the projects the
  model was trained on, and the law on this question is not settled. Disclose your use of the
  agent, as in earlier modules, and do not ask it to copy a specific project.
- **Who holds the copyright.** Each author holds copyright in what they write. On a team project,
  list every team member as a copyright holder in the `LICENSE` file.

This page is a general introduction, not legal advice.
