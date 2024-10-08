#  website for ESPM 157

<https://espm-157.carlboettiger.info>

As part of our course migration into python, this website is now being built with jupyter-book, and still under development.  

## Automated Deploy

Edit markdown source files, site should render automatically via GitHub Actions, see `.github/workflows`

## Local Build/Preview

Make sure requirements are installed via `make install` or equivalently:

```
pip install book-requirements.txt
```

Render site and preview:

```
make html
make serve
```

Preview at `https://${BASE}${JUPYTERHUB_SERVICE_PREFIX}proxy/8000/index.html"`.  Adjust `BASE` env var in Makefile to your server (or `localhost`).


## Themes

Site is currently built using [shibuya](https://github.com/lepture/shibuya) theme for sphinx, which is not explicitly supported by jupyter-book.  Specifically, most configurations in the `html` section of `_config.yml` for jupyterbook will not be recognized, but the theme can be configured using standard sphinx configuration via the `sphinx.config` section.  

## Developing

Custom navbar and footer:  edit `_templates/parials/foot-socials.html` and `_templates/partials/nav-socials.html` accordingly as in the example there.  Note that icons must use `iconify-icon` tags, as in:

```
<iconify-icon icon="simple-icons:jupyter"></iconify-icon>
```

To add additional icons, it is necessary to compile them using the `genicons.js` script with path to icon svgs, e.g. from <https://simpleicons.org/>, and add then add the resulting CSS lines to the custom css files in `_static`.  Note that [Jupyterbook will automatically](https://jupyterbook.org/en/stable/advanced/html.html) pick up css files in `_static`.  


## Previous versions

For reference, see the [course website](https://espm-157.github.io/website-r/) for the R-based version of this course, last taught in Fall 2023.  This version was built with `blogdown` / `hugo` using a custom theme based on the open source Material-Kit from Creative Tim.



