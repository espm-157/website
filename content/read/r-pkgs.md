---
title: "Writing R Packages"
---

Today's class will introduce the basic idea of an R package as a fundamental unit for sharing re-usable R functions.  We will re-organize our population dynamics assignment repo into the structure required for an R package.

While writing a minimal R package is really pretty simple, R packages are still considered an advanced topic and rightly the subject of completely separate books.  We recommend Hadley Wickham's [Writing R Packages](http://r-pkgs.had.co.nz/) which is available in press or online for more detailed reading.  But our unit today is merely to give you a taste for creating an R package that passes "check" by creating the necessary `DESCRIPTION` file and adding `roxygen` documentation for our code.  

Skim the readings on [package `DESCRIPTION` metadata](http://r-pkgs.had.co.nz/description.html) and [object documentation](http://r-pkgs.had.co.nz/man.html) as references for this exercise.  