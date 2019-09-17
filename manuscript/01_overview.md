# Overview

<!-- Google Slide ID -->
<!-- 1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c -->

<!-- Include a slide PNG with Page_ID from this Slide Deck: -->
<!-- ![](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=PAGE_ID) -->
<!-- or use  `didactr::gs_slide_df("1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c")$png_markdown` -->

As you start to explore building your own packages, it's a good idea to first think about packages you've already used and what you like or dislike about them. This can be helpful in guiding your thinking as you start writing your own packages, helping to make them as useful as possible to both you and others who may use your packages! 

For example, think of the R package [`googlesheets`](https://cran.rstudio.com/web/packages/googlesheets/vignettes/basic-usage.html) from Jenny Bryan. Let's discuss why this is such a wonderful and widely-used package.

First, the **name** of the package makes it clear what the package is used for! The `googlesheets` R package makes working with Google Sheets in R a lot easier! That's a great start.

Second, the main functions within that package all begin with `gs_`. This means that whenever you see `gs_` in someone else's code *or* whenever you're trying to remember what function from `googlesheets` you need, you know that it will likely start with `gs_`, making it easier to use.

Third, the package is **well-documented** and has [**vignettes**](https://cran.rstudio.com/web/packages/googlesheets/vignettes/basic-usage.html). We'll discuss these in later lessons in this course, but for now what this means is that if you are trying to figure out what a function does, how to get started, or how to use the package overall, a look at the package's vignettes, peak through the package documentation, or a quick Google search will usually solve your problem quickly and painlessly.

{format: png}
![`googlesheets` is a great package](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3ba7e1_0_0)

While we'll get to discussing function naming, documentation, and vignettes in coming lessons, we'll focus on the first point here - package naming! We'll also discuss the basic components of an R package and get you on your way to creating your first R package.

### Package Naming

Technically, your package name can be anything, so long as it (1) starts with a letter, (2) only contains letters, numbers, and periods, and (3) does not end with a period.

*But*, when it comes to naming a package *well* there are a few additional things to keep in mind. If your package is just for your use, you can name it whatever you want. But, if you have any plans of releasing your package, there are a number of guidelines to follow. And, whether you plan on releasing it or not, it's probably best to just get in the habit of following these guidelines.

Your package name should:

1. make it clear what your package does
2. not be the name of an already-existing R package
3. all be lowercase 
4. be as concise as possible

For example, ` stringr` is a package that makes it easy to work with strings. 'string' is right there in the name and the `r` at the end indicates that it's an R package. 

Similarly, `lubridate` makes it easier to work with dates and sounds like the word 'lubricate' - a great name for that R package.

Moving beyond the most obvious cases, `dplyr` may seem like an odd name for a package, but this package works best for dataframes (the 'd' in `dplyr`), generalizes the "apply" family of functions (the 'ply'), and uses pliers ('plyr'). 

As you start writing your own packages, it's best to spend some time thinking of a good name at the beginning of the process and are sure that an R package by the same name does not already exist

### The Minimal Package

Packages do not have to be anywhere near as complex as those that we've mentioned so far. Your package does not have to make working with Google Sheets easier, work out how to work with strings/dates, or allow for piping to be a worthwhile package. 
In fact, you can create an R package with a single function, stored in the `R/` directory and a text file called DESCRIPTION. This is an [example of the bare bones](https://github.com/kbroman/pkg_primer/tree/gh-pages/example/stage1/R) needed to create an R package.

In this and the following two two lessons in this course we'll work on building a minimal (yet functional!) R package.

### A Strong Package

However, in order for a package to be useful, a package should have a few additional components. This makes understanding the code/functions in your package and overall usage of your package easily understood by you in the future as well as others trying to use your package.

Strong Packages also have:

* **tests** - code that runs each time your package is built to check to ensure that the behavior of each of your package's functions are behaving as expected
* good **documentation** - descriptions of each function, the inputs (arguments) it takes, the outputs it returns, and examples of how to use it
* **vignettes** - guides and examples demonstrating how to use the functionality of your package 

In the final lessons in this course, we'll dedicate time to writing a *good* R package with proper documentation and tests.

### Package Types

Before we jump into creating your first R package, let's take a second to lay out the types of packages that exist. Generally, there are five states of an R package:

1. source
2. bundled
3. binary
4. installed
5. in memory

As you *use* R packages, it's typically not important to know or even think about which state your package is currently in. However, as you start to *develop* R packages and need to debug your packages, understanding these states can help you debug more quickly.

#### Source Packages

Source Packages are those packages you're developing on your computer. It's a bunch of functions stored in an `R/` directory along with a DESCRIPTION text file. As we create your R package in this course, add functions, and edit documentation, we'll be working with the source package.

#### Bundled Packages

Bundled packages are those where all components of the package have been compressed into a single file (usually with the extension `tar.gz`). You will typically not encounter or work with bundled packages - they are used to move between other states. 

#### Binary Packages

Like bundled packages, binary packages are also a single, compressed file. However, when decompressed, bundled packages have a structure very similar to source packages - or what's on your computer. Binary packages, on the other hand, have a very different internal structure. For example, functions are not stored in `.R` files in the `R/` directory as they are in source packages.

What's important to know about binary packages is that they are platform-specific. This means that someone who has a Windows laptop will need a different binary package (a file that ends in *.zip*) than a Mac user (who would need a file that ends in *.tgz*).

#### Installed Packages

Installed packages are binary packages that have been decompressed into a package library (we'll talk about these in just a second!). Packages can be installed in a number of ways. 

For example, we've discussed that for packages on CRAN, you can use `install.packages()`. What this does is take the binary package stored on CRAN that is appropriate for the Computer platform you're using, downloads the binary package to your computer, decompresses it, and stores that in your package library.

However, to install a package from GitHub, we've noted that you can use `devtools::install_github()`. This takes the **source package** on GitHub, bundles it into a **bundled package**, decompresses that file and then installs the package into your package library.

While it's not super important to understand the details of each state a package can be in, it's important to be at least aware, as you will run into different package states along the way. 

#### In-Memory Packages

We've discussed previously that there is a difference between installing and loading a package. To use the functions within a package, it first has to be installed. This is done most typically with either `install.packages()` or `install_github()` from `devtools`. 

After installation, however, you can't actually use the functions until you load the package into memory (our final package state!). So far we've used `library()` to load the package into package. This loads the package when you use `library()`, making its functionality available to you. 

Something we haven't discussed in detail yet, however, is that you can use a function without loading the entire package into memory by calling the package and function name separated by two colons. For example, if you haven't loaded `devtools` into memory but want to use `install_github()` from devtools you can call `devtools::install_github()` to use that function. We'll use this format frequently throughout package development.

We'll avoid using `library()` in package development, as it requires the package be installed before being able to use the package's functions. Instead, we'll use the `package::function()` format frequently in package development.

### A note on `library()`

As discussed in the [Introduction to R](https://leanpub.com/universities/courses/jhu/cbds-intro-r) course, packages you've installed are stored in your package library. The function `.libPaths()` will tell you where on your computer your installed packages are stored. 

Whenever you call `library()` on  package, R will look in this path for a directory with the specified package's name and load that package into memory.

### Getting Started: Your First R Package

RStudio has a bunch of built-in functionality to help make package development simpler, and you can take advantage of this functionality on RStudio Cloud. In fact getting started building your first R package requires just a few steps!

We suggest you follow along as the following lessons in this course will refer back to the skeleton package we create in this lesson.

#### Step 1: Create New Project on RStudio Cloud

As you've done previously, you'll start by going to [Rstudio Cloud](https://rstudio.cloud) and creating a new project.

{format: png}
![Create a New Project](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3ba7e1_0_177)

We're going to create a package called `cbds`, so you can should this project 'cbds'. Now, we talked previously about how having a good name for your package is important. Because this is just a package being created as an example, `cbds` is a fine name. But, if it were a package being used for a specific purpose or one to be released out into the world, you should spend more time and think of a better name for sure!

{format: png}
![Rename project: cbds](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3ba7e1_0_172)

#### Step 2: Install `usethis`

Up to this point, this should all be pretty familiar. However, now we get into the fun stuff! As with most things in R, there's a package called `usethis` for helping people develop packages! As described on their website, [`usethis`](https://usethis.r-lib.org/) "is a workflow package: it automates repetitive tasks that arise during project setup and development, both for R packages and non-package projects." Sounds like just the thing we want! 

To get starting using `usethis`, we'll have to first install it!

```r
# install package
install.packages("usethis")
```

#### Step 3: Create Package

Now, you're ready to create your first package. To do this we'll load `usethis` into memory and then use the `create_package()` function to create our project that will store the source package! 

```r
# load package
library(usethis)

# Create a new package
create_package("cbds")
```

When you run this code, you'll get a warning message asking you if you want to create the package anyway. Choose the numeric option (here, it's 3) that corresponds to "Yup". 

{format: png}
![`create_package()`](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3bad68_0_22)

You'll then be prompted to see if you want to Switch Projects. 

{format: png}
![Select "Save" to Switch Projects](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3bad68_0_27)

Click Save when asked if you want to Save workspace image to `/cloud/project/.RData` and you'll be moved into the directory `cbds/`.

{format: png}
![cbds package directory and Build tab](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3bad68_0_32)

Notice that you're now within `/cloud/project/cbds` and that a number of files are visible here. These have all been created for you thanks to the `create_package()` function from `usethis`. Earlier we mentioned that a minimal package has a folder called `R/` and a text file called DESCRIPTION. Both of those have been created for you! This means that you have a minimal package already...in just a few short steps!


##### Aside: RStudio Project Files

The reason we get this message asking us if we want to create a project within an existing project while telling us this is generally not a good idea has to do with the fact that we're building this on RStudio Cloud, rather than RStudio on our local computer. 

Something we haven't discussed a ton up to this point is that everything on RStudio Cloud is organized into projects.Within each project a project.Rproj file is created. `.Rproj` files are text files that keep track of information about your project. 

Packages also require an .Rproj file within the package directory. Because RStudio Cloud already has a .Rproj file by default for the project space, we see this message. 

{format: png}
![Creating packages in RStudio Cloud creates an .Rproj file](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3bad68_0_64)


#### Step 4: Build Package

You should also notice on RStudio Cloud that a "Build" tab is now visible at the top-right. If you click on "Install and Restart", RStudio will build your package from the source package files in this directory, restart R in the console, and load your package into R. A log of what's happening will also be kept in the Build tab.

{format: png}
![Install and Restart from the Build tab](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/export/png?id=1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c&pageid=g5d3c3bad68_0_78)

Here, you've built your package from the source package files in this directory; however, we haven't actually added any functions to this package yet. That's what we'll do in a coming lesson. Once we do that, we'll build the package and test out its functionality!


### Summary

In this lesson we've covered package naming, what is required for the minimal R package, what's needed to make a *good* R package, and got started creating our R package using the `usethis` package. In coming lessons we'll add functionality, documentation, tests, and vignettes to our package as you get more and more comfortable using RStudio Cloud for package development!

### Additional Resources

- [The minimal R package](https://kbroman.org/pkg_primer/pages/minimal.html), by Karl Broman
- [`usethis` documentation](https://usethis.r-lib.org/), by Jenny Bryan and Hadley Wickham
- [Writing R Extensions](https://cran.r-project.org/doc/manuals/r-release/R-exts.html), from the R Core Team

### Slides and Video

![Overview](https://www.youtube.com/watch?v=O0Tpi1azWNo)

  - [Slides](https://docs.google.com/presentation/d/1FRr14fKonsB9VU7ssSN96diU048kKCkI-Zcemeiw-8c/edit?usp=sharing)

{quiz, id: quiz_01_overview}

### Overview quiz

{choose-answers: 4} 
? Which of the following check to see if the functions in your test are executing as expected?


C) tests
o) documentation
o) .R files
o) .Rproj files
o) vignettes
o) functions in the `R/` directory

{choose-answers: 4} 
? Which state is your package in once you've loaded it into R?

C) in memory
o) source
o) bundled
o) binary
o) installed

{choose-answers: 4} 
? Why do we use `usethis`?

C) It helps automate repetitive tasks in package development
o) It helps test functionality within our package
o) It removes packages from our RStudio projects
o) It installs packages necessary for our package to run
o) It helps with documentation of our package
o) It's the only way packages can be created in R

{choose-answers: 4} 
? To create a package called "mypackage", what code would you execute?

C) `usethis::create_package('mypackage')`
o) `usethis::create_package('project/mypackage')`
o) `usethis('project/mypackage')`
o) `usethis('mypackage')`
o) `usethis()`
o) `usethis::create('mypackage')`
o) `usethis::create('project/mypackage')`
o) `create('project/mypackage')`
o) `create('mypackage')`
o) `create()`

{choose-answers: 4} 
? What would you create to explain to others how to use the functionality within your package?

C) vignette
o) tests
o) unit tests
o) DESCRIPTION
o) functions
o) .R files

{/quiz}
