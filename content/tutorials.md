+++
title = "Tutorials"
layout = "page-nav-pills"
description = "Tutorials will provide a brief introduction to a range of data science tools, many of which we will continue to use regularly throughout the course modules.  Tutorial sessions will be woven in between modules and are meant to fit within a single class session.  While modules aim to help you master fundamental skills through a hands-on analysis over several weeks, tutorials are meant primarily to give you some context and a flavor for what is possible."
+++

&nbsp;
<div class="tab-pane active" id="github">
<h3><i class="fa fa-github"></i> GitHub</h3>
  
Almost everything we do will involve GitHub in some way.  This tutorial will provide a brief introduction to our GitHub-based workflow and review common `git` patterns for resolving issues you may encounter in working collaboratively.  
<!-- User name/picture, 2FA, github classroom, pull requests, github emoji-->
</div>
<div class="tab-pane" id="rmarkdown">

### <i class="icon-rlogo"></i> RMarkdown Notebooks

Most of your work will take place inside an RMarkdown notebook.  While we will rely primarily on the `github_document` format, RMarkdown supports a wide variety of output formats that you can use to create `pdf` documents (including particular journal formats) slideshows, websites, ebooks and interactive tutorials.  In this tutorial, we will showcase these formats and introduce how RMarkdown output can be customized through `yaml` header blocks, `knitr` chunks, and templates.  We will also introduce some of the technology behind RMarkdown formats, including `pandoc`, `LaTeX`, and `HTML`/`CSS`.  See <https://rmarkdown.rstudio.com>.
  
</div>
<div class="tab-pane" id="travis">

### <i class="fa fa-check"></i> Travis CI

Continuous Integration (CI) is an important concept data science practice has largely adopted from software engineering, in which a suite of tests are run every time changes are committed (i.e. pushed to GitHub or other version control platform) to a project. We will use the popular Travis-CI platform to check for successful and reproducible rendering of RMarkdown notebooks in your project directories. 

Our Travis-CI tutorial will provide more background on what Travis is an how it can be configured and used in a variety of settings.  

</div>
<div class="tab-pane" id="packages">
  <h3><i class="fa fa-archive"></i> R Packages</h3>

Writing R packages isn't just for software developers.
The R packaging mechanism provides a powerful and very flexible mechanism for organizing
research projects, a notion we refer to as the R "compendium" model.  This tutorial will
introduce you to the fundamentals of the R package structure and it's ecosystem of tools.

</div>
<div class="tab-pane" id="docker">
  <h3><i class="fa fa-docker"></i> Docker</h3>
  
  Docker the engine behind the emerging Open Container standard for creating portable 
  computational environments; important both for reproducibility of existing work and 
  deploying analyses on larger compute systems (see Cloud Tutorial).  This tutorial will
  introduce you to the basics of using Docker with the R environment. 
  
</div>
<div class="tab-pane" id="cloud">
  <h3><i class="fa fa-cloud"></i> Cloud</h3>
  
  This tutorial will review some of the major commercial and academic platforms for
  cloud computing research and give you experience of launching your own instances and
  running analyses on cloud computers using Docker and the RStudio interface. 
</div>
<div class="tab-pane" id="website">
  <h3><i class="fa fa-html5"></i> Web design</h3>
  
Effective web-based communication is an important element of reproducible and collaborative data science.  This tutorial will provide a brief introduction to creating your own websites with `Rmarkdown` based tools such as `bookdown` and `blogdown`.  
  
  <!-- netlify, hugo, bootstrap css -->
</div>
<div class="tab-pane" id="shiny">
  <h3> Shiny</h3>
  RStudio's Shiny platform provides a simple way to turn your R plots and analyses into interactive interfaces with menus, buttons and slider bars.  
</div>
<!-- Shiny? -->